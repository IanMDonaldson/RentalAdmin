package com.iandonaldson.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;

import com.iandonaldson.data.FilmDaoImpl;
import com.iandonaldson.data.Film;


/**
 * Servlet implementation class Film
 */
@WebServlet("/WebFilm")
public class WebFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String filmIDParam;
	private int filmID;
	private Film film;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WebFilm() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		if (request.getParameter("action") == null) {
			request.getRequestDispatcher("FilmMenu.jsp").forward(request, response);
		}
		else {
			FilmDaoImpl filmDaoImpl = new FilmDaoImpl();
			switch(request.getParameter("action")) {
			case "getAllFilms":
				request.getSession().setAttribute("FilmList", filmDaoImpl.getAllFilms());
				request.getRequestDispatcher("FilmList.jsp").forward(request, response);
				break;
			case "getFilm":
				filmIDParam = request.getParameter("id");
				filmID = Integer.parseInt(filmIDParam);
				film = filmDaoImpl.getFilm(filmID);
				request.getSession().setAttribute("film", film);
				request.getSession().setAttribute("actors", film.getActorList());
				request.getRequestDispatcher("Film.jsp").forward(request, response);
				break;
			case "updateFilmGET":
				filmIDParam = request.getParameter("id");
				filmID = Integer.parseInt(filmIDParam);
				film = filmDaoImpl.getFilm(filmID);
				request.getSession().setAttribute("id", Integer.toString(filmID));
				request.getSession().setAttribute("title", film.getTitle());
				request.getSession().setAttribute("description", film.getDescription());
				//request.getSession().setAttribute("releaseDate", film.getReleaseDate().toString());
				request.getSession().setAttribute("rentalRate", Double.toString(film.getRentalRate()));
				request.getSession().setAttribute("replacementCost", Double.toString(film.getReplacementCost()));
				request.getSession().setAttribute("length", Integer.toString(film.getLength()));
				request.getSession().setAttribute("rentalDuration", Integer.toString(film.getRentalDuration())); //changed since working
				request.getSession().setAttribute("category", film.getCategory().getName());
				request.getSession().setAttribute("language", film.getLanguage().getName());
				request.getRequestDispatcher("FilmUpdate.jsp").forward(request, response);
				break;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FilmDaoImpl filmDaoImpl = new FilmDaoImpl();
		if (request.getParameter("action") == null ) {
			request.getRequestDispatcher("Menu.jsp").forward(request,response);
		}
		else {
			switch (request.getParameter("action")) {
			case "updateFilm":
				filmIDParam = request.getParameter("id");
				filmID = Integer.parseInt(filmIDParam);
				film = filmDaoImpl.getFilm(filmID);
//				SimpleDateFormat releaseDateFmt = new SimpleDateFormat("yyyy");
//				try {
//					Date parsedRelDate = (Date) releaseDateFmt.parse(request.getParameter("releaseDate"));
//					film.setReleaseDate(parsedRelDate);
//				} catch (ParseException e) {
//					e.printStackTrace();
//				}			
				//TODO find a way to convert java.util.date to java.sql.date or find a way to do without util.Date
				film.setTitle(request.getParameter("title").toString());
				film.setDescription(request.getParameter("description").toString());
				film.setLength(Integer.parseInt(request.getParameter("length")));
				film.setRentalRate(Double.parseDouble(request.getParameter("rentalRate")));
				film.setReplacementCost(Double.parseDouble(request.getParameter("replacementCost")));
				film.setRentalDuration(Integer.parseInt(request.getParameter("rentalDuration")));
				if (filmDaoImpl.updateFilm(film)) {
					request.getSession().setAttribute("film", film);//available as ${film} in jsp
					request.getSession().setAttribute("actors", film.getActorList()); //avail as ${actors} in .jsp
					request.getRequestDispatcher("Film.jsp").forward(request, response);
				}
				break;
			}
		}
	}

}
/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	response.setContentType("text/html;charset=UTF-8");
	
	if (request.getParameter("action") == null) {
		request.getRequestDispatcher("MovieMgmt.jsp").forward(request, response);
	}
	else {
		// Get a data access instance
		FilmDaoImpl filmDaoImpl = new FilmDaoImpl();
		switch(request.getParameter("action")) 
		{
		case "getlist":
			getList (request, response);
			break;
		case "getinstance":
			getInstance (request, response);
			break;			
		case "updatemovie":
			updateMovie (request, response);
			break;	
		}
	}
}


protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	if (request.getParameter("action") == null) {
		request.getRequestDispatcher("MovieMgmt.jsp").forward(request, response);
	}
	else {
		switch(request.getParameter("action")) 
		{
		case "updateFilm":
			filmIdParm = request.getParameter("Id");
			filmId = Integer.parseInt(filmIdParm);
			FilmDaoImpl filmDaoImpl = new FilmDaoImpl();
			Film movie = filmDaoImpl.getFilm(filmId);
			movie.setDescription(request.getParameter("description").toString());
			if (filmDaoImpl.updateFilm(movie))
			{
				getInstance (request, response, filmId);
			}
						
			}
		}	
	}

private void getList (HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
	FilmDaoImpl filmDaoImpl = new FilmDaoImpl();
	request.getSession().setAttribute("MovieList", filmDaoImpl.getAllFilms());
	request.getRequestDispatcher("MovieList.jsp").forward(request, response);
	
}

private void getInstance (HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
	filmIdParm = request.getParameter("Id");
	filmId = Integer.parseInt(filmIdParm);
	Film movie = getFilm(filmId);
	request.getSession().setAttribute("movie", movie);
	request.getSession().setAttribute("actors", movie.getActors());
	request.getRequestDispatcher("Movie.jsp").forward(request, response);	
}

private void getInstance (HttpServletRequest request, HttpServletResponse response, int filmId) 
		throws ServletException, IOException {
	Film movie = getFilm(filmId);
	request.getSession().setAttribute("movie", movie);
	request.getSession().setAttribute("actors", movie.getActors());
	request.getRequestDispatcher("Movie.jsp").forward(request, response);	
}

private Film getFilm (int filmId) {
	FilmDaoImpl filmDaoImpl = new FilmDaoImpl();
	return filmDaoImpl.getFilm(filmId);
}

private void updateMovie (HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
	filmIdParm = request.getParameter("Id");
	filmId = Integer.parseInt(filmIdParm);
	movie = getFilm(filmId);
	request.getSession().setAttribute("id", Integer.toString(filmId));
	request.getSession().setAttribute("title", movie.getTitle());
	request.getSession().setAttribute("description", movie.getDescription());
	request.getSession().setAttribute("releaseDate", movie.getReleaseDate().toString());
	request.getRequestDispatcher("MovieUpdate.jsp").forward(request, response);
}

*/
