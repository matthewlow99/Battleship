-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2022 at 11:05 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `battleship`
--

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `gameID` int(11) NOT NULL,
  `player0` int(11) NOT NULL DEFAULT 0,
  `player1` int(11) NOT NULL DEFAULT 0,
  `currentTurn` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`gameID`, `player0`, `player1`, `currentTurn`) VALUES
(1, 1, 1, 1),
(2, 0, 1, 0),
(3, 1, 0, 0),
(69, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `moves`
--

CREATE TABLE `moves` (
  `id` int(11) NOT NULL,
  `gameID` int(11) NOT NULL,
  `row` int(11) NOT NULL,
  `col` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `result` varchar(16) NOT NULL,
  `shipID` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `moves`
--

INSERT INTO `moves` (`id`, `gameID`, `row`, `col`, `player`, `result`, `shipID`) VALUES
(44, 1, 1, 5, 0, 'Sink', 'ship1'),
(45, 1, 5, 3, 1, 'Miss', NULL),
(46, 1, 5, 6, 1, 'Miss', NULL),
(47, 1, 1, 6, 0, 'Sink', NULL),
(48, 1, 7, 5, 1, 'Miss', NULL),
(49, 1, 1, 5, 0, 'Sink', NULL),
(50, 1, 2, 3, 1, 'Sink', 'ship1'),
(51, 1, 2, 9, 0, 'Sink', 'ship2'),
(52, 1, 4, 6, 1, 'Miss', NULL),
(53, 1, 3, 9, 0, 'Sink', 'ship2'),
(54, 1, 8, 3, 1, 'Sink', 'ship5'),
(55, 1, 4, 9, 0, 'Sink', NULL),
(56, 1, 6, 5, 1, 'Miss', NULL),
(57, 1, 6, 5, 0, 'Miss', NULL),
(58, 1, 6, 9, 1, 'Sink', 'ship4'),
(59, 1, 6, 7, 0, 'Miss', NULL),
(60, 69, 1, 1, 0, 'Miss', NULL),
(61, 69, 2, 4, 1, 'Hit', 'ship3'),
(62, 1, 2, 2, 1, 'Sink', NULL),
(63, 1, 6, 8, 0, 'Miss', NULL),
(64, 1, 8, 4, 1, 'Sink', 'ship5'),
(65, 1, 5, 7, 0, 'Sink', 'ship3'),
(66, 1, 5, 7, 1, 'Miss', NULL),
(67, 1, 6, 4, 0, 'Miss', NULL),
(68, 1, 8, 2, 1, 'Sink', 'ship5'),
(69, 1, 7, 3, 0, 'Miss', NULL),
(70, 1, 8, 5, 1, 'Sink', 'ship5'),
(71, 1, 4, 7, 0, 'Sink', 'ship3'),
(72, 1, 8, 1, 1, 'Sink', 'ship5'),
(73, 1, 6, 3, 0, 'Miss', NULL),
(74, 1, 8, 6, 1, 'Sink', NULL),
(75, 1, 3, 7, 0, 'Sink', NULL),
(76, 1, 7, 9, 1, 'Sink', 'ship4'),
(77, 1, 9, 7, 0, 'Miss', NULL),
(78, 1, 5, 9, 1, 'Sink', 'ship4'),
(79, 1, 3, 3, 0, 'Miss', NULL),
(80, 1, 3, 7, 1, 'Miss', NULL),
(81, 1, 5, 9, 0, 'Miss', NULL),
(82, 1, 8, 9, 1, 'Miss', NULL),
(83, 1, 9, 4, 0, 'Miss', NULL),
(84, 1, 8, 10, 1, 'Miss', NULL),
(85, 1, 8, 5, 0, 'Sink', 'ship5'),
(86, 1, 9, 6, 1, 'Miss', NULL),
(87, 1, 8, 6, 0, 'Sink', 'ship5'),
(88, 1, 10, 6, 1, 'Sink', 'ship3'),
(89, 1, 8, 7, 0, 'Sink', 'ship5'),
(90, 1, 10, 7, 1, 'Sink', 'ship3'),
(91, 1, 8, 8, 0, 'Sink', 'ship5'),
(92, 1, 10, 5, 1, 'Miss', NULL),
(93, 1, 8, 9, 0, 'Miss', NULL),
(94, 1, 10, 8, 1, 'Sink', NULL),
(95, 1, 8, 4, 0, 'Sink', 'ship5'),
(96, 1, 4, 2, 1, 'Hit', 'ship2'),
(97, 1, 8, 3, 0, 'Sink', NULL),
(98, 1, 4, 9, 1, 'Sink', 'ship4'),
(99, 1, 4, 3, 0, 'Miss', NULL),
(100, 1, 3, 9, 1, 'Sink', NULL),
(101, 1, 3, 4, 0, 'Miss', NULL),
(102, 1, 4, 3, 1, 'Hit', 'ship2'),
(103, 1, 10, 8, 0, 'Hit', 'ship4');

-- --------------------------------------------------------

--
-- Table structure for table `ships`
--

CREATE TABLE `ships` (
  `shipID` varchar(16) NOT NULL,
  `row` int(11) NOT NULL,
  `col` int(11) NOT NULL,
  `gameID` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `playerID` int(11) NOT NULL,
  `sunk` int(11) NOT NULL DEFAULT 0 COMMENT '0 - alive; 1 - sunk',
  `hit` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ships`
--

INSERT INTO `ships` (`shipID`, `row`, `col`, `gameID`, `id`, `playerID`, `sunk`, `hit`) VALUES
('ship1', 2, 2, 1, 571, 0, 1, 1),
('ship1', 2, 3, 1, 572, 0, 1, 1),
('ship2', 4, 2, 1, 573, 0, 0, 1),
('ship2', 4, 3, 1, 574, 0, 0, 1),
('ship2', 4, 4, 1, 575, 0, 0, 0),
('ship4', 3, 9, 1, 576, 0, 1, 1),
('ship4', 4, 9, 1, 577, 0, 1, 1),
('ship4', 5, 9, 1, 578, 0, 1, 1),
('ship4', 6, 9, 1, 579, 0, 1, 1),
('ship4', 7, 9, 1, 580, 0, 1, 1),
('ship5', 8, 1, 1, 581, 0, 1, 1),
('ship5', 8, 2, 1, 582, 0, 1, 1),
('ship5', 8, 3, 1, 583, 0, 1, 1),
('ship5', 8, 4, 1, 584, 0, 1, 1),
('ship5', 8, 5, 1, 585, 0, 1, 1),
('ship5', 8, 6, 1, 586, 0, 1, 1),
('ship3', 10, 6, 1, 587, 0, 1, 1),
('ship3', 10, 7, 1, 588, 0, 1, 1),
('ship3', 10, 8, 1, 589, 0, 1, 1),
('ship1', 1, 5, 1, 590, 1, 1, 1),
('ship1', 1, 6, 1, 591, 1, 1, 1),
('ship2', 2, 9, 1, 592, 1, 1, 1),
('ship2', 3, 9, 1, 593, 1, 1, 1),
('ship2', 4, 9, 1, 594, 1, 1, 1),
('ship3', 3, 7, 1, 595, 1, 1, 1),
('ship3', 4, 7, 1, 596, 1, 1, 1),
('ship3', 5, 7, 1, 597, 1, 1, 1),
('ship5', 8, 3, 1, 598, 1, 1, 1),
('ship5', 8, 4, 1, 599, 1, 1, 1),
('ship5', 8, 5, 1, 600, 1, 1, 1),
('ship5', 8, 6, 1, 601, 1, 1, 1),
('ship5', 8, 7, 1, 602, 1, 1, 1),
('ship5', 8, 8, 1, 603, 1, 1, 1),
('ship4', 10, 5, 1, 604, 1, 0, 0),
('ship4', 10, 6, 1, 605, 1, 0, 0),
('ship4', 10, 7, 1, 606, 1, 0, 0),
('ship4', 10, 8, 1, 607, 1, 0, 1),
('ship4', 10, 9, 1, 608, 1, 0, 0),
('ship1', 2, 2, 69, 609, 1, 0, 0),
('ship1', 2, 3, 69, 610, 1, 0, 0),
('ship3', 2, 8, 69, 611, 1, 1, 0),
('ship3', 3, 8, 69, 612, 1, 1, 0),
('ship3', 4, 8, 69, 613, 1, 1, 0),
('ship2', 5, 5, 69, 614, 1, 0, 0),
('ship2', 6, 5, 69, 615, 1, 0, 0),
('ship2', 7, 5, 69, 616, 1, 0, 0),
('ship5', 9, 4, 69, 617, 1, 1, 0),
('ship5', 9, 5, 69, 618, 1, 1, 0),
('ship5', 9, 6, 69, 619, 1, 1, 0),
('ship5', 9, 7, 69, 620, 1, 1, 0),
('ship5', 9, 8, 69, 621, 1, 1, 0),
('ship5', 9, 9, 69, 622, 1, 1, 0),
('ship4', 5, 1, 69, 623, 1, 0, 0),
('ship4', 6, 1, 69, 624, 1, 0, 0),
('ship4', 7, 1, 69, 625, 1, 0, 0),
('ship4', 8, 1, 69, 626, 1, 0, 0),
('ship4', 9, 1, 69, 627, 1, 0, 0),
('ship5', 4, 3, 69, 628, 0, 1, 0),
('ship5', 4, 4, 69, 629, 0, 1, 0),
('ship5', 4, 5, 69, 630, 0, 1, 0),
('ship5', 4, 6, 69, 631, 0, 1, 0),
('ship5', 4, 7, 69, 632, 0, 1, 0),
('ship5', 4, 8, 69, 633, 0, 1, 0),
('ship1', 8, 2, 69, 634, 0, 1, 0),
('ship1', 9, 2, 69, 635, 0, 1, 0),
('ship2', 7, 8, 69, 636, 0, 0, 0),
('ship2', 8, 8, 69, 637, 0, 0, 0),
('ship2', 9, 8, 69, 638, 0, 0, 0),
('ship3', 2, 4, 69, 639, 0, 1, 1),
('ship3', 2, 5, 69, 640, 0, 1, 0),
('ship3', 2, 6, 69, 641, 0, 1, 0),
('ship4', 6, 5, 69, 642, 0, 1, 0),
('ship4', 7, 5, 69, 643, 0, 1, 0),
('ship4', 8, 5, 69, 644, 0, 1, 0),
('ship4', 9, 5, 69, 645, 0, 1, 0),
('ship4', 10, 5, 69, 646, 0, 1, 0),
('ship1', 2, 2, 2, 647, 1, 0, 0),
('ship1', 2, 3, 2, 648, 1, 0, 0),
('ship4', 2, 9, 2, 649, 1, 0, 0),
('ship4', 3, 9, 2, 650, 1, 0, 0),
('ship4', 4, 9, 2, 651, 1, 0, 0),
('ship4', 5, 9, 2, 652, 1, 0, 0),
('ship4', 6, 9, 2, 653, 1, 0, 0),
('ship5', 3, 5, 2, 654, 1, 1, 0),
('ship5', 4, 5, 2, 655, 1, 1, 0),
('ship5', 5, 5, 2, 656, 1, 1, 0),
('ship5', 6, 5, 2, 657, 1, 1, 0),
('ship5', 7, 5, 2, 658, 1, 1, 0),
('ship5', 8, 5, 2, 659, 1, 1, 0),
('ship3', 9, 8, 2, 660, 1, 1, 0),
('ship3', 9, 9, 2, 661, 1, 1, 0),
('ship3', 9, 10, 2, 662, 1, 1, 0),
('ship2', 10, 2, 2, 663, 1, 0, 0),
('ship2', 10, 3, 2, 664, 1, 0, 0),
('ship2', 10, 4, 2, 665, 1, 0, 0),
('ship1', 2, 3, 3, 666, 0, 0, 0),
('ship1', 2, 4, 3, 667, 0, 0, 0),
('ship3', 4, 9, 3, 668, 0, 0, 0),
('ship3', 5, 9, 3, 669, 0, 0, 0),
('ship3', 6, 9, 3, 670, 0, 0, 0),
('ship4', 8, 5, 3, 671, 0, 0, 0),
('ship4', 8, 6, 3, 672, 0, 0, 0),
('ship4', 8, 7, 3, 673, 0, 0, 0),
('ship4', 8, 8, 3, 674, 0, 0, 0),
('ship4', 8, 9, 3, 675, 0, 0, 0),
('ship2', 5, 1, 3, 676, 0, 0, 0),
('ship2', 5, 2, 3, 677, 0, 0, 0),
('ship2', 5, 3, 3, 678, 0, 0, 0),
('ship5', 10, 5, 3, 679, 0, 0, 0),
('ship5', 10, 6, 3, 680, 0, 0, 0),
('ship5', 10, 7, 3, 681, 0, 0, 0),
('ship5', 10, 8, 3, 682, 0, 0, 0),
('ship5', 10, 9, 3, 683, 0, 0, 0),
('ship5', 10, 10, 3, 684, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`gameID`);

--
-- Indexes for table `moves`
--
ALTER TABLE `moves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ships`
--
ALTER TABLE `ships`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `gameID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `moves`
--
ALTER TABLE `moves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `ships`
--
ALTER TABLE `ships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=685;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
