<?php
header('Content-Type: text/xml');
header("Cache-Control: no-cache, must-revalidate");

$dsn = "mysql:host=localhost; dbname=var_4";
$user = 'root';
$pass = '';
try {
    $dbh = new PDO($dsn,$user,$pass);

    $actor = $_GET["actor_film"];

    $nursestart = "SELECT film.FILM_NAME FROM film,actor,film_actor WHERE film.FILM_ID = film_actor.FILM_FID and film_actor.ACTOR_FID = actor.ACTOR_ID and actor.ACTOR_NAME = '". $actor ."'";

    echo '<?xml version="1.0" encoding="utf8" ?>';
	echo "<root>";
    foreach ($dbh->query($nursestart) as $row) {
    	echo "<filmName>";
        echo $row['FILM_NAME'];
        echo "</filmName>";
    }
    echo "</root>";
} catch (PDOException $e) {
    echo "Ошибка";
}