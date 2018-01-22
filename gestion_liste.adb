--AUTEUR:	Ramusi Michael
--SECTION:	ITI 1re annee
--DATE:		Janvier 2018
--COURS:	Labo prog
--PROJET:	Liste dynamiques
with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body gestion_liste is

   function Empty(List: T_List) return Boolean is
   begin
      return List = null;
   end Empty;

   -- Insert: push a word in a list of words
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

   -- Search: find an element in the list and return nb of occurences
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

   -- Intersect: return the words contained in list one and two
   function Intersect(Left, Right: T_List) return T_List is
      L1 : T_List := Left;
      L2: T_List := Right;
      Common: T_List;
   begin
      while L1 /= null loop
         while L2 /= null loop
            if L1.Value.Word = L2.Value.Word then
               Insert(Common, L1.Value.Word);
               exit;
            end if;
            L2 := L2.Next;
         end loop;
         L2 := Right;
         L1 := L1.Next;
      end loop;
      return Common;
   end Intersect;

   -- Difference: return the words contained in list one that list two
   --             doesn't contain
   function Difference(Left, Right: T_List) return T_List is
      L1 : T_List := Right;
      L2: T_List := Left;
      Diff: T_List;
      Exists: Boolean := false;
   begin
      while L1 /= null loop
         while L2 /= null loop
            if L1.Value.Word = L2.Value.Word then
               Exists := true;
               exit;
            end if;
            L2 := L2.Next;
         end loop;
         if not Exists then
            for occurence in 1..L1.Value.Occurence loop
               Insert(Diff, L1.Value.Word);
            end loop;
         end if;
         Exists := false;
         L2 := Left;
         L1 := L1.Next;
      end loop;
      return Diff;
   end Difference;

   -- "+": concatenate the words and occurences of the two list
   function "+"(Left, Right: T_List) return T_List is
      L1 : T_List := Left;
      L2: T_List := Right;
   begin
      While L2 /= null loop
         for occurence in 1..L2.Value.Occurence loop
            Insert(L1, L2.Value.Word);
         end loop;
         L2 := L2.Next;
      end loop;
      return L1;
   end "+";


   end gestion_liste;
