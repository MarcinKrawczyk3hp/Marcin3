-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 26 Kwi 2023, 15:03
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cms`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `filename` varchar(96) NOT NULL,
  `title` text NOT NULL,
  `userId` int(11) NOT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT 0,
  `likes` int(11) NOT NULL,
  `dislikes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`id`, `timestamp`, `filename`, `title`, `userId`, `removed`, `likes`, `dislikes`) VALUES
(30, '2023-03-22 16:13:29', 'img/bae71f335f63894bbacacd1e51299bf72ad5f7ae56e470819d08cb7cd66769bb.webp', '0', 1, 1, 0, 0),
(31, '2023-03-29 13:50:30', 'img/3c1a2580cfc516f8221b9f919f3c0c83d64e11065e251d834806b0e2fbee0468.webp', '0', 1, 1, 0, 0),
(32, '2023-03-29 13:55:54', 'img/1516c256f289ccc9b58da695aacf05d5d16a29a4123b38a14c43bff55a5357a0.webp', '0', 1, 1, 0, 0),
(33, '2023-03-29 13:57:32', 'img/7431356293858882b6b41d430d68d858119f0a5c48059706463802dd1f7ae1cd.webp', '0', 1, 0, 0, 0),
(34, '2023-03-29 13:57:44', 'img/96ca24efb757bf5314a8fa2182ce798e787c1afed240ca1c15100fd03410f087.webp', '0', 1, 0, 0, 0),
(35, '2023-03-29 13:58:38', 'img/bdf8873ff497d06f1852842099dd3ae702e915a4a6c1157f3a6be9a32de2abad.webp', 'HWDP', 1, 0, 0, 0),
(36, '2023-03-29 14:04:32', 'img/7a7e9b8247f44ee853b7f7bff824c658b54b09c4131556affc17c43742f3c6ab.webp', 'Szaweł Dobryczłowiek', 1, 1, 0, 0),
(37, '2023-03-29 14:15:14', 'img/3846f61713eda7cabd4cf05bc1cce41676d532fab618b17f3a3555f00b2cbecc.webp', 'JAN PAT 2', 4, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'jan@kowalski.pl', '$argon2i$v=19$m=65536,t=4,p=1$cG5Oa0JDMUlKM1duZXB2VQ$wXh3ydXQAZQwvGlsObFpyxGbFyvbvv2FK3XiyU5mcJE'),
(2, 'jan@kowalski.pl', '$argon2i$v=19$m=65536,t=4,p=1$U0RYLmpzdjN6QXVhZ0daRQ$XkLd2RFMc6SBc8vu6ixwot0pnV8/JWkeFN7pbpu4k6M'),
(3, 'JanPawel@2137.xn--kremwka-o0a', '$argon2i$v=19$m=65536,t=4,p=1$UGlCWDZacTlPVko4VUNZRg$pnfcwm5U/YLUdcVpXoYgOz0BZTZnIa5wEzMf+FaETf4'),
(4, 'JanPawel@2137.gmd', '$argon2i$v=19$m=65536,t=4,p=1$SXF1Z1VXM2djYXEzZTNubg$TXf84meTIK6uQj20Zkd33puhEmDsSAz0GA9Iq/aEISM'),
(5, 'jan@kowalski.pl', '$argon2i$v=19$m=65536,t=4,p=1$MUZFSUpoZC92bzJMa0ZVQw$XMo7mAZF8Ubi2d5/dv5c5udO20EiTpmfJ65/SVZtn5s'),
(6, '123@123.pl', '$argon2i$v=19$m=65536,t=4,p=1$SlJLMndBLmNGMFZxbDFFMw$ToZhAd9KaC4SfE8yXFVp5r4i6MyEhfLfrSBblt49lxo');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
