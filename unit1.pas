unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function CompararNumero(a, b: Integer): Boolean;
    function Soma(a, b: Integer): Integer;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;


//Todo: Função retorna algo, procedure não retorna = void

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit3.Text:=IntToStr (Soma(StrToInt(Edit1.Text), StrToInt(Edit2.Text )));
  CheckBox1.Checked:=CompararNumero(StrToInt(Edit1.Text), StrToInt(Edit2.Text ));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Try
    Form2:=TForm2.Create(Self);
    Form2.ShowModal;

   finally
     if Assigned(Form2) then
     Form2.Release;
  end;
end;





function TForm1.Soma(a,b:Integer):Integer;
begin
  result:= a + b;
end;

function TForm1.CompararNumero(a, b:Integer):Boolean;
begin
  Result:= a = b;
end;


end.

