generic
   type T_Info is private;

package gestion_pile is
   type T_Queue is limited private;
   -- Interface
   function Vide(Q : T_Queue) return Boolean;
   function Tete(Q : T_Queue) return T_Info;
   function Queue(Q : T_Queue) return T_Info;
   procedure Inserer(Q   : in out T_Queue;
                     Val : in     T_Info);
   procedure Extraire(Q   : in out T_Queue;
                      Val :    out T_Info);
   -- Exception
   QUEUE_VIDE : exception;

private
   -- Structure des chainons de la queue
   type T_Element;
   type T_Lien is access T_Element;
   type T_Element is record
      Valeur  : T_Info;
      Suivant : T_Lien;
   end record;
   -- Structure de queue
   type T_Queue is record
      Tete  : T_Lien;
      Queue : T_Lien;
   end record;
end gestion_pile;
