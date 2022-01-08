program project5;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes { you can add units after this };

type
  arr = array of integer;
  matrix = array of arr;
  vector = array of real;

  procedure input_mat(var n: integer; var A: matrix);
  var
    i, j: integer;

  begin
    writeln('Введите порядок матрицы: ');
    readln(n);
    SetLength(A, n);
    writeln('Введите элементы матрицы: ');
    for i := 0 to n - 1 do
    begin
      SetLength(A[i], n);
      for j := 0 to n - 1 do
        Read(A[i, j]);
      readln;
    end;
  end;

  procedure output_mat(A: matrix);
  var
    i, j: integer;

  begin
    for i := 0 to Length(A) - 1 do
    begin
      for j := 0 to Length(A) - 1 do
        Write(A[i, j]: 4);
      writeln;
    end;
    writeln;
  end;


  procedure change_elem(var A2,A: matrix;k:integer);
  var
    i, j, n, a: integer;

  begin
    setlength(A2,k,k);
    for i:=0 to k-1 do
    for j:=0 to k-1 do
    begin
      A
    end;

    n := Length(A2);
    for i := 0 to (n div 2 - 1) do
      for j := 0 to n - i - 1 do
      begin
        a := A2[i, j];
        A2[i, j] := A2[n - i - 1, j];
        A2[n - i - 1, j] := a;
      end;
    output_mat(A2);
  end;

  function mean(A: matrix): vector;
  var
    i, j: integer;
    amount_ari, amount_geo: integer;
    sum, product: double;
    V: vector;

  begin
    sum := 0;
    product := 1;
    amount_ari := -1;
    amount_geo := 0;
    for i := 0 to Length(A) - 1 do
      for j := 0 to Length(A) - 1 do
      begin
        if (i = j) and (A[i, j] mod 2 = 0) and (A[i, j] <> 0) then
        begin
          if (amount_ari = -1) then
            amount_ari := 1
          else
            amount_ari := amount_ari + 1;
          sum := sum + A[i, j];
        end
        else if (i = Length(A) - 1 - j) and (A[i, j] mod 2 = 1) then
        begin
          if (not((i = j) and (Length(A) mod 2 = 1) and (A[i, j] = 0))) then
          begin
            amount_geo := amount_geo + 1;
            product := product * A[i, j];
          end;
          {if (A[i, j] mod 2 = 1) and (n div 2 = 0) and (A[i, j] <> 0) then
          begin
            amount_geo := amount_geo + 1;
            product := product * A[i, j];
          end
          else if (A[i, j] mod 2 = 1) and (n div 2 = 1) and (A[i, j] <> 0) and
            (j <> (n div 2) + 1) then
          begin
            amount_geo := amount_geo + 1;
            product := product * A[i, j];
          end;}
        end;
      end;
    if ((amount_ari = -1) and (amount_geo = 0)) then
    begin
      SetLength(V, 1);
      V[0] := 0;
    end
    else if (amount_ari = -1) then
    begin
      SetLength(V, 2);
      V[0] := 0;
      V[1] := exp((1/amount_ari)*ln(abs(product)));
    end
    else if (amount_geo = 0) then
    begin
      SetLength(V, 2);
      V[0] := sum / real(amount_ari);
      V[1] := 0;
    end
    else
    begin
      SetLength(V, 2);
      V[0] := sum / real(amount_ari);
      V[1] := exp((1/amount_ari)*ln(abs(product)));
    end;
    mean := V;
  end;

  procedure output_V(V: vector);
  var
    i: integer;

  begin
    writeln('Вектор: ');
    for i := 0 to Length(V) - 1 do
      writeln(V[i]: 5: 5);
  end;

var
  n: integer;
  A, A2: matrix;
  T: vector;

begin
  n := 1;
  while (n <> 0) do
  begin
    input_mat(n, A);
    writeln;
    if n > 100 then
    begin
      writeln('Порядок матрицы должен быть меньше 100');
      readln;
      exit;
    end
    else
    begin
      output_mat(A);
      writeln;
      change_elem(A2,n);
      writeln;
      mean(A);
      writeln;
      T := mean(A);
      output_V(T);
    end;
    writeln;
  end;
  readln;
end.
