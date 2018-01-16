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
      Value : T_Info;
      Next : T_Ptr_Element := null;
      end record;

   type T_List is record
      Current : T_Ptr_Element := null;
   end record;

   -----------------------------------------------------------------------------
   -- PROCEDURES & FUNCTIONS

   procedure Insert(List: in out T_List; Val: in String);
   procedure Delete(List: in out T_List; Val: in String);
   function Search(List: T_List; Val: String) return Natural;
   function Intersect(Left, Right: T_List) return T_List;
   function Difference(Left, Right: T_List) return T_List;
   function "+"(Left, Right: T_List) return T_List;

end gestion_liste;
