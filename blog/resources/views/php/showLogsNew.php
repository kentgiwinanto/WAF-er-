<?php

    $Result = file_get_contents("http://192.168.1.105:9112/GetLogs.php");
    $Result = unserialize($Result);
    print_r($Result);
    die();
  foreach ($Result as $att => $val) {

?>

<tbody>
    <tr>
        <td>LOG001</td>
        <td>Fri Apr 13 00:53:24 2018</td>
        <td>SQL Injection Detected Via lbinject</td>
        <td>SQLi</td>
        <td>192.168.1.105</td>
        <td>0.0.0.0</td>
        <td>High</td>
        <td><a data-fancybox data-src="#modal" href="javascript:;" class="btn btn-primary"><div class="fas fa-list"></div></a></td>
    </tr>
    <tr>
        <td>LOG002</td>
        <td><?php echo $att['id'] ?></td>
        <td>XSS Attack Attempt</td>
        <td>XSS</td>
        <td>192.168.1.105</td>
        <td>0.0.0.0</td>
        <td>Low</td>
        <td><a data-fancybox data-src="#modal" href="javascript:;" class="btn btn-primary"><div class="fas fa-list"></div></a></td>
    </tr>
    <tr>
        <td>LOG003</td>
        <td>Fri Apr 12 21:53:13 2018</td>
        <td>Brute Force Attack</td>
        <td>Brute Force</td>
        <td>192.168.1.106</td>
        <td>0.0.0.0</td>
        <td>Low</td>
        <td><a data-fancybox data-src="#modal" href="javascript:;" class="btn btn-primary"><div class="fas fa-list"></div></a></td>
    </tr>
    <tr>
        <td>LOG004</td>
        <td>Fri Apr 12 17:11:03 2018</td>
        <td>SQL Injection Detected Via lbinject</td>
        <td>SQLi</td>
        <td>192.168.1.105</td>
        <td>0.0.0.0</td>
        <td>High</td>
        <td><a data-fancybox data-src="#modal" href="javascript:;" class="btn btn-primary"><div class="fas fa-list"></div></a></td>
    </tr>
    <tr>
        <td>LOG005</td>
        <td>Fri Apr 11 03:21:30 2018</td>
        <td>XSS Attack Via WAF</td>
        <td>XSS</td>
        <td>192.168.1.112</td>
        <td>0.0.0.0</td>
        <td>Medium</td>
        <td><a data-fancybox data-src="#modal" href="javascript:;" class="btn btn-primary"><div class="fas fa-list"></div></a></td>
    </tr>
    <tr>
        <td>LOG006</td>
        <td>Fri Apr 13 18:23:31 2018</td>
        <td>SQL Injection Attempt</td>
        <td>SQLi</td>
        <td>192.168.1.105</td>
        <td>0.0.0.0</td>
        <td>Low</td>
        <td><a data-fancybox data-src="#modal" href="javascript:;" class="btn btn-primary"><div class="fas fa-list"></div></a></td>
    </tr>
</tbody>
<?php
}
 ?>
