unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    btnCriar: TButton;
    Button2: TButton;
    edtTamanho: TEdit;
    Label1: TLabel;
    mmoResultado: TMemo;
    rdgTipoArray: TRadioGroup;
    procedure btnCriarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private

    vetor: array of integer;
    matriz: array of array of integer;
    tamanho: integer ;

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
  ShowMessage('Deseja Realmente sair?');
  Form2.Close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if (rdgTipoArray.ItemIndex = 0 ) then
    Finalize(vetor)
  else
    Finalize (matriz);

  mmoResultado.Clear;
end;



procedure TForm2.btnCriarClick(Sender: TObject);
var i, j: integer;
  s: string;
begin
  tamanho:= StrToInt(edtTamanho.Text);
  mmoResultado.Lines.Clear;
  randomize;

  if ( rdgTipoArray.ItemIndex = -1) then
  begin
    ShowMessage('Favor selecionar o Tipo de Array');
    Abort;
  end;

  if( rdgTipoArray.ItemIndex = 0 ) then
    begin
      SetLength(vetor, tamanho); //Cria o vetor dinamicamente
      for i:=low(vetor) to high(vetor) do
      begin
        vetor[i] := random (26);
        mmoResultado.Lines.Add(Format('vetor[%2d] = %2d',[i, vetor[i]]));
      end;
    end
  else
    begin
      SetLength(matriz, tamanho);
      for i:=low(matriz) to high(matriz) do
      begin
        s:=Format('%2da. linha = ', [i + 1]);
        SetLength(matriz[i], tamanho);
        for j:= low(matriz[i]) to high (matriz[i]) do
        begin
          matriz [i, j]:= random (26);
          s:= s + Format ('%2d ', [matriz[i, j]]);

      end;
        mmoResultado.Lines.Add(s);
    end;
end;

end;

end.

