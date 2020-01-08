<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF_8">
</head>
<body>
<header>
	<div class="container">
	<button class="dropButton"><a href="Home?action=mainMenu" id="home">Home</a></button>
		<div class="drop">
            <button class="dropButton">Films</button>
			<div class="dropContent">
					<a href="WebFilm?action=getAllFilms">List All Films</a>
					<a href="WebFilm?action=addFilmGET">Add Film</a>
					<a href="WebFilm?action=filmManagement">Film Management & Search</a>
			</div>
		</div>
			<div class="drop">
				<button class="dropButton">Actors</button>
				<div class="dropContent">
					<a href="WebActor?action=getAllActors">List All Actors</a>
					<a href="WebActor?action=addActorGET">Add Actor</a>
					<a href="WebActor?action=manageActors">Actor Management & Search</a>
				</div>
			</div>
		</div>
	</div>
</header>
</body>
</html>