package gestion_pile is

   -- Exceptions
   EMPTY_STACK : exception;

   -- Stack structure
   type T_Element;
   type T_Ptr_Element is access T_Element;
   type T_Element is
      record
         Value    : Integer;
         Next : T_Ptr_Element := null;
      end record;
   type T_Stack is record
      Peak : T_Ptr_Element := null;
   end record;
   -- Procedures & functions
   function Empty(Stack : T_Stack) return boolean;
   function Peak(Stack: T_Stack) return Integer;
   procedure Push(Stack : in out T_Stack; Val : in Integer);
   procedure Pop(Stack : in out T_Stack; Val : out Integer);


end gestion_pile;
