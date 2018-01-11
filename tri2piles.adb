with gestion_pile; use gestion_pile;
with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure tri2piles is


   P1: T_Stack;
   P2: T_Stack;
   Val : Integer;
begin
   Push(P1, 3);
   Put(Peak(P1));
   Push(P1, 9);
   Put(Peak(P1));
   Pop(P1, Val);
   Put(Peak(P1));
   Put(Val);
end tri2piles;
