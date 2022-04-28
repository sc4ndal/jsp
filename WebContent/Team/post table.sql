-- phpMyAdmin SQL Dump
-- version 3.2.3
-- http://www.phpmyadmin.net
--
-- 호스트: localhost
-- 처리한 시간: 22-04-28 18:42 
-- 서버 버전: 5.1.41
-- PHP 버전: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 데이터베이스: `ktjdb`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `title` varchar(50) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `rDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(2048) DEFAULT NULL,
  UNIQUE KEY `rDate` (`rDate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `post`
--

INSERT INTO `post` (`title`, `username`, `rDate`, `content`) VALUES
('good', 'test', '2022-04-28 18:31:32', 'good'),
('test4441', 'test2', '2022-04-28 17:17:27', 'test3'),
('test1', 'admin', '2022-04-28 17:57:59', 'test1');
