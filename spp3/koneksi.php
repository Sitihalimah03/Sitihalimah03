<?php 
$koneksi = mysqli_connect("localhost","root","","db_spp3","sql112.epizy.com","epiz_28426333","eGS6bBMGzJi","epiz_28426333_master");
 
// Check connection
if (mysqli_connect_errno()){
	echo "Koneksi database gagal : " . mysqli_connect_error();
}
 
?>