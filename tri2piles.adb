with gestion_pile; use gestion_pile;
with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure tri2piles is


   P1: T_Pile;
   P2: T_Pile;
   Val : Integer;
begin
   Empiler(P1, 3);
   Put(P1.Sommet.Value);
   Empiler(P1, 9);
   Put(P1.Sommet.Value);
   Depiler(P1, Val);
   Put(P1.Sommet.Value);
   Put(Val);
end tri2piles;
