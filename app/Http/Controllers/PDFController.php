<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PDF;

class PDFController extends Controller
{
      public function downloadPDF(){

      $pdf = PDF::loadView('pdf');
      return $pdf->download('invoice.pdf');

    }
}
