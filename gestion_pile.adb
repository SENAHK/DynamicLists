with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body gestion_pile is

   function Empty(Stack : T_Stack) return boolean is
   begin
      return Stack.Peak = null;
   end Empty;

   function Peak(Stack: T_Stack) return Integer is
      begin
      if not Empty(Stack) then
         return Stack.Peak.Value;
      else
         raise EMPTY_STACK;
         end if;
   end Peak;

   procedure Push(Stack : in out T_Stack; Val : in Integer) is
      Tmp: T_Ptr_Element;
   begin
      if Empty(Stack) then
         Tmp := new T_Element'(Val, null);
      else
         Stack.Peak.Next := Stack.Peak;
         Tmp := new T_Element'(Val, Stack.Peak.Next);
      end if;
      Stack.Peak := Tmp;
   end Push;

   procedure Pop(Stack : in out T_Stack; Val : out Integer) is
   begin
      if Empty(Stack) then
         raise EMPTY_STACK;
      else
         Val := Stack.Peak.Value;
         Stack.Peak := Stack.Peak.Next;
      end if;
   end Pop;


end gestion_pile;
