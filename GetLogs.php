<?php
$array_files = array();	
$path = realpath('/var/log/nginx/modsec/');
$Nomor = 0;

foreach(new RecursiveIteratorIterator(new RecursiveDirectoryIterator($path, RecursiveDirectoryIterator::SKIP_DOTS)) as $file){ // Directory Iterasi dari path yang kita tentuin dna skip dots
	if((string)$file != '/var/log/nginx/modsec/Debug.log'){ // Memasukkan ke array jika tidak mengandung file Debug.log
		array_push($array_files,(string)$file);
	}
}
// Reverse Sort
foreach($array_files as $key=>$listFiles){
	$array_files[$key] = file_get_contents($array_files[$key]); // Membaca file sesuai dengan path array
}
header('Content-type: application/json');		
echo json_encode($array_files);

?>
