<?php require "ultra/genre_up.php"; ?>
<?php require "ultra/actors_up.php"; ?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<form action="genre.php">
    <p><b>список фильмов выбранного жанра</b> - HTML</p>
    <select name="genre">
        <?php
        foreach ($outputGenre as $genre) {
            echo "<option value=\"$genre\">$genre</option>";
        }
        ?>
    </select>
    <p><input type="button" value="Выбрать" onclick="getFilmsByGenre()"></p>
</form>
<ul id="genre-res"></ul>

<form action="actor.php">
    <p><b>список фильмов с выбранным актером</b> - XML</p>
    <select name="actor_film">
        <?php
        foreach ($outputActor as $actor) {
            echo "<option value=\"$actor\">$actor</option>";
        }
        ?>
    </select>
    <p><input type="button" value="Выбрать" onclick="getFilmsByActor()"></p>
</form>
<ul id="actor-res"></ul>

<form action="date_film.php">
    <p><b>список фильмов за указанный временной интервал</b> - JSON</p>
    <select name="date">
        <?php
        foreach ($outputDate as $dates) {
            echo "<option value=\"$dates\">$dates</option>";
        }
        ?>
        <option>0000-00-00</option>
        <option>2020-03-27</option>
    </select>
    <p><input type="button" value="Выбрать" onclick="getFilmsByDate()"></p>
</form>
<ul id="date-res"></ul>

<script src="forms_ajax.js"></script>
</body>
</html>