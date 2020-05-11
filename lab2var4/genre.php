<?php

$dsn = "mysql:host=localhost; dbname=var_4";
$user = 'root';
$pass = '';
try {
    $dbh = new PDO($dsn,$user,$pass);

    $genre = $_GET["genre"];

    $nursestart = "SELECT film.FILM_NAME FROM film,genre,film_genre WHERE film.FILM_ID = film_genre.FID_FILM and film_genre.FID_GENRE = genre.GENRE_ID and genre.GENRE_TITLE = '". $genre ."'";

    foreach ($dbh->query($nursestart) as $row) {
        echo '<li>'.$row['FILM_NAME'].'</li>';
    }
} catch (PDOException $e) {
    echo '<li>'."Ошибка".'</li>';
}