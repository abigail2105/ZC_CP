�
 TINEDITFORM 0D,  TPF0TInEditForm
InEditFormLeft}Top0Width�Height�Caption(Input File Editor for Marxan and MarZoneColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterPixelsPerInch`
TextHeight TLabelLabel17Left8Top8WidthGHeightCaptionCost Threshold  TButtonbtnLoadLeft8ToppWidthKHeightHintLoads optionsCaptionLoadParentShowHintShowHint	TabOrder VisibleOnClickbtnLoadClick  TButtonbtnSaveLeft� ToppWidthKHeightHintSaves changesCaptionSaveEnabledParentShowHintShowHint	TabOrderOnClickbtnSaveClick  TButtonbtnExitLeft� ToppWidthKHeightHintQuits input editorCaptionExitParentShowHintShowHint	TabOrderOnClickbtnExitClick  TPageControlPageControl1Left Top�Width�Heighta
ActivePagehParentShowHintShowHint	TabOrder 	TTabSheet	TabSheet1CaptionProblem TLabelLabel1LeftTop WidthPHeightCaption0This Program edits an input file for MARXAN v2.0Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel2LeftTop0Width�HeightCaptionRCreated by Ian Ball 1999.  Modified by Ian Ball 2000.  Modified by Matt Watts 2006  TLabelLabel30LeftTopWidth|HeightCaptionand MarZone v1.0Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  	TGroupBox	GroupBox2Left0Top`WidthHeight9Caption
BoundariesTabOrder  TLabelLabel3LeftTopWidthUHeightCaptionBoundary Modifier  TEditEdit3LeftxTopWidthqHeightHintMultiplier for boundary lengthTabOrder Text3OnChangeEdit1Change   	TGroupBox	GroupBox5Left0TopWidthHeight=CaptionMiscellaneousTabOrder TLabelLabel14LeftTopWidth?HeightCaptionRepeat Runs  TEditEdit11LefthTopWidth� HeightHintNumber of runsTabOrder Text11OnChangeEdit1Change   TRadioGroupRadioGroup1Left0Top� WidthHeightACaptionInput file type	ItemIndexItems.StringsTradional Formatted StyleNew Freeform Style TabOrderVisibleOnClickEdit1Change   	TTabSheet	TabSheet2CaptionRun Options 	TGroupBox	GroupBox3Left(Top0Width	HeightiCaptionRun OptionsTabOrder  	TComboBox	ComboBox3LeftTopWidth� HeightHintAlgorithm Options
ItemHeightTabOrder TextRun OptionsOnChangeComboBox3ChangeItems.StringsAnnealing with Heuristic$Annealing with Iterative ImprovementAnnealing with bothHeuristic AloneIterative Improvement Alone!Heuristic + Iterative Improvement   	TComboBox	ComboBox1LeftTop8Width� HeightHintHeuristic Type
ItemHeightTabOrderText	HeuristicOnChangeEdit1ChangeItems.StringsRichnessGreedy 
Max RarityBest Rarity
Ave Rarity
Sum RarityProduct IrreplaceabilitySum Irreplaceability     	TTabSheet	TabSheet3Caption	Annealing 	TGroupBox	GroupBox6Left0TopWidth	HeightCaptionAnnealing ControlsTabOrder  TLabelLabel5LeftTop(Width_HeightCaptionNumber of Iterations  TLabelLabel9LeftTop@WidthrHeightCaptionTemperature Decreases  TLabelLabel10LeftTop� WidthWHeightCaptionInitial Temperature  TLabelLabel11Left(Top� WidthDHeightCaptionCooling Factor  TLabelLabel15Left Top� WidthUHeightCaptionFinal Temperature  TLabelLabel16LeftxTop� Width&HeightCaptionLabel16  TEditEdit5Left� Top WidthqHeightHintLength of Annealing RunTabOrder Text5OnChangeEdit1Change  TEditEdit2Left� Top8WidthqHeightTabOrderText2OnChangeEdit2Change  	TCheckBox	CheckBox1LeftTop`Width� HeightCaptionAdaptive AnnealingTabOrderOnClickCheckBox1Click  TEditEdit4LeftxTop� WidthyHeightTabOrderText4OnChangeEdit6Change  TEditEdit6LeftxTop� WidthyHeightTabOrderText6OnChangeEdit6Change  	TCheckBox	CheckBox2LeftTop� Width� HeightCaption"Set Cooling From Final TemperatureTabOrderOnClickCheckBox2Click  TEditEdit7LeftxTop WidthyHeightEnabledTabOrderText7OnChangeEdit7Change    	TTabSheet	TabSheet6CaptionInput TLabelLabel12LeftTop WidthEHeightCaptionInput Directory  TButtonbtnBrowseInputLeftTop� WidthKHeightCaptionBrowseTabOrder OnClickbtnBrowseInputClick  TEditEdit17Left`Top Width� HeightTabOrderTextEdit17OnChangeEdit1Change  	TGroupBox	GroupBox4Left/TopWidth3HeightiCaptionNecessary Input FilesTabOrder TLabelLabel21LeftATopWidthXHeightCaptionSpecies File Name  TLabelLabel25Left(Top1WidthqHeightCaptionPlanning Unit File Name  TLabelLabel28LeftTopIWidth� HeightCaptionPlanning unit Versus Species  TEditEdit12Left� TopWidthyHeightTabOrder TextEdit12OnChangeEdit1Change  TEditEdit15Left� Top.WidthyHeightTabOrderTextEdit15OnChangeEdit1Change  TEditEdit20Left� TopCWidthyHeightTabOrderTextEdit20OnChangeEdit1Change   	TGroupBox	GroupBox8Left0Top� Width3HeightiCaptionOptional Input FileTabOrder TLabelLabel26Left;Top"WidthOHeightCaptionBlock DefinitionsVisible  TEditEdit21Left� TopWidthyHeightTabOrder TextEdit21VisibleOnChangeEdit1Change  TEditEdit22Left� Top6WidthyHeightTabOrderTextEdit22OnChangeEdit1Change  	TCheckBox
CheckBox12Left(Top WidthHeightTabOrderVisibleOnClickCheckBox12Click  	TCheckBox
CheckBox13Left(Top8WidthqHeightCaptionBoundary LengthTabOrderOnClickCheckBox13Click    	TTabSheethCaptionOutput TLabelLabel13LeftTopWidthEHeightCaptionScreen Output  TLabelLabel22LeftTop� WidthKHeightCaptionSave File Name  TLabelLabel23LeftTop WidthMHeightCaptionOutput Directory  TLabelLabel24LeftTop� Width� HeightCaption2Species missing if proportion of target lower than  	TComboBox	ComboBox2LefthTopWidthiHeight
ItemHeightTabOrder Text	VerbosityOnChangeEdit1ChangeItems.StringsSilent RunningResults OnlyGeneral ProgressDetailed Progress   TEditEdit16Left`Top� Width� HeightTabOrderTextEdit16OnChangeEdit1Change  	TCheckBox	CheckBox4LeftTop0Width� HeightCaptionSave Each RunTabOrderOnClickEdit1Change  	TCheckBox	CheckBox5LeftTopHWidthqHeightCaptionSave Overall BestTabOrderOnClickEdit1Change  	TCheckBox	CheckBox6LeftTop`WidthaHeightCaptionSave SummaryTabOrderOnClickEdit1Change  	TCheckBox	CheckBox7LeftTopxWidth� HeightCaptionSave Scenario DetailsTabOrderOnClickEdit1Change  	TCheckBox	CheckBox8LeftTop� Width� HeightCaptionSave Missing Values InfoTabOrderOnClickEdit1Change  TEditEdit18Left`Top Width� HeightTabOrderTextEdit18OnChangeEdit1Change  TEditEdit19Left� Top� WidthYHeightTabOrderText19OnChangeEdit1Change  TButtonbtnBrowseOutputLeftTop WidthKHeightCaptionBrowseTabOrder	OnClickbtnBrowseOutputClick  	TCheckBox
CheckBox10Left� Top0WidthaHeightCaptionArcView FormatTabOrder
OnClickEdit1Change  	TCheckBox
CheckBox11Left� Top`Width� HeightCaptionSave Summed SolutionTabOrderOnClickEdit1Change  	TCheckBox
CheckBox17Left� TopHWidth� HeightCaptionArcView Format (CSV file type)TabOrderOnClickCheckBox17Click  	TCheckBox
CheckBox18Left� TopxWidthaHeightCaptionSave LogTabOrderOnClickCheckBox18Click   	TTabSheet	TabSheet4CaptionCost Threshold 	TGroupBox	GroupBox1LeftTop WidthIHeight� CaptionCost ThresholdTabOrder  TLabelLabel4LeftTop4WidthGHeightCaption	ThresholdFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel6Left`Top� WidthNHeightCaptionPenalty Factor A  TLabelLabel7LeftTophWidthHeightCaption=Penalty Factor = A exp(Bt)  -  A      (t varies from 0  to 1)  TLabelLabel8Left`Top� WidthNHeightCaptionPenalty Factor B  	TCheckBox	CheckBox3LeftTopWidth� HeightHint"Enables the cost threshold penaltyCaptionThreshold EnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder OnClickCheckBox3Click  TEditEdit13LefthTop4WidthiHeightHintCost thresholdTabOrderText13OnChangeEdit1Change  TEditEdit14Left� Top|WidthiHeightHintThreshold penalty strengthTabOrderText14OnChangeEdit1Change  TEditEdit1Left� Top� WidthiHeightTabOrderText1OnChangeEdit1Change    	TTabSheet	TabSheet5CaptionMisc 	TGroupBox	GroupBox7Left0Top0Width)Height� CaptionAdvanced OptionsTabOrder  TLabelLabel18Left(Top`WidthDHeightCaptionRandom SeedVisible  TLabelLabel20Left8Top Width=HeightCaptionStarting Prop  TEditEdit9Left� TopXWidthyHeightTabOrder Text9VisibleOnChangeEdit1Change  TEditEdit10Left� Top� WidthiHeightTabOrderText10VisibleOnChangeEdit1Change  	TCheckBox	CheckBox9LeftTop@Width� HeightCaptionSpecify Random SeedTabOrderVisibleOnClickCheckBox9Click  TEditEdit8Left� Top WidthyHeightTabOrderText8OnChangeEdit1Change  	TCheckBox
CheckBox14LeftTop� WidthyHeightCaptionBest Score SpeedupTabOrderVisibleOnClickCheckBox14Click    	TTabSheet	TabSheet7CaptionMarZone 	TGroupBox	GroupBox9Left/Top Width3Height� CaptionNecessary MarZone Input FilesTabOrder  TLabelLabel19LeftyTopWidthHeightCaptionZones  TLabelLabel27Left]Top1Width;HeightCaptionZone Target  TLabelLabel29Left� TopaWidthHeightCaptionCosts  TLabelLabel31LeftkTopxWidth1HeightCaption	Zone Cost  TLabelLabel32LeftUTopHWidthDHeightCaptionZone Target 2  TEditEdit23Left� TopWidthyHeightTabOrder Text	zones.datOnChangeEdit1Change  TEditEdit24Left� Top.WidthyHeightTabOrderTextzonetarget.datOnChangeEdit1Change  TEditEdit25Left� TopCWidthyHeightTabOrderTextzonetarget2.datOnChangeEdit1Change  TEditEdit28Left� Top[WidthyHeightTabOrderText	costs.datOnChangeEdit1Change  TEditEdit29Left� TopsWidthyHeightTabOrderTextzonecost.datOnChangeEdit1Change   	TGroupBox
GroupBox10Left0Top� Width3HeightwCaptionOptional MarZone Input FilesTabOrder TEditEdit26Left� TopWidthyHeightTabOrder Text
puzone.datOnChangeEdit1Change  TEditEdit27Left� Top6WidthyHeightTabOrderTextzoneboundcost.datOnChangeEdit1Change  	TCheckBox
CheckBox16Left*Top8WidthyHeightCaptionZone Boundary CostTabOrderOnClickCheckBox13Click  	TCheckBox
CheckBox15Left0Top WidthqHeightCaptionPlanning Unit ZoneTabOrder   	TCheckBoxCheckEnableMarZoneLeftTopWidth� HeightCaptionEnable MarZoneTabOrder     