{******************************************************************************}
{
{ 팝빌 홈택스 현금영수증 연계  API Delphi SDK Example
{
{ - SDK 튜토리얼 : https://docs.popbill.com/htcashbill/tutorial/delphi
{ - 업데이트 일자 : 2021-06-15
{ - 연동 기술지원 연락처 : 1600-9854 / 070-4304-2991
{ - 연동 기술지원 이메일 : code@linkhub.co.kr
{
{ <테스트 연동개발 준비사항>
{ (1) 41, 44번 라인에 선언된 링크아이디(LinkID)와 비밀키(SecretKey)를
{    링크허브 가입시 메일로 발급받은 인증정보로 수정
{ (2) 팝빌 개발용 사이트(test.popbill.com)에 연동회원으로 가입
{ (3) 홈택스 연동서비스를 이용하기 위해 팝빌에 인증정보를 등록합니다
{     인증방법은 부서사용자 인증 공인인증서 인증 방식이 있습니다.
{     - 팝빌로그인 > [홈택스연동] > [환경설정] > [인증 관리] 메뉴에서
{       [홈택스 부서사용자 등록] 혹은 [홈택스 공인인증서 등록]을 통해
{       인증정보를 등록합니다.
{     - 홈택스연동 인증 관리 팝업 URL(GetCertificatePopUpURL)반환된 URL에
{       접속하여 [홈택스 부서사용자 등록] 혹은 [홈택스 공인인증서 등록]을
{       통해 인증정보를 등록합니다.
{******************************************************************************}

unit Example;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillHTCashbill, ExtCtrls, Grids;

const
        {**********************************************************************}
        { - 인증정보(링크아이디, 비밀키)는 파트너의 연동회원을 식별하는        }
        {   인증에 사용되므로 유출되지 않도록 주의하시기 바랍니다              }
        { - 상업용 전환이후에도 인증정보는 변경되지 않습니다.                  }
        {**********************************************************************}

        //링크아이디.
        LinkID = 'TESTER';

        // 파트너 통신용 비밀키. 유출 주의.
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';

type
  TTFormExample = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoinMember: TButton;
    btnCheckIsMember: TButton;
    btnCheckID: TButton;
    GroupBox11: TGroupBox;
    btnGetChargeInfo: TButton;
    GroupBox4: TGroupBox;
    btnUpdateContact: TButton;
    btnRegistContact: TButton;
    btnListContact: TButton;
    GroupBox16: TGroupBox;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    GroupBox2: TGroupBox;
    btnGetAccessURL: TButton;
    txtCorpNum: TEdit;
    txtUserID: TEdit;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    btnRequestJob: TButton;
    btnGetJobState: TButton;
    btnListActiveJob: TButton;
    Label1: TLabel;
    txtJobID: TEdit;
    GroupBox5: TGroupBox;
    btnSearch: TButton;
    btnSummary: TButton;
    GroupBox6: TGroupBox;
    btnGetFlatRatePopUpURL: TButton;
    btnGetFlatRateState: TButton;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    GroupBox7: TGroupBox;
    btnGetBalance: TButton;
    GroupBox10: TGroupBox;
    btnGetPartnerBalance: TButton;
    btnGetChargeURL: TButton;
    btnGetPartnerURL_CHRG: TButton;
    GroupBox12: TGroupBox;
    btnGetCertificatePopUpURL: TButton;
    btnGetCertificateExpireDate: TButton;
    btnCheckCertValidation: TButton;
    btnRegistDeptUser: TButton;
    btnCheckDeptUser: TButton;
    btnCheckLoginDeptUser: TButton;
    btnDeleteDeptUser: TButton;
    btnGetPaymentURL: TButton;
    btnGetUseHistoryURL: TButton;
    btnGetContactInfo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnRequestJobClick(Sender: TObject);
    procedure btnGetJobStateClick(Sender: TObject);
    procedure btnListActiveJobClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSummaryClick(Sender: TObject);
    procedure btnGetFlatRatePopUpURLClick(Sender: TObject);
    procedure btnGetFlatRateStateClick(Sender: TObject);
    procedure btnGetCertificatePopUpURLClick(Sender: TObject);
    procedure btnGetCertificateExpireDateClick(Sender: TObject);
    procedure btnGetChargeInfoClick(Sender: TObject);
    procedure btnGetAccessURLClick(Sender: TObject);
    procedure btnGetChargeURLClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnJoinMemberClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
    procedure btnCheckCertValidationClick(Sender: TObject);
    procedure btnRegistDeptUserClick(Sender: TObject);
    procedure btnCheckDeptUserClick(Sender: TObject);
    procedure btnCheckLoginDeptUserClick(Sender: TObject);
    procedure btnDeleteDeptUserClick(Sender: TObject);
    procedure btnGetPaymentURLClick(Sender: TObject);
    procedure btnGetUseHistoryURLClick(Sender: TObject);
    procedure btnGetContactInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TFormExample: TTFormExample;
  htCashbillService : THometaxCBService;
implementation

{$R *.DFM}

procedure TTFormExample.FormCreate(Sender: TObject);
begin
        htCashbillService := THometaxCBService.Create(LinkID,SecretKey);

        //연동환경 설정값, true(개발용), false(상업용)
        htCashbillService.IsTest := true;

        //Exception 처리 설정값. 미기재시 true(기본값)
        htCashbillService.IsThrowException := true;

        //인증토큰 IP제한기능 사용여부, true(권장)
        htCashbillService.IPRestrictOnOff := true;

        //로컬시스템 시간 사용여부, true(사용), false(미사용) - 기본값
        htCashbillService.UseLocalTimeYN := false;

        StringGrid1.Cells[0,0] := 'ntsconfirmNum';
        StringGrid1.Cells[1,0] := 'tradeDate';
        StringGrid1.Cells[2,0] := 'tradeDT';
        StringGrid1.Cells[3,0] := 'tradeType';
        StringGrid1.Cells[4,0] := 'tradeUsage';
        StringGrid1.Cells[5,0] := 'totalAmount';
        StringGrid1.Cells[6,0] := 'supplyCost';
        StringGrid1.Cells[7,0] := 'tax';
        StringGrid1.Cells[8,0] := 'serviceFee';
        StringGrid1.Cells[9,0] := 'invoiceType';
        StringGrid1.Cells[10,0] := 'franchiseCorpNum';
        StringGrid1.Cells[11,0] := 'franchiseCorpName';
        StringGrid1.Cells[12,0] := 'franchiseCorpName';
        StringGrid1.Cells[13,0] := 'identityNum';
        StringGrid1.Cells[14,0] := 'identityNumType';
        StringGrid1.Cells[15,0] := 'customerName';
        StringGrid1.Cells[16,0] := 'cardOwnerName';
        StringGrid1.Cells[17,0] := 'deductionType';
end;

Function BoolToStr(b:Boolean):String;
begin
    if b = true then BoolToStr:='True';
    if b = false then BoolToStr:='False';
end;
procedure TTFormExample.btnRequestJobClick(Sender: TObject);
var
        queryType: EnumQueryType;
        SDate: String;
        EDate: String;
        jobID: String;
begin
        {**********************************************************************}
        { 현금영수증 매출/매입 내역 수집을 요청합니다.                         
        {  - 수집 요청시 반환되는 작업아이디(jobID)의 유효시간은 1시간입니다.
        {  - https://docs.popbill.com/htcashbill/delphi/api#RequestJob
        {**********************************************************************}

        // 현금영수증 유형,  SELL- 매출, BUY- 매입
        queryType := SELL;

        // 시작일자, 표시형식(yyyyMMdd)
        SDate := '20210601';

        // 종료일자, 표시형식(yyyyMMdd)
        EDate := '20210615';

        try
                jobID := htCashbillService.RequestJob(txtCorpNum.text, queryType, SDate, EDate);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'응답메시지 : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                ShowMessage('jobID : ' + jobID);
                txtjobID.text := jobID;
        end;

end;

procedure TTFormExample.btnGetJobStateClick(Sender: TObject);
var
        jobInfo : THomeTaxCBJobInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 수집요청에 대한 상태를 확인합니다.                                   
        { - https://docs.popbill.com/htcashbill/delphi/api#GetJobState
        {**********************************************************************}
        
        try
                jobInfo := htCashbillService.GetJobState(txtCorpNum.text, txtJobId.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'응답메시지 : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'jobID (작업아이디) : '+ jobInfo.jobID + #13;
                tmp := tmp + 'jobState (수집상태) : '+ IntToStr(jobInfo.jobState) + #13;
                tmp := tmp + 'queryType (수집유형) : ' + jobInfo.queryType  + #13;
                tmp := tmp + 'queryDateType (수집일자 유형) : ' + jobInfo.queryDateType  + #13;
                tmp := tmp + 'queryStDate (시작일자) : ' + jobInfo.queryStDate + #13;
                tmp := tmp + 'queryEnDate (종료일자) : ' + jobInfo.queryEnDate + #13;
                tmp := tmp + 'errorCode (오류코드) : ' + IntToStr(jobInfo.errorCode) + #13;
                tmp := tmp + 'errorReason (오류메시지) : ' + jobInfo.errorReason + #13;
                tmp := tmp + 'jobStartDT (작업 시작일시) : ' + jobInfo.jobStartDT + #13;
                tmp := tmp + 'jobEndDT (작업 종료일시) : ' + jobInfo.jobEndDT + #13;
                tmp := tmp + 'collectCount (수집개수) : ' + IntToStr(jobInfo.collectCount) + #13;
                tmp := tmp + 'regDT (수집 요청일시) : ' + jobInfo.regDT + #13;

                ShowMessage(tmp);
        end;
end;

procedure TTFormExample.btnListActiveJobClick(Sender: TObject);
var
        jobList : THomeTaxCBJobInfoList;
        tmp : String;
        i : Integer;
begin
        {**********************************************************************}
        { 1시간 이내 수집 요청한 작업아이디 목록을 확인합니다.                 
        { - https://docs.popbill.com/htcashbill/delphi/api#ListActiveState
        {**********************************************************************}

        try
                jobList := htCashbillService.ListActiveState(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'응답메시지 : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'jobID(작업아이디) | jobState(수집상태) | queryType(수집유형) | queryDateType(일자유형) | ';
                tmp := tmp + 'queryStDate(시작일자) |queryEnDate(종료일자) | errorCode(오류코드) | errorReason(오류메시지) | ';
                tmp := tmp + 'jobStartDT(작업 시작일시) | jobEndDT(작업 종료일시) | collectCount(수집개수) | regDT(수집 요청일시) ' + #13;

                for i := 0 to Length(jobList) -1 do
                begin
                    tmp := tmp + jobList[i].jobID + ' | ';
                    tmp := tmp + IntToStr(jobList[i].jobState) + ' | ';
                    tmp := tmp + jobList[i].queryType + ' | ';
                    tmp := tmp + jobList[i].queryDateType + ' | ';
                    tmp := tmp + jobList[i].queryStDate + ' | ';
                    tmp := tmp + jobList[i].queryEnDate + ' | ';
                    tmp := tmp + IntToStr(jobList[i].errorCode) + ' | ';
                    tmp := tmp + jobList[i].errorReason + ' | ';
                    tmp := tmp + jobList[i].jobStartDT + ' | ';
                    tmp := tmp + jobList[i].jobEndDT + ' | ';
                    tmp := tmp + IntToStr(jobList[i].collectCount) + ' | ';
                    tmp := tmp + jobList[i].regDT + #13;
                end;

                txtJobId.text := jobList[0].jobID;
                ShowMessage(tmp);                
        end;
end;

procedure TTFormExample.btnSearchClick(Sender: TObject);
var

        tradeType : array of string;
        tradeUsage : array of string;
        page : Integer;
        perPage : Integer;
        order : String;
        searchInfo : THomeTaxCBSearchList;
        tmp : string;
        i : Integer; 
begin
        {**********************************************************************}
        { 현금영수증 매출/매입 내역의 수집 결과를 조회합니다.                  
        {  - 수집 요청시 반환되는 작업아이디(jobID)의 유효시간은 1시간입니다.  
        {  - https://docs.popbill.com/htcashbill/delphi/api#Search
        {**********************************************************************}

        // 현금영수증 종류, N-일반 현금영수증, C-취소 현금영수증
        SetLength(tradeType, 2);
        tradeType[0] := 'N';
        tradeType[1] := 'C';

        // 거래용도 배열, P-소득공제용, C-지출증빙용
        SetLength(tradeUsage, 2);
        tradeUsage[0] := 'P';
        tradeUsage[1] := 'C';

        // 페이지번호, 기본값 '1'
        Page := 1;

        // 페이지당 검색개수, 기본값 500, 최대 1000
        PerPage := 10;

        // 정렬방향, D-내림차순, A-오름차순
        Order := 'D';

        try
                searchInfo := htCashbillService.Search(txtCorpNum.text, txtJobId.text, tradeType, tradeUsage, Page, PerPage, Order);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;                                                                     
                end;
        end;


        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'응답메시지 : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'code (응답코드) : ' + IntToStr(searchInfo.code) + #13;
                tmp := tmp + 'total (총 검색결과 건수) : ' + IntToStr(searchInfo.total) + #13;
                tmp := tmp + 'perPage (페이지당 검색개수) : ' + IntToStr(searchInfo.perPage) + #13;
                tmp := tmp + 'pageNum (페이지 번호) : ' + IntToStr(searchInfo.pageNum) + #13;
                tmp := tmp + 'pageCount (페이지 개수) : ' + IntToStr(searchInfo.pageCount)+ #13;
                tmp := tmp + 'message (응답 메시지) : ' + searchInfo.message + #13 + #13;

                for i:=0 to length(searchInfo.list)-1 do
                begin
                        StringGrid1.Cells[0, i+1] := searchInfo.list[i].ntsconfirmNum;             // 국세청 승인번호
                        StringGrid1.Cells[1, i+1] := searchInfo.list[i].tradeDate;                 // 거래일자
                        StringGrid1.Cells[2, i+1] := searchInfo.list[i].tradeDT;                   // 거래일시
                        StringGrid1.Cells[3, i+1] := searchInfo.list[i].tradeType;                 // 문서형태
                        StringGrid1.Cells[4, i+1] := searchInfo.list[i].tradeUsage;                // 거래구분
                        StringGrid1.Cells[5, i+1] := searchInfo.list[i].totalAmount;               // 거래금액
                        StringGrid1.Cells[6, i+1] := searchInfo.list[i].supplyCost;                // 공급가액
                        StringGrid1.Cells[7, i+1] := searchInfo.list[i].tax;                       // 부가세
                        StringGrid1.Cells[8, i+1] := searchInfo.list[i].serviceFee;                // 봉사료
                        StringGrid1.Cells[9, i+1] := searchInfo.list[i].invoiceType;               // 매입/매출
                        StringGrid1.Cells[10, i+1] := searchInfo.list[i].franchiseCorpNum;         // 발행자 사업자번호
                        StringGrid1.Cells[11, i+1] := searchInfo.list[i].franchiseCorpName;        // 발행자 상호
                        StringGrid1.Cells[12, i+1] := searchInfo.list[i].franchiseCorpName;        // 발행자 사업자유형
                        StringGrid1.Cells[13, i+1] := searchInfo.list[i].identityNum;              // 식별번호
                        StringGrid1.Cells[14, i+1] := IntToStr(searchInfo.list[i].identityNumType);// 식별번호유형
                        StringGrid1.Cells[15, i+1] := searchInfo.list[i].customerName;             // 고객명
                        StringGrid1.Cells[16, i+1] := searchInfo.list[i].cardOwnerName;            // 카드소유자명
                        StringGrid1.Cells[17, i+1] := IntToStr(searchInfo.list[i].deductionType);  // 공제유형
                end;
                ShowMessage(tmp);
        end;


end;

procedure TTFormExample.btnSummaryClick(Sender: TObject);
var

        tradeType : array of string;
        tradeUsage : array of string;
        summaryInfo : TCashbillSummary;
        tmp : string;
begin
        {**********************************************************************}
        { 현금영수증  매출/매입 내역의 수집 결과 요약정보를 조회합니다.        
        {  - 수집 요청시 반환되는 작업아이디(jobID)의 유효시간은 1시간입니다.  
        {  - https://docs.popbill.com/htcashbill/delphi/api#Summary
        {**********************************************************************}

        // 현금영수증 종류, N-일반 현금영수증, C-취소 현금영수증
        SetLength(tradeType, 2);
        tradeType[0] := 'N';
        tradeType[1] := 'C';

        // 거래용도 배열, P-소득공제용, C-지출증빙용
        SetLength(tradeUsage, 2);
        tradeUsage[0] := 'P';
        tradeUsage[1] := 'C';

        try
                summaryInfo := htCashbillService.Summary(txtCorpNum.text, txtJobId.text, tradeType, tradeUsage);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'응답메시지 : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'count (수집 결과 건수) : ' + IntToStr(summaryInfo.count) + #13;
                tmp := tmp + 'supplyCostTotal (공급가액 합계) : ' + IntToStr(summaryInfo.supplyCostTotal) + #13;
                tmp := tmp + 'serviceFeeTotal (봉사료 합계) : ' + IntToStr(summaryInfo.serviceFeeTotal) + #13;
                tmp := tmp + 'taxTotal (세액 합계) : ' + IntToStr(summaryInfo.taxTotal) + #13;
                tmp := tmp + 'amountTotal (합계 금액) : ' + IntToStr(summaryInfo.amountTotal) + #13;
                ShowMessage(tmp);
        end;

end;

procedure TTFormExample.btnGetFlatRatePopUpURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 정액제 서비스 신청 팝업 URL을 반환합니다.                            
        { - URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetFlatRatePopUpURL
        {**********************************************************************}
        
        try
                resultURL := htCashbillService.GetFlatRatePopUpURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'응답메시지 : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + resultURL);
        end;
end;

procedure TTFormExample.btnGetFlatRateStateClick(Sender: TObject);
var
        stateInfo : THometaxCBFlatRate;
        tmp : String;
begin
        {**********************************************************************}
        { 정액제 서비스 상태를 확인합니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetFlatRateState
        {**********************************************************************}
        
        try
                stateInfo := htCashbillService.GetFlatRateState(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'응답메시지 : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'referenceID (사업자번호) : ' + stateInfo.referenceID + #13;
                tmp := tmp + 'contractDT (정액제 서비스 시작일시) : ' + stateInfo.contractDT + #13;
                tmp := tmp + 'useEndDate (정액제 서비스 종료일시) : ' + stateInfo.useEndDate + #13;
                tmp := tmp + 'baseDate (자동연장 결제일) : ' + IntToStr(stateInfo.baseDate) + #13;
                tmp := tmp + 'state (정액제 서비스 상태) : ' + IntToStr(stateInfo.state) + #13;
                tmp := tmp + 'closeRequestYN (정액제 해지신청 여부) : ' + BoolToStr(stateInfo.closeRequestYN) + #13;
                tmp := tmp + 'useRestrictYN (정액제 사용제한 여부) : ' + BoolToStr(stateInfo.useRestrictYN) + #13;
                tmp := tmp + 'closeOnExpired (정액제 만료시 해지 여부) : ' + BoolToStr(stateInfo.closeOnExpired) + #13;
                tmp := tmp + 'unPaidYN (미수금 보유 여부) : ' + BoolToStr(stateInfo.unPaidYN) + #13;
                ShowMessage(tmp);
        end;


end;

procedure TTFormExample.btnGetCertificatePopUpURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 홈택스 연동 인증관리를 위한 URL을 반환 합니다.
        { - 인증방식에는 부서사용자/공인인증서 인증 방식이 있습니다.
        { - URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetCertificatePopUpURL
        {**********************************************************************}
        
        try
                resultURL := htCashbillService.GetCertificatePopUpURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'응답메시지 : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TTFormExample.btnGetCertificateExpireDateClick(Sender: TObject);
var
        expires : String;
begin
        {**********************************************************************}
        { 팝빌에 등록된 홈택스 공인인증서 만료일자를 확인합니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetCertificateExpireDate
        {**********************************************************************}
        
        try
                expires := htCashbillService.GetCertificateExpireDate(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'응답메시지 : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                ShowMessage('ExpireDate is : ' + expires);
        end;
end;

procedure TTFormExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : THometaxCBChargeInfo;
        tmp : String;
begin
        {******************************************************************}
        { 홈택스 현금영수증 연동  API 서비스 과금정보를 확인합니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetChargeInfo
        {******************************************************************}
        
        try
                chargeInfo := htCashbillService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'응답메시지 : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;
end;

procedure TTFormExample.btnGetAccessURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 팝빌(www.popbill.com)에 로그인된 팝업 URL을 반환합니다.
        { - URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetAccessURL
        {**********************************************************************}
        
        try
                resultURL := htCashbillService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL : ' + #13 + resultURL);
end;

procedure TTFormExample.btnGetChargeURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 충전 URL을 반환합니다.                            
        { - URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetChargeURL  
        {**********************************************************************}

        try
                resultURL := htCashbillService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL : ' + #13 + resultURL);
end;

procedure TTFormExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 파트너의 연동회원으로 가입된 사업자번호인지 확인합니다.
        { - LinkID는 파트너를 식별하는 인증정보(38번라인)에 설정되어 있습니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#CheckIsMember
        {**********************************************************************}
        
        try
                response := htCashbillService.CheckIsMember(txtCorpNum.text,LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTFormExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 회원가입(JoinMember API)을 호출하기 전 아이디 중복을 확인합니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#CheckID
        {**********************************************************************}

        try
                response := htCashbillService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTFormExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { 파트너의 연동회원으로 회원가입을 요청합니다.
        { - 아이디 중복확인은 btnCheckIDClick 프로시져를 참조하시기 바랍니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#JoinMember 
        {**********************************************************************}

        // 링크아이디
        joinInfo.LinkID := LinkID;

        // 사업자번호 '-' 제외, 10자리
        joinInfo.CorpNum := '1234567890';

        // 대표자성명, 최대 100자
        joinInfo.CEOName := '대표자성명';

        // 상호명, 최대 200자
        joinInfo.CorpName := '링크허브';

        // 주소, 최대 300자
        joinInfo.Addr := '주소';

        // 업태, 최대 100자
        joinInfo.BizType := '업태';

        // 종목, 최대 100자
        joinInfo.BizClass := '종목';

        // 아이디, 6자이상 50자 미만
        joinInfo.ID     := 'userid';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // 담당자명, 최대 100자
        joinInfo.ContactName := '담당자명';

        // 담당자 연락처, 최대 20자
        joinInfo.ContactTEL :='070-4304-2991';

        // 담당자 휴대폰번호, 최대 20자
        joinInfo.ContactHP := '010-000-1111';

        // 담당자 팩스번호, 최대 20자
        joinInfo.ContactFAX := '02-6442-9700';

        // 담당자 메일, 최대 100자
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := htCashbillService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTFormExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 연동회원의 잔여포인트를 확인합니다. 과금방식이 연동과금이 아닌       
        { - 파트너과금인 경우 파트너 잔여포인트 확인(GetPartnerBalance API)를    
        {   이용하시기 바랍니다
        { - https://docs.popbill.com/htcashbill/delphi/api#GetBalance
        {**********************************************************************}
        
        try
                balance := htCashbillService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('잔여포인트 : ' + FloatToStr(balance));
end;

procedure TTFormExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 파트너의 잔여포인트를 확인합니다. 과금방식이 파트너과금이 아닌
        { - 연동과금인 경우 연동회원 잔여포인트 확인(GetBalance API)를
        {   이용하시기 바랍니다
        { - https://docs.popbill.com/htcashbill/delphi/api#GetPartnerBalance
        {**********************************************************************}
        
        try
                balance := htCashbillService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('잔여포인트 : ' + FloatToStr(balance));
end;

procedure TTFormExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { 연동회원의 담당자를 신규로 등록합니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#RegistContact
        {**********************************************************************}

        // [필수] 담당자 아이디 (6자 이상 50자 미만)
        joinInfo.id := 'testkorea';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // [필수] 담당자명(한글이나 영문 100자 이내)
        joinInfo.personName := '담당자성명';

        // [필수] 연락처 (최대 20자)
        joinInfo.tel := '070-4304-2991';

        // 휴대폰번호 (최대 20자)
        joinInfo.hp := '010-1111-2222';

        // 팩스번호 (최대 20자)
        joinInfo.fax := '02-6442-9700';

        // [필수] 이메일 (최대 100자)
        joinInfo.email := 'test@test.com';

        // 담당자 조회권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        joinInfo.searchRole := '3';

        try
                response := htCashbillService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTFormExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 연동회원의 담당자 목록을 확인합니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#ListContact
        {**********************************************************************}

        try
                InfoList := htCashbillService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'id(아이디) | email(이메일) | hp(휴대폰) | personName(성명) | searchRole(담당자 조회 권한) | ';
        tmp := tmp + 'tel(연락처) | fax(팩스) | mgrYN(관리자 여부) | regDT(등록일시) | state(상태)' + #13;

        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + InfoList[i].searchRole + ' | ';
            tmp := tmp + InfoList[i].tel + ' | ';
            tmp := tmp + InfoList[i].fax + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
            tmp := tmp + InfoList[i].regDT + ' | ';
            tmp := tmp + IntToStr(InfoList[i].state) + #13;
        end;
        ShowMessage(tmp);
end;

procedure TTFormExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 담당자 정보를 수정합니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // 담당자 아이디
        contactInfo.id := 'testkorea';

        // 담당자명 (최대 100자)
        contactInfo.personName := '테스트 담당자';

        // 연락처 (최대 20자)
        contactInfo.tel := '070-4304-2991';

        // 휴대폰번호 (최대 20자)
        contactInfo.hp := '010-4324-1111';

        // 이메일 주소 (최대 100자)
        contactInfo.email := 'test@test.com';

        // 팩스번호 (최대 20자)
        contactInfo.fax := '02-6442-9799';

        // 담당자 조회권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        contactInfo.searchRole := '3';

        try
                response := htCashbillService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);

end;

procedure TTFormExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 확인합니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetCorpInfo
        {**********************************************************************}
        
        try
                corpInfo := htCashbillService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName (상호) : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName (대표자성명) : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;
        ShowMessage(tmp);
end;

procedure TTFormExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 수정합니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // 대표자명, 최대 100자
        corpInfo.ceoname := '대표자명';

        // 상호, 최대 200자
        corpInfo.corpName := '상호';

        // 업태, 최대 100자
        corpInfo.bizType := '업태';

        // 종목, 최대 100자
        corpInfo.bizClass := '종목';

        // 주소, 최대 300자
        corpInfo.addr := '서울특별시 강남구 영동대로 517';

        try
                response := htCashbillService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTFormExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 파트너 포인트 충전 URL을 반환합니다.                              
        { - URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetPartnerURL  
        {**********************************************************************}

        try
                resultURL := htCashbillService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL : ' + #13 + resultURL);
end;

procedure TTFormExample.btnCheckCertValidationClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 팝빌에 등록된 공인인증서의 홈택스 로그인을 테스트한다.
        { - https://docs.popbill.com/htcashbill/delphi/api#CheckCertValidation               
        {**********************************************************************}

        try
                response := htCashbillService.CheckCertValidation(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'응답메시지 : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;

end;

procedure TTFormExample.btnRegistDeptUserClick(Sender: TObject);
var
        response : TResponse;
        deptUserID, deptUserPWD : String;
begin
        {**********************************************************************}
        { 홈택스 현금영수증 부서사용자 계정을 등록한다.
        { - https://docs.popbill.com/htcashbill/delphi/api#RegistDeptUser
        {**********************************************************************}

        //홈택스에서 생성한 현금영수증 부서사용자 아이디
        deptUserID := 'test_id';

        // 홈택스에서 생성한 현금영수증 부서사용자 비밀번호
        deptUserPWD := 'test_pwd!';

        try
                response := htCashbillService.RegistDeptUser(txtCorpNum.Text, deptUserID, deptUserPWD);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTFormExample.btnCheckDeptUserClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 팝빌에 등록된 현금영수증 부서사용자 아이디를 확인한다.
        { - https://docs.popbill.com/htcashbill/delphi/api#CheckDeptUser
        {**********************************************************************}

        try
                response := htCashbillService.CheckDeptUser(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTFormExample.btnCheckLoginDeptUserClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 팝빌에 등록된 현금영수증부서사용자 계정정보를 이용하여 홈택스 로그인을 테스트한다.
        { - https://docs.popbill.com/htcashbill/delphi/api#CheckLoginDeptUser                                          
        {**********************************************************************}

        try
                response := htCashbillService.CheckLoginDeptUser(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTFormExample.btnDeleteDeptUserClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 팝빌에 등록된 현금영수증 부서사용자 계정정보를 삭제한다.
        { - https://docs.popbill.com/htcashbill/delphi/api#DeleteDeptUser
        {**********************************************************************}

        try
                response := htCashbillService.DeleteDeptUser(txtCorpNum.Text);
        except
                on le : EPopbillException do begin          
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTFormExample.btnGetPaymentURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 결제내역 팝업 URL을 반환한다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := htCashbillService.getPaymentURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);
end;

procedure TTFormExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 사용내역 팝업 URL을 반환한다.
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초이다.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := htCashbillService.getUseHistoryURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);

end;

procedure TTFormExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자 정보를 확인한다.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := htCashbillService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(htCashbillService.LastErrCode) + #10#13 +'응답메시지 : '+ htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (아이디) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (담당자 성명) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (담당자 연락처(전화번호)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'hp (담당자 휴대폰번호) : ' + contactInfo.hp + #13;
                tmp := tmp + 'fax (담당자 팩스번호) : ' + contactInfo.fax + #13;
                tmp := tmp + 'email (담당자 이메일) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (등록 일시) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (담당자 조회권한) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (관리자 여부) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (계정상태) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.
