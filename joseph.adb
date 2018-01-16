with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


procedure Joseph is
   -----------------------------------------------------------------------------
   -- Data structure
   -- simple linked list
   type T_Element;
   type T_List is access T_Element;
   type T_Element is record
      Info: Integer;
      Next: T_Liste := null;
   end record;

   -- circular list uses only one cursor
   type T_Circular_List is record
      Current: T_Liste := null;
   end record;
   -----------------------------------------------------------------------------



begin

end Joseph;
