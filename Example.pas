unit Example;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillHTCashbill, ExtCtrls, Grids;
  
const
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
    btnGetBalance: TButton;
    btnGetPartnerBalance: TButton;
    btnGetChargeInfo: TButton;
    GroupBox4: TGroupBox;
    btnUpdateContact: TButton;
    btnRegistContact: TButton;
    btnListContact: TButton;
    GroupBox16: TGroupBox;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    GroupBox2: TGroupBox;
    btnGetPopbillURL_LOGIN: TButton;
    btnGetPopbillURL_CHRG: TButton;
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
    btnGetCertificatePopUpURL: TButton;
    btnGetCertificateExpireDate: TButton;
    StringGrid1: TStringGrid;
    Label2: TLabel;
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
    procedure btnGetPopbillURL_LOGINClick(Sender: TObject);
    procedure btnGetPopbillURL_CHRGClick(Sender: TObject);
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

        //연동환경 설정값, true(테스트용), false(상업용)
        htCashbillService.IsTest := true;
        
        //Exception 처리 설정값. 미기재시 true(기본값) 
        htCashbillService.IsThrowException := true;

        StringGrid1.Cells[0,0] := '구분';
        StringGrid1.Cells[1,0] := '거래일시';
        StringGrid1.Cells[2,0] := '식별번호';
        StringGrid1.Cells[3,0] := '공급가액';
        StringGrid1.Cells[4,0] := '세액';
        StringGrid1.Cells[5,0] := '봉사료';
        StringGrid1.Cells[6,0] := '거래금액';
        StringGrid1.Cells[7,0] := '문서형태';
        StringGrid1.Cells[8,0] := '국세청승인번호';


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
        // 수집요청시 반환되는 작업아이디(jobID)의 유효시간은 1시간입니다.

        // 현금영수증 유형,  SELL- 매출, BUY- 매입
        queryType := SELL;

        // 시작일자, 날자형식(yyyyMMdd)
        SDate := '20160501';

        // 종료일자, 날자형식(yyyyMMdd)
        EDate := '20160731';
        
        try
                jobID := htCashbillService.RequestJob(txtCorpNum.text, queryType, SDate, EDate);

        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('jobID : ' + jobID);
        txtjobID.text := jobID;

end;

procedure TTFormExample.btnGetJobStateClick(Sender: TObject);
var
        jobInfo : THomeTaxCBJobInfo;
        tmp : String;
begin
        try
                // 수집상태확인 GetJobState(팝빌회원 사업자번호, 작업아이디)
                // 작업아이디는 수집요청(requestJob) 호출시 반환됩니다.
                jobInfo := htCashbillService.GetJobState(txtCorpNum.text, txtJobId.text);

        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

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

procedure TTFormExample.btnListActiveJobClick(Sender: TObject);
var
        jobList : THomeTaxCBJobInfoList;
        tmp : String;
        i : Integer;
begin

        try
                // 1시간 이내 수집 요청한 작업아이디 목록을 확인합니다.
                jobList := htCashbillService.ListActiveState(txtCorpNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'jobID | jobState | queryType | queryDateType | queryStDate | queryEnDate | errorCode | errorReason | jobStartDT | jobEndDT | collectCount | regDT ' + #13;

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
        // 현금영수증 종류, N - 일반 현금영수증, C - 취소 현금영수증
        SetLength(tradeType, 2);
        tradeType[0] := 'N';
        tradeType[1] := 'C';

        // 거래용도 배열, P - 소득공제용, C - 지출증빙용
        SetLength(tradeUsage, 2);
        tradeUsage[0] := 'P';
        tradeUsage[1] := 'C';

        // 페이지번호 
        Page := 1;

        // 페이지당 검색개수
        PerPage := 10;

        // 정렬방향, D-내림차순, A-오름차순
        Order := 'D';

        try
                searchInfo := htCashbillService.Search(txtCorpNum.text, txtJobId.text, tradeType, tradeUsage, Page, PerPage, Order);

        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'code (응답코드) : ' + IntToStr(searchInfo.code) + #13;
        tmp := tmp + 'total (총 검색결과 건수) : ' + IntToStr(searchInfo.total) + #13;
        tmp := tmp + 'perPage (페이지당 검색개수) : ' + IntToStr(searchInfo.perPage) + #13;
        tmp := tmp + 'pageNum (페이지 번호) : ' + IntToStr(searchInfo.pageNum) + #13;
        tmp := tmp + 'pageCount (페이지 개수) : ' + IntToStr(searchInfo.pageCount)+ #13;
        tmp := tmp + 'message (응답 메시지) : ' + searchInfo.message + #13 + #13;


        for i:=0 to length(searchInfo.list)-1 do
        begin

                StringGrid1.Cells[0, i+1] := searchInfo.list[i].tradeUsage;  // 거래유형
                StringGrid1.Cells[1, i+1] := searchInfo.list[i].tradeDT;     // 거래일시
                StringGrid1.Cells[2, i+1] := searchInfo.list[i].identityNum; // 거래처 식별번호
                StringGrid1.Cells[3, i+1] := searchInfo.list[i].supplyCost;  // 공급가액
                StringGrid1.Cells[4, i+1] := searchInfo.list[i].tax;         // 세액
                StringGrid1.Cells[5, i+1] := searchInfo.list[i].serviceFee;  // 봉사료
                StringGrid1.Cells[6, i+1] := searchInfo.list[i].totalAmount; // 거래금액
                StringGrid1.Cells[7, i+1] := searchInfo.list[i].tradeType;   // 현금영수증 형태
                StringGrid1.Cells[8, i+1] := searchInfo.list[i].ntsconfirmNum; // 국세청승인번호
        end;

        ShowMessage(tmp);
end;

procedure TTFormExample.btnSummaryClick(Sender: TObject);
var

        tradeType : array of string;
        tradeUsage : array of string;
        summaryInfo : TCashbillSummary;
        tmp : string;
begin
        // 현금영수증 종류, N - 일반 현금영수증, C - 취소 현금영수증
        SetLength(tradeType, 2);
        tradeType[0] := 'N';
        tradeType[1] := 'C';

        // 거래용도 배열, P - 소득공제용, C - 지출증빙용
        SetLength(tradeUsage, 2);
        tradeUsage[0] := 'P';
        tradeUsage[1] := 'C';

        try
                summaryInfo := htCashbillService.Summary(txtCorpNum.text, txtJobId.text, tradeType, tradeUsage);

        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'count (수집 결과 건수) : ' + IntToStr(summaryInfo.count) + #13;
        tmp := tmp + 'supplyCostTotal (공급가액 합계) : ' + IntToStr(summaryInfo.supplyCostTotal) + #13;
        tmp := tmp + 'serviceFeeTotal (봉사료 합계) : ' + IntToStr(summaryInfo.serviceFeeTotal) + #13;
        tmp := tmp + 'taxTotal (세액 합계) : ' + IntToStr(summaryInfo.taxTotal) + #13;
        tmp := tmp + 'amountTotal (합계 금액) : ' + IntToStr(summaryInfo.amountTotal) + #13;

        ShowMessage(tmp);

end;

procedure TTFormExample.btnGetFlatRatePopUpURLClick(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := htCashbillService.GetFlatRatePopUpURL(txtCorpNum.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + resultURL);
end;

procedure TTFormExample.btnGetFlatRateStateClick(Sender: TObject);
var
        stateInfo : THometaxCBFlatRate;
        tmp : String;
begin

        try
                stateInfo := htCashbillService.GetFlatRateState(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

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

procedure TTFormExample.btnGetCertificatePopUpURLClick(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := htCashbillService.GetCertificatePopUpURL(txtCorpNum.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TTFormExample.btnGetCertificateExpireDateClick(Sender: TObject);
var
        expires : String;
begin
        try
                expires := htCashbillService.GetCertificateExpireDate(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ExpireDate is : ' + expires);
end;

procedure TTFormExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : THometaxCBChargeInfo;
        tmp : String;
begin

        try
                chargeInfo := htCashbillService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;

        ShowMessage(tmp);
end;

procedure TTFormExample.btnGetPopbillURL_LOGINClick(Sender: TObject);
var
  resultURL : String;
begin

        try
                resultURL := htCashbillService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,'LOGIN');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('팝빌 로그인 URL' + #13 + resultURL);
end;

procedure TTFormExample.btnGetPopbillURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin

        try
                resultURL := htCashbillService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('포인트충전 URL ' + #13 + resultURL);
end;

procedure TTFormExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := htCashbillService.CheckIsMember(txtCorpNum.text,LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TTFormExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := htCashbillService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TTFormExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        joinInfo.LinkID := LinkID;        //링크아이디
        joinInfo.CorpNum := '1231212312'; //사업자번호 '-' 제외.
        joinInfo.CEOName := '대표자성명';
        joinInfo.CorpName := '상호';
        joinInfo.Addr := '주소';
        joinInfo.BizType := '업태';
        joinInfo.BizClass := '업종';
        joinInfo.ID     := 'userid';  //6자 이상 20자 미만.
        joinInfo.PWD    := 'pwd_must_be_long_enough'; //6자 이상 20자 미만.
        joinInfo.ContactName := '담당자명';
        joinInfo.ContactTEL :='02-999-9999';
        joinInfo.ContactHP := '010-1234-5678';
        joinInfo.ContactFAX := '02-999-9998';
        joinInfo.ContactEmail := 'test@test.com';

        try
                response := htCashbillService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);


end;

procedure TTFormExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        try
                balance := htCashbillService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

end;

procedure TTFormExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
         try
                balance := htCashbillService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
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
        joinInfo.id := 'userid';                        // [필수] 아이디 (6자 이상 20자 미만)
        joinInfo.pwd := 'thisispassword';               // [필수] 비밀번호 (6자 이상 20자 미만)
        joinInfo.personName := '담당자성명';            // [필수] 담당자명(한글이나 영문 30자 이내)
        joinInfo.tel := '070-7510-3710';                // [필수] 연락처
        joinInfo.hp := '010-1111-2222';                 // 휴대폰번호
        joinInfo.fax := '02-6442-9700';                 // 팩스번호
        joinInfo.email := 'test@test.com';              // [필수] 이메일
        joinInfo.searchAllAllowYN := false;             // 조회권한(true 회사조회/ false 개인조회)
        joinInfo.mgrYN     := false;                    // 관리자 권한여부 

        try
                response := htCashbillService.RegistContact(txtCorpNum.text,joinInfo,txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TTFormExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin

        try
                InfoList := htCashbillService.ListContact(txtCorpNum.text,txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        tmp := 'id | email | hp | personName | searchAllAlloyYN | tel | fax | mgrYN | regDT' + #13;
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].searchAllAllowYN) + ' | ';
            tmp := tmp + InfoList[i].tel + ' | ';
            tmp := tmp + InfoList[i].fax + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
            tmp := tmp + InfoList[i].regDT + #13;
        end;

        ShowMessage(tmp);
end;

procedure TTFormExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        contactInfo := TContactInfo.Create;

        contactInfo.personName := '테스트 담당자';      // 담당자명
        contactInfo.tel := '070-7510-3710';             // 연락처
        contactInfo.hp := '010-4324-1111';              // 휴대폰번호
        contactInfo.email := 'test@test.com';           // 이메일 주소
        contactInfo.fax := '02-6442-9799';              // 팩스번호
        contactInfo.searchAllAllowYN := false;           // 조회권한, true(회사조회), false(개인조회)
        contactInfo.mgrYN := false;                     // 관리자권한 설정여부 

        try
                response := htCashbillService.UpdateContact(txtCorpNum.text,contactInfo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TTFormExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        try
                corpInfo := htCashbillService.GetCorpInfo(txtCorpNum.text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
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
        corpInfo := TCorpInfo.Create;

        corpInfo.ceoname := '대표자명';         // 대표자명
        corpInfo.corpName := '팝빌1';    // 회사명
        corpInfo.bizType := '업태';             // 업태
        corpInfo.bizClass := '업종';            // 업종
        corpInfo.addr := '서울특별시 강남구 영동대로 517';  // 주소
        
        try
                response := htCashbillService.UpdateCorpInfo(txtCorpNum.text,corpInfo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

end.
