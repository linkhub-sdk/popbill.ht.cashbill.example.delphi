unit Example;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillHTCashbill, ExtCtrls, Grids;
  
const
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

        //����ȯ�� ������, true(�׽�Ʈ��), false(�����)
        htCashbillService.IsTest := true;
        
        //Exception ó�� ������. �̱���� true(�⺻��) 
        htCashbillService.IsThrowException := true;

        StringGrid1.Cells[0,0] := '����';
        StringGrid1.Cells[1,0] := '�ŷ��Ͻ�';
        StringGrid1.Cells[2,0] := '�ĺ���ȣ';
        StringGrid1.Cells[3,0] := '���ް���';
        StringGrid1.Cells[4,0] := '����';
        StringGrid1.Cells[5,0] := '�����';
        StringGrid1.Cells[6,0] := '�ŷ��ݾ�';
        StringGrid1.Cells[7,0] := '��������';
        StringGrid1.Cells[8,0] := '����û���ι�ȣ';


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
        // ������û�� ��ȯ�Ǵ� �۾����̵�(jobID)�� ��ȿ�ð��� 1�ð��Դϴ�.

        // ���ݿ����� ����,  SELL- ����, BUY- ����
        queryType := SELL;

        // ��������, ��������(yyyyMMdd)
        SDate := '20160501';

        // ��������, ��������(yyyyMMdd)
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
                // ��������Ȯ�� GetJobState(�˺�ȸ�� ����ڹ�ȣ, �۾����̵�)
                // �۾����̵�� ������û(requestJob) ȣ��� ��ȯ�˴ϴ�.
                jobInfo := htCashbillService.GetJobState(txtCorpNum.text, txtJobId.text);

        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

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

procedure TTFormExample.btnListActiveJobClick(Sender: TObject);
var
        jobList : THomeTaxCBJobInfoList;
        tmp : String;
        i : Integer;
begin

        try
                // 1�ð� �̳� ���� ��û�� �۾����̵� ����� Ȯ���մϴ�.
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
        // ���ݿ����� ����, N - �Ϲ� ���ݿ�����, C - ��� ���ݿ�����
        SetLength(tradeType, 2);
        tradeType[0] := 'N';
        tradeType[1] := 'C';

        // �ŷ��뵵 �迭, P - �ҵ������, C - ����������
        SetLength(tradeUsage, 2);
        tradeUsage[0] := 'P';
        tradeUsage[1] := 'C';

        // ��������ȣ 
        Page := 1;

        // �������� �˻�����
        PerPage := 10;

        // ���Ĺ���, D-��������, A-��������
        Order := 'D';

        try
                searchInfo := htCashbillService.Search(txtCorpNum.text, txtJobId.text, tradeType, tradeUsage, Page, PerPage, Order);

        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'code (�����ڵ�) : ' + IntToStr(searchInfo.code) + #13;
        tmp := tmp + 'total (�� �˻���� �Ǽ�) : ' + IntToStr(searchInfo.total) + #13;
        tmp := tmp + 'perPage (�������� �˻�����) : ' + IntToStr(searchInfo.perPage) + #13;
        tmp := tmp + 'pageNum (������ ��ȣ) : ' + IntToStr(searchInfo.pageNum) + #13;
        tmp := tmp + 'pageCount (������ ����) : ' + IntToStr(searchInfo.pageCount)+ #13;
        tmp := tmp + 'message (���� �޽���) : ' + searchInfo.message + #13 + #13;


        for i:=0 to length(searchInfo.list)-1 do
        begin

                StringGrid1.Cells[0, i+1] := searchInfo.list[i].tradeUsage;  // �ŷ�����
                StringGrid1.Cells[1, i+1] := searchInfo.list[i].tradeDT;     // �ŷ��Ͻ�
                StringGrid1.Cells[2, i+1] := searchInfo.list[i].identityNum; // �ŷ�ó �ĺ���ȣ
                StringGrid1.Cells[3, i+1] := searchInfo.list[i].supplyCost;  // ���ް���
                StringGrid1.Cells[4, i+1] := searchInfo.list[i].tax;         // ����
                StringGrid1.Cells[5, i+1] := searchInfo.list[i].serviceFee;  // �����
                StringGrid1.Cells[6, i+1] := searchInfo.list[i].totalAmount; // �ŷ��ݾ�
                StringGrid1.Cells[7, i+1] := searchInfo.list[i].tradeType;   // ���ݿ����� ����
                StringGrid1.Cells[8, i+1] := searchInfo.list[i].ntsconfirmNum; // ����û���ι�ȣ
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
        // ���ݿ����� ����, N - �Ϲ� ���ݿ�����, C - ��� ���ݿ�����
        SetLength(tradeType, 2);
        tradeType[0] := 'N';
        tradeType[1] := 'C';

        // �ŷ��뵵 �迭, P - �ҵ������, C - ����������
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

        tmp := 'count (���� ��� �Ǽ�) : ' + IntToStr(summaryInfo.count) + #13;
        tmp := tmp + 'supplyCostTotal (���ް��� �հ�) : ' + IntToStr(summaryInfo.supplyCostTotal) + #13;
        tmp := tmp + 'serviceFeeTotal (����� �հ�) : ' + IntToStr(summaryInfo.serviceFeeTotal) + #13;
        tmp := tmp + 'taxTotal (���� �հ�) : ' + IntToStr(summaryInfo.taxTotal) + #13;
        tmp := tmp + 'amountTotal (�հ� �ݾ�) : ' + IntToStr(summaryInfo.amountTotal) + #13;

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

        tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;

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

        ShowMessage('�˺� �α��� URL' + #13 + resultURL);
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

        ShowMessage('����Ʈ���� URL ' + #13 + resultURL);
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
        joinInfo.LinkID := LinkID;        //��ũ���̵�
        joinInfo.CorpNum := '1231212312'; //����ڹ�ȣ '-' ����.
        joinInfo.CEOName := '��ǥ�ڼ���';
        joinInfo.CorpName := '��ȣ';
        joinInfo.Addr := '�ּ�';
        joinInfo.BizType := '����';
        joinInfo.BizClass := '����';
        joinInfo.ID     := 'userid';  //6�� �̻� 20�� �̸�.
        joinInfo.PWD    := 'pwd_must_be_long_enough'; //6�� �̻� 20�� �̸�.
        joinInfo.ContactName := '����ڸ�';
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

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));

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

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));


end;

procedure TTFormExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        joinInfo.id := 'userid';                        // [�ʼ�] ���̵� (6�� �̻� 20�� �̸�)
        joinInfo.pwd := 'thisispassword';               // [�ʼ�] ��й�ȣ (6�� �̻� 20�� �̸�)
        joinInfo.personName := '����ڼ���';            // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 30�� �̳�)
        joinInfo.tel := '070-7510-3710';                // [�ʼ�] ����ó
        joinInfo.hp := '010-1111-2222';                 // �޴�����ȣ
        joinInfo.fax := '02-6442-9700';                 // �ѽ���ȣ
        joinInfo.email := 'test@test.com';              // [�ʼ�] �̸���
        joinInfo.searchAllAllowYN := false;             // ��ȸ����(true ȸ����ȸ/ false ������ȸ)
        joinInfo.mgrYN     := false;                    // ������ ���ѿ��� 

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

        contactInfo.personName := '�׽�Ʈ �����';      // ����ڸ�
        contactInfo.tel := '070-7510-3710';             // ����ó
        contactInfo.hp := '010-4324-1111';              // �޴�����ȣ
        contactInfo.email := 'test@test.com';           // �̸��� �ּ�
        contactInfo.fax := '02-6442-9799';              // �ѽ���ȣ
        contactInfo.searchAllAllowYN := false;           // ��ȸ����, true(ȸ����ȸ), false(������ȸ)
        contactInfo.mgrYN := false;                     // �����ڱ��� �������� 

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
        corpInfo := TCorpInfo.Create;

        corpInfo.ceoname := '��ǥ�ڸ�';         // ��ǥ�ڸ�
        corpInfo.corpName := '�˺�1';    // ȸ���
        corpInfo.bizType := '����';             // ����
        corpInfo.bizClass := '����';            // ����
        corpInfo.addr := '����Ư���� ������ ������� 517';  // �ּ�
        
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
