unit FormMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Spin, PasswordGenerator, FormAbout, IniFiles;

type

  { TMainForm }

  TMainForm = class(TForm)
    NumChars4: TButton;
    NumChars8: TButton;
    NumChars12: TButton;
    PasswordButtton: TButton;
    TypeCharUp: TCheckBox;
    TypeCharLow: TCheckBox;
    TypeDigit: TCheckBox;
    TypeSpChar: TCheckBox;
    PasswordEdit: TEdit;
    GroupNum: TGroupBox;
    GroupType: TGroupBox;
    GroupPassword: TGroupBox;
    MainFormMenu: TMainMenu;
    MenuItemFile: TMenuItem;
    MenuItemSettings: TMenuItem;
    MenuItemSep1: TMenuItem;
    MenuItemExit: TMenuItem;
    MenuItemInfo: TMenuItem;
    MenuItemAbout: TMenuItem;
    NumChars: TSpinEdit;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure MenuItemAboutClick(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure MenuItemSettingsClick(Sender: TObject);
    procedure NumChars4Click(Sender: TObject);
    procedure NumChars8Click(Sender: TObject);
    procedure NumChars12Click(Sender: TObject);
    procedure PasswordButttonClick(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;
  IniFile: TIniFile;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
    MainForm.Left:= IniFile.ReadInteger('Position', 'X', 25);
    MainForm.Top:= IniFile.ReadInteger('Position', 'Y', 25);
    MainForm.Width:= IniFile.ReadInteger('Size', 'Width', 350);
    MainForm.Height:= IniFile.ReadInteger('Size', 'Height', 560);
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  IniFile.WriteInteger('Position', 'X', MainForm.Left);
  IniFile.WriteInteger('Position', 'Y', MainForm.Top);
  IniFile.WriteInteger('Size', 'Width', MainForm.Width);
  IniFile.WriteInteger('Size', 'Height', MainForm.Height);
end;

procedure TMainForm.MenuItemAboutClick(Sender: TObject);
begin
  AboutForm.ShowModal;
end;

procedure TMainForm.MenuItemExitClick(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.MenuItemSettingsClick(Sender: TObject);
begin
  IniFile.WriteInteger('Position', 'X', 25);
  IniFile.WriteInteger('Position', 'Y', 25);
  IniFile.WriteInteger('Size', 'Width', 350);
  IniFile.WriteInteger('Size', 'Height', 560);

  MainForm.Left:= IniFile.ReadInteger('Position', 'X', 25);
  MainForm.Top:= IniFile.ReadInteger('Position', 'Y', 25);
  MainForm.Width:= IniFile.ReadInteger('Size', 'Width', 350);
  MainForm.Height:= IniFile.ReadInteger('Size', 'Height', 560);
end;

procedure TMainForm.NumChars4Click(Sender: TObject);
begin
  NumChars.Value:= 4;
end;

procedure TMainForm.NumChars8Click(Sender: TObject);
begin
  NumChars.Value:= 8;
end;

procedure TMainForm.NumChars12Click(Sender: TObject);
begin
  NumChars.Value:= 12;
end;

procedure TMainForm.PasswordButttonClick(Sender: TObject);
begin
  if not TypeCharUp.Checked and not TypeCharLow.Checked and not TypeDigit.Checked and not TypeSpChar.Checked then
    PasswordEdit.Text:= 'Не выбраны типы'
  else
    PasswordEdit.Text:= GetPasswordString(TypeCharUp.Checked, TypeCharLow.Checked, TypeDigit.Checked, TypeSpChar.Checked, NumChars.Value);
end;


initialization

if FileExists(GetUserDir + DirectorySeparator + '.ampasswordgenerator.ini') = False then
begin
  IniFile:= TIniFile.Create(GetUserDir + DirectorySeparator + '.ampasswordgenerator.ini');
  IniFile.WriteInteger('Position', 'X', 25);
  IniFile.WriteInteger('Position', 'Y', 25);
  IniFile.WriteInteger('Size', 'Width', 350);
  IniFile.WriteInteger('Size', 'Height', 560);
  IniFile.Free;
end;

IniFile:= TIniFile.Create(GetUserDir + DirectorySeparator + '.ampasswordgenerator.ini');


finalization

IniFile.Free;


end.

