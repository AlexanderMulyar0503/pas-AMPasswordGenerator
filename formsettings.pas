unit FormSettings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin, IniFiles;

type

  { TSettingsForm }

  TSettingsForm = class(TForm)
    ButtonDefault: TButton;
    ButtonOK: TButton;
    ButtonCancel: TButton;
    GroupPosition: TGroupBox;
    GroupSize: TGroupBox;
    LabelPositionX: TLabel;
    LabelPositionY: TLabel;
    LabelSizeWidth: TLabel;
    LabelSizeHeight: TLabel;
    PositionX: TSpinEdit;
    PositionY: TSpinEdit;
    SizeWidth: TSpinEdit;
    SizeHeight: TSpinEdit;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonDefaultClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  SettingsForm: TSettingsForm;
  CancelPositionX, CancelPositionY: Integer;
  CancelSizeWidth, CancelSizeHeight: Integer;

implementation

{$R *.lfm}

{ TSettingsForm }

procedure TSettingsForm.ButtonDefaultClick(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile:= TIniFile.Create('app.ini');
  IniFile.WriteInteger('Position', 'X', 25);
  IniFile.WriteInteger('Position', 'Y', 25);
  IniFile.WriteInteger('Size', 'Width', 350);
  IniFile.WriteInteger('Size', 'Height', 560);
  IniFile.Free;
  SettingsForm.Close;
end;

procedure TSettingsForm.ButtonOKClick(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile:= TIniFile.Create('app.ini');
  IniFile.WriteInteger('Position', 'X', PositionX.Value);
  IniFile.WriteInteger('Position', 'Y', PositionY.Value);
  IniFile.WriteInteger('Size', 'Width', SizeWidth.Value);
  IniFile.WriteInteger('Size', 'Height', SizeHeight.Value);
  IniFile.Free;
  SettingsForm.Close;
end;

procedure TSettingsForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

procedure TSettingsForm.ButtonCancelClick(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile:= TIniFile.Create('app.ini');
  IniFile.WriteInteger('Position', 'X', CancelPositionX);
  IniFile.WriteInteger('Position', 'Y', CancelPositionY);
  IniFile.WriteInteger('Size', 'Width', CancelSizeWidth);
  IniFile.WriteInteger('Size', 'Height', CancelSizeHeight);
  IniFile.Free;
  SettingsForm.Close;
end;

end.

