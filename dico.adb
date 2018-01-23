--AUTEUR:	Ramusi Michael
--SECTION:	ITI 1re annee
--DATE:		Janvier 2018
--COURS:	Labo prog
--PROJET:	Liste dynamiques
with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with gestion_liste; use gestion_liste;

procedure dico is
   INVALID_ARGUMENTS: Exception;

   -- lecture d'un mot de caractères dans 'a'..'z' ou 'A'..'Z'
   procedure Read_Word(Fichier  : in File_Type;
                       Mot      : out String;
                       Lg       : out Natural) is
      ch : Character;
   begin
      lg := 0;
      Mot := (others => Ascii.Nul); -- Ascii.Nul est le caractère vide
      loop
         Get_Immediate(Fichier,Ch);
         exit when ch not in 'a'..'z' and ch not in 'A'..'Z';
         lg := lg+1;
         mot(lg) := ch;
      end loop;
   end Read_Word;




   procedure FileToList(File: in string; List: in out T_List) is
      Fichier : File_Type;
      mot     : String(1..100) := (others => Ascii.Nul);
      Lg : Natural := 0;
   begin
      Open(Fichier,In_File, File);
      while not End_Of_File(Fichier) loop
         Read_Word(Fichier,mot,Lg);
         if Lg > 0 then
            Insert(List, mot(1..Lg));
         end if;
      end loop;
      Close(Fichier);
   end FileToList;


   L1, L2: T_List;
   Arg: String(1..2);
begin
   begin
      if Argument_Count < 2 then
         raise INVALID_ARGUMENTS;

      else
         if Argument_Count = 2 then
            -- INSERT TO LIST
            if Argument(1) = "-p" then
               FileToList(Argument(2), L1);
               Put(L1);
            else
               raise INVALID_ARGUMENTS;
            end if;
         end if;

         if Argument_Count = 3 then
            FileToList(Argument(2), L1);
            Arg := Argument(1);

            if Argument(1) = "-s" then
               Put( Search(L1, Argument(3)) );
            end if;
            if Argument(1) = "-x" then
               Put("OK");
               --Put( Delete(L1, Argument(3) ));
            end if;
            if Argument(1) = "-i" then
               FileToList(Argument(3), L2);
               Put( Intersect(L1, L2) );
            end if;
            if Argument(1) = "-d" then
               FileToList(Argument(3), L2);
               Put( Difference(L2, L1) );
            end if;
            if Argument(1) = "-c" then
               Put("ok");
               FileToList(Argument(3), L2);
               Put( L1 + L2 );
            end if;
         end if;
      end if;
      exception
         when INVALID_ARGUMENTS => Put("Invalid Arguments");
         when WORD_INEXISTANT => Put("Word not found in the list");
      end;
   end dico;
