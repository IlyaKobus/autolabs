unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
  if(Edit1.Text = Form1.ADOQuery1.FieldByName('Password').AsString) and
        (Edit2.Text = Edit3.Text) and (Edit2.Text <> '') and (Edit1.Text <> Edit2.Text) then begin

    with form1 do begin
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('UPDATE [Students] SET [Password] = "' + Edit2.Text +
                      '" WHERE (([FIO]="' + ComboBox1.Text + '")' +
                      ' AND ([Group]="' + ComboBox2.Text + '"));');
      ADOQuery1.ExecSQL;
    end;

    ShowMessage('������ ������� �������!');
    Close;
  end

  else if (Edit1.Text <> Form1.ADOTable1.FieldByName('Password').AsString) then ShowMessage('�������� ������!')
    else if (Edit1.Text = Edit2.Text) then ShowMessage('������ � ����� ������ ���������!')
      else if (Edit2.Text = '') then ShowMessage('������ �� ����� ���� ������!')
        else if (Length(Edit2.Text) <> 4) then ShowMessage('������ ������ �������� �� 4-� ��������!')
          else ShowMessage('���� ������ ������ �� ���������!');
  Edit1.Clear; Edit2.Clear; Edit3.Clear;
  Edit1.SetFocus;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
