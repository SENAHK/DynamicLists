with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with gestion_liste; use gestion_liste;

procedure dico is

   -- Structure de liste
   type T_Element;
   type T_Lisa is access T_Element;
   type T_Element is record
      N : Integer;
      Suivant : T_Lisa := null;
   end record;

   -- lecture d'un mot de caract�res dans 'a'..'z' ou 'A'..'Z'
   procedure Read_Word(Fichier  : in File_Type;
                       Mot      : out String;
                       Lg       : out Natural) is
      ch : Character;
   begin
      lg := 0;
      Mot := (others => Ascii.Nul); -- Ascii.Nul est le caract�re vide
      loop
         Get_Immediate(Fichier,Ch);
         exit when ch not in 'a'..'z' and ch not in 'A'..'Z';
         lg := lg+1;
         mot(lg) := ch;
      end loop;
   end Read_Word;

   -- Ins�re la valeur <Val> � la bonne position dans la liste tri�e <Liste>
   procedure Inserer(Liste : in out T_Lisa; Val : in Integer) is
      Tmp : T_Lisa := new T_Element'(Val,null);
      Crt : T_Lisa := Liste;
   begin
      if Liste = null then
         Liste := Tmp;
      elsif Val <= Liste.all.N then
         Tmp.all.Suivant := Liste;
         Liste := Tmp;
      else
         while Crt.all.Suivant /= null
               and then Val > Crt.all.Suivant.all.N loop
            Crt := Crt.all.Suivant;
         end loop;
         Tmp.all.Suivant := Crt.all.Suivant;
         Crt.all.Suivant := Tmp;
      end if;
end Inserer;

      -- Affiche le contenu de la liste <Liste>
   procedure Put(Liste : in T_Lisa) is
      Crt : T_Lisa := Liste;
   begin
      while Crt /= null loop
         Put(Crt.all.N);
         Crt := Crt.all.Suivant;
      end loop;
end Put;

   Fichier : File_Type;
   mot     : String(1..100) := (others => Ascii.Nul);
   Lg : Natural := 0;



   List: T_List;
   Nb: T_Lisa;
begin

--     Inserer(Nb, 4);
--     Inserer(Nb, 3);
--     Inserer(Nb, 2);
--     Put(Nb);
--        Open(Fichier,In_File,Argument(1));
--        while not End_Of_File(Fichier) loop
--           Read_Word(Fichier,mot,Lg);
--           if Lg > 0 then
--              Put_Line(mot(1..Lg));
--           end if;
--        end loop;
--        Close(Fichier);

   --Insert(List, "il");
   Insert(List, "il");
   Insert(List, "fait");
   Insert(List, "froid");
   Insert(List, "ce");
   Insert(List, "matin");
   Insert(List, "ce");
   Insert(List, "froid");
   Insert(List, "donne");
   Insert(List, "froid");
   Insert(List, "a");
   Put(List);
   Put(Search(List, "matin"));
end dico;
