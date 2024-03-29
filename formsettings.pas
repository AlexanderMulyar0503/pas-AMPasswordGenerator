unit FormSettings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin;

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
  private

  public

  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.lfm}

end.

