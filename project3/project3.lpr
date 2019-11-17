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
  x,e,f,f1,S,S1,pow,fac:extended;          //задаем переменные
  i,i1,k,n:integer;

begin
  writeln('Вводим данные для вычисления функции: ((cos(x)-1)/(x^2))+(1/2)');
  writeln('Введите x, где |x|<1:');        //вводим значения x и эпсилон
  read(x);
  writeln('Введите эпсилон:');
  read(e);
  i:=1;
  k:=1;
  f:=1;
  pow:=2;
  fac:=24;
  S:=0;
  n:=4;

  if (abs(x)<1)and(x<>0)and(e>0) then      //начинаем вычисления если
  begin                                    //модуль x <1 и x не равен 0 и эпсилон >0
  writeln('');
  writeln('Номер члена ряда  ','  Значение члена ряда  ','    Частичная сумма');
  writeln(l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,
  l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l);

  while abs(f)>e do                        //выполняем цикл когда модуль ф>0
  begin
    write(i:8);
    f:=((k)*((exp(pow*ln(abs(x))))/fac));  //вычисляем член ряда
    S:=S+f;
    write(f:29:12);                        //выводим
    writeln(S:23:12);
    pow:=pow+2;
    fac:=fac*(n+1)*(n+2);
    n:=n+2;
    k:=k*(-1);
    i:=i+1;
  end;

  S1:=0;                                   //данные для вычисления суммы ряда
  i1:=i-1;                                 //в обратном порядке
  fac:=((fac)/(n*(n-1)));
  pow:=pow-2;
  n:=n-2;
  k:=k*(-1);
  while i1<>0 do                           //пока номер не равен нулю выводим данные
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

  f1:=(((cos(x)-1)/sqr(x))+(1/2));         //точное значение функции
  writeln('Приблеженное значение суммы в прямом порядке = ', S:4:12);
  writeln('Приблеженное значение суммы в обратном порядке = ', S1:4:12);
  writeln('Точное значение суммы = ', f1:4:8);
  writeln('Абсолютная погрешность = ', (f1-S):4:15);
  writeln('Относительная погрешность = ', ((f1-S)/f1):4:15);
  end
  else if (e=0)or(e<0) then writeln('Задайте положительный эпсилон')
  else if (x=0) then writeln('x равен нулю, что непозволительно')
  else writeln('|x| должен быть меньше 1');

  readln;
  readln;
end.
