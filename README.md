# Gym Database Project

## Opis projektu
Projekt przedstawia bazę danych zaprojektowaną dla siłowni. Celem projektu jest zarządzanie informacjami o członkach, trenerach, zajęciach, sprzęcie oraz płatnościach w uporządkowany i efektywny sposób.

## Funkcje bazy danych
- **Zarządzanie członkami**: Przechowywanie danych osobowych i informacji o członkostwie.
- **Planowanie zajęć**: Harmonogramy zajęć.
- **Śledzenie sprzętu**: Rejestracja sprzętu, zgłaszanie usterek i planowanie napraw.
- **Obsługa płatności**: Powiązanie płatności z członkami siłowni.

## Struktura bazy danych
Baza danych składa się z następujących tabel:
- **Memberships**: Informacje o typach członkostw.
- **Members**: Dane członków siłowni.
- **Specializations**: Specjalizacje trenerów.
- **Classes**: Rodzaje zajęć grupowych.
- **Trainers**: Informacje o trenerach.
- **TrainerSchedules**: Harmonogramy trenerów.
- **TrainerScheduleAssignments**: Powiązanie trenerów z ich harmonogramami.
- **ClassReservations**: Rezerwacje zajęć przez członków.
- **Equipment**: Lista sprzętu siłowni.
- **Malfunctions**: Usterki sprzętu.
- **EquipmentMaintenance**: Szczegóły konserwacji sprzętu.
- **Payments**: Płatności członków.

## Zapytania SQL
Przykładowe zapytania SQL użyte w projekcie:
1. Pobieranie danych członka i jego członkostwa:
   ```sql
   SELECT m.Name, m.LastName, ms.TypeOfMember, ms.Cost 
   FROM Members m
   JOIN Memberships ms ON m.MembershipID = ms.MembershipID
   WHERE m.MemberID = 1;

1. Zajęcia prawdzone przez trenera z harmonogramem:
   ```sql
   SELECT t.Name AS TrainerName, t.LastName AS TrainerLastName, c.Name AS ClassName, ts.DayOfWeek, ts.StartTime, ts.EndTime
   FROM Trainers t
   JOIN TrainerSchedules ts ON t.TrainerID = ts.TrainerScheduleID
   JOIN Classes c ON ts.ClassesID = c.ClassesID
   WHERE t.TrainerID = 1;

3. Członkowie zapisani na konkretne zajęcia:
   ```sql
   SELECT m.Name AS MemberName, m.LastName AS MemberLastName, c.Name AS ClassName
   FROM ClassReservations cr
   JOIN Members m ON cr.MemberID = m.MemberID
   JOIN Classes c ON cr.ClassesID = c.ClassesID
   WHERE c.ClassesID = 1;

