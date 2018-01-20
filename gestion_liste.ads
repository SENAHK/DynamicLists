package gestion_liste is
   -----------------------------------------------------------------------------
   -- DATA STRUCTURE
   EMPTY_LIST: Exception;

   type T_Info (Max: Natural := 0) is record
      Word: String(0..Max);
      Occurence: Natural;
   end record;

   -- Simply-linked list structure of T_Info
   type T_Element;
   type T_Ptr_Element is access T_Element;
   type T_Element is record
      Value : Integer;
      Next : T_Ptr_Element := null;
   end record;

   type T_List is record
      -- First element of the list
      Head: T_Ptr_Element := null;
      -- Current position in the list
      Position : T_Ptr_Element := null;
   end record;

   -----------------------------------------------------------------------------
   -- PROCEDURES & FUNCTIONS
   procedure Put(List: in T_list);
   procedure Insert(List: in out T_List; Val: in Integer);
--     procedure Delete(List: in out T_List; Val: in String);
--     function Search(List: T_List; Val: String) return Natural;
--     function Intersect(Left, Right: T_List) return T_List;
--     function Difference(Left, Right: T_List) return T_List;
--     function "+"(Left, Right: T_List) return T_List;
   function Empty(List: T_List) return Boolean;
end gestion_liste;
