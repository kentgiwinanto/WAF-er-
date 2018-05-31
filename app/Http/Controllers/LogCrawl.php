<?php

// $obj = new simple_html_dom();
//     $url = 'http://192.168.1.109:9112/modsec';
//     $htmls = file_get_html($url);
//     //$tests = $htmls->find('div');
//     $tests = $htmls;
//
// print_r($tests);
// die;

// Require Array2XML class which takes a PHP array and changes it to XML
// require_once('array2xml.php');

// Gets JSON file

//$json = file_get_contents('logs.json');

function public getLog(){
  $Result = file_get_contents("http://192.168.43.134:9112/GetLogs.php");
  $Result = json_decode($Result);

   print_r($Result[0]);
}

//
// function arrescape(&$element, $index)
// {
//   $element = str_replace(array("'", "\"", "&quot;"), '', $element);
// }
//
// foreach ($Result as $results) {
//
//   // Decodes JSON into a PHP array
//   // function arrescape(&$element, $index)
//   // {
//   //   $element = str_replace(array("'", "\"", "&quot;"), '', $element);
//   // }
//
//   $php_array = json_decode($results, true);
//
//   array_walk_recursive($php_array,"arrescape");
//
//
//   // adding Content Type
//   header("Content-type: text/xml");
//
//   // Converts PHP Array to XML with the root element being 'root-element-here'
//   $xml = Array2XML::createXML('XML', $php_array);
//
//   echo $xml->saveXML();

//}



?>
