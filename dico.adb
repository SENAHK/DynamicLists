with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with gestion_liste; use gestion_liste;

procedure dico is
   --
--     procedure ReadWord(File  : in File_Type;
--                        Word      : out String;
--                        Lg       : out Natural) is
--        ch : Character;
--     begin
--        lg := 0;
--        Word := (others => Ascii.Nul); -- Ascii.Nul = empty char
--        loop
--           Get_Immediate(File, Ch);
--           exit when ch not in 'a'..'z' and ch not in 'A'..'Z';
--           lg := lg+1;
--           Word(lg) := ch;
--        end loop;
--     end ReadWord;
--
--     File : File_Type;
--     Word     : String(1..100) := (others => Ascii.Nul);
--     Lg : Natural := 0;
   List: T_List;
begin
   --Open(File, In_File, Argument(1));
--     Open(File, In_File, "words.txt");
--     while not End_Of_File(File) loop
--        ReadWord(File, Word, Lg);
--        if Lg > 0 then
--           Put_Line(Word(1..Lg));
--        end if;
--     end loop;
--     Close(File);
   Insert(List, 5);
   Insert(List, 7);
   Insert(List, 3);
   Put(List);
end dico;
