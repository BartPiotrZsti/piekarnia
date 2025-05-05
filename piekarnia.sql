-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 05, 2025 at 03:42 PM
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
-- Struktura tabeli dla tabeli `bulki`
--

CREATE TABLE `bulki` (
  `nazwa` varchar(45) NOT NULL,
  `kolor` varchar(45) NOT NULL,
  `wielkość` varchar(45) NOT NULL,
  `zakwas` varchar(45) NOT NULL,
  `ziarno` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `chleb`
--

CREATE TABLE `chleb` (
  `nazwa` varchar(45) NOT NULL,
  `ziarno` varchar(45) NOT NULL,
  `zakwas` varchar(45) NOT NULL,
  `kolor` varchar(45) NOT NULL,
  `wielkość` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ciasto`
--

CREATE TABLE `ciasto` (
  `nazwa` varchar(45) NOT NULL,
  `kolor` varchar(45) NOT NULL,
  `wielkość` varchar(45) NOT NULL,
  `baza` varchar(45) NOT NULL,
  `posypka` varchar(45) NOT NULL,
  `smaki` varchar(45) NOT NULL,
  `owoce` varchar(45) NOT NULL,
  `polewa` varchar(45) NOT NULL,
  `srodek` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menu`
--

CREATE TABLE `menu` (
  `chleby` int(11) NOT NULL,
  `ciasta` int(11) NOT NULL,
  `bułki` int(11) NOT NULL,
  `przekąski` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
