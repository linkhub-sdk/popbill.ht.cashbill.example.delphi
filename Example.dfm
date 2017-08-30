object TFormExample: TTFormExample
  Left = 403
  Top = 117
  Width = 1121
  Height = 802
  Caption = '팝빌 홈택스 현금영수증 연계 API SDK Example'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 16
    Top = 12
    Width = 129
    Height = 13
    AutoSize = False
    Caption = '팝빌회원 사업자번호 : '
  end
  object Label4: TLabel
    Left = 304
    Top = 12
    Width = 81
    Height = 13
    AutoSize = False
    Caption = '팝빌아이디 : '
  end
  object GroupBox8: TGroupBox
    Left = 8
    Top = 40
    Width = 1089
    Height = 161
    Caption = '팝빌 기본 API'
    TabOrder = 0
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 137
      Height = 121
      Caption = '회원가입'
      TabOrder = 0
      object btnJoinMember: TButton
        Left = 8
        Top = 88
        Width = 120
        Height = 25
        Caption = '회원 가입'
        TabOrder = 0
        OnClick = btnJoinMemberClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = '가입여부확인'
        TabOrder = 1
        OnClick = btnCheckIsMemberClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = 'ID 중복 확인'
        TabOrder = 2
        OnClick = btnCheckIDClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 160
      Top = 24
      Width = 145
      Height = 121
      Caption = '포인트 관련'
      TabOrder = 1
      object btnGetChargeInfo: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '과금정보 확인'
        TabOrder = 0
        OnClick = btnGetChargeInfoClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 624
      Top = 24
      Width = 145
      Height = 121
      Caption = '담당자 관련'
      TabOrder = 2
      object btnUpdateContact: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = '담당자 정보 수정'
        TabOrder = 0
        OnClick = btnUpdateContactClick
      end
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '담당자 추가'
        TabOrder = 1
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '담당자 목록 조회'
        TabOrder = 2
        OnClick = btnListContactClick
      end
    end
    object GroupBox16: TGroupBox
      Left = 776
      Top = 24
      Width = 145
      Height = 121
      Caption = '회사정보 관련'
      TabOrder = 3
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '회사정보 조회'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 128
        Height = 25
        Caption = '회사정보 수정'
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 928
      Top = 24
      Width = 153
      Height = 121
      Caption = '기타'
      TabOrder = 4
      object btnGetPopbillURL_LOGIN: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '팝빌 로그인 URL'
        TabOrder = 0
        OnClick = btnGetPopbillURL_LOGINClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 312
      Top = 24
      Width = 148
      Height = 121
      Caption = '연동과금 포인트'
      TabOrder = 5
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '잔여포인트 확인'
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetPopbillURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '포인트충전 URL'
        TabOrder = 1
        OnClick = btnGetPopbillURL_CHRGClick
      end
    end
    object GroupBox10: TGroupBox
      Left = 472
      Top = 24
      Width = 145
      Height = 121
      Caption = '파트너과금 포인트'
      TabOrder = 6
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '파트너포인트 확인'
        TabOrder = 0
        OnClick = btnGetPartnerBalanceClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '포인트충전 URL'
        TabOrder = 1
        OnClick = btnGetPartnerURL_CHRGClick
      end
    end
  end
  object txtCorpNum: TEdit
    Left = 144
    Top = 8
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 1
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 384
    Top = 8
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 2
    Text = 'testkorea'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 208
    Width = 769
    Height = 545
    Caption = '홈택스 현금영수증 연계 관련 API'
    TabOrder = 3
    object Label1: TLabel
      Left = 24
      Top = 176
      Width = 106
      Height = 13
      AutoSize = False
      Caption = '작업아이디 (jobID) :'
    end
    object Label2: TLabel
      Left = 24
      Top = 198
      Width = 263
      Height = 13
      AutoSize = False
      Caption = '(작업아이디는 '#39'수집 요청'#39' 호출시 생성됩니다.)'
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 24
      Width = 149
      Height = 128
      Caption = '매출/매입 내역 수집'
      TabOrder = 0
      object btnRequestJob: TButton
        Left = 8
        Top = 24
        Width = 130
        Height = 25
        Caption = '수집 요청'
        TabOrder = 0
        OnClick = btnRequestJobClick
      end
      object btnGetJobState: TButton
        Left = 8
        Top = 56
        Width = 131
        Height = 25
        Caption = '수집 상태 확인'
        TabOrder = 1
        OnClick = btnGetJobStateClick
      end
      object btnListActiveJob: TButton
        Left = 8
        Top = 88
        Width = 131
        Height = 25
        Caption = '수집 상태 목록 확인'
        TabOrder = 2
        OnClick = btnListActiveJobClick
      end
    end
    object txtJobID: TEdit
      Left = 136
      Top = 173
      Width = 153
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 1
    end
    object GroupBox5: TGroupBox
      Left = 176
      Top = 24
      Width = 179
      Height = 129
      Caption = '매출/매입 수집결과 조회'
      TabOrder = 2
      object btnSearch: TButton
        Left = 8
        Top = 24
        Width = 161
        Height = 25
        Caption = '수집 결과 조회'
        TabOrder = 0
        OnClick = btnSearchClick
      end
      object btnSummary: TButton
        Left = 8
        Top = 56
        Width = 161
        Height = 25
        Caption = '수집 결과 요약정보 조회'
        TabOrder = 1
        OnClick = btnSummaryClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 368
      Top = 24
      Width = 177
      Height = 161
      Caption = '부가기능'
      TabOrder = 3
      object btnGetFlatRatePopUpURL: TButton
        Left = 8
        Top = 24
        Width = 161
        Height = 25
        Caption = '정액제 서비스 신청 URL'
        TabOrder = 0
        OnClick = btnGetFlatRatePopUpURLClick
      end
      object btnGetFlatRateState: TButton
        Left = 8
        Top = 56
        Width = 161
        Height = 25
        Caption = '정액제 서비스 상태 확인'
        TabOrder = 1
        OnClick = btnGetFlatRateStateClick
      end
      object btnGetCertificatePopUpURL: TButton
        Left = 8
        Top = 88
        Width = 161
        Height = 25
        Caption = '공인인증서 등록 URL'
        TabOrder = 2
        OnClick = btnGetCertificatePopUpURLClick
      end
      object btnGetCertificateExpireDate: TButton
        Left = 8
        Top = 120
        Width = 161
        Height = 25
        Caption = '공인인증서 만료일자 확인'
        TabOrder = 3
        OnClick = btnGetCertificateExpireDateClick
      end
    end
    object StringGrid1: TStringGrid
      Left = 16
      Top = 216
      Width = 737
      Height = 281
      ColCount = 9
      FixedCols = 0
      RowCount = 11
      TabOrder = 4
      ColWidths = (
        64
        107
        82
        79
        84
        76
        83
        61
        85)
    end
  end
end
