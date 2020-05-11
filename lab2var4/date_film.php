<?php
header('Content-Type: application/json');

$dsn = "mysql:host=localhost; dbname=var_4";
$user = 'root';
$pass = '';
try {
    $dbh = new PDO($dsn,$user,$pass);

    $date = $_GET["date"];

    $datestart = "SELECT film.FILM_NAME FROM film WHERE film.FILM_DATE = '". $date ."'";


    $result = array();
    foreach ($dbh->query($datestart) as $row) {
        $result[] = $row['FILM_NAME'];
    }
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Ошибка";
}