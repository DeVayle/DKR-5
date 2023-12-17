program dkr5;
uses Crt;

const
  NORM = 14; { цвет невыделеного пункта }
  SEL = 11; { цвет выделенного пункта }
  Num = 3;
  low = 10;
  mid = 50;
  high = 200;

var
  menu: array[1..Num] of string[36];{ названия пунктов меню }
  punkt: integer;
  ch: char; str, str2: string;
  x_menu, y_menu: byte;
  qsort, qs, vsort, vs: text;



procedure vstavki_low;
var
  a: array[1..low] of integer;
  x, i, j, n: integer;
  s: string;
  
begin
  ClrScr;
  assign(vsort, 'd:\vsort_low.txt');
  
  i:= 1;
  reset(vsort);
  while not eof(vsort) do
  begin
    readln(vsort, s);
    n:= StrToInt(s);
    a[i]:= n;
    i+=1;
  end;
  close(vsort);
  writeln('Исходный массив:        ', a);
  
  for i := 2 to low do
  begin
    x := a[i];
    j := i - 1;
    while (j > 0) and (x < a[j]) do
    begin
      a[j + 1] := a[j];
      j := j - 1;
    end;
    a[j + 1] := x;
  end;
  if str2 = 'up' then begin
    writeln('Отсортированный массив: ', a);
    rewrite(vs);
    for i:=1 to low do
      writeln(vs, a[i]);
    close(vs);
  end;
  if str2 = 'down' then begin
    write('Отсортированный массив: [');
    for i:=low downto 1 do
      write(a[i], ',');
    write(']');
    rewrite(vs);
    for i:=low downto 1 do
      writeln(vs, a[i]);
    close(vs);
  end;
end;

procedure vstavki_mid;
var
  a: array[1..mid] of integer;
  x, i, j, n: integer;
  s: string;
  
begin
  ClrScr;
  assign(vsort, 'd:\vsort_mid.txt');
  
  i:= 1;
  reset(vsort);
  while not eof(vsort) do
  begin
    readln(vsort, s);
    n:= StrToInt(s);
    a[i]:= n;
    i+=1;
  end;
  close(vsort);
  writeln('Исходный массив:        ', a);
  
  for i := 2 to mid do
  begin
    x := a[i];
    j := i - 1;
    while (j > 0) and (x < a[j]) do
    begin
      a[j + 1] := a[j];
      j := j - 1;
    end;
    a[j + 1] := x;
  end;
  if str2 = 'up' then begin
    writeln('Отсортированный массив: ', a);
    rewrite(vs);
    for i:=1 to mid do
      writeln(vs, a[i]);
    close(vs);
  end;
  if str2 = 'down' then begin
    write('Отсортированный массив: [');
    for i:=mid downto 1 do
      write(a[i], ',');
    write(']');
    rewrite(vs);
    for i:=mid downto 1 do
      writeln(vs, a[i]);
    close(vs);
  end;
end;

procedure vstavki_high;
var
  a: array[1..high] of integer;
  x, i, j, n: integer;
  s: string;
  
begin
  ClrScr;
  assign(vsort, 'd:\vsort_high.txt');
  
  i:= 1;
  reset(vsort);
  rewrite(vs);
  while not eof(vsort) do
  begin
    readln(vsort, s);
    n:= StrToInt(s);
    a[i]:= n;
    writeln(vs, n);
    i+=1;
  end;
  close(vs);
  close(vsort);
  writeln('Исходный массив:        ', a);
  
  for i := 2 to high do
  begin
    x := a[i];
    j := i - 1;
    while (j > 0) and (x < a[j]) do
    begin
      a[j + 1] := a[j];
      j := j - 1;
    end;
    a[j + 1] := x;
  end;
  if str2 = 'up' then begin
    writeln('Отсортированный массив: ', a);
    rewrite(vs);
    for i:=1 to high do
      writeln(vs, a[i]);
    close(vs);
  end;
  if str2 = 'down' then begin
    write('Отсортированный массив: [');
    for i:=high downto 1 do
      write(a[i], ',');
    write(']');
    rewrite(vs);
    for i:=high downto 1 do
      writeln(vs, a[i]);
    close(vs);
  end;
end;











procedure quakesort_low;
var
  a: array[1..low] of integer;
  n, i: integer;
  s: string;
  
procedure QuickSort(nL, nR: Integer);
var
  i, j, x, y: integer;

begin
  i := nL; j := nR;
  x := a[(nL+nR) div 2];
  repeat
    while (a[i] < x) do inc(i);
    while (x < a[j]) do dec(j);
    if (i <= j) then
    begin
      y:= a[i];
      a[i]:= a[j];
      a[j]:= y;
      inc(i);
      dec(j);
    end;
  until (i > j);
  if (nL < nR) then QuickSort(nL, j);
  if (i < nR) then QuickSort(i, nR);
end;
  
begin
  ClrScr;
  assign(qsort, 'd:\qsort_low.txt');
  
  i:= 1;
  reset(qsort);
  while not eof(qsort) do
  begin
    readln(qsort, s);
    n:= StrToInt(s);
    a[i]:= n;
    i+=1;
  end;
  close(qsort);
  writeln('Исходный массив:  ', a);
  
  QuickSort(1, low);
  if str2 = 'up' then begin
    writeln('Отсортированный массив: ', a);
    rewrite(qs);
    for i:=1 to low do
      writeln(qs, a[i]);
    close(qs);
  end;
  if str2 = 'down' then begin
    write('Отсортированный массив: [');
    for i:=low downto 1 do
      write(a[i], ',');
    write(']');
    rewrite(qs);
    for i:=low downto 1 do
      writeln(qs, a[i]);
    close(qs);
  end;
end;

procedure quakesort_mid;
var
  a: array[1..mid] of integer;
  n, i: integer;
  s: string;
  
procedure QuickSort(nL, nR: Integer);
var
  i, j, x, y: integer;

begin
  i := nL; j := nR;
  x := a[(nL+nR) div 2];
  repeat
    while (a[i] < x) do inc(i);
    while (x < a[j]) do dec(j);
    if (i <= j) then
    begin
      y:= a[i];
      a[i]:= a[j];
      a[j]:= y;
      inc(i);
      dec(j);
    end;
  until (i > j);
  if (nL < nR) then QuickSort(nL, j);
  if (i < nR) then QuickSort(i, nR);
end;
  
begin
  ClrScr;
  assign(qsort, 'd:\qsort_mid.txt');
  
  i:= 1;
  reset(qsort);
  while not eof(qsort) do
  begin
    readln(qsort, s);
    n:= StrToInt(s);
    a[i]:= n;
    i+=1;
  end;
  close(qsort);
  writeln('Исходный массив:  ', a);
  
  QuickSort(1, mid);
  if str2 = 'up' then begin
    writeln('Отсортированный массив: ', a);
    rewrite(qs);
    for i:=1 to mid do
      writeln(qs, a[i]);
    close(qs);
  end;
  if str2 = 'down' then begin
    write('Отсортированный массив: [');
    for i:=mid downto 1 do
      write(a[i], ',');
    write(']');
    rewrite(qs);
    for i:=mid downto 1 do
      writeln(qs, a[i]);
    close(qs);
  end;
end;

procedure quakesort_high;
var
  a: array[1..high] of integer;
  n, i: integer;
  s: string;
  
procedure QuickSort(nL, nR: Integer);
var
  i, j, x, y: integer;

begin
  i := nL; j := nR;
  x := a[(nL+nR) div 2];
  repeat
    while (a[i] < x) do inc(i);
    while (x < a[j]) do dec(j);
    if (i <= j) then
    begin
      y:= a[i];
      a[i]:= a[j];
      a[j]:= y;
      inc(i);
      dec(j);
    end;
  until (i > j);
  if (nL < nR) then QuickSort(nL, j);
  if (i < nR) then QuickSort(i, nR);
end;
  
begin
  ClrScr;
  assign(qsort, 'd:\qsort_high.txt');
  
  i:= 1;
  reset(qsort);
  while not eof(qsort) do
  begin
    readln(qsort, s);
    n:= StrToInt(s);
    a[i]:= n;
    i+=1;
  end;
  close(qsort);
  writeln('Исходный массив:  ', a);
  
  QuickSort(1, high);
  if str2 = 'up' then begin
    writeln('Отсортированный массив: ', a);
    rewrite(qs);
    for i:=1 to high do
      writeln(qs, a[i]);
    close(qs);
  end;
  if str2 = 'down' then begin
    write('Отсортированный массив: [');
    for i:=high downto 1 do
      write(a[i], ',');
    write(']');
    rewrite(qs);
    for i:=high downto 1 do
      writeln(qs, a[i]);
    close(qs);
  end;
end;









procedure punkt1;
begin
  ClrScr;
  assign(vs, 'd:\vsort.txt');
  writeln('Введите объем массива: (low / mid / high)');
  readln(str);
  writeln('Сортировка по возрастанию/убыванию (up / down)');
  readln(str2);
  if str = 'low' then vstavki_low;
  if str = 'mid' then vstavki_mid;
  if str = 'high' then vstavki_high;
  if (str <> 'low') and (str <> 'mid') and (str <> 'high') and (str2 <> 'up') and (str2 <> 'down') then writeln('Введите корректное значение');
  writeln;
  writeln('Процедура завершена. Нажмите <Enter> для продолжения.');
  repeat
    ch := readkey;
  until ch = #13;
end;

procedure punkt2;
begin
  ClrScr;
  assign(qs, 'd:\qsort.txt');
  writeln('Введите объем массива: (low / mid / high)');
  readln(str);
  writeln('Сортировка по возрастанию/убыванию (up / down)');
  readln(str2);
  if str = 'low' then quakesort_low;
  if str = 'mid' then quakesort_mid;
  if str = 'high' then quakesort_high;
  if (str <> 'low') and (str <> 'mid') and (str <> 'high') and (str2 <> 'up') and (str2 <> 'down') then writeln('Введите корректное значение');
  writeln;
  writeln('Процедура завершена. Нажмите <Enter> для продолжения.');
  repeat
    ch := readkey;
  until ch = #13;
end;





procedure MenuToScr;{ вывод меню на экран }
var
  i: integer;
begin
  ClrScr;
  for i := 1 to Num do
  begin
    GoToXY(x_menu, y_menu + i - 1);
    write(menu[i]);
  end;
  TextColor(SEL);
  GoToXY(x_menu, y_menu + punkt - 1);
  write(menu[punkt]);{ выделим строку меню }
  TextColor(NORM);
end;

begin
  ClrScr;
  menu[1] := ' Сортировка вставками ';
  menu[2] := ' Сортировка быстрым алгоритмом ';
  menu[3] := ' Выход ';
  punkt := 1; x_menu := 5; y_menu := 5;
  TextColor(NORM);
  MenuToScr;
  repeat
    ch := ReadKey;
    if ch = #0 then begin
      ch := ReadKey;
      case ch of
        #40:{ стрелка вниз }
          if punkt < Num then begin
            GoToXY(x_menu, y_menu + punkt - 1); write(menu[punkt]);
            punkt := punkt + 1;
            TextColor(SEL);
            GoToXY(x_menu, y_menu + punkt - 1); write(menu[punkt]);
            TextColor(NORM);
          end;
        #38:{ стрелка вверх }
          if punkt > 1 then begin
            GoToXY(x_menu, y_menu + punkt - 1); write(menu[punkt]);
            punkt := punkt - 1;
            TextColor(SEL);
            GoToXY(x_menu, y_menu + punkt - 1); write(menu[punkt]);
            TextColor(NORM);
          end;
      end;
    end
    else
    if ch = #13 then begin{ нажата клавиша <Enter> }
      case punkt of
        1: punkt1;
        2: punkt2;
        3: exit { выход }
      end;
      MenuToScr;
    end;
  until ch = #27;{ 27 - код <Esc> }
end.