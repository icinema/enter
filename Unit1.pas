unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
const DelSym= ' .,!?';
var Text,Word,LongestWord: string; i: integer;
begin
   Text:=Memo1.Lines.Text;
   for i := 1 to Length(Text) do
    if Pos(Text[i],DelSym) > 0 then
     Text[i]:=',';

    if Text[1]= ',' then
     Delete(Text,1,1);
    while Pos(',,',Text) > 0 do
     Delete(Text,Pos(',,',Text),1);

     Text:=AnsiReplaceText(AnsiReplaceText(Text,Chr(13),''),Chr(10),'');

    repeat
     Word:=Copy(Text,1,Pos(',',Text)-1);
     Delete(Text,1,Length(Word)+1);
     ListBox1.Items.Add(Word);
    until Length(Text) = 0;

    Label1.Caption:='Количество слов в тексте: '+IntToStr(ListBox1.Items.Count);

    LongestWord:=ListBox1.Items[0];
    for i := 1 to ListBox1.Items.Count-1 do
     if Length(ListBox1.Items[i]) > Length(LongestWord) then
      LongestWord:=ListBox1.Items[i];

     Label2.Caption:='Самое длинное слово: '+LongestWord+' ('+IntToStr(Length(LongestWord))+' букв)';
     end;
     end.
