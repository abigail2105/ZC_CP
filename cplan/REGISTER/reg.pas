unit reg;

{$DEFINE POST_2_2_REG}

interface

uses
  {Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Outline, ExtCtrls, FileCtrl, StdCtrls, Grids, DirOutln;}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

const
     {C-Plan registration files}
     CPLAN_REGDIR = 'cp.rgt';
     CPLAN_REGFILE = 'cp32.rgt';
     CPLAN_REGSEED = 19473; {registration seed modified on Wed 26 Nov 1997 when registration method updated}

type
  TRegisterForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    editReg: TEdit;
    lblMachineKey: TLabel;
    editUser: TEdit;
    editOrganisation: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblVersion: TLabel;
    Label7: TLabel;
    Memo1: TMemo;
    ColourTimer: TTimer;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function UserInfoEntered : boolean;
    procedure btnCancelClick(Sender: TObject);
    procedure CreateRegFile;
    procedure ColourTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegisterForm: TRegisterForm;


function GenerateReg(const sMachineKey : string) : string;
procedure GenerateMachineKey(var sCreationKey, sModifyKey, sWindowsVolumeKey : string);
function IsValidRegFile : boolean;


implementation

uses
    FileCtrl, version;

{$R *.DFM}

function RunCPlanApp_(const sApp, sParam : string) : boolean;
var
   sRunFile, sPath, sCmd : string;
   PCmd : PChar;
   //AIniFile : TIniFile;
begin
     //AIniFile := TIniFile.Create(DB_INI_FILENAME);

     sPath := ExtractFilePath(Application.ExeName);
     // sPath := AIniFile.ReadString('Paths','32bit','');
     sRunFile := sPath + sApp + '.exe';

     if (sParam <> '') then
        sCmd := sRunFile + ' ' + sParam
     else
         sCmd := sRunFile;

     //AIniFile.Free;

     if FileExists(sRunFile) then
     begin
          GetMem(PCmd,Length(sCmd)+1);
          StrPCopy(PCmd,sCmd);

          WinEXEC(PCmd,SW_SHOW);

          FreeMem(PCmd,Length(sCmd)+1);

          Result := True;
     end
     else
         Result := False;
end;

procedure WriteBatFile(const sWindowsDrive, sCPlanInstallPath : string);
var
   BatFile : TextFile;
begin
     // This procedure assumes that the 2 parameters passed contain a trailing back slash character.

     assignfile(BatFile,sCPlanInstallPath + 'cr.bat');
     rewrite(BatFile);

     writeln(BatFile,'dir "' +
                     sWindowsDrive +
                     '" > "' +
                     sCPlanInstallPath +
                     'crout"');

     closefile(BatFile);
end;

function RunApp(const sApp, sParam : string) : boolean;
var
   sRunFile, sPath, sCmd : string;
   PCmd : PChar;
   //AIniFile : TIniFile;
begin
     //AIniFile := TIniFile.Create(DB_INI_FILENAME);

     // sPath := ExtractFilePath(Application.ExeName);
     // sPath := AIniFile.ReadString('Paths','32bit','');
     sRunFile := {sPath +} sApp {+ '.exe'};

     if (sParam <> '') then
        sCmd := '"' + sRunFile + '" "' + sParam + '"'
     else
         sCmd := '"' + sRunFile + '"';

     //AIniFile.Free;

     GetMem(PCmd,Length(sCmd)+1);
     StrPCopy(PCmd,sCmd);
     WinEXEC(PCmd,SW_HIDE{SW_SHOW});
     FreeMem(PCmd,Length(sCmd)+1);

     Result := True;
end;

function ReadDirOutFile(const sFile : string) : string;
// return the volumn id stripped from the given file
var
   InFile : TextFile;
   sLine : string;
   iPos : integer;
begin
     assignfile(InFile,sFile);
     reset(InFile);
     // find the line that contains 'Volume Serial Number'
     repeat
           readln(InFile,sLine);

     until (Pos('Volume Serial Number',sLine) > 0);
     // extract the serial number from that line
     repeat
           iPos := Pos(' ',sLine);
           if (iPos > 0) then
              sLine := Copy(sLine,iPos+1,Length(sLine)-iPos);

     until (iPos = 0);
     closefile(InFile);

     Result := sLine;
end;

function ReturnWindowsVolumnId{(const cDriveLetter : char)} : string;
var
   sWinDir, sVolumeId, sOutputPath : String;
   iLength : Integer;
   fFileRead : boolean;
begin
     // returns the volumn id of the drive specified

     // make .bat file in the C-Plan program files directory
     // using a cmd like this in the .bat file :
     //   dir c:\ > d:\xyz1.txt
     //
     // substitute the drive windows is installed on for c:\
     // substitute the c-plan install drive & directory for d:\
     // GetWindowsDirectory
     iLength := 255;
     setLength(sWinDir, iLength);
     iLength := GetWindowsDirectory(PChar(sWinDir), iLength);
     setLength(sWinDir, iLength);
     // get C-Plan directory
     // use C-Plan directory instead of c:\
     sOutputPath := ExtractFilePath(Application.ExeName);

     WriteBatFile(sWinDir + '\',sOutputPath);

     // execute the .bat file and send the output to the C-Plan program files directory
     RunApp(sOutputPath + 'cr.bat','');

     // we must wait a little while until the output file can be read
     fFileRead := False;
     repeat
           try// read the output file and get the volumn id from it
              Result := ReadDirOutFile(sOutputPath + 'crout');
              fFileRead := True;
           except

           end;

     until fFileRead;

     // delete the .bat file and the output file
     DeleteFile(sOutputPath + 'crout');
     DeleteFile(sOutputPath + 'cr.bat');
end;

function IsValidRegFile : boolean;
var
   iRegFile : integer;
   sRegKey, sOldRegKey : string[6];
   sPath, sDir,
   sCreationKey, sModifyKey, sWindowsVolumeKey : string;
begin
     RunCPlanApp_('move_avx','');
     //Result := True;

     // run the move avx program to ensure ArcView is using the correct cplan.avx file

     Result := True;

     //get key from reg file and compare against generated one
     (*
     Result := False;

     sDir := ExtractFileDir(Application.ExeName) + '\' + CPLAN_REGDIR;
     ForceDirectories(sDir);

     sPath := sDir + '\' + CPLAN_REGFILE;

     iRegFile := FileOpen(sPath,fmOpenRead);
     if (iRegFile > 0) then
     begin
          FileRead(iRegFile,sRegKey,SizeOf(sRegKey));
          FileClose(iRegFile);

          GenerateMachineKey(sCreationKey,sModifyKey,sWindowsVolumeKey);
          sOldRegKey := GenerateReg(sCreationKey);
          if (sOldRegKey <> '') then
          begin
               if (sRegKey = sOldRegKey)
               or (sRegKey = GenerateReg(sWindowsVolumeKey)) then
                  Result := True;
          end
          else
          begin
               if (sRegKey = GenerateReg(sWindowsVolumeKey)) then
                  Result := True;
          end;
     end;
     *)
end;

procedure TRegisterForm.CreateRegFile;
var
   iRegFile : integer;
   sPath, sDir : string;
   sRegKey : string[6];
   UserFile : TextFile;
   sCreationKey, sModifyKey, sWindowsVolumeKey : string;
begin
     // run the move avx program to ensure ArcView is using the correct cplan.avx file
     RunCPlanApp_('move_avx','');
     {user has entered a valid key, now create the registration file}

     {$IFDEF VER80}
     sDir := ExtractFilePath(Application.ExeName);
     sDir := Copy(sDir,1,Length(sDir)-1) + '\' + CPLAN_REGDIR;
     {$ELSE}
     sDir := ExtractFileDir(Application.ExeName) + '\' + CPLAN_REGDIR;
     {$ENDIF}

     ForceDirectories(sDir);
     sPath := sDir + '\' + CPLAN_REGFILE;

     assignfile(UserFile,sDir + '\user');
     rewrite(UserFile);
     writeln(UserFile,'User: ' + editUser.Text);
     writeln(UserFile,'Organisation: ' + editOrganisation.Text);
     closefile(UserFile);

     iRegFile := FileCreate (sPath {, fmOpenWrite});

     if (iRegFile > 0) then
     begin
          GenerateMachineKey(sCreationKey,sModifyKey,sWindowsVolumeKey);
          //sRegKey := GenerateReg(sCreationKey);
          sRegKey := GenerateReg(sWindowsVolumeKey);

          FileWrite(iRegFile,sRegKey,SizeOf(sRegKey));

          FileClose(iRegFile);
     end;
end;

function GenerateReg(const sMachineKey : string) : string;
var
   eValue : extended;
begin
     try
        //eValue := StrToFloat('0.' + '8637');
        eValue := StrToFloat('0' + DecimalSeparator + sMachineKey);
        //eValue := StrToFloat('0.' + '8702');
        //testing error with machine key '8702'

        eValue := 1/Cos(eValue);

        Str(eValue:11:6,Result);

        Result := Copy(Result,6,6);
        {do something to encrypt the MachineKey}
     except
           Result := '';
     end;
end;

procedure ReturnDirectoryDate(const sDir : string;
                              var lCreationDate,
                                  lModifyDate : LongInt);
var
   SRec : TSearchRec;
   //sTime : string;
   iResult : integer;
   iLow, iHigh : integer;
begin
     iResult := FindFirst(sDir,faDirectory,SRec);

     {$IFDEF POST_2_2_REG}
     try
        iLow := SRec.FindData.ftCreationTime.dwLowDateTime;
        iHigh := SRec.FindData.ftCreationTime.dwHighDateTime;
     except
           iLow := 0;
           iHigh := 0;
     end;

     lModifyDate := SRec.Time;

     if (iLow = 0)
     and (iHigh = 0) then
         lCreationDate := SRec.Time
     else
         lCreationDate := iLow + iHigh;
     {$ELSE}
     lModifyDate := SRec.Time;
     lCreationDate := SRec.Time;
     {$ENDIF}

     //sTime := DateTimeToStr(Result);

     FindClose(SRec);
end;

procedure NewGetDirDate(const sDir : string);
var
   iFileHandle, iFileDate : integer;
   sDate : string;
begin
     iFileHandle := FileOpen(sDir,fmShareDenyNone);
     iFileDate := FileGetDate(iFileHandle);
     FileClose(iFileHandle);
     sDate := TimeToStr(FileDateToDateTime(iFileDate));
end;

procedure TestMachineKey;
var
   sPath, sDate : string;
   lCreationDate, lModifyDate : LongInt;
begin
     sPath := ExtractFileDir(Application.ExeName) {+ '\' + CPLAN_REGDIR};
     ReturnDirectoryDate('d:\out32\cp.rgt'{sPath},lCreationDate, lModifyDate);
     sDate := DateToStr(lCreationDate);
end;

function StringToIntKey(const sKey : string) : integer;
var
   iCount : integer;
begin
     Result := 0;
     if (Length(sKey) > 0) then
        for iCount := 1 to Length(sKey) do
            Result := Result + ord(sKey[iCount]);
end;

procedure GenerateMachineKey(var sCreationKey, sModifyKey, sWindowsVolumeKey : string);
var
   lCreationDate, lModifyDate : LongInt;
   sPath : string;
begin
     try
        {$IFDEF VER80}
        sPath := ExtractFilePath(Application.ExeName);
        sPath := Copy(sPath,1,Length(sPath)-1) + '\' + CPLAN_REGDIR;
        {$ELSE}
        sPath := ExtractFileDir(Application.ExeName) + '\' + CPLAN_REGDIR;
        {$ENDIF}
     except
           MessageDlg('Exception in GenerateMachineKey/A',mtError,[mbOk],0);
     end;

     try
        ReturnDirectoryDate(sPath,lCreationDate, lModifyDate);
     except
           MessageDlg('Exception in GenerateMachineKey/ReturnDirectoryDate',mtError,[mbOk],0);
     end;

     try
        RandSeed := lCreationDate + CPLAN_REGSEED;
        sCreationKey := IntToStr( Random(10000) );

        RandSeed := lModifyDate + CPLAN_REGSEED;
        sModifyKey := IntToStr( Random(10000) );
     except
           MessageDlg('Exception in GenerateMachineKey/B',mtError,[mbOk],0);
     end;

     try
        RandSeed := StringToIntKey(ReturnWindowsVolumnId) + CPLAN_REGSEED;
     except
           MessageDlg('Exception in GenerateMachineKey/ReturnWindowsVolumnId',mtError,[mbOk],0);
     end;
     sWindowsVolumeKey := IntToStr( Random(10000) );
end;

function TRegisterForm.UserInfoEntered : boolean;
begin
     if {(editUser.Text <> '')
     and (editOrganisation.Text <> '')
     and} (editReg.Text <> '') then
         Result := True
     else
         Result := False;
end;

procedure TRegisterForm.btnOkClick(Sender: TObject);
var
   sReg, sOldReg : string;
   sCreationKey, sModifyKey, sWindowsVolumeKey : string;
begin
     if UserInfoEntered then
     begin
          {write the registration code to the reg file
           if it is valid}
          GenerateMachineKey(sCreationKey,sModifyKey,sWindowsVolumeKey);
          //sOldReg := GenerateReg(sCreationKey);
          sReg := GenerateReg(sWindowsVolumeKey);

          if (sReg = editReg.Text)
          {or (sOldReg = editReg.Text)} then
          begin
               {user has valid key}
               CreateRegFile;

               MessageDlg('C-Plan has been registered',mtInformation,[mbOk],0);

               Application.Terminate;
          end
          else
          begin
               {user has invalid key}
               MessageDlg('You have entered an invalid Registration Key',
                          mtInformation,[mbOk],0);
          end;
     end
     else
         MessageDlg('You must enter User, Organisation and Registration Key',
                    mtInformation,[mbOk],0);
end;

procedure TRegisterForm.FormCreate(Sender: TObject);
var
   sCreationKey, sModifyKey, sWindowsVolumeKey : string;
begin
     lblVersion.Caption := CPLAN_VERSION;
     GenerateMachineKey(sCreationKey,sModifyKey,sWindowsVolumeKey);
     lblMachineKey.Caption := sWindowsVolumeKey;

     if IsValidRegFile then
     begin
          MessageDlg('CPlan is already registered',mtInformation,[mbOk],0);
          Application.Terminate;
     end;
end;

procedure TRegisterForm.btnCancelClick(Sender: TObject);
begin
     MessageDlg('You must run ' + Application.ExeName +
                ' and register before running C-Plan',
                mtInformation,[mbOk],0);
     Application.Terminate;
end;

procedure TRegisterForm.ColourTimerTimer(Sender: TObject);
begin
     // Toggle the colours of the components to attract
     // the attention of the user.

     (*if (Label3.Font.Color = clBlack) then
     begin
          Label3.Font.Color := clRed;
          lblMachineKey.Font.Color := clRed;
          Label5.Font.Color := clRed;
          Label6.Font.Color := clRed;
          Label4.Font.Color := clRed;
     end
     else
     begin
          Label3.Font.Color := clBlack;
          lblMachineKey.Font.Color := clBlack;
          Label5.Font.Color := clBlack;
          Label6.Font.Color := clBlack;
          Label4.Font.Color := clBlack;
     end;



     if (lblMachineKey.Font.Color = clBlack) then
         
     else*)
         
end;

end.
