-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 06, 2025 at 11:29 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `piekarnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie_produkt`
--

CREATE TABLE `kategorie_produkt` (
  `id` int(11) NOT NULL,
  `nazwa_kat` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategorie_produkt`
--

INSERT INTO `kategorie_produkt` (`id`, `nazwa_kat`) VALUES
(1, 'Pieczywo'),
(2, 'Ciasta'),
(3, 'Bułki'),
(4, 'Torty'),
(5, 'Ciastka'),
(6, 'Chleb bezglutenowy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `adres_email` varchar(45) NOT NULL,
  `telefon` int(9) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`imie`, `nazwisko`, `adres_email`, `telefon`, `id`) VALUES
('Jan', 'Kowalski', 'jan.kowalski@example.com', 123456789, 1),
('Anna', 'Nowak', 'anna.nowak@example.com', 987654321, 2),
('Mateusz', 'Wójcik', 'mateusz.wojcik@example.com', 456789123, 3),
('Zofia', 'Nowicka', 'zofia.nowicka@example.com', 654321789, 4),
('Piotr', 'Mazur', 'piotr.mazur@example.com', 321987654, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nazwa_prod` varchar(45) NOT NULL,
  `kategoria_prod` int(11) NOT NULL,
  `cena` int(11) NOT NULL,
  `masa_gramy` int(45) NOT NULL,
  `skladniki` varchar(45) NOT NULL,
  `kolor` varchar(45) NOT NULL,
  `baza` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `nazwa_prod`, `kategoria_prod`, `cena`, `masa_gramy`, `skladniki`, `kolor`, `baza`) VALUES
(1, 'Chleb pszenno-żytni', 1, 5, 500, 'mąka, drożdże, sól', 'złoty', 'pszenna'),
(2, 'Tort czekoladowy', 2, 15, 1000, 'mąka, jajka, cukier', 'biały', 'biszkopt'),
(5, 'Bagietka francuska', 1, 6, 400, 'mąka, drożdże, sól, woda', 'złoty', 'pszenna'),
(6, 'Makowiec', 2, 20, 1200, 'mąka, mak, cukier, jajka', 'ciemny', 'drożdżowe'),
(7, 'Ciastka owsiane', 3, 12, 500, 'płatki owsiane, miód, jajka', 'brązowy', 'owsiane');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `funkcja` varchar(45) NOT NULL,
  `telefon` int(9) NOT NULL,
  `wiek` int(3) NOT NULL,
  `adres_zam` varchar(45) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pracownicy`
--

INSERT INTO `pracownicy` (`imie`, `nazwisko`, `funkcja`, `telefon`, `wiek`, `adres_zam`, `id`) VALUES
('Karol', 'Lis', 'Piekarz', 123987654, 35, 'Świętochłowice 10', 1),
('Ewa', 'Kozłowska', 'Sprzedawca', 789654123, 28, 'Katowice 15', 2),
('Katarzyna', 'Zielińska', 'Cukiernik', 741258963, 40, 'Gliwice 22', 3),
('Tomasz', 'Lewandowski', 'Kierownik', 852369741, 45, 'Chorzów 8', 4);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kategorie_produkt`
--
ALTER TABLE `kategorie_produkt`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategoria` (`kategoria_prod`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorie_produkt`
--
ALTER TABLE `kategorie_produkt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `kategoria` FOREIGN KEY (`kategoria_prod`) REFERENCES `kategorie_produkt` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
