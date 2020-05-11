<?php

$dsn = "mysql:host=localhost; dbname=var_4";
$user = 'root';
$pass = '';
try {
    $dbh = new PDO($dsn,$user,$pass);

    $dateName = "SELECT FILM_DATE FROM film";

    $outputDate[] = array();

    unset($outputDate[0]);

    foreach ($dbh->query($dateName) as $row) {
        $outputDate[] .= $row['FILM_DATE'];
    }
} catch (PDOException $e) {
    echo "Ошибка";
}