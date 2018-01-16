with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure Joseph is
   -----------------------------------------------------------------------------
   -- DATA STRUCTURE

   -- simple linked list
   type T_Element;
   type T_List is access T_Element;
   type T_Element is record
      Value: Integer;
      Next: T_List := null;
   end record;

   -- circular list uses only one cursor
   type T_Circular_List is record
      Current: T_List := null;
   end record;

   type T_Numbers is array(Natural range <>) of Integer;
   -----------------------------------------------------------------------------
   -- PROCEDURES & FUNCTIONS

   function Empty(List: T_Circular_List) return Boolean is
   begin
      return List.Current = null;
   end Empty;

   procedure Push(List: in out T_Circular_List; Value: in Integer) is
      Tmp: T_List;
   begin
      if Empty(List) then
         Tmp := new T_Element'(Value, List.Current);
         List.Current := Tmp;
         List.Current.Next := List.Current;
      else
         Tmp := new T_Element'(Value, List.Current);
         List.Current := Tmp;
      end if;
   end Push;

   Procedure Put(List: in T_Circular_List) is
      Val: Integer;
      Temp: T_Circular_List := List;
   begin

      for i in 0..6 loop
         Val := Temp.Current.Value;
         Temp.Current := Temp.Current.Next;
         New_Line;
         Put(Val);
         New_Line;
      end loop;

   end Put;
   -----------------------------------------------------------------------------
   -- VARIABLES

   List: T_Circular_List;

   Values: T_Numbers(0..4) := (0 => 17,
                               1 => 34,
                               2 => 20,
                               3 => 40,
                               4 => 25  );
begin

   for i in 0..4 loop
      Push(List, Values(I));
      Put(List.Current.Value);
   end loop;
   New_Line;
   Put(List);


end Joseph;
