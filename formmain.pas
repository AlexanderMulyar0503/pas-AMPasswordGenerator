unit FormMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Spin, PasswordGenerator, FormAbout;

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
    procedure MenuItemAboutClick(Sender: TObject);
    procedure NumChars4Click(Sender: TObject);
    procedure NumChars8Click(Sender: TObject);
    procedure NumChars12Click(Sender: TObject);
    procedure PasswordButttonClick(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.MenuItemAboutClick(Sender: TObject);
begin
  AboutForm.ShowModal;
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

end.

