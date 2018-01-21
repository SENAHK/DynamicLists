with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body gestion_liste is

   function Empty(List: T_List) return Boolean is
   begin
      return List = null;
   end Empty;

   procedure Insert(List: in out T_List; Val: in String) is
      Tmp : T_List := new T_Element'((Val'Length, Val, 1), null);
      Current : T_List := List;
   begin
      if Empty(List) then
         List := Tmp;
      else
         -- Processing the first element of the list
         -- if word to insert is smaller than element
         if Val < List.Value.Word then
            -- insert before the element
            Tmp.Next := List;
            List := Tmp;
         else
            -- if word is equal to the first element
            if Val = List.Value.Word then
               -- only increment occurence
               Current.Value.Occurence := Current.Value.Occurence + 1;
            else
               -- go to the next element
               while Current.Next /= null and then Val > Current.Next.Value.Word loop
                  Current := Current.Next;
               end loop;
               if Current.Next /= null and then Val = Current.Next.Value.Word then
                  Current.Next.Value.Occurence := Current.Next.Value.Occurence + 1;
               else
                  Tmp.Next := Current.Next;
                  Current.Next := Tmp;
               end if;
            end if;
         end if;
      end if;
   end Insert;

   procedure Put(List: in T_list) is
      L: T_List := List;
   begin
      if not Empty(L) then
         New_Line;
         loop
            exit when L = null;
            Put(L.Value.Word);
            Put(": ");
            Put(L.Value.Occurence);
            New_Line;
            L := L.Next;
         end loop;
      end if;
   end Put;
   --     procedure Delete(List: in out T_List; Val: in String) is
   --     begin
   --
   --     end Delete;
   --
   function Search(List: T_List; Val: String) return Natural is
      Current: T_List := List;
   begin
      while Current.Next /= null and then Current.Value.Word /= Val loop
         Current := Current.Next;
      end loop;
      if Current.Value.Word = Val then
         return Current.Value.Occurence;
      else
         raise WORD_INEXISTANT;
      end if;
   end Search;
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
