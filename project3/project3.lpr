program project3;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

const
  l=#196;

var
  x,e,f,f1,S,S1,pow,fac:extended;          //������ ��६����
  i,i1,k,n:integer;

begin
  writeln('������ ����� ��� ���᫥��� �㭪樨: ((cos(x)-1)/(x^2))+(1/2)');
  writeln('������ x, ��� |x|<1:');        //������ ���祭�� x � �ᨫ��
  read(x);
  writeln('������ �ᨫ��:');
  read(e);
  i:=1;
  k:=1;
  f:=1;
  pow:=2;
  fac:=24;
  S:=0;
  n:=4;

  if (abs(x)<1)and(x<>0)and(e>0) then      //��稭��� ���᫥��� �᫨
  begin                                    //����� x <1 � x �� ࠢ�� 0 � �ᨫ�� >0
  writeln('');
  writeln('����� 童�� �鸞  ','  ���祭�� 童�� �鸞  ','    ����筠� �㬬�');
  writeln(l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,
  l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l);

  while abs(f)>e do                        //�믮��塞 横� ����� ����� �>0
  begin
    write(i:8);
    f:=((k)*((exp(pow*ln(abs(x))))/fac));  //����塞 童� �鸞
    S:=S+f;
    write(f:29:12);                        //�뢮���
    writeln(S:23:12);
    pow:=pow+2;
    fac:=fac*(n+1)*(n+2);
    n:=n+2;
    k:=k*(-1);
    i:=i+1;
  end;

  S1:=0;                                   //����� ��� ���᫥��� �㬬� �鸞
  i1:=i-1;                                 //� ���⭮� ���浪�
  fac:=((fac)/(n*(n-1)));
  pow:=pow-2;
  n:=n-2;
  k:=k*(-1);
  while i1<>0 do                           //���� ����� �� ࠢ�� ��� �뢮��� �����
  begin
    write(i1:8);
    f:=((k)*((exp(pow*ln(abs(x))))/fac));
    write(f:29:12);
    S1:=S1+f;
    writeln(S1:23:12);
    i1:=i1-1;
    pow:=pow-2;
    fac:=((fac)/(n*(n-1)));
    n:=n-2;
    k:=k*(-1);
  end;

  writeln(l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,
  l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l);
  writeln('');

  f1:=(((cos(x)-1)/sqr(x))+(1/2));         //�筮� ���祭�� �㭪樨
  writeln('�ਡ�������� ���祭�� �㬬� � ��אַ� ���浪� = ', S:4:12);
  writeln('�ਡ�������� ���祭�� �㬬� � ���⭮� ���浪� = ', S1:4:12);
  writeln('��筮� ���祭�� �㬬� = ', f1:4:8);
  writeln('��᮫�⭠� ����譮��� = ', (f1-S):4:15);
  writeln('�⭮�⥫쭠� ����譮��� = ', ((f1-S)/f1):4:15);
  end
  else if (e=0)or(e<0) then writeln('������ ������⥫�� �ᨫ��')
  else if (x=0) then writeln('x ࠢ�� ���, �� ���������⥫쭮')
  else writeln('|x| ������ ���� ����� 1');

  readln;
  readln;
end.
