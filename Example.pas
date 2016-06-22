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
        mgtKeyType: EnumMgtKeyType;
        SDate: String;
        EDate: String;
        jobID: String;
begin

        // ���ݿ����� ����,  SELL- ����, BUY- ����
        mgtKeyType := EnumMgtKeyType(GetEnumValue(TypeInfo(EnumMgtKeyType),'SELL'));


        // ��������, ��������(yyyyMMdd)
        SDate := '20160501';

        // ��������, ��������(yyyyMMdd)
        EDate := '20160731';
        
        try
                jobID := htCashbillService.RequestJob(txtCorpNum.text, mgtKeyType, SDate, EDate);

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

        tmp := 'jobID : '+ jobInfo.jobID + #13;
        tmp := tmp + 'jobState : '+ IntToStr(jobInfo.jobState) + #13;
        tmp := tmp + 'queryType : ' + jobInfo.queryType  + #13;
        tmp := tmp + 'queryDateType : ' + jobInfo.queryDateType  + #13;
        tmp := tmp + 'queryStDate : ' + jobInfo.queryStDate + #13;
        tmp := tmp + 'queryEnDate : ' + jobInfo.queryEnDate + #13;
        tmp := tmp + 'errorCode : ' + IntToStr(jobInfo.errorCode) + #13;
        tmp := tmp + 'errorReason : ' + jobInfo.errorReason + #13;
        tmp := tmp + 'jobStartDT : ' + jobInfo.jobStartDT + #13;
        tmp := tmp + 'jobEndDT : ' + jobInfo.jobEndDT + #13;
        tmp := tmp + 'collectCount : ' + IntToStr(jobInfo.collectCount) + #13;
        tmp := tmp + 'regDT : ' + jobInfo.regDT + #13;

        tmp := tmp + #13;

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

end.
