program project4;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

var
  seq:char;                 //элемент последовательности
  seq2:char;                //элемент из последовательности с которым сравниваем
  seq3:char;                //последовательность введенную с клавиатуры
  n:byte;
  n1:byte;
  k:byte;
  k1:byte;
  i:byte;                   //счетчик
  F1,F2:boolean;            //заданные логические переменные

  a,b:char;
  x:extended;
  x2:extended;
  g,gg:extended;
  i2:byte;
  c,t1,t,ten,ten1:longint;

begin
  writeln('Проверка последовательности букв. Для остановки цикла введите ''0''');
  repeat
    F1:=true;
    F2:=true;
    seq:='a';
    seq2:='A';
    seq3:='a';
    i:=1;
    n:=0;
    n1:=0;
    k:=1;
    k1:=1;

    writeln('Введите последовательность заглавных и строчных букв');
    while (seq in ['A'..'Z','a'..'z']) and (F1 or F2) do
    begin                       //проверяем заглавная или строчная данная буква
      read(seq);
      if seq in ['A'..'Z'] then
      begin
        if seq>=seq2 then
        begin
          F1:=true;
        end
        else
        begin
          F1:=false;
          writeln('Заглавная ',F1);
          k:=0;
        end;
        seq2:=seq;
        n:=1;
      end
      else if seq in ['a'..'z'] then
      begin
        if seq>=seq3 then
        begin
          F2:=true;
        end
        else
        begin
          F2:=false;
          writeln('Строчная ',F2);
          k1:=0;
        end;
        seq3:=seq;
        n1:=1;
      end;
      i:=i+1;
    end;
    if F1 and (n=1) and (k=1) then writeln('Заглавная ',F1);
    if F2 and (n1=1) and (k1=1) then writeln('Строчная ',F2);

    writeln;
    readln;
  until seq='0';
  writeln;
  writeln;

  writeln('Вывод числа в виде +(-)0.d1d2d3...d9E+(-)p1p2');
  writeln('Для остановки цикла введите ''90''');
  repeat



  begin
    i2:=0;
    ten:=10; ten1:=10;
    writeln('Введите x:');
    read(x);
    writeln();
    if x = 0 then write('+0.000000000E+00');
    if ((x > 0) and (x < 1)) or ((x < 0) and (x > -1)) then
    begin
      c:=0;
      if (x > 0) and (x < 1) then write('+0.');
      if (x < 0) and (x > -1) then write('-0.');
      x:=abs(x);
      while x < 0.1 do
      begin
        c:=c+1;
        x:=x*10;
      end;

      for i2:=1 to 9 do
      begin
        x:=x;
        x2:=x*ten;
        ten:=ten*10;
        t:=trunc(x2);
        t:= t mod 10;
        a:=Chr(t+48);
        write(a);
      end;


      write('E-0');
      if c < 10 then
      begin
        b:=Chr(c+48);
        write(b)
      end;
      if c >= 10 then
      begin
        g:=c/100;
        for i2:=1 to 2 do
        begin
          gg:=g;
          gg:=g*ten1;
          t1:=trunc(gg);
          t1:=t1 mod 10;
          b:=Chr(t1+48);
          ten1:=ten1*10;
          write(b);
        end;
      end;
    end;
    if (x >= 1) or (x <= -1) then
    begin
      c:=0;
      if x >= 1 then write('+0.');
      if x <= -1 then write('-0.');
      x:=abs(x);
      while x > 1 do
      begin
        c:=c+1;
        x:=x/10;
      end;

      for i2:=1 to 9 do
      begin
        x:=x;
        x2:=x*ten;
        ten:=ten*10;
        t:=trunc(x2);
        t:= t mod 10;
        a:=Chr(t+48);
        write(a);
      end;


      write('E+0');
      if c < 10 then
      begin
        b:=Chr(c+48);
        write(b)
      end;
      if c >= 10 then
      begin
        g:=c/100;
        for i2:=1 to 2 do
        begin
          gg:=g;
          gg:=g*ten1;
          t1:=trunc(gg);
          t1:=t1 mod 10;
          b:=Chr(t1+48);
          ten1:=ten1*10;
          write(b);
        end;
      end;
      writeln;
    end;
    writeln;

  end
  until x=90;
  readln;
end.
