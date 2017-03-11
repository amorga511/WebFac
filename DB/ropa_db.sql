-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2017 at 10:13 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `llantas_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cai_control`
--

CREATE TABLE `tbl_cai_control` (
  `id` int(11) NOT NULL,
  `empresa` varchar(45) DEFAULT NULL,
  `rtn` varchar(20) DEFAULT NULL,
  `cai` varchar(60) DEFAULT NULL,
  `rango_desde` varchar(25) DEFAULT NULL,
  `rango_hasta` varchar(25) DEFAULT NULL,
  `fecha_limite` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cai_control`
--

INSERT INTO `tbl_cai_control` (`id`, `empresa`, `rtn`, `cai`, `rango_desde`, `rango_hasta`, `fecha_limite`, `estado`) VALUES
(1, 'TGU001', '14011986000640', '8EDE4C-19A1A4-EB43A6-A56CDF-68CB20-BE', '000-001-01-00000001', '000-001-01-00000400', '2017-11-17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cajas`
--

CREATE TABLE `tbl_cajas` (
  `id` int(11) NOT NULL,
  `num_caja` int(11) NOT NULL,
  `tienda` varchar(20) NOT NULL,
  `monto` decimal(10,0) NOT NULL,
  `fech_apertura` datetime NOT NULL,
  `fech_cierre` date NOT NULL,
  `estado_caja` int(11) NOT NULL,
  `cajero` varchar(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cajas`
--

INSERT INTO `tbl_cajas` (`id`, `num_caja`, `tienda`, `monto`, `fech_apertura`, `fech_cierre`, `estado_caja`, `cajero`, `status`) VALUES
(1, 1, 'TGU001', '0', '0000-00-00 00:00:00', '0000-00-00', 0, '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_correlativos`
--

CREATE TABLE `tbl_correlativos` (
  `id` varchar(15) NOT NULL,
  `correlativo` int(11) NOT NULL,
  `prefijo` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_correlativos`
--

INSERT INTO `tbl_correlativos` (`id`, `correlativo`, `prefijo`, `estado`) VALUES
('FAC', 0, '000-001-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_facturas`
--

CREATE TABLE `tbl_facturas` (
  `id` varchar(60) NOT NULL,
  `fech_fac` datetime DEFAULT NULL,
  `vendedor` varchar(15) DEFAULT NULL,
  `cliente` varchar(30) DEFAULT NULL,
  `rtn_cliente` varchar(20) DEFAULT NULL,
  `tel_cliente` int(11) DEFAULT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `descuento` decimal(9,2) DEFAULT NULL,
  `isv` decimal(9,2) DEFAULT NULL,
  `efectivo` decimal(9,2) DEFAULT NULL,
  `tarjeta` decimal(9,2) DEFAULT NULL,
  `total` decimal(9,2) DEFAULT NULL,
  `cajero` varchar(15) DEFAULT NULL,
  `caja` varchar(10) DEFAULT NULL,
  `nota` varchar(45) DEFAULT NULL,
  `cai` varchar(60) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_factura_detalle`
--

CREATE TABLE `tbl_factura_detalle` (
  `id` int(11) NOT NULL,
  `cod_item` varchar(10) DEFAULT NULL,
  `precio` decimal(9,2) DEFAULT NULL,
  `unidades` decimal(9,2) DEFAULT NULL,
  `factura_id` varchar(60) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_personal`
--

CREATE TABLE `tbl_personal` (
  `id` varchar(20) NOT NULL,
  `nombre_persona` varchar(50) NOT NULL,
  `apellido_persona` varchar(50) NOT NULL,
  `telefono_persona` int(11) NOT NULL,
  `cargo_persona` int(11) NOT NULL,
  `status_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_personal`
--

INSERT INTO `tbl_personal` (`id`, `nombre_persona`, `apellido_persona`, `telefono_persona`, `cargo_persona`, `status_persona`) VALUES
('0', 'Cajero', 'Llantas', 0, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tiendas`
--

CREATE TABLE `tbl_tiendas` (
  `id` varchar(10) NOT NULL,
  `nombre_tienda` varchar(30) NOT NULL,
  `direccion_tienda` varchar(50) NOT NULL,
  `telefono_tienda` int(11) NOT NULL,
  `rtn_tienda` varchar(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tiendas`
--

INSERT INTO `tbl_tiendas` (`id`, `nombre_tienda`, `direccion_tienda`, `telefono_tienda`, `rtn_tienda`, `status`) VALUES
('TGU001', 'Import. y Llanticentro JIREH', 'Salida a Danli, Villa Vieja', 0, '14011986000640', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `num` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `id_empleado` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`num`, `usuario`, `password`, `id_empleado`, `estado`) VALUES
(1, 'caja', 'jireh', '0', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cai_control`
--
ALTER TABLE `tbl_cai_control`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cajas`
--
ALTER TABLE `tbl_cajas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_correlativos`
--
ALTER TABLE `tbl_correlativos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_facturas`
--
ALTER TABLE `tbl_facturas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_factura_detalle`
--
ALTER TABLE `tbl_factura_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_personal`
--
ALTER TABLE `tbl_personal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tiendas`
--
ALTER TABLE `tbl_tiendas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`num`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cai_control`
--
ALTER TABLE `tbl_cai_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_cajas`
--
ALTER TABLE `tbl_cajas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_factura_detalle`
--
ALTER TABLE `tbl_factura_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
