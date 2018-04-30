<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Array2XML;

use Illuminate\Http\Request;
// require_once('array2xml.php');



  function arrescape(&$element, $index)
  {
    $element = str_replace(array("'", "\"", "&quot;","`"), '', $element);
    return $element;
  }

  public function getLog()
  {
    $iniNomor = 0;
    $iniArray = array();
    $Result = file_get_contents("http://192.168.43.134:9112/GetLogs.php");
    $Result = unserialize($Result);

     foreach ($Result as $results) {

       $php_array = json_decode($results, true);

       array_walk_recursive($php_array,"self::arrescape");

       // adding Content Type
       // header("Content-type: text/xml");

       // Converts PHP Array to XML with the root element being 'root-element-here'
       $xml = Array2XML::createXML('XML', $php_array);
       array_push($iniArray,$xml->saveXML());
     }
     // echo $xml->saveXML();


     //print_r($iniArray[0]);

        return $iniArray->with('iniArray',$iniArray);
  }

?>