with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body gestion_liste is

   function Empty(List: T_List) return Boolean is
   begin
      return List.Head = null;
   end Empty;
   procedure Insert(List: in out T_List; Val: in Integer) is
      Tmp: T_Ptr_Element;
   begin
      if Empty(List) then
         Tmp := new T_Element'(Val, null);
         List.Position := Tmp;
         List.Head := Tmp;
      else
         Tmp := new T_Element'(Val, List.Position);
         List.Position := Tmp;
      end if;

   end Insert;

   procedure Put(List: in T_list) is
      L: T_List := List;
   begin
      if not Empty(L) then
         while L.Position /= null loop
            Put(L.Position.Value);
            L.Position := L.Position.Next;
         end loop;
      end if;
   end Put;
--     procedure Delete(List: in out T_List; Val: in String) is
--     begin
--
--     end Delete;
--
--     function Search(List: T_List; Val: String) return Natural is
--     begin
--
--     end Search;
--
--     function Intersect(Left, Right: T_List) return T_List is
--     begin
--
--     end Intersect;
--
--     function Difference(Left, Right: T_List) return T_List is
--     begin
--
--     end Difference;
--
--     function "+"(Left, Right: T_List) return T_Listis
--     begin
--
--     end "+";


end gestion_liste;
