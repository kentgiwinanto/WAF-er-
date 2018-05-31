<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Array2XML;
use App\Http\Controllers\GetLogs;


class ShowLogServer extends Controller
{
    use GetLogs;
    public function showlog($iniArray){



      print_r($iniArray[0]);

    }
}
