-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2020 at 08:41 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itp225mod6`
--
CREATE DATABASE IF NOT EXISTS `ajoskowitp225mod8` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ajoskowitp225mod8`;

-- --------------------------------------------------------

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`(
    `eventID` int(11) NOT NULL AUTO_INCREMENT,
    `eventName` varchar(40) NOT NULL,
    `description` varchar(40) NOT NULL,
    `eventTime` datetime NOT NULL,
    `eventLocation` varchar(40) NOT NULL,
    `memberFee` decimal (6,2) NOT NULL,
    `nonMemberFee` decimal (6,2) NOT NULL,
    PRIMARY KEY (eventID)
);

INSERT INTO `events` (`eventName`, `description`,`eventTime`, `eventLocation`, `memberFee`, `nonMemberFee`) VALUES

('Winter Afternoon','Lee Hip discusses arboretum history', '2020-05-19 14:30', 'Community Arboretum at VWCC', 19.95, 23.95),
('Kokedama Plant-It-Night','Build your own kokedama planter', '2020-05-12 12:30', 'Arboretum Grounds', 30.00, 40.00),
('Speakers Night','Guest speaker TBA' ,'2020-06-19 19:30', 'College Theatre', 6.00, 10.00); 


--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `custID` int(11) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `membership` varchar(20) NOT NUll    
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`custID`, `lastName`, `firstName`, `email`, `address`, `city`, `state`, `zip`, `phone`, `membership`) VALUES
(1, 'Doe', 'John', 'johndoe@gmail.com', '101 Nomans Land', 'Roanoke', 'VA', '24018', '123456789', 'None'),
(7, 'Mouse', 'Mickey', '', 'Disney Land', 'Orlando', 'Florida', '32830', '111-111-1111', 'Individual'),
(8, 'Jones', 'Jennifer', '', '24 Main Street', 'Birmingham', 'Alabama', '61234', '5403972000','Patron' );

-- --------------------------------------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `employeeID` int(11) NOT NULL AUTO_INCREMENT,
  `lastName` varchar(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `membership` varchar(20) NOT NUll,
  `eventID` int(11),
   PRIMARY KEY (employeeID),
   FOREIGN KEY (eventID) REFERENCES `events` (eventID)
   
);

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`lastName`, `firstName`, `email`, `address`, `city`, `state`, `zip`, `phone`, `membership`,`eventID`) VALUES
('Thompson', 'George', 'frankt@gmail.com', '103 Pine Street', 'Roanoke', 'VA', '24018', '123-456-7892', 'None', 1),
('Schmidt', 'Joe', '', 'Disney Land', 'Orlando', 'Florida', '32830', '111-111-1111', 'None', 2),
('Smith', 'Jennifer', '', '24 Main Street', 'Birmingham', 'Alabama', '61234', '540-397-2000','Individual', 3 );


DROP TABLE IF EXISTS `volunteers`;
CREATE TABLE `volunteers` (
  `volunteerID` int(11) NOT NULL AUTO_INCREMENT,
  `lastName` varchar(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `membership` varchar(20) NOT NUll,
  `job` varchar (40) NOT NULL,
  `eventID` int(11),
   PRIMARY KEY (volunteerID),
   FOREIGN KEY (eventID) REFERENCES `events` (eventID)
   
);

--
-- Dumping data for table `volunteers`
--

INSERT INTO `volunteers` (`lastName`, `firstName`, `email`, `address`, `city`, `state`, `zip`, `phone`, `membership`,`job`,`eventID`) VALUES
('Baez', 'Joan', 'joanb@gmail.com', '101 Your Land', 'Roanoke', 'Virginia', '24018', '540-456-7892', 'None', 'Speaker', 1),
('Cocker', 'Joe', '', 'The Palladium', 'New York', 'New York', '10001', '212-111-1111', 'Benefactor','Tour Guide', 2),
('Cronkite', 'Walter', '', '24 Hollywood Blvd', 'Los Angeles', 'California', '90210', '213-435-2000','Individual', 'Newsletter', 1),
('Thompson', 'Frank','', '78 E Vermont Street', 'Roanoke', 'Virginia','24001', '540-555-9875', 'Patron', 'Project Helper', 3);

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `plantID` int(11) NOT NULL,
  `numInStock` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`plantID`, `numInStock`, `price`, `size`) VALUES
(1, 11, '2.00', 2),
(2, 48, '4.00', 4),
(3, 15, '5.00', 3),
(5, 15, '2.50', 2),
(6, 13, '3.00', 1),
(7, 10, '4.50', 3),
(8, 15, '6.00', 2),
(9, 20, '5.00', 1),
(10, 24, '5.25', 4),
(11, 35, '3.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `custID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--



-- --------------------------------------------------------



--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `orderID` int(11) NOT NULL,
  `plantID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `priceEach` decimal(4,2) NOT NULL,
  `orderLineNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--



-- --------------------------------------------------------

--
-- Table structure for table `plants`
--

DROP TABLE IF EXISTS `plants`;
CREATE TABLE `plants` (
  `plantID` int(11) NOT NULL,
  `botanicalName` varchar(30) NOT NULL,
  `commonName` varchar(30) NOT NULL,
  `heightMinInches` decimal(4,2) DEFAULT NULL,
  `heightMaxInches` decimal(4,2) DEFAULT NULL,
  `spreadInches` decimal(4,2) DEFAULT NULL,
  `zones` varchar(20) DEFAULT NULL,
  `seasonalInterest` varchar(255) DEFAULT NULL,
  `pestProblems` varchar(255) DEFAULT NULL,
  `culture` varchar(100) DEFAULT NULL,
  `propagation` varchar(100) DEFAULT NULL,
  `uses` varchar(100) DEFAULT NULL,
  `pronunciation` varchar(100) DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `family` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `image` varchar(20) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `vendor` varchar(100) DEFAULT NULL,
  `edible` varchar(20) DEFAULT NULL,
  `container` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plants`
--

INSERT INTO `plants` (`plantID`, `botanicalName`, `commonName`, `heightMinInches`, `heightMaxInches`, `spreadInches`, `zones`, `seasonalInterest`, `pestProblems`, `culture`, `propagation`, `uses`, `pronunciation`, `origin`, `family`, `type`, `image`, `color`, `source`, `vendor`, `edible`, `container`) VALUES
(1, 'Achillea Summer Pastel Mix', 'Yarrow', NULL, NULL, NULL, '5-7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Perennial', NULL, 'pink, rose, orange-red, purple, gray, salmon', 'In-House', NULL, 'No', 'No'),
(2, 'Alcea sp.', 'Hollyhock', '10.00', '12.00', '20.00', '6-8', 'Summer', 'None', 'Wet soil', 'Cuttings', 'Hedges', 'HolleeHock', 'Europe', 'Hollecus', 'Perennial', '', 'yellow, copper, pink, red, white', 'In-House', NULL, 'No', 'No'),
(3, 'Dianthus  x Sweet Memory', 'Grass Pink', '9.00', '18.00', '12.00', '4-6', 'Summer - White Flower with pink eye', 'Leaf spot in humid weather', 'Well-drained (some lime) sun prune after flowering Winter mulch eergreen branches', 'Cuttings in summer  Seed', 'Rock gardens Borders Edging', 'dye-AN-thus', 'Eastern Asia', 'Carynophyllacea', '', NULL, '', 'In-House', NULL, 'No', 'No'),
(5, 'Festuca ovina glauca  Elijah B', 'Blue Fescue', '6.00', '8.00', '1.00', '6-8', 'Spring - blue foliage best  Summer - straw colored flower  Cool season', 'None serious', 'Well-drained  moist soil  cut back in fall  Divide every 2 to 3 years  Full sun to part shade', 'Division  Seed', 'Edging  mass Groundcover Pots  tubs Specimen Salt Tolerant', 'fess-TOO-kah', 'Europe', 'Gramineae', '', NULL, '', 'In-House', NULL, 'No', 'No'),
(6, 'Festuca valesiaca  Glaucantha ', 'Wallis Fescue', '4.00', '6.00', '6.00', '5-7', 'Weeping  powdery blue foliage  evergreen Bluish-white to wheat colored flowers', 'None serious', 'Well-drained  rocky soil  Full sun  not in hot  inland climates', 'Division', 'Accent  Rock garden  Borders  Edging', 'fess-TOO-kah', 'Central Europe', 'Gramineae', 'Perennial', NULL, 'white', 'In-House', NULL, 'No', 'No'),
(7, 'Geranium x  Johnson s Blue ', 'Cranesbill', '16.00', '18.00', '18.00', '6-8', 'Summer to early fall-blue flower', 'None serious', 'Well-drained  moist  humus-rich soil  Full sun to part shade', 'Division every 2 to 3 years', 'Front or middle of border', 'jer-ANE-ee-um', 'Hybrid', 'Geraniaceae', '', NULL, '', 'In-House', NULL, 'No', 'No'),
(8, 'Geranium endressii', 'Pyrenean Cranesbill', '12.00', '18.00', '24.00', '5-7', 'Summer-white Flower', 'Japanese Beetle', 'Well-drained soil  Sun to part shade  Intolerant of extreme heat', 'Cuttings  Division  Seed', 'Borders  Rock gardens', 'jer-ANE-ee-um', 'Pyrenees', 'Geraniaceae', 'Perennial', '', 'white', 'In-House', '', 'No', 'Yes'),
(9, 'Geranium macrorrhizum  Ingwers', 'Bigroot CranesbillEdit', '15.00', '18.00', '24.00', '5-7', 'Late sprint to early summer rose-pink flowers  Glossy foliage', 'None serious', 'Well-drained  moist  humus-rich soil Sun to part shade  Drought-tolerant', 'Division  Seed', 'Rock Gardens  Beds  Borders', 'jer-ANE-ee-um', 'Southern Europe', 'Geraniaceae', '', '', 'Red', 'Purchased', 'Flowers r Us', 'No', 'Yes'),
(10, 'newPlantEdit', 'NewPlantCommon Edit', '7.00', '12.00', '20.00', '6-8', 'SummerEdit', 'NoneEdit', 'WetEdit', 'SeedsEdit', 'Rock GardensEdit', 'new_plantEdit', 'EuropeEdit', 'newPlanteiusEdit', 'AnnualEdit', 'noneEdit', 'BlueEdit', 'In-House', NULL, 'No', 'No'),
(11, 'Solanum lycopersicum var. cera', 'Cherry Tomato', '10.00', '15.00', '15.00', '3-4', 'Summer', 'None', 'Indoor Sow', 'Seed', 'Salad', 'CherryTomatoe', 'South America', 'cerasiforme', 'Annual', '', 'Red', 'Purchased', 'Burpee', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `saleID` int(11) NOT NULL,
  `saleName` varchar(30) NOT NULL,
  `memberStartDate` datetime NOT NULL,
  `memberEndDate` datetime NOT NULL,
  `publicStartDate` datetime NOT NULL,
  `publicEndDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`saleID`, `saleName`, `memberStartDate`, `memberEndDate`, `publicStartDate`, `publicEndDate`) VALUES
(1, 'sale1', '2019-04-01 00:00:00', '2019-04-02 00:00:00', '2019-04-02 00:00:00', '2019-04-03 00:00:00'),
(3, 'Summer Sale', '2019-07-05 00:00:00', '2019-07-06 00:00:00', '2019-07-07 00:00:00', '2019-07-08 00:00:00'),
(5, 'Tomato Sale', '2019-04-26 00:00:00', '2019-04-27 00:00:00', '2019-04-28 00:00:00', '2019-04-29 00:00:00'),
(6, 'Fall Sale', '2019-10-15 00:00:00', '2019-10-16 00:00:00', '2019-10-17 00:00:00', '2019-10-18 00:00:00'),
(7, 'Mid-Summer Sale', '2019-06-13 00:00:00', '2019-06-14 00:00:00', '2019-06-15 00:00:00', '2019-06-17 00:00:00');

-- --------------------------------------------------------


DROP TABLE IF EXISTS `memberships`;
CREATE TABLE `memberships` (
    `memberID` int(11) NOT NULL,
    `memberLevel` varchar(25) NOT NULL
);

INSERT INTO `memberships` (`memberID`,`memberLevel`) VALUES
(1, 'None'),
(2, 'Individual'),
(3, 'Family/Duel'),
(4, 'Sponsor'),
(5, 'Patron'),
(6, 'Benefactor');

DROP TABLE IF EXISTS `volunteerJobs`;
CREATE TABLE `volunteerJobs` (
    `jobID` int(11) NOT NULL,
    `job` varchar(30) NOT NULL
);

INSERT INTO `volunteerJobs`(`jobID`, `job`) VALUES
(1, 'Tour Guide'),
(2, 'Speaker'),
(3, 'Event Helper'),
(4, 'Newsletter'),
(5, 'Plant Curator'),
(6, 'Garden Helper'),
(7, 'Project Helper');





--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `stateID` int(11) NOT NULL,
  `stateName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`stateID`, `stateName`) VALUES
(1, 'Alabama'),
(2, 'Alaska'),
(3, 'Arizona'),
(4, 'Arkansas'),
(5, 'California'),
(6, 'Colorado'),
(7, 'Connecticut'),
(8, 'Delaware'),
(9, 'Florida'),
(10, 'Georgia'),
(11, 'Hawaii'),
(12, 'Idaho'),
(13, 'Illinois'),
(14, 'Indiana'),
(15, 'Iowa'),
(16, 'Kansas'),
(17, 'Kentucky'),
(18, 'Louisiana'),
(19, 'Maine'),
(20, 'Maryland'),
(21, 'Massachusetts'),
(22, 'Michigan'),
(23, 'Minnesoda'),
(24, 'Mississippi'),
(25, 'Missouri'),
(26, 'Montana'),
(27, 'Nebraska'),
(28, 'Nevada'),
(29, 'New Hampshire'),
(30, 'New Jersey'),
(31, 'New Mexico'),
(32, 'New York'),
(33, 'North Carolina'),
(34, 'North Dakota'),
(35, 'Ohio'),
(36, 'Oklahoma'),
(37, 'Oregon'),
(38, 'Pennsylvania'),
(39, 'Rhode Island'),
(40, 'South Carolina'),
(41, 'South Dakota'),
(42, 'Tennessee'),
(43, 'Texas'),
(44, 'Utah'),
(45, 'Vermont'),
(46, 'Virginia'),
(47, 'Washington'),
(48, 'West Virginia'),
(49, 'Wisconsin'),
(50, 'Wyoming');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`custID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`plantID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `custID` (`custID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`orderID`,`orderLineNumber`),
  ADD KEY `plantID` (`plantID`);

--
-- Indexes for table `plants`
--
ALTER TABLE `plants`
  ADD PRIMARY KEY (`plantID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`saleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `custID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `plants`
--
ALTER TABLE `plants`
  MODIFY `plantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `saleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`plantID`) REFERENCES `plants` (`plantID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`custID`) REFERENCES `customers` (`custID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`plantID`) REFERENCES `plants` (`plantID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;


GRANT SELECT, INSERT, UPDATE, DELETE
ON *
TO ajoskow@localhost
IDENTIFIED BY 'baseball';


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
