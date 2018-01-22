--AUTEUR:	Ramusi Michael
--SECTION:	ITI 1re annee
--DATE:		Janvier 2018
--COURS:	Labo prog
--PROJET:	Liste dynamiques
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Unchecked_Deallocation;

procedure joseph is
   -- Structure of list
   type T_Element;
   type T_Liste is access T_Element;
   type T_Element is record
      Value : Integer;
      Next : T_Liste := null;
   end record;
   
   procedure Free is new Unchecked_Deallocation(T_Element, T_Liste);

   procedure Put(List : in T_Liste; N: in Integer) is
   begin
      if List.Value = N then
         Put(List.Value);
         Put(List.Next, N + 1);
      end if;
   end Put;
	
   -- Insert in List in a way for that List is a circular list-type
   procedure Insert(List: in out T_Liste; N: in Integer) is 
      Tmp: T_Liste := new T_Element;
      Temp: T_Liste;
   begin
      List := new T_Element;
      for i in 1..N loop
         Tmp := new T_Element'(i, null);
         List.Next := Tmp;
         List := Tmp;
         if i = 1 then
            Temp := List;
         end if;
      end loop;
      List.Next := Temp;
   end Insert;

   -- Delete
   procedure Delete(List : in out T_Liste; K : in Integer) is
      Alias: T_Liste := List;
      Tmp: T_Liste;
      i: Integer := 0;
   begin
      while List /= null loop
         i := i + 1;
         -- for each k element, delete it
         if i rem K = 0 then
            List := List.Next;
            Put(List.Value);
            New_Line;
            Tmp := List;
            List := Alias.Next;
            List.Next := Tmp.Next;
            Free(Tmp);
         else
            Alias := List;
            List:= List.Next;
         end if;
	      
         if List = Alias then
            Put(List.Value);
            List := null;
            exit;
         end if;
      end loop;
   end Delete;
   List : T_Liste;
   -- N will fix the numbers that will be we in the list -> from 1 to N
   N : Positive := Integer'Value(Argument(1));
   -- K will fix the number of the step uses to delete an element in the list
   K : Positive := Integer'Value(Argument(2));
begin
   Put("OK");
   New_Line;
   Insert(List, Integer'Value(Argument(1)));
   New_Line;
   Delete(List, Integer'Value(Argument(2)));
   New_Line;   
end joseph;
