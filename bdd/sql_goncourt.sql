-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 08 sep. 2024 à 16:48
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `goncourt`
--

CREATE DATABASE IF NOT EXISTS `goncourt`

CREATE TABLE `main_character`(
   m_id INT,
   m_firstname VARCHAR(30),
   m_lastname VARCHAR(30),
   PRIMARY KEY(m_id)
);


CREATE TABLE author(
   a_id INT,
   a_firstname VARCHAR(30),
   a_lastname VARCHAR(30),
   a_biography VARCHAR(400),
   PRIMARY KEY(a_id)
);


CREATE TABLE jury(
   j_id INT,
   j_is_president BOOLEAN NOT NULL,
   j_a_id INT NOT NULL,
   PRIMARY KEY(j_id),
   UNIQUE(j_a_id),
   FOREIGN KEY(j_a_id) REFERENCES author(a_id)
);


CREATE TABLE book(
   b_id INT,
   b_summary VARCHAR(400),
   b_editor VARCHAR(30) NOT NULL,
   b_publication_date DATE NOT NULL,
   b_nb_pages INT NOT NULL,
   b_isbn INT NOT NULL,
   b_price DECIMAL(5,2) NOT NULL,
   b_a_id INT NOT NULL,
   PRIMARY KEY(b_id),
   FOREIGN KEY(b_a_id) REFERENCES author(a_id)
);

CREATE TABLE include(
   i_b_id INT,
   i_m_id INT,
   PRIMARY KEY(i_b_id, i_m_id),
   FOREIGN KEY(i_b_id) REFERENCES book(b_id),
   FOREIGN KEY(i_m_id) REFERENCES main_character(m_id)
);

