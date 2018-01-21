package gestion_liste is
   -----------------------------------------------------------------------------
   -- DATA STRUCTURE
   EMPTY_LIST: Exception;
   WORD_INEXISTANT: EXception;
   WORD_OVERFLOW: Exception;

   subtype T_Length is Natural range 1..100;
   type T_Info (Max: T_Length := 1) is record
      Word: String(1..Max);
      Occurence: Natural;
   end record;

   -- Simply-linked list structure of T_Info
   type T_Element;
   type T_List is access T_Element;
   type T_Element is record
      Value : T_Info;
      Next : T_List := null;
   end record;


   -----------------------------------------------------------------------------
   -- PROCEDURES & FUNCTIONS
   procedure Put(List: in T_list);
   procedure Insert(List: in out T_List; Val: in String);
--     procedure Delete(List: in out T_List; Val: in String);
   function Search(List: T_List; Val: String) return Natural;
--     function Intersect(Left, Right: T_List) return T_List;
--     function Difference(Left, Right: T_List) return T_List;
--     function "+"(Left, Right: T_List) return T_List;
   function Empty(List: T_List) return Boolean;
end gestion_liste;
