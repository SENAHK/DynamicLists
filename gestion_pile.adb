with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body gestion_pile is

   function Vide(Pile : T_Pile) return boolean is

   begin
      return Pile.Sommet = null;
   end Vide;


--     function Sommet(Pile : T_Pile) return T_Info is
--
--     begin
--
--     end Sommet;



   procedure Empiler(Pile : in out T_Pile; Val : in Integer) is
      Tmp: T_Ptr_Element;
   begin
      if Vide(Pile) then
         Tmp := new T_Element'(Val, null);
      else
         Pile.Sommet.Suivant := Pile.Sommet;
         Tmp := new T_Element'(Val, Pile.Sommet.Suivant);
      end if;
      Pile.Sommet := Tmp;
   end Empiler;

   procedure Depiler(Pile : in out T_Pile; Val : out Integer) is

   begin
      if Vide(Pile) then
         raise Pile_Vide;
      else
         Val := Pile.Sommet.Value;
         Pile.Sommet := Pile.Sommet.Suivant;
      end if;
   end Depiler;


end gestion_pile;
