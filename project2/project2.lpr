program project2;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes { you can add units after this };

//������ ������� ��ᥩ�

const
  line = '------------------------------------------------------------';

var
  a, b, h: extended;                                  //a,b,h ���ࢠ� � 蠣
  i, meter1, meter2: integer;                         //���稪�

begin
  writeln('����� ��� ⠡㫨஢���� �㭪権 "sin(x)" � "ln(x)"');
  writeln('������ ���ࢠ� (������, ���ᨬ�):');
  Read(a, b);
  writeln('������ 蠣:');                      //���� ������
  Read(h);
  i := 1;
  meter1 := 0;
  meter2 := 0;

  if h = 0 then                                   //�᫨ 蠣=0, ������
    writeln('��� �� �����!')                      //'��� �� �����!'
  else
  begin

    writeln;
    writeln('����� �窨  ', '  ��㬥��  ',
      '  �㭪�� sin(x)  ', '  �㭪�� ln(x)  ');
    writeln(line);
    while a < (b + (h / 2)) do                          //����᪠�� 横�
    begin
      Write(i: 7);
      Write('': 7);
      Write(a: 7: 2);
      Write('': 7);
      if (sin(a) > 0) and (sin(a - h) < 0) or (sin(a) < 0) and (sin(a - h) > 0) then
      begin
        //�᫨ �᫮ �뫮 ������⥫��/����⥫��
        Write(sin(a): 9: 2);
        //� �⠫� ����⥫��/������⥫��
        meter1 := (meter1 + 1);
        //� 㢥��稢��� ���稪 meter
      end
      else if (sin(a) = 0) and (not (i = 1)) then
      begin
        Write(sin(a): 9: 2);
        meter1 := (meter1 + 1);
      end
      else
        Write(sin(a): 9: 2);
      if (a > 0) then
      begin
        if (ln(a) > 0) and (ln(a + h) < 0) or (ln(a) < 0) and (ln(a + h) > 0) then
        begin
          writeln(ln(a): 17: 2);
          meter2 := (meter2 + 1);
        end
        else if (ln(a) = 0) and (not (i = 1)) then
        begin
          writeln(ln(a): 17: 2);
          meter2 := (meter2 + 1);
        end
        else
          writeln(ln(a): 17: 2);
      end
      else
        Write('-': 15, #10);
      a := a + h;
      //㢥��稢��� ��㬥�� �� 蠣
      i := i + 1;
      //� ���� 横�� 㢥��稢��� ���稪 i
    end;
    writeln(line);
    writeln;
    writeln('������⢮ ��६�� ����� sin(x)=', meter1: 3, ', ',
      '������⢮ ��६�� ����� ln(x)=', meter2: 3);
    //�뢮��� ���-�� ��६�� ����� �� ���ࢠ��
    if (meter1 = 0) and (meter2 = 0) then
      writeln(
        '� �㭪�� sin(x) � �㭪�� ln(x) �� �����﫨 ���� �� �������� ���ࢠ��')
    else if (meter1 = 0) then
      writeln('�㭪�� sin(x) �� �����﫠 ���� �� �������� ���ࢠ��')
    else if (meter2 = 0) then
      writeln('�㭪�� ln(x) �� �����﫠 ���� �� �������� ���ࢠ��');
  end;
  readln;
  readln;
end.
