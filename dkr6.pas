{   ---------<>---------
#38 - стрелочка вверх
#40 - стрелочка вниз
#37 - стрелочка влево
#39 - стрелочка вправо
#13 - Enter
    ---------<>---------}
uses crt;

const LIMIT_OF_LIST = 50;

type 
  Node = record
    info: array [0..LIMIT_OF_LIST] of integer;
    next: integer;
    size: integer;
  end;
  
var gl_key: char;
var gl_pos, gl_len: integer;
var node_new: Node;

procedure Add_To_End(var node_new_1: Node; var elem: integer);
begin
  if node_new_1.size < LIMIT_OF_LIST then
  begin
    node_new_1.info[node_new_1.size] := elem;
    inc(node_new_1.size);
  end
  else
    print('Error');
end;

procedure Add_To_Start(var node_new_1: Node; elem: Integer);
begin
  if node_new_1.size = LIMIT_OF_LIST then 
    println('Full!!!')
  else
  begin
    for var i := node_new_1.size - 1 downto 0 do
      node_new_1.info[i + 1] := node_new_1.info[i];
    node_new_1.info[0] := elem;
    inc(node_new_1.size)
  end;
end;

procedure Print_Node(const node_new_1: Node);
begin
  if node_new_1.size <> 0 then begin
    print('Array: ');
    for var i := 0 to node_new_1.size - 1 do
      print(node_new_1.info[i], ' ');
    println;
  end;
  if node_new_1.size = 0 then println('Empty');
  readln();
end;

procedure Clear(var node_new_1: Node);
begin
  node_new_1.size := 0;
  println('Clear!')
end;

procedure Delete_Last(var node_new_1: Node);
begin
  if node_new_1.size <> 0 then begin
  node_new_1.size -= 1;
  println('Done!');
  end;
  if node_new_1.size = 0 then println('Error')
end;


procedure Main_Menu; begin
  
  gl_len := 6;
  println();
  println();
  println();
  println();
  
  if (gl_pos = 1) then
    print('               --> ')  
  else
    print('             ');
  println(' [1] Добавить элемент в конец списка');
  
  if (gl_pos = 2) then
    print('               --> ')
  else
    print('             ');
  println(' [2] Вывести список');
  
  if (gl_pos = 3) then
    print('               --> ')
  else
    print('             ');
  println(' [3] Добавить элемент в начало списка');
  if (gl_pos = 4) then
    print('               --> ')
  else
    print('             ');
  println(' [4] Очистить список');
  if (gl_pos = 5) then
    print('               --> ')
  else
    print('             ');
  println(' [5] Удалить последний элемент');
  if (gl_pos = 6) then
    print('               --> ')
  else
    print('             ');
  println(' [6] Выход')
  
end;


procedure Navigation; begin
  gl_key:= readkey;
  if (gl_key = #40) then
    inc(gl_pos);
  if (gl_pos > gl_len) then
    gl_pos := 1;
  if (gl_key = #38) then
    dec(gl_pos);
  if (gl_pos = 0) then
    gl_pos := gl_len;
end;


Begin
node_new.size := 0;
println('Нажмите на клавишу, чтобы начать...');
gl_key :=readkey;
gl_pos := 1;
clrscr();
while (true) do
  begin
    clrscr;
    Main_Menu;
    Navigation;
    if (gl_key = #13) then
      begin
        case gl_pos of
          1: begin
            var elem := ReadlnInteger('Enter ');
            Add_To_End(node_new, elem);
          end;
          2: begin
            Print_Node(node_new);
          end;
          3: begin
            var elem := ReadlnInteger('Enter ');
            Add_To_Start(node_new, elem);
          end;
          4: begin
            Clear(node_new);
          end;
          5: begin
            Delete_Last(node_new);
          end;
          6: begin
            exit;
          end;
        end;
      end;
  end;
end.