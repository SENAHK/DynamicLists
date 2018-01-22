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

   procedure FillStack(Left, Right: in out T_Stack; Values: in T_Numbers) is
      Nb, Popped: Integer;
      Cpt: Natural := 1;
   begin
      -- Left stack should contain greater values
      -- At first, push first val into it
      Push(Left, Values(0));

      -- Looping through the remaining elements
      for I in 1..Values'Last loop
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

         if not Empty(Right) and then Nb > Peak(Right) then
            Push(Left, Nb);
         end if;

         if not Empty(Left) and then Nb > Peak(Left) then
            Push(Left, Nb);
         end if;

      end loop;

      while not Empty(Right) loop
         Pop(Right, Popped);
         Push(Left, Popped);
      end loop;
   end FillStack;

   -- I: Natural := 0;
   Left, Right: T_Stack;
   Val : Integer;

   Values: T_Numbers(0..Argument_Count-1);
   --     Values: T_Numbers(0..4) := (0 => 17,
   --                                 1 => 34,
   --                                 2 => 20,
   --                                 3 => 40,
   --                                 4 => 25  );
begin


   if Argument_Count > 0 then

      for I in Values'Range loop
         Values(I) := Integer'Value(Argument(I+1));
         --I := I + 1;
      end loop;


      FillStack(Left, Right, Values);
      New_Line;
      Put("Sorted:");

      loop

         New_Line;
         Put(Peak(LEfT));
         Pop(Left, Val);
         New_Line;
         exit when Empty(Left);
      end loop;
   else
      Put("Argument Error");
   end if;
end tri2piles;
