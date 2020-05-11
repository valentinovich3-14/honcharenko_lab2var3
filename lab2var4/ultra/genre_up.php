<?php

$dsn = "mysql:host=localhost; dbname=var_4";
$user = 'root';
$pass = '';
try {
    $dbh = new PDO($dsn,$user,$pass);

    $genreName = "SELECT GENRE_TITLE FROM genre";

    $outputGenre[] = array();

    unset($outputGenre[0]);

    foreach ($dbh->query($genreName) as $row) {
        $outputGenre[] .= $row['GENRE_TITLE'];
    }
} catch (PDOException $e) {
    echo "Ошибка";
}