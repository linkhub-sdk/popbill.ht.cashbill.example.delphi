object TFormExample: TTFormExample
  Left = 669
  Top = 246
  Caption = #54045#48716' '#54856#53469#49828' '#54788#44552#50689#49688#51613' '#50672#46041' API SDK Example'
  ClientHeight = 763
  ClientWidth = 1105
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
    Caption = #54045#48716#54924#50896' '#49324#50629#51088#48264#54840' : '
  end
  object Label4: TLabel
    Left = 304
    Top = 12
    Width = 81
    Height = 13
    AutoSize = False
    Caption = #54045#48716#50500#51060#46356' : '
  end
  object Label5: TLabel
    Left = 744
    Top = 13
    Width = 81
    Height = 13
    AutoSize = False
    Caption = 'URL : '
  end
  object GroupBox8: TGroupBox
    Left = 8
    Top = 40
    Width = 1089
    Height = 185
    Caption = #54045#48716' '#44592#48376' API'
    TabOrder = 0
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 137
      Height = 121
      Caption = #54924#50896#44032#51077
      TabOrder = 0
      object btnJoinMember: TButton
        Left = 8
        Top = 88
        Width = 120
        Height = 25
        Caption = #54924#50896' '#44032#51077
        TabOrder = 0
        OnClick = btnJoinMemberClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = #44032#51077#50668#48512#54869#51064
        TabOrder = 1
        OnClick = btnCheckIsMemberClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = #50500#51060#46356' '#51473#48373' '#54869#51064
        TabOrder = 2
        OnClick = btnCheckIDClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 160
      Top = 24
      Width = 145
      Height = 121
      Caption = #54252#51064#53944' '#44288#47144
      TabOrder = 1
      object btnGetChargeInfo: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = #44284#44552#51221#48372' '#54869#51064
        TabOrder = 0
        OnClick = btnGetChargeInfoClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 624
      Top = 24
      Width = 145
      Height = 153
      Caption = #45812#45817#51088' '#44288#47144
      TabOrder = 2
      object btnUpdateContact: TButton
        Left = 8
        Top = 120
        Width = 129
        Height = 25
        Caption = #45812#45817#51088' '#51221#48372' '#49688#51221
        TabOrder = 0
        OnClick = btnUpdateContactClick
      end
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = #45812#45817#51088' '#52628#44032
        TabOrder = 1
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = #45812#45817#51088' '#47785#47197' '#51312#54924
        TabOrder = 2
        OnClick = btnListContactClick
      end
      object btnGetContactInfo: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = #45812#45817#51088' '#51221#48372' '#54869#51064
        TabOrder = 3
        OnClick = btnGetContactInfoClick
      end
    end
    object GroupBox16: TGroupBox
      Left = 776
      Top = 24
      Width = 145
      Height = 121
      Caption = #54924#49324#51221#48372' '#44288#47144
      TabOrder = 3
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = #54924#49324#51221#48372' '#51312#54924
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 128
        Height = 25
        Caption = #54924#49324#51221#48372' '#49688#51221
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 928
      Top = 24
      Width = 153
      Height = 121
      Caption = #44592#53440
      TabOrder = 4
      object btnGetAccessURL: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = #54045#48716' '#47196#44536#51064' URL'
        TabOrder = 0
        OnClick = btnGetAccessURLClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 312
      Top = 24
      Width = 148
      Height = 153
      Caption = #50672#46041#44284#44552' '#54252#51064#53944
      TabOrder = 5
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = #51092#50668#54252#51064#53944' '#54869#51064
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetChargeURL: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = #54252#51064#53944#52649#51204' URL'
        TabOrder = 1
        OnClick = btnGetChargeURLClick
      end
      object btnGetPaymentURL: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = #54252#51064#53944' '#44208#51228#45236#50669' URL'
        TabOrder = 2
        OnClick = btnGetPaymentURLClick
      end
      object btnGetUseHistoryURL: TButton
        Left = 8
        Top = 120
        Width = 129
        Height = 25
        Caption = #54252#51064#53944' '#49324#50857#45236#50669' URL'
        TabOrder = 3
        OnClick = btnGetUseHistoryURLClick
      end
    end
    object GroupBox10: TGroupBox
      Left = 472
      Top = 24
      Width = 145
      Height = 121
      Caption = #54028#53944#45320#44284#44552' '#54252#51064#53944
      TabOrder = 6
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = #54028#53944#45320#54252#51064#53944' '#54869#51064
        TabOrder = 0
        OnClick = btnGetPartnerBalanceClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = #54252#51064#53944#52649#51204' URL'
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
    Top = 224
    Width = 1089
    Height = 529
    Caption = #54856#53469#49828' '#54788#44552#50689#49688#51613' '#50672#44228' '#44288#47144' API'
    TabOrder = 3
    object Label1: TLabel
      Left = 24
      Top = 208
      Width = 106
      Height = 13
      AutoSize = False
      Caption = #51089#50629#50500#51060#46356' (jobID) :'
    end
    object Label2: TLabel
      Left = 24
      Top = 230
      Width = 263
      Height = 13
      AutoSize = False
      Caption = '('#51089#50629#50500#51060#46356#45716' '#39#49688#51665' '#50836#52397#39' '#54840#52636#49884' '#49373#49457#46121#45768#45796'.)'
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 24
      Width = 149
      Height = 161
      Caption = #47588#52636'/'#47588#51077' '#45236#50669' '#49688#51665
      TabOrder = 0
      object btnRequestJob: TButton
        Left = 8
        Top = 24
        Width = 130
        Height = 25
        Caption = #49688#51665' '#50836#52397
        TabOrder = 0
        OnClick = btnRequestJobClick
      end
      object btnGetJobState: TButton
        Left = 8
        Top = 56
        Width = 131
        Height = 25
        Caption = #49688#51665' '#49345#53468' '#54869#51064
        TabOrder = 1
        OnClick = btnGetJobStateClick
      end
      object btnListActiveJob: TButton
        Left = 8
        Top = 88
        Width = 131
        Height = 25
        Caption = #49688#51665' '#49345#53468' '#47785#47197' '#54869#51064
        TabOrder = 2
        OnClick = btnListActiveJobClick
      end
    end
    object txtJobID: TEdit
      Left = 136
      Top = 205
      Width = 153
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 1
    end
    object GroupBox5: TGroupBox
      Left = 176
      Top = 24
      Width = 179
      Height = 161
      Caption = #47588#52636'/'#47588#51077' '#49688#51665#44208#44284' '#51312#54924
      TabOrder = 2
      object btnSearch: TButton
        Left = 8
        Top = 24
        Width = 161
        Height = 25
        Caption = #49688#51665' '#44208#44284' '#51312#54924
        TabOrder = 0
        OnClick = btnSearchClick
      end
      object btnSummary: TButton
        Left = 8
        Top = 56
        Width = 161
        Height = 25
        Caption = #49688#51665' '#44208#44284' '#50836#50557#51221#48372' '#51312#54924
        TabOrder = 1
        OnClick = btnSummaryClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 368
      Top = 24
      Width = 177
      Height = 161
      Caption = #48512#44032#44592#45733
      TabOrder = 3
      object btnGetFlatRatePopUpURL: TButton
        Left = 8
        Top = 24
        Width = 161
        Height = 25
        Caption = #51221#50529#51228' '#49436#48708#49828' '#49888#52397' URL'
        TabOrder = 0
        OnClick = btnGetFlatRatePopUpURLClick
      end
      object btnGetFlatRateState: TButton
        Left = 8
        Top = 56
        Width = 161
        Height = 25
        Caption = #51221#50529#51228' '#49436#48708#49828' '#49345#53468' '#54869#51064
        TabOrder = 1
        OnClick = btnGetFlatRateStateClick
      end
    end
    object StringGrid1: TStringGrid
      Left = 16
      Top = 248
      Width = 1057
      Height = 281
      ColCount = 18
      FixedCols = 0
      RowCount = 11
      TabOrder = 4
      ColWidths = (
        91
        77
        122
        79
        84
        76
        83
        61
        85
        97
        104
        64
        64
        64
        64
        64
        64
        64)
    end
    object GroupBox12: TGroupBox
      Left = 552
      Top = 24
      Width = 377
      Height = 161
      Caption = #54856#53469#49828' '#51064#51613#44288#47144' '#44592#45733
      TabOrder = 5
      object btnGetCertificatePopUpURL: TButton
        Left = 8
        Top = 24
        Width = 177
        Height = 25
        Caption = #54856#53469#49828' '#51064#51613#44288#47532' URL'
        TabOrder = 0
        OnClick = btnGetCertificatePopUpURLClick
      end
      object btnGetCertificateExpireDate: TButton
        Left = 8
        Top = 56
        Width = 177
        Height = 25
        Caption = #44277#46041#51064#51613#49436' '#47564#47308#51068#51088' '#54869#51064
        TabOrder = 1
        OnClick = btnGetCertificateExpireDateClick
      end
      object btnCheckCertValidation: TButton
        Left = 8
        Top = 88
        Width = 177
        Height = 25
        Caption = #44277#46041#51064#51613#49436' '#47196#44536#51064' '#53580#49828#53944
        TabOrder = 2
        OnClick = btnCheckCertValidationClick
      end
      object btnRegistDeptUser: TButton
        Left = 8
        Top = 120
        Width = 177
        Height = 25
        Caption = #48512#49436#49324#50857#51088' '#44228#51221#46321#47197
        TabOrder = 3
        OnClick = btnRegistDeptUserClick
      end
      object btnCheckDeptUser: TButton
        Left = 192
        Top = 24
        Width = 177
        Height = 25
        Caption = #48512#49436#49324#50857#51088' '#46321#47197#51221#48372' '#54869#51064
        TabOrder = 4
        OnClick = btnCheckDeptUserClick
      end
      object btnCheckLoginDeptUser: TButton
        Left = 192
        Top = 56
        Width = 177
        Height = 25
        Caption = #48512#49436#49324#50857#51088' '#47196#44536#51064' '#53580#49828#53944
        TabOrder = 5
        OnClick = btnCheckLoginDeptUserClick
      end
      object btnDeleteDeptUser: TButton
        Left = 192
        Top = 88
        Width = 177
        Height = 25
        Caption = #48512#49436#49324#50857#51088' '#46321#47197#51221#48372' '#49325#51228
        TabOrder = 6
        OnClick = btnDeleteDeptUserClick
      end
    end
  end
  object txtURL: TEdit
    Left = 792
    Top = 8
    Width = 305
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 4
  end
end
