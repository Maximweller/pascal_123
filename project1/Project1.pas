program Project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

const
  r=#186;
  f=#205;
  t=#201;y=#203;u=#187;
  g=#204;h=#206;j=#185;
  b=#200;n=#202;m=#188;

Var
   x1,y1,x2,y2,x3,y3,x0,y0:integer;
   t1,t2,t3,s1,s2,s3,a1,a2,a3:double;
   side,angle:string[16];

begin
     writeln('Введите координаты первой точки:');      //вводим координаты точек
     read(x1,y1);
     writeln('Введите координаты второй точки:');
     read(x2,y2);
     writeln('Введите координаты третьей точки:');
     read(x3,y3);
     writeln('Введите координаты проверяемой точки:');
     read(x0,y0);
     writeln('');
                                                       //образуют ли введенные точки треугольник
     if ((x1=x2)and(x2=x3)and(x3=x1)and(y1=y2)and(y2=y3)and(y3=y1)) then
       begin
         writeln('У вас получилась точка. Попробуйте еще раз!');
         readln;
       end
     else if (((x1=x2)and(y1=y2))or((x1=x3)and(y1=y3)) or
             ((x2=x3)and(y2=y3))) then
       begin
         writeln('Две точки совпадают. Треугольника нет!');
         readln;
       end
     else if (((x3-x1)*(y2-y1)-(x2-x1)*(y3-y1))=0) then
       begin
         writeln('Точки лежат на одной прямой. Треугольника нет!');
         readln;
       end
     else
       begin
         t1:=(x1-x0)*(y2-y1)-(x2-x1)*(y1-y0);          //лежит ли проверяемая точка справа от сторон треугольника
         t2:=(x2-x0)*(y3-y2)-(x3-x2)*(y2-y0);
         t3:=(x3-x0)*(y1-y3)-(x1-x3)*(y3-y0);

         if (t1>0)and(t2>0)and(t3>0) or
            (t1<0)and(t2<0)and(t3<0) then
           writeln('точка лежит внутри треугольника')
         else if (t1=0)or(t2=0)or(t3=0) then
           writeln('точка лежит на стороне')
         else writeln('точка лежит вне треугольника');
         readln;

         s1:=sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));    //по стороне треугольника определяем тип
         s2:=sqrt((x3-x2)*(x3-x2)+(y3-y2)*(y3-y2));
         s3:=sqrt((x1-x3)*(x1-x3)+(y1-y3)*(y1-y3));

         if (s1=s2)and(s2=s3)and(s3=s1) then
           side:='равносторонний'
         else if (s1=s2)or(s2=s3)or(s3=s1) then
           side:='равнобедренный'
         else side:='разносторонний';
         writeln(side);

         a1:=sqrt((s2*s2)+(s3*s3));                    //по третьей стороне определяем тип
         a2:=sqrt((s1*s1)+(s3*s3));
         a3:=sqrt((s1*s1)+(s2*s2));

         if (a1=s1)or(a2=s2)or(a3=s3) then
           angle:='прямоугольный'
         else if (a1<s1)or(a2<s2)or(a3<s3) then
           angle:='тупоугольный'
         else if (a1>s1)and(a2>s2)and(a3>s3) then
           angle:='остроугольный';
         writeln(angle);
         writeln('');

                                                       //вывод данных с помощью псевдографики
         writeln(t,f,f,f,f,f,f,f,f,f,f,y,f,f,f,f,f,f,f,f,f,f,y,f,f,f,f,f,f,f,f,f,f,y,f,f,f,f,f,f,f,f,f,f,y,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,u);
         writeln(r,'  первая  ',r,'  вторая  ',r,'  третья  ',r,'  чет-ая  ',r,'           вид треугольника          ',r);
         writeln(g,f,f,f,f,f,f,f,f,f,f,h,f,f,f,f,f,f,f,f,f,f,h,f,f,f,f,f,f,f,f,f,f,h,f,f,f,f,f,f,f,f,f,f,h,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,y,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,j);
         writeln(r,x1:4,',',y1:3,'':2,r,x2:4,',',y2:3,'':2,r,x3:4,',',y3:3,'':2,r,x0:4,',',y0:3,'':2,r,side:16,'':2,r,angle:16,'':2,r);
         writeln(b,f,f,f,f,f,f,f,f,f,f,n,f,f,f,f,f,f,f,f,f,f,n,f,f,f,f,f,f,f,f,f,f,n,f,f,f,f,f,f,f,f,f,f,n,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,n,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,m);
       end;
     readln;
end.
