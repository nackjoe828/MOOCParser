-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2014 at 07:00 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sjsucsor_160s5g12014s`
--

-- --------------------------------------------------------

--
-- Table structure for table `coursedetails`
--

CREATE TABLE IF NOT EXISTS `coursedetails` (
  `id` int(4) NOT NULL,
  `profname` varchar(30) NOT NULL,
  `profimage` text NOT NULL,
  `course_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coursedetails`
--

INSERT INTO `coursedetails` (`id`, `profname`, `profimage`, `course_id`) VALUES
(0, 'Prof. Oliver Szasz', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1021269/thumb_270_prof.oliver_szasz.jpg', 65),
(1, 'Prof. Juergen Faust', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1084300/thumb_270_Juergen_Faust_iversity.jpg', 65),
(2, 'Prof. Tanja Schmitt-Fumian', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1037752/thumb_270_Prof_Tanja-Schmitt-Fumian_auf_MHMK-Cube_1_.jpg', 65),
(3, 'Silvio Barta', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1040065/thumb_270_5K0K4422-2.jpg', 65),
(4, 'Astrid Thomaser', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1035871/thumb_270_a_thomaser_3.jpg', 65),
(5, 'Dipl. Des. Thomas Stegmann', 'https://d1wshrh2fwv7ib.cloudfront.net/users/694644/thumb_270_tomBW.jpg', 65),
(6, 'Oliver T. Hellriegel', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1040071/thumb_270_20081114-OLIVER_HELLRIEGEL2778_SMALL.jpg', 65),
(7, 'Gary York', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1040089/thumb_270_pic1.png', 65),
(8, 'Bret Sheridan', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1040095/thumb_270_bret-sheridan.jpg', 65),
(9, 'Johann Knott', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1040092/thumb_270_johann_knott.jpg', 65),
(10, 'Prof. Lars Grau', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1040101/thumb_270_Lars_grau.jpg', 65),
(11, 'Prof. Egbert van Wyngaarden', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1039909/thumb_270_JW8A8641_grey.jpg', 65),
(12, 'Paul Neevoort', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1040113/thumb_270_paul_neervoort.jpg', 65),
(13, 'Prof. Dr. Alyosh Agarwal', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1040104/thumb_270_Prof_Dr_Agarwal_Photo.jpg', 65),
(14, 'Prof. Dr. Barbara Stelzner', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1034728/thumb_270_JW8A9709BW.jpg', 65),
(15, '-Prof. Dr.-Ing. Martin Meywerk', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5466/thumb_270_Meywerk_05.jpg', 66),
(16, 'Prof. Dr. Jan Wouters', 'https://d1wshrh2fwv7ib.cloudfront.net/users/142/thumb_270_Foto_Prof_Wouters.jpg', 67),
(17, 'Prof. Dr. Anna Triandafyllidou', 'https://d1wshrh2fwv7ib.cloudfront.net/users/143/thumb_270_Anna_Triandafyllidou.jpg', 67),
(18, 'Prof. Marise Cremona', 'https://d1wshrh2fwv7ib.cloudfront.net/users/144/thumb_270_cremona.jpg', 67),
(19, 'Prof. Dr. Christoph Herrmann', 'https://d1wshrh2fwv7ib.cloudfront.net/users/141/thumb_270_Foto_Prof_Herrmann.jpg', 67),
(20, 'Dr. Joris Larik', 'https://d1wshrh2fwv7ib.cloudfront.net/users/2584/thumb_270_Foto_Joris_Conference.jpg', 67),
(21, 'Prof. Dr.-Ing. Georg Fries', 'https://d1wshrh2fwv7ib.cloudfront.net/users/870/thumb_270_schorsch.jpg', 68),
(22, 'Prof. Dr. Peter Dannenmann', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1099/thumb_270_Dannemann.jpg', 68),
(23, 'Prof. Dr. Karin Graeslund', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5815/thumb_270_cd_2625.jpg', 68),
(24, 'Prof. Dr.-Ing. Patrick Metzler', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1724/thumb_270_Metzeler2.jpg', 68),
(25, 'Prof. Dr. Michael Schmidt', 'https://d1wshrh2fwv7ib.cloudfront.net/users/7809/thumb_270_M.Schmidt_-_komprimiert.JPG', 68),
(26, 'Prof. Dr. Andreas Zinnen', 'https://d1wshrh2fwv7ib.cloudfront.net/users/27818/thumb_270_mooc.jpg', 68),
(27, 'Dipl.-Päd. Robert Hörhammer', 'https://d1wshrh2fwv7ib.cloudfront.net/users/964/thumb_270_Robert_Hoerhammer.jpg', 68),
(28, 'Production Team', 'https://d1wshrh2fwv7ib.cloudfront.net/users/808812/thumb_270_PTeam_270_color.jpg', 68),
(29, 'Dr. Frank Hoffmann', 'https://d1wshrh2fwv7ib.cloudfront.net/users/138/thumb_270_Hoffmann.jpg', 69),
(30, 'Dipl.-Chem. Michael Sartor', 'https://d1wshrh2fwv7ib.cloudfront.net/users/139/thumb_270_sartor.jpg', 69),
(31, 'Prof. Dr. Michael Fröba', 'https://d1wshrh2fwv7ib.cloudfront.net/users/140/thumb_270_froeba.jpg', 69),
(32, 'Victor Manrique', 'https://d1wshrh2fwv7ib.cloudfront.net/users/357380/thumb_270_victor.jpg', 70),
(33, 'Isidro Rodrigo', 'https://d1wshrh2fwv7ib.cloudfront.net/users/410126/thumb_270_Foto.jpg', 70),
(34, 'Dr. Oscar Garcia-Panella', 'https://d1wshrh2fwv7ib.cloudfront.net/users/783999/thumb_270_true_friends.jpg', 70),
(35, 'emiliano labrador', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1059892/thumb_270_cerca_pq.jpg', 70),
(36, 'Montecarlo -', 'https://d1wshrh2fwv7ib.cloudfront.net/users/457190/thumb_270_Montecarlo.jpg', 70),
(37, 'Andrzej Marczewski', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1059190/thumb_270_186197_582507618_481772499_n.jpg', 70),
(38, 'Dr. Flavio Escribano', 'https://d1wshrh2fwv7ib.cloudfront.net/users/804972/thumb_270_392289_10150486448823701_577346158_n.jpg', 70),
(39, 'Cristina Pagés', 'https://d1wshrh2fwv7ib.cloudfront.net/users/801807/thumb_270_cristina_pages.jpg', 70),
(40, 'Yannick Sampedro', 'https://d1wshrh2fwv7ib.cloudfront.net/users/694317/thumb_270_test3.jpg', 70),
(41, 'at. habil. Susanne Illenberger', 'https://d1wshrh2fwv7ib.cloudfront.net/users/147/thumb_270_illenberger.jpg', 71),
(42, 'Professor Sebastian Springer', 'https://d1wshrh2fwv7ib.cloudfront.net/users/781293/thumb_270_9c96052bdb4cbaa47b_l_9db7b.jpg', 71),
(43, 'Dr. rer. nat. Nicole Kühl', 'https://d1wshrh2fwv7ib.cloudfront.net/users/718035/thumb_270_DE_Kontakt__ber_InCelligence_NK.jpg', 71),
(44, 'Romy Kraemer', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5911/thumb_270_TheDOSchool_TEAM_Romy_Kraemer_240.jpg', 72),
(45, 'Florian Hoffmann', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5904/thumb_270_TheDOSchool_Florian_Hoffmann.jpg', 72),
(46, 'Katherin Kirschenmann', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5906/thumb_270_TheDOSchool_Katherin_Kirschenmann.jpg', 72),
(47, 'Dr. Mei Wang', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5979/thumb_270_TheDOSchool_TEAM_Mei_Wang_240.jpg', 72),
(48, 'Rouven Steinfeld', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5981/thumb_270_TheDOSchool_TEAM_Rouven_Ramon_Steinfeld_240.jpg', 72),
(49, '-Prof. Dr.-Ing. Martin Meywerk', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5466/thumb_270_Meywerk_05.jpg', 73),
(50, '-Prof. Dr.-Ing. Martin Meywerk', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5466/thumb_270_Meywerk_05.jpg', 74),
(51, 'Prof. Dr. Alberto Suárez', 'https://d1wshrh2fwv7ib.cloudfront.net/users/124/thumb_270_Suarez737.jpg', 75),
(52, 'Prof. Paolo Salucci', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5752/thumb_270_Paolo_Salucci.JPG', 76),
(53, 'of. Dr. Klaus Quibeldey-Cirkel', 'https://d1wshrh2fwv7ib.cloudfront.net/users/167/thumb_270_KQC.png', 77),
(54, 'Christoph Thelen', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1877/thumb_270_Thelen.png', 77),
(55, 'Paul-Christian Volkmer', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5151/thumb_270_Image-0001.png', 77),
(56, 'Andreas Gärtner', 'https://d1wshrh2fwv7ib.cloudfront.net/users/2153/thumb_270_iversity-profilbild.jpg', 77),
(57, 'Daniel Gerhardt', 'https://d1wshrh2fwv7ib.cloudfront.net/users/2152/thumb_270_Portrait_DG_gray.png', 77),
(58, 'Shumkov PhD  Illac Angelo Diaz', 'https://d1wshrh2fwv7ib.cloudfront.net/users/2389/thumb_270_Ivan-Shumkov_s.jpg', 78),
(59, 'e Institute for Global Justice', 'https://d1wshrh2fwv7ib.cloudfront.net/users/9029/thumb_270_Anja_Mihr_Highres.jpg', 79),
(60, 'Stefano Mirti', 'https://d1wshrh2fwv7ib.cloudfront.net/users/148/thumb_270_Stefano.jpg', 80),
(61, 'Anne-Sophie Gauvin', 'https://d1wshrh2fwv7ib.cloudfront.net/users/186/thumb_270_Anne-Sophie.jpg', 80),
(62, 'Giulia San Gregorio', 'https://d1wshrh2fwv7ib.cloudfront.net/users/2425/thumb_270_273550_506105731_1644234_n.jpg', 80),
(63, 'Dott. Lucia Giuliano', 'https://d1wshrh2fwv7ib.cloudfront.net/users/150/thumb_270_Lucia.jpg', 80),
(64, 'Prof. Giovanni Pasca Raymondi', 'https://d1wshrh2fwv7ib.cloudfront.net/users/149/thumb_270_Giovanni.jpg', 80),
(65, 'Prof. Ivan R. Shumkov PhD', 'https://d1wshrh2fwv7ib.cloudfront.net/users/2389/thumb_270_Ivan-Shumkov_s.jpg', 81),
(66, 'Prof. Dr. Furio Cerutti', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5751/thumb_270_IMG_1717.JPG', 82),
(67, 'Christina Maria Schollerer', 'https://d1wshrh2fwv7ib.cloudfront.net/users/123/thumb_270_ChrisSchollerer.jpg', 83),
(68, 'Prof. Winfried Gerling', 'https://d1wshrh2fwv7ib.cloudfront.net/users/121/thumb_270_WinfriedGerlon.jpg', 83),
(69, 'Prof. Constanze Langer', 'https://d1wshrh2fwv7ib.cloudfront.net/users/122/thumb_270_ConstanzeLanger.jpg', 83),
(70, 'Julian van Dieken', 'https://d1wshrh2fwv7ib.cloudfront.net/users/120/thumb_270_Julian_van_Dieken_-_Vimeo_300x300.jpg', 83),
(71, 'Prof. Dr. Oliver Vornberger', 'https://d1wshrh2fwv7ib.cloudfront.net/users/2624/thumb_270_oliver-vornberger-600-800.jpg', 84),
(72, 'Nils Haldenwang', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5712/thumb_270_Avatar.jpg', 84),
(73, 'Nicolas Neubauer', 'https://d1wshrh2fwv7ib.cloudfront.net/users/2675/thumb_270_HemdGut1Web1zu1.jpeg', 84),
(74, 'Prof. Dr. Christian Spannagel', 'https://d1wshrh2fwv7ib.cloudfront.net/users/126/thumb_270_spannagel.jpg', 85),
(75, 'r. phil. habil. Martin Lindner', 'https://d1wshrh2fwv7ib.cloudfront.net/users/129/thumb_270_martin_bayer2011.JPG', 85),
(76, 'Dr. Michael Gieding', 'https://d1wshrh2fwv7ib.cloudfront.net/users/127/thumb_270_gieding.jpg', 85),
(77, 'Lutz Berger', 'https://d1wshrh2fwv7ib.cloudfront.net/users/2049/thumb_270_thumb_200_lutz_berger.jpg', 85),
(78, 'Prof. Dr. Stephan Breidenbach', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1878/thumb_270_Foto_Stephan_Breidenbach_5868_-_Mai_2012_Ausserhofer__Mittel_.jpg', 86),
(79, 'Prof. Dr. Gerald Hüther', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1059487/thumb_270_Gerald.jpg', 86),
(80, 'Monia Ben Larbi', 'https://d1wshrh2fwv7ib.cloudfront.net/users/9744/thumb_270_monia5.JPG', 86),
(81, 'Claudia Morten', 'https://d1wshrh2fwv7ib.cloudfront.net/users/657233/thumb_270_Bildschirmfoto_2013-11-14_um_10.10.37.png', 86),
(82, 'Prof. Dr. Ralf Schlauderer', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1011627/thumb_270_schlauderer.jpg', 87),
(83, 'Prof. Dr. Johannes Holzner', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1011603/thumb_270_holzner.jpg', 87),
(84, 'Dr. Aram Aristakesyan', 'https://d1wshrh2fwv7ib.cloudfront.net/users/753/thumb_270_Aram_Aristakesyan.jpg', 87),
(85, 'Christian Schuh', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1011636/thumb_270_schuh.jpg', 87),
(86, 'Thomas Dengler', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1011645/thumb_270_dengler.jpg', 87),
(87, 'Annette Schmid', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1011660/thumb_270_schmid.jpg', 87),
(88, 'Prof. Dr. Ralf Schlauderer', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1011627/thumb_270_schlauderer.jpg', 88),
(89, 'Prof. Dr. Johannes Holzner', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1011603/thumb_270_holzner.jpg', 88),
(90, 'Dr. Aram Aristakesyan', 'https://d1wshrh2fwv7ib.cloudfront.net/users/753/thumb_270_Aram_Aristakesyan.jpg', 88),
(91, 'Christian Schuh', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1011636/thumb_270_schuh.jpg', 88),
(92, 'Thomas Dengler', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1011645/thumb_270_dengler.jpg', 88),
(93, 'Annette Schmid', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1011660/thumb_270_schmid.jpg', 88),
(94, 'PD Dr. med. Bernhard Hirt', 'https://d1wshrh2fwv7ib.cloudfront.net/users/125/thumb_270_Hirt-Portrait.jpg', 89),
(95, 'oph Corves  Dr. Linda Kleemann', 'https://d1wshrh2fwv7ib.cloudfront.net/users/151/thumb_270_corves.jpg', 90),
(96, 'of. Dr. Klaus Quibeldey-Cirkel', 'https://d1wshrh2fwv7ib.cloudfront.net/users/167/thumb_270_KQC.png', 91),
(97, 'Christoph Thelen', 'https://d1wshrh2fwv7ib.cloudfront.net/users/1877/thumb_270_Thelen.png', 91),
(98, 'Paul-Christian Volkmer', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5151/thumb_270_Image-0001.png', 91),
(99, 'Andreas Gärtner', 'https://d1wshrh2fwv7ib.cloudfront.net/users/2153/thumb_270_iversity-profilbild.jpg', 91),
(100, 'Daniel Gerhardt', 'https://d1wshrh2fwv7ib.cloudfront.net/users/2152/thumb_270_Portrait_DG_gray.png', 91),
(101, 'f. Frank Piller  Michael Engel', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5923/thumb_270_Piller.jpg', 92),
(102, 'Prof. Dr. Christian Spannagel', 'https://d1wshrh2fwv7ib.cloudfront.net/users/126/thumb_270_spannagel.jpg', 93),
(103, 'Dr. Michael Gieding', 'https://d1wshrh2fwv7ib.cloudfront.net/users/129/thumb_270_martin_bayer2011.JPG', 93),
(104, 'r. phil. habil. Martin Lindner', 'https://d1wshrh2fwv7ib.cloudfront.net/users/127/thumb_270_gieding.jpg', 93),
(105, 'Lutz Berger', 'https://d1wshrh2fwv7ib.cloudfront.net/users/2049/thumb_270_thumb_200_lutz_berger.jpg', 93),
(106, 'Dr. Malte Persike', 'https://d1wshrh2fwv7ib.cloudfront.net/users/8/thumb_270_thumb_200_pic_mpe_blurred.jpg', 94),
(107, 'Prof. Dr. Marc Oliver Opresnik', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5799/thumb_270_Bild_Opresnik.jpg', 95),
(108, 'Prof. Dr.-Ing. Rolf Granow', 'https://d1wshrh2fwv7ib.cloudfront.net/users/6353/thumb_270_prof_granow_550px.jpg', 95),
(109, 'Andreas Wittke', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5507/thumb_270_bkk_mobil_oil_egk.jpg', 95),
(110, 'Stefanie Herbst', 'https://d1wshrh2fwv7ib.cloudfront.net/users/5775/thumb_270_stefanie_01.jpg', 95),
(111, 'Thomas Muschal', 'https://d1wshrh2fwv7ib.cloudfront.net/users/4367/thumb_270_Bild_05b.jpg', 95),
(112, 'Gregor Huber', 'https://d1wshrh2fwv7ib.cloudfront.net/users/6017/thumb_270_gh_iversity.JPG', 95);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coursedetails`
--
ALTER TABLE `coursedetails`
  ADD CONSTRAINT `coursedetails_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course_data` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
