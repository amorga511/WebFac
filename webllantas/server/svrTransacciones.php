
<?php
session_start();

	$postdata = file_get_contents("php://input");
	$vPost = json_decode($postdata);

switch((int)$vPost->op) {
	case 201:
		aperturaCaja($vPost->tienda, $vPost->cajero, $vPost->caja, $vPost->monto,$vPost->f_open);
		break;
	case 202:
		save_factura($vPost->arrItems, $vPost->arrGenerales);
		break;
	case 203:
		save_cierre($vPost->caja);
		break;

}


function aperturaCaja($vTienda, $vCajero, $vCaja, $vMonto, $vfech){
	include 'dblink.php';
	//echo $vTienda . $vCajero . $vCaja . $vMonto . substr($vfech, 0,10);
	$vQery = "UPDATE tbl_cajas SET estado_caja=1, monto=". $vMonto .", fech_apertura='". $vfech ."', cajero='" . $vCajero . "'";
	$vQery .= " where tienda='". $vTienda ."' and num_caja=" . $vCaja;

	if($con->query($vQery)){
		$_SESSION["infoCaja"] = json_encode(array("caja"=>$vCaja, "cajero"=>$vCajero), true);
		echo '1,Success';
	}else{
		echo $con->error;
	}

}

function save_factura($vArrItems, $vArrGenerales){
	include 'dblink.php';

	$vSQL = "";
	$numFacInt = 0;
	$numfac = "0";
	$prefijo = "0";
	$cai = "0";

	$vSQL = "SELECT * FROM tbl_cai_control where estado=1";
	if($resC = $con->query($vSQL)){
		while($rowC = $resC->fetch_array()){
			$cai = $rowC[3];
		}
	}

	$vSQL = "SELECT * FROM tbl_correlativos where estado=1 and id='FAC'";
	if($rNumFac = $con->query($vSQL)){
		while($rows = $rNumFac->fetch_array()){
			$numfac = $rows[1];
			$numFacInt = (int)$rows[1];
			$prefijo = $rows[2];
		}
	}
	$numfac = $prefijo . '-' . getNumChar($numFacInt +1);
	//echo $vTienda . $vCajero . $vCaja . $vMonto . substr($vfech, 0,10);
	$vQuery 	= "INSERT INTO tbl_facturas(id, fech_fac, vendedor, cliente, rtn_cliente, tel_cliente, subtotal, descuento, isv, efectivo, tarjeta, total, 
						cajero, caja, nota, cai, estado)";
	$vQuery .= " VALUES ('". $numfac ."','". $vArrGenerales->fecha ."','" . $vArrGenerales->vendedor . "','". $vArrGenerales->cliente ."','". $vArrGenerales->rtn ."','". $vArrGenerales->tel . "'," . $vArrGenerales->subTotal . "";
	$vQuery .= " ," . $vArrGenerales->desc .",". $vArrGenerales->isv ."," . $vArrGenerales->efectivo . ",". $vArrGenerales->tarjeta ."," . $vArrGenerales->total .",";
	$vQuery .= " '". $vArrGenerales->cajero ."','" . $vArrGenerales->caja . "','" . $vArrGenerales->nota ."','" . $cai . "', 1)";

	if($con->query($vQuery)){
		for($i=0; $i<count($vArrItems);$i++){
			$vQuery = "";
			$vQuery .= "INSERT INTO tbl_factura_detalle(cod_item, precio, unidades, factura_id, detalle) ";
			$vQuery .= " VALUES ('". $vArrItems[$i]->cod ."','". $vArrItems[$i]->price ."','". $vArrItems[$i]->cant . "','". $numfac ."','". $vArrItems[$i]->desc ."')";
			if($con->query($vQuery)){

			}else{
				echo $con->error;
			}
		}
	}else{
		echo $con->error;
		return;
	}

	$numFacInt = (int)$numFacInt + 1;
	$vSQL = "UPDATE tbl_correlativos set correlativo =" . $numFacInt . " where id='FAC'";
	//echo $vSQL;
	if(!$con->query($vSQL)){
		echo $con->error;
	}
	echo "1,success," . $numfac;
}

function save_cierre($vCaja){
	include 'dblink.php';
	
	$vSQL = "UPDATE tbl_cajas set estado_caja=0 and cajero='0' where num_caja=" . $vCaja;
	if($con->query($vSQL)){
		echo "1,success";
	}
}

function getNumChar($vNum){
	$vSTR = "";
	if($vNum<10){
		$vSTR = "0000000" . $vNum;
	}else if($vNum<100){
		$vSTR = "000000" . $vNum;
	}else if($vNum<1000){
		$vSTR = "00000" . $vNum;
	}else if($vNum<10000){
		$vSTR = "0000" . $vNum;
	}else if($vNum<100000){
		$vSTR = "000" . $vNum;
	}else if($vNum<100000){
		$vSTR = "00" . $vNum;
	}else if($vNum<1000000){
		$vSTR = "0" . $vNum;
	}else{
		$vSTR = "" . $vNum;
	}
	return $vSTR;
}


?>










