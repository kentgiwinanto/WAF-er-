<?php
  $data = DB::select("CALL WAF_Read_Logs()");
  foreach ($data as $val) {
    echo "<ul id='dateSlider'>";
    echo "<li style='cursor: pointer;'>";
        echo $val->TimeStampLog."</br>";
        //return $val;
    echo "</li>";
    echo "</ul>";
?>

        <ul id="typeSlider">
          <li>
            <table border="solid 1px">
              <tr>
                <th style="width: 340px"></th>
                <th style="width:340px"></th>
              </tr>
              <tr>
                <td> @include('php.showLogsAtt')
                <!-- <td> @include('php.showLogsVal') -->
              </tr>
            </table>
          </li>
        </ul>

      <?php
    }
     ?>
