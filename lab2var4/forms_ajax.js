var ajax; // глобальная переменная для хранения обработчика запросов
InitAjax();
function InitAjax() {
	try { /* пробуем создать компонент XMLHTTP для IE старых версий */
		ajax = new ActiveXObject("Microsoft.XMLHTTP");
	} catch (e) {
		try {//XMLHTTP для IE версий >6
		ajax = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {// XMLHTTP для Mozilla и остальных
			ajax = new XMLHttpRequest();
		} catch(e) { ajax = 0; }
		}
	}
}



/*Genre FORM*/

function getFilmsByGenre() {
	if (!ajax) {
		alert("Ajax не инициализирован");
		return;
	}
	var genre = document.getElementsByName("genre")[0].value;
	ajax.onreadystatechange = getFilmsByGenreCallback;
	var params = 'genre=' + encodeURIComponent(genre);
	ajax.open("GET", "genre.php?"+params, true);
	ajax.send(null);
}

function getFilmsByGenreCallback() {
	if (ajax.readyState == 4) {
		if (ajax.status == 200) {
		// если ошибок нет
			var genre_res = document.getElementById('genre-res');
			genre_res.innerHTML = ajax.responseText;
		}
		else alert(ajax.status + " - " + ajax.statusText);
		ajax.abort();
	}
}


/*Actor FORM*/

function getFilmsByActor() {
	if (!ajax) {
		alert("Ajax не инициализирован");
		return;
	}
	var actor = document.getElementsByName("actor_film")[0].value;
	ajax.onreadystatechange = getFilmsByActorCallback;
	var params = 'actor_film=' + encodeURIComponent(actor);
	ajax.open("GET", "actor.php?"+params, true);
	ajax.send(null);
}

function getFilmsByActorCallback() {
	if (ajax.readyState == 4) {
		if (ajax.status == 200) {
		// если ошибок нет
			var actor_res = document.getElementById('actor-res');
			var result = '';

			var rows = ajax.responseXML.firstChild.children;
			for (var i = 0; i < rows.length; i++) {
				result += '<li>' + rows[i].childNodes[0].nodeValue + '</li>';
			}
			actor_res.innerHTML = result;
		}
		else alert(ajax.status + " - " + ajax.statusText);
		ajax.abort();
	}
}


/*Date FORM*/

function getFilmsByDate() {
	if (!ajax) {
		alert("Ajax не инициализирован");
		return;
	}
	var date = document.getElementsByName("date")[0].value;
	ajax.onreadystatechange = getFilmsByDateCallback;
	var params = 'date=' + encodeURIComponent(date);
	ajax.open("GET", "date_film.php?"+params, true);
	ajax.send(null);
}

function getFilmsByDateCallback() {
	if (ajax.readyState == 4) {
		if (ajax.status == 200) {
		// если ошибок нет
			var actor_res = document.getElementById('date-res');
			var result = '';

			var rows = JSON.parse(ajax.responseText);
			for (var i = 0; i < rows.length; i++) {
				result += '<li>' + rows[i] + '</li>';
			}
			actor_res.innerHTML = result;
		}
		else alert(ajax.status + " - " + ajax.statusText);
		ajax.abort();
	}
}