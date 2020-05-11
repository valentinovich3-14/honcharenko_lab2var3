-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 30 2020 г., 14:17
-- Версия сервера: 10.4.10-MariaDB
-- Версия PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab1var4`
--

-- --------------------------------------------------------

--
-- Структура таблицы `actor`
--

CREATE TABLE `actor` (
  `ACTOR_ID` int(11) NOT NULL,
  `ACTOR_NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `actor`
--

INSERT INTO `actor` (`ACTOR_ID`, `ACTOR_NAME`) VALUES
(1, 'Brad_Pitt'),
(2, 'Jake_Gyllenhaal'),
(3, 'Leonard_DiCaprio'),
(4, 'Angelina_Jolie'),
(5, 'Miley_Cyrus');

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `FILM_ID` int(11) NOT NULL,
  `FILM_NAME` varchar(50) DEFAULT NULL,
  `FILM_DATE` date DEFAULT NULL,
  `FILM_COUNTRY` varchar(50) DEFAULT NULL,
  `FILM_QUALITY` varchar(50) DEFAULT NULL,
  `FILM_RESOLUTION` int(11) DEFAULT NULL,
  `FILM_CODEC` varchar(50) DEFAULT NULL,
  `FILM_PRODUCER` varchar(50) DEFAULT NULL,
  `FILM_DIRECTOR` varchar(50) DEFAULT NULL,
  `FILM_CARRIER` enum('VIDEO','CD','DVD','BR') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `film`
--

INSERT INTO `film` (`FILM_ID`, `FILM_NAME`, `FILM_DATE`, `FILM_COUNTRY`, `FILM_QUALITY`, `FILM_RESOLUTION`, `FILM_CODEC`, `FILM_PRODUCER`, `FILM_DIRECTOR`, `FILM_CARRIER`) VALUES
(1, 'Fight_Club', '0000-00-00', 'USA', 'HD', 1080, 'XDCodec', 'Pitt', 'Palanick', 'DVD'),
(2, 'Family_Smith', '0000-00-00', 'USA', 'Rip', 720, 'BCodec', 'Smith', 'Pitt', 'VIDEO');

-- --------------------------------------------------------

--
-- Структура таблицы `film_actor`
--

CREATE TABLE `film_actor` (
  `FILM_FID` int(11) NOT NULL,
  `ACTOR_FID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `film_actor`
--

INSERT INTO `film_actor` (`FILM_FID`, `ACTOR_FID`) VALUES
(1, 1),
(2, 1),
(2, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `film_genre`
--

CREATE TABLE `film_genre` (
  `FID_FILM` int(11) NOT NULL,
  `FID_GENRE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `film_genre`
--

INSERT INTO `film_genre` (`FID_FILM`, `FID_GENRE`) VALUES
(1, 3),
(2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `GENRE_ID` int(11) NOT NULL,
  `GENRE_TITLE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`GENRE_ID`, `GENRE_TITLE`) VALUES
(1, 'Horror'),
(2, 'Comedy'),
(3, 'Drama'),
(4, 'Detective');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`ACTOR_ID`);

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`FILM_ID`);

--
-- Индексы таблицы `film_actor`
--
ALTER TABLE `film_actor`
  ADD PRIMARY KEY (`FILM_FID`,`ACTOR_FID`),
  ADD KEY `ACTOR_FID` (`ACTOR_FID`);

--
-- Индексы таблицы `film_genre`
--
ALTER TABLE `film_genre`
  ADD PRIMARY KEY (`FID_FILM`,`FID_GENRE`),
  ADD KEY `FID_GENRE` (`FID_GENRE`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`GENRE_ID`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `film_actor`
--
ALTER TABLE `film_actor`
  ADD CONSTRAINT `film_actor_ibfk_1` FOREIGN KEY (`FILM_FID`) REFERENCES `film` (`FILM_ID`),
  ADD CONSTRAINT `film_actor_ibfk_2` FOREIGN KEY (`ACTOR_FID`) REFERENCES `actor` (`ACTOR_ID`);

--
-- Ограничения внешнего ключа таблицы `film_genre`
--
ALTER TABLE `film_genre`
  ADD CONSTRAINT `film_genre_ibfk_1` FOREIGN KEY (`FID_FILM`) REFERENCES `film` (`FILM_ID`),
  ADD CONSTRAINT `film_genre_ibfk_2` FOREIGN KEY (`FID_GENRE`) REFERENCES `genre` (`GENRE_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
