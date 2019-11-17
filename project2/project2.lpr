program project2;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes { you can add units after this };

//Сделал Салимов Гусейн

const
  line = '------------------------------------------------------------';

var
  a, b, h: extended;                                  //a,b,h интервал и шаг
  i, meter1, meter2: integer;                         //счетчики

begin
  writeln('Данные для табулирования функций "sin(x)" и "ln(x)"');
  writeln('Введите интервал (минимум, максимум):');
  Read(a, b);
  writeln('Введите шаг:');                      //ввод данных
  Read(h);
  i := 1;
  meter1 := 0;
  meter2 := 0;

  if h = 0 then                                   //если шаг=0, вводим
    writeln('Шаг не задан!')                      //'Шаг не задан!'
  else
  begin

    writeln;
    writeln('Номер точки  ', '  Аргумент  ',
      '  Функция sin(x)  ', '  Функция ln(x)  ');
    writeln(line);
    while a < (b + (h / 2)) do                          //запускаем цикл
    begin
      Write(i: 7);
      Write('': 7);
      Write(a: 7: 2);
      Write('': 7);
      if (sin(a) > 0) and (sin(a - h) < 0) or (sin(a) < 0) and (sin(a - h) > 0) then
      begin
        //если число было положительным/отрицательным
        Write(sin(a): 9: 2);
        //и стало отрицательным/положительным
        meter1 := (meter1 + 1);
        //то увеличиваем счетчик meter
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
      //увеличиваем аргумент на шаг
      i := i + 1;
      //в конце цикла увеличиваем счетчик i
    end;
    writeln(line);
    writeln;
    writeln('Количество перемен знака sin(x)=', meter1: 3, ', ',
      'Количество перемен знака ln(x)=', meter2: 3);
    //выводим кол-во перемен знака на интервале
    if (meter1 = 0) and (meter2 = 0) then
      writeln(
        'И функция sin(x) и функция ln(x) не поменяли знак на заданном интервале')
    else if (meter1 = 0) then
      writeln('Функция sin(x) не поменяла знак на заданном интервале')
    else if (meter2 = 0) then
      writeln('Функция ln(x) не поменяла знак на заданном интервале');
  end;
  readln;
  readln;
end.
