{******************************************************************************}
{
{ �˺� Ȩ�ý� ���ݿ����� ����  API Delphi SDK Example
{
{ - SDK Ʃ�丮�� : https://docs.popbill.com/htcashbill/tutorial/delphi
{ - ������Ʈ ���� : 2021-06-15
{ - ���� ������� ����ó : 1600-9854 / 070-4304-2991
{ - ���� ������� �̸��� : code@linkhub.co.kr
{
{ <�׽�Ʈ �������� �غ����>
{ (1) 41, 44�� ���ο� ����� ��ũ���̵�(LinkID)�� ���Ű(SecretKey)��
{    ��ũ��� ���Խ� ���Ϸ� �߱޹��� ���������� ����
{ (2) �˺� ���߿� ����Ʈ(test.popbill.com)�� ����ȸ������ ����
{ (3) Ȩ�ý� �������񽺸� �̿��ϱ� ���� �˺��� ���������� ����մϴ�
{     ��������� �μ������ ���� ���������� ���� ����� �ֽ��ϴ�.
{     - �˺��α��� > [Ȩ�ý�����] > [ȯ�漳��] > [���� ����] �޴�����
{       [Ȩ�ý� �μ������ ���] Ȥ�� [Ȩ�ý� ���������� ���]�� ����
{       ���������� ����մϴ�.
{     - Ȩ�ý����� ���� ���� �˾� URL(GetCertificatePopUpURL)��ȯ�� URL��
{       �����Ͽ� [Ȩ�ý� �μ������ ���] Ȥ�� [Ȩ�ý� ���������� ���]��
{       ���� ���������� ����մϴ�.
{******************************************************************************}

unit Example;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillHTCashbill, ExtCtrls, Grids;

const
        {**********************************************************************}
        { - ��������(��ũ���̵�, ���Ű)�� ��Ʈ���� ����ȸ���� �ĺ��ϴ�        }
        {   ������ ���ǹǷ� ������� �ʵ��� �����Ͻñ� �ٶ��ϴ�              }
        { - ����� ��ȯ���Ŀ��� ���������� ������� �ʽ��ϴ�.                  }
        {**********************************************************************}

        //��ũ���̵�.
        LinkID = 'TESTER';

        // ��Ʈ�� ��ſ� ���Ű. ���� ����.
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

        //����ȯ�� ������, true(���߿�), false(�����)
        htCashbillService.IsTest := true;

        //Exception ó�� ������. �̱���� true(�⺻��)
        htCashbillService.IsThrowException := true;

        //������ū IP���ѱ�� ��뿩��, true(����)
        htCashbillService.IPRestrictOnOff := true;

        //���ýý��� �ð� ��뿩��, true(���), false(�̻��) - �⺻��
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
        { ���ݿ����� ����/���� ���� ������ ��û�մϴ�.                         
        {  - ���� ��û�� ��ȯ�Ǵ� �۾����̵�(jobID)�� ��ȿ�ð��� 1�ð��Դϴ�.
        {  - https://docs.popbill.com/htcashbill/delphi/api#RequestJob
        {**********************************************************************}

        // ���ݿ����� ����,  SELL- ����, BUY- ����
        queryType := SELL;

        // ��������, ǥ������(yyyyMMdd)
        SDate := '20210601';

        // ��������, ǥ������(yyyyMMdd)
        EDate := '20210615';

        try
                jobID := htCashbillService.RequestJob(txtCorpNum.text, queryType, SDate, EDate);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'����޽��� : '+  htCashbillService.LastErrMessage);
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
        { ������û�� ���� ���¸� Ȯ���մϴ�.                                   
        { - https://docs.popbill.com/htcashbill/delphi/api#GetJobState
        {**********************************************************************}
        
        try
                jobInfo := htCashbillService.GetJobState(txtCorpNum.text, txtJobId.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'����޽��� : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'jobID (�۾����̵�) : '+ jobInfo.jobID + #13;
                tmp := tmp + 'jobState (��������) : '+ IntToStr(jobInfo.jobState) + #13;
                tmp := tmp + 'queryType (��������) : ' + jobInfo.queryType  + #13;
                tmp := tmp + 'queryDateType (�������� ����) : ' + jobInfo.queryDateType  + #13;
                tmp := tmp + 'queryStDate (��������) : ' + jobInfo.queryStDate + #13;
                tmp := tmp + 'queryEnDate (��������) : ' + jobInfo.queryEnDate + #13;
                tmp := tmp + 'errorCode (�����ڵ�) : ' + IntToStr(jobInfo.errorCode) + #13;
                tmp := tmp + 'errorReason (�����޽���) : ' + jobInfo.errorReason + #13;
                tmp := tmp + 'jobStartDT (�۾� �����Ͻ�) : ' + jobInfo.jobStartDT + #13;
                tmp := tmp + 'jobEndDT (�۾� �����Ͻ�) : ' + jobInfo.jobEndDT + #13;
                tmp := tmp + 'collectCount (��������) : ' + IntToStr(jobInfo.collectCount) + #13;
                tmp := tmp + 'regDT (���� ��û�Ͻ�) : ' + jobInfo.regDT + #13;

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
        { 1�ð� �̳� ���� ��û�� �۾����̵� ����� Ȯ���մϴ�.                 
        { - https://docs.popbill.com/htcashbill/delphi/api#ListActiveState
        {**********************************************************************}

        try
                jobList := htCashbillService.ListActiveState(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'����޽��� : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'jobID(�۾����̵�) | jobState(��������) | queryType(��������) | queryDateType(��������) | ';
                tmp := tmp + 'queryStDate(��������) |queryEnDate(��������) | errorCode(�����ڵ�) | errorReason(�����޽���) | ';
                tmp := tmp + 'jobStartDT(�۾� �����Ͻ�) | jobEndDT(�۾� �����Ͻ�) | collectCount(��������) | regDT(���� ��û�Ͻ�) ' + #13;

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
        { ���ݿ����� ����/���� ������ ���� ����� ��ȸ�մϴ�.                  
        {  - ���� ��û�� ��ȯ�Ǵ� �۾����̵�(jobID)�� ��ȿ�ð��� 1�ð��Դϴ�.  
        {  - https://docs.popbill.com/htcashbill/delphi/api#Search
        {**********************************************************************}

        // ���ݿ����� ����, N-�Ϲ� ���ݿ�����, C-��� ���ݿ�����
        SetLength(tradeType, 2);
        tradeType[0] := 'N';
        tradeType[1] := 'C';

        // �ŷ��뵵 �迭, P-�ҵ������, C-����������
        SetLength(tradeUsage, 2);
        tradeUsage[0] := 'P';
        tradeUsage[1] := 'C';

        // ��������ȣ, �⺻�� '1'
        Page := 1;

        // �������� �˻�����, �⺻�� 500, �ִ� 1000
        PerPage := 10;

        // ���Ĺ���, D-��������, A-��������
        Order := 'D';

        try
                searchInfo := htCashbillService.Search(txtCorpNum.text, txtJobId.text, tradeType, tradeUsage, Page, PerPage, Order);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;                                                                     
                end;
        end;


        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'����޽��� : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'code (�����ڵ�) : ' + IntToStr(searchInfo.code) + #13;
                tmp := tmp + 'total (�� �˻���� �Ǽ�) : ' + IntToStr(searchInfo.total) + #13;
                tmp := tmp + 'perPage (�������� �˻�����) : ' + IntToStr(searchInfo.perPage) + #13;
                tmp := tmp + 'pageNum (������ ��ȣ) : ' + IntToStr(searchInfo.pageNum) + #13;
                tmp := tmp + 'pageCount (������ ����) : ' + IntToStr(searchInfo.pageCount)+ #13;
                tmp := tmp + 'message (���� �޽���) : ' + searchInfo.message + #13 + #13;

                for i:=0 to length(searchInfo.list)-1 do
                begin
                        StringGrid1.Cells[0, i+1] := searchInfo.list[i].ntsconfirmNum;             // ����û ���ι�ȣ
                        StringGrid1.Cells[1, i+1] := searchInfo.list[i].tradeDate;                 // �ŷ�����
                        StringGrid1.Cells[2, i+1] := searchInfo.list[i].tradeDT;                   // �ŷ��Ͻ�
                        StringGrid1.Cells[3, i+1] := searchInfo.list[i].tradeType;                 // ��������
                        StringGrid1.Cells[4, i+1] := searchInfo.list[i].tradeUsage;                // �ŷ�����
                        StringGrid1.Cells[5, i+1] := searchInfo.list[i].totalAmount;               // �ŷ��ݾ�
                        StringGrid1.Cells[6, i+1] := searchInfo.list[i].supplyCost;                // ���ް���
                        StringGrid1.Cells[7, i+1] := searchInfo.list[i].tax;                       // �ΰ���
                        StringGrid1.Cells[8, i+1] := searchInfo.list[i].serviceFee;                // �����
                        StringGrid1.Cells[9, i+1] := searchInfo.list[i].invoiceType;               // ����/����
                        StringGrid1.Cells[10, i+1] := searchInfo.list[i].franchiseCorpNum;         // ������ ����ڹ�ȣ
                        StringGrid1.Cells[11, i+1] := searchInfo.list[i].franchiseCorpName;        // ������ ��ȣ
                        StringGrid1.Cells[12, i+1] := searchInfo.list[i].franchiseCorpName;        // ������ ���������
                        StringGrid1.Cells[13, i+1] := searchInfo.list[i].identityNum;              // �ĺ���ȣ
                        StringGrid1.Cells[14, i+1] := IntToStr(searchInfo.list[i].identityNumType);// �ĺ���ȣ����
                        StringGrid1.Cells[15, i+1] := searchInfo.list[i].customerName;             // ����
                        StringGrid1.Cells[16, i+1] := searchInfo.list[i].cardOwnerName;            // ī������ڸ�
                        StringGrid1.Cells[17, i+1] := IntToStr(searchInfo.list[i].deductionType);  // ��������
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
        { ���ݿ�����  ����/���� ������ ���� ��� ��������� ��ȸ�մϴ�.        
        {  - ���� ��û�� ��ȯ�Ǵ� �۾����̵�(jobID)�� ��ȿ�ð��� 1�ð��Դϴ�.  
        {  - https://docs.popbill.com/htcashbill/delphi/api#Summary
        {**********************************************************************}

        // ���ݿ����� ����, N-�Ϲ� ���ݿ�����, C-��� ���ݿ�����
        SetLength(tradeType, 2);
        tradeType[0] := 'N';
        tradeType[1] := 'C';

        // �ŷ��뵵 �迭, P-�ҵ������, C-����������
        SetLength(tradeUsage, 2);
        tradeUsage[0] := 'P';
        tradeUsage[1] := 'C';

        try
                summaryInfo := htCashbillService.Summary(txtCorpNum.text, txtJobId.text, tradeType, tradeUsage);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'����޽��� : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'count (���� ��� �Ǽ�) : ' + IntToStr(summaryInfo.count) + #13;
                tmp := tmp + 'supplyCostTotal (���ް��� �հ�) : ' + IntToStr(summaryInfo.supplyCostTotal) + #13;
                tmp := tmp + 'serviceFeeTotal (����� �հ�) : ' + IntToStr(summaryInfo.serviceFeeTotal) + #13;
                tmp := tmp + 'taxTotal (���� �հ�) : ' + IntToStr(summaryInfo.taxTotal) + #13;
                tmp := tmp + 'amountTotal (�հ� �ݾ�) : ' + IntToStr(summaryInfo.amountTotal) + #13;
                ShowMessage(tmp);
        end;

end;

procedure TTFormExample.btnGetFlatRatePopUpURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ������ ���� ��û �˾� URL�� ��ȯ�մϴ�.                            
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetFlatRatePopUpURL
        {**********************************************************************}
        
        try
                resultURL := htCashbillService.GetFlatRatePopUpURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'����޽��� : '+  htCashbillService.LastErrMessage);
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
        { ������ ���� ���¸� Ȯ���մϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetFlatRateState
        {**********************************************************************}
        
        try
                stateInfo := htCashbillService.GetFlatRateState(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'����޽��� : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'referenceID (����ڹ�ȣ) : ' + stateInfo.referenceID + #13;
                tmp := tmp + 'contractDT (������ ���� �����Ͻ�) : ' + stateInfo.contractDT + #13;
                tmp := tmp + 'useEndDate (������ ���� �����Ͻ�) : ' + stateInfo.useEndDate + #13;
                tmp := tmp + 'baseDate (�ڵ����� ������) : ' + IntToStr(stateInfo.baseDate) + #13;
                tmp := tmp + 'state (������ ���� ����) : ' + IntToStr(stateInfo.state) + #13;
                tmp := tmp + 'closeRequestYN (������ ������û ����) : ' + BoolToStr(stateInfo.closeRequestYN) + #13;
                tmp := tmp + 'useRestrictYN (������ ������� ����) : ' + BoolToStr(stateInfo.useRestrictYN) + #13;
                tmp := tmp + 'closeOnExpired (������ ����� ���� ����) : ' + BoolToStr(stateInfo.closeOnExpired) + #13;
                tmp := tmp + 'unPaidYN (�̼��� ���� ����) : ' + BoolToStr(stateInfo.unPaidYN) + #13;
                ShowMessage(tmp);
        end;


end;

procedure TTFormExample.btnGetCertificatePopUpURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { Ȩ�ý� ���� ���������� ���� URL�� ��ȯ �մϴ�.
        { - ������Ŀ��� �μ������/���������� ���� ����� �ֽ��ϴ�.
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetCertificatePopUpURL
        {**********************************************************************}
        
        try
                resultURL := htCashbillService.GetCertificatePopUpURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'����޽��� : '+  htCashbillService.LastErrMessage);
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
        { �˺��� ��ϵ� Ȩ�ý� ���������� �������ڸ� Ȯ���մϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetCertificateExpireDate
        {**********************************************************************}
        
        try
                expires := htCashbillService.GetCertificateExpireDate(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'����޽��� : '+  htCashbillService.LastErrMessage);
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
        { Ȩ�ý� ���ݿ����� ����  API ���� ���������� Ȯ���մϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetChargeInfo
        {******************************************************************}
        
        try
                chargeInfo := htCashbillService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'����޽��� : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;
end;

procedure TTFormExample.btnGetAccessURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �˺�(www.popbill.com)�� �α��ε� �˾� URL�� ��ȯ�մϴ�.
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetAccessURL
        {**********************************************************************}
        
        try
                resultURL := htCashbillService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
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
        { ����ȸ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.                            
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetChargeURL  
        {**********************************************************************}

        try
                resultURL := htCashbillService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
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
        { ��Ʈ���� ����ȸ������ ���Ե� ����ڹ�ȣ���� Ȯ���մϴ�.
        { - LinkID�� ��Ʈ�ʸ� �ĺ��ϴ� ��������(38������)�� �����Ǿ� �ֽ��ϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#CheckIsMember
        {**********************************************************************}
        
        try
                response := htCashbillService.CheckIsMember(txtCorpNum.text,LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TTFormExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ȸ������(JoinMember API)�� ȣ���ϱ� �� ���̵� �ߺ��� Ȯ���մϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#CheckID
        {**********************************************************************}

        try
                response := htCashbillService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TTFormExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { ��Ʈ���� ����ȸ������ ȸ�������� ��û�մϴ�.
        { - ���̵� �ߺ�Ȯ���� btnCheckIDClick ���ν����� �����Ͻñ� �ٶ��ϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#JoinMember 
        {**********************************************************************}

        // ��ũ���̵�
        joinInfo.LinkID := LinkID;

        // ����ڹ�ȣ '-' ����, 10�ڸ�
        joinInfo.CorpNum := '1234567890';

        // ��ǥ�ڼ���, �ִ� 100��
        joinInfo.CEOName := '��ǥ�ڼ���';

        // ��ȣ��, �ִ� 200��
        joinInfo.CorpName := '��ũ���';

        // �ּ�, �ִ� 300��
        joinInfo.Addr := '�ּ�';

        // ����, �ִ� 100��
        joinInfo.BizType := '����';

        // ����, �ִ� 100��
        joinInfo.BizClass := '����';

        // ���̵�, 6���̻� 50�� �̸�
        joinInfo.ID     := 'userid';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // ����ڸ�, �ִ� 100��
        joinInfo.ContactName := '����ڸ�';

        // ����� ����ó, �ִ� 20��
        joinInfo.ContactTEL :='070-4304-2991';

        // ����� �޴�����ȣ, �ִ� 20��
        joinInfo.ContactHP := '010-000-1111';

        // ����� �ѽ���ȣ, �ִ� 20��
        joinInfo.ContactFAX := '02-6442-9700';

        // ����� ����, �ִ� 100��
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := htCashbillService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TTFormExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ����ȸ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ���������� �ƴ�       
        { - ��Ʈ�ʰ����� ��� ��Ʈ�� �ܿ�����Ʈ Ȯ��(GetPartnerBalance API)��    
        {   �̿��Ͻñ� �ٶ��ϴ�
        { - https://docs.popbill.com/htcashbill/delphi/api#GetBalance
        {**********************************************************************}
        
        try
                balance := htCashbillService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
end;

procedure TTFormExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ��Ʈ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ��Ʈ�ʰ����� �ƴ�
        { - ���������� ��� ����ȸ�� �ܿ�����Ʈ Ȯ��(GetBalance API)��
        {   �̿��Ͻñ� �ٶ��ϴ�
        { - https://docs.popbill.com/htcashbill/delphi/api#GetPartnerBalance
        {**********************************************************************}
        
        try
                balance := htCashbillService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
end;

procedure TTFormExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { ����ȸ���� ����ڸ� �űԷ� ����մϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#RegistContact
        {**********************************************************************}

        // [�ʼ�] ����� ���̵� (6�� �̻� 50�� �̸�)
        joinInfo.id := 'testkorea';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 100�� �̳�)
        joinInfo.personName := '����ڼ���';

        // [�ʼ�] ����ó (�ִ� 20��)
        joinInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        joinInfo.hp := '010-1111-2222';

        // �ѽ���ȣ (�ִ� 20��)
        joinInfo.fax := '02-6442-9700';

        // [�ʼ�] �̸��� (�ִ� 100��)
        joinInfo.email := 'test@test.com';

        // ����� ��ȸ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        joinInfo.searchRole := '3';

        try
                response := htCashbillService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TTFormExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ����ȸ���� ����� ����� Ȯ���մϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#ListContact
        {**********************************************************************}

        try
                InfoList := htCashbillService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'id(���̵�) | email(�̸���) | hp(�޴���) | personName(����) | searchRole(����� ��ȸ ����) | ';
        tmp := tmp + 'tel(����ó) | fax(�ѽ�) | mgrYN(������ ����) | regDT(����Ͻ�) | state(����)' + #13;

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
        { ����ȸ���� ����� ������ �����մϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // ����� ���̵�
        contactInfo.id := 'testkorea';

        // ����ڸ� (�ִ� 100��)
        contactInfo.personName := '�׽�Ʈ �����';

        // ����ó (�ִ� 20��)
        contactInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        contactInfo.hp := '010-4324-1111';

        // �̸��� �ּ� (�ִ� 100��)
        contactInfo.email := 'test@test.com';

        // �ѽ���ȣ (�ִ� 20��)
        contactInfo.fax := '02-6442-9799';

        // ����� ��ȸ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        contactInfo.searchRole := '3';

        try
                response := htCashbillService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);

end;

procedure TTFormExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� Ȯ���մϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetCorpInfo
        {**********************************************************************}
        
        try
                corpInfo := htCashbillService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName (��ȣ) : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName (��ǥ�ڼ���) : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType (����) : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass (����) : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr (�ּ�) : ' + corpInfo.Addr + #13;
        ShowMessage(tmp);
end;

procedure TTFormExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� �����մϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // ��ǥ�ڸ�, �ִ� 100��
        corpInfo.ceoname := '��ǥ�ڸ�';

        // ��ȣ, �ִ� 200��
        corpInfo.corpName := '��ȣ';

        // ����, �ִ� 100��
        corpInfo.bizType := '����';

        // ����, �ִ� 100��
        corpInfo.bizClass := '����';

        // �ּ�, �ִ� 300��
        corpInfo.addr := '����Ư���� ������ ������� 517';

        try
                response := htCashbillService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TTFormExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ��Ʈ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.                              
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetPartnerURL  
        {**********************************************************************}

        try
                resultURL := htCashbillService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
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
        { �˺��� ��ϵ� ������������ Ȩ�ý� �α����� �׽�Ʈ�Ѵ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#CheckCertValidation               
        {**********************************************************************}

        try
                response := htCashbillService.CheckCertValidation(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(htCashbillService.LastErrCode) + #10#13 +'����޽��� : '+  htCashbillService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;

end;

procedure TTFormExample.btnRegistDeptUserClick(Sender: TObject);
var
        response : TResponse;
        deptUserID, deptUserPWD : String;
begin
        {**********************************************************************}
        { Ȩ�ý� ���ݿ����� �μ������ ������ ����Ѵ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#RegistDeptUser
        {**********************************************************************}

        //Ȩ�ý����� ������ ���ݿ����� �μ������ ���̵�
        deptUserID := 'test_id';

        // Ȩ�ý����� ������ ���ݿ����� �μ������ ��й�ȣ
        deptUserPWD := 'test_pwd!';

        try
                response := htCashbillService.RegistDeptUser(txtCorpNum.Text, deptUserID, deptUserPWD);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TTFormExample.btnCheckDeptUserClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { �˺��� ��ϵ� ���ݿ����� �μ������ ���̵� Ȯ���Ѵ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#CheckDeptUser
        {**********************************************************************}

        try
                response := htCashbillService.CheckDeptUser(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TTFormExample.btnCheckLoginDeptUserClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { �˺��� ��ϵ� ���ݿ������μ������ ���������� �̿��Ͽ� Ȩ�ý� �α����� �׽�Ʈ�Ѵ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#CheckLoginDeptUser                                          
        {**********************************************************************}

        try
                response := htCashbillService.CheckLoginDeptUser(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TTFormExample.btnDeleteDeptUserClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { �˺��� ��ϵ� ���ݿ����� �μ������ ���������� �����Ѵ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#DeleteDeptUser
        {**********************************************************************}

        try
                response := htCashbillService.DeleteDeptUser(txtCorpNum.Text);
        except
                on le : EPopbillException do begin          
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TTFormExample.btnGetPaymentURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ �������� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := htCashbillService.getPaymentURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        { ����ȸ�� ����Ʈ ��볻�� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := htCashbillService.getUseHistoryURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� ����� ������ Ȯ���Ѵ�.
        { - https://docs.popbill.com/htcashbill/delphi/api#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := htCashbillService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if htCashbillService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(htCashbillService.LastErrCode) + #10#13 +'����޽��� : '+ htCashbillService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (���̵�) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (����� ����) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (����� ����ó(��ȭ��ȣ)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'hp (����� �޴�����ȣ) : ' + contactInfo.hp + #13;
                tmp := tmp + 'fax (����� �ѽ���ȣ) : ' + contactInfo.fax + #13;
                tmp := tmp + 'email (����� �̸���) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (��� �Ͻ�) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (����� ��ȸ����) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (������ ����) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (��������) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.
