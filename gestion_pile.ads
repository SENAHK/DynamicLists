package gestion_pile is
   -- Exceptions
   --
   Pile_Vide : exception;

   --
   -- Implémentation de la structure de pile
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

   -- Fonctionnalités d'une pile (fonctions et procédures)
   --
   -- Cette fonction retourne vrai si la pile <Pile> est vide et faux sinon
   function Vide(Pile : T_Pile) return boolean;

   -- Cette fonction retourne vrai si la pile <Pile> a atteint sa capacité maximale
   -- et faux sinon
   --function Sommet(Pile : T_Pile) return Integer;

   -- Cette fonction empile la valeur <Info> sur la pile <Pile>
   -- L'exception <Pile_Pleine> est levée si la pile <Pile> a atteint sa capacité maximale
   procedure Empiler(Pile : in out T_Pile; Val : in Integer);

   -- Cette fonction retire la valeur stockée au sommet de la pile <Pile>
   -- et la stocke dans <Info>
   -- L'exception <Pile_Vide> est levée si la pile <Pile> est vide
   procedure Depiler(Pile : in out T_Pile; Val : out Integer);

   --


end gestion_pile;
