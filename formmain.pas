unit FormMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Spin;

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
    procedure NumChars4Click(Sender: TObject);
    procedure NumChars8Click(Sender: TObject);
    procedure NumChars12Click(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }


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

end.

