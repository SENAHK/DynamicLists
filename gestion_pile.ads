package gestion_pile is
   -- Exceptions
   --
   Pile_Vide : exception;

   --
   -- Impl�mentation de la structure de pile
   --
   type T_Element;
   type T_Ptr_Element is access T_Element;
   type T_Element is
      record
         Value    : Integer;
         Suivant : T_Ptr_Element := null;
      end record;
   type T_Pile is record
      Sommet : T_Ptr_Element := null;
   end record;

   -- Fonctionnalit�s d'une pile (fonctions et proc�dures)
   --
   -- Cette fonction retourne vrai si la pile <Pile> est vide et faux sinon
   function Vide(Pile : T_Pile) return boolean;

   -- Cette fonction retourne vrai si la pile <Pile> a atteint sa capacit� maximale
   -- et faux sinon
   --function Sommet(Pile : T_Pile) return Integer;

   -- Cette fonction empile la valeur <Info> sur la pile <Pile>
   -- L'exception <Pile_Pleine> est lev�e si la pile <Pile> a atteint sa capacit� maximale
   procedure Empiler(Pile : in out T_Pile; Val : in Integer);

   -- Cette fonction retire la valeur stock�e au sommet de la pile <Pile>
   -- et la stocke dans <Info>
   -- L'exception <Pile_Vide> est lev�e si la pile <Pile> est vide
   procedure Depiler(Pile : in out T_Pile; Val : out Integer);

   --


end gestion_pile;
