--AUTEUR:	Ramusi Michael
--SECTION:	ITI 1re annee
--DATE:		Janvier 2018
--COURS:	Labo prog
--PROJET:	Liste dynamiques
with gestion_pile; use gestion_pile;
with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure tri2piles is

   type T_Numbers is array(Natural range <>) of Integer;

   procedure FillStack(Left, Right: in out T_Stack; Values: in out T_Numbers) is
      Nb, Popped: Integer;
      Cpt: Natural := 1;
   begin
      -- Looping through the elements
      for I in 0..Values'Last loop
         Put("NB: ");
         Put(Values(I));
         new_line;

         --Nb is the value to sort
         Nb := Values(I);

         -- While Nb > peak of left stack
         while not Empty(Left) and then Nb > Peak(Left) loop
            -- Pop the value from left, push it to right
            Pop(Left, Popped);
            Push(Right, Popped);
         end loop;

         -- While Nb < peak of right stack
         while not Empty(Right) and then Nb < Peak(Right) loop
            -- pop the value from right, push it to left
            Pop(Right, Popped);
            Push(Left, Popped);
         end loop;

         Push(Left, Nb);

      end loop;
      --Put( Right.Peak.Value);
      while not Empty(Right) loop
         Pop(Right, Popped);
         Push(Left, Popped);
      end loop;
   end FillStack;

   -- I: Natural := 0;
   Left, Right: T_Stack;
   Val : Integer;

   Values: T_Numbers(0..Argument_Count-1);
begin
   if Argument_Count > 0 then

      for I in Values'Range loop
         Values(I) := Integer'Value(Argument(I+1));
      end loop;

      FillStack(Left, Right, Values);
      New_Line;
      Put("Sorted:");

      loop
         New_Line;
         Pop(Left, Val);
         Put(Val);
         New_Line;
         exit when Empty(Left);
      end loop;
   else
      Put("Argument Error");
   end if;
end tri2piles;
