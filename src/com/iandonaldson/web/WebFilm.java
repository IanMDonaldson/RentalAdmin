package com.iandonaldson.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iandonaldson.data.FilmDaoImpl;
import com.iandonaldson.data.Film;
import com.iandonaldson.data.ActorDaoImpl;
import com.iandonaldson.data.Actor;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;
import java.text.ParseException;


/**
 * Servlet implementation class Film
 */
@WebServlet("/WebFilm")
public class WebFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String filmIDParam;
	private int filmID;
	private Film film;
	private String isUpdated = "true";
       
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
			request.getRequestDispatcher("FilmManagement.jsp").forward(request, response);
		}
		else {
			FilmDaoImpl filmDaoImpl = new FilmDaoImpl();
			ActorDaoImpl actorDaoImpl = new ActorDaoImpl();
			switch(request.getParameter("action")) {
			case "getAllFilms":
				request.getSession().setAttribute("filmList", filmDaoImpl.getAllFilms());
				request.getRequestDispatcher("FilmList.jsp").forward(request, response);
				break;
			case "getFilm":
				filmIDParam = request.getParameter("id");
				filmID = Integer.parseInt(filmIDParam);
					request.getSession().setAttribute("film", film);
				request.getSession().setAttribute("id", film.getId());
				request.getSession().setAttribute("filmsActorList", film.getActorList());
				request.getSession().setAttribute(isUpdated, "true");
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
				request.getSession().setAttribute(isUpdated, "true");
				request.getRequestDispatcher("FilmUpdate.jsp").forward(request, response);
				break;
			case "manageFilms": 
				request.getRequestDispatcher("FilmManagement.jsp").forward(request, response);
				break;
			case "addFilmGET":
				filmID = filmDaoImpl.getNewFilmID();
				request.getSession().setAttribute("id", Integer.toString(filmID));
				request.getRequestDispatcher("FilmAdd.jsp").forward(request, response);
				break;
			case "deleteFilmGET":
				filmIDParam = request.getParameter("id");
				filmID = Integer.parseInt(filmIDParam);
				if (filmDaoImpl.deleteFilm(filmID)) {
					request.getSession().setAttribute("filmList", filmDaoImpl.getAllFilms());
					request.getRequestDispatcher("FilmList.jsp").forward(request, response);
				} else {
					request.getSession().setAttribute("delete", false);
					request.getRequestDispatcher("FailurePage.jsp").forward(request, response);
				}
				break;
			case "assocActorsGET":
				filmIDParam = request.getParameter("id");
				filmID = Integer.parseInt(filmIDParam);
				film = filmDaoImpl.getFilm(filmID);
				request.getSession().setAttribute("film", film);
				request.getSession().setAttribute("actorsNotAssoc", actorDaoImpl.getActorsNotAssocWFilm(film));
				request.getSession().setAttribute("actorsAssoc", film.getActorList());
				request.getRequestDispatcher("AssocActorsToFilm.jsp").forward(request, response);
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
			case "updateFilmPOST":
				filmIDParam = request.getParameter("id");
				filmID = Integer.parseInt(filmIDParam);
				film = filmDaoImpl.getFilm(filmID);
				film.setTitle(request.getParameter("title").toString());
				film.setDescription(request.getParameter("description").toString());
				film.setLength(Integer.parseInt(request.getParameter("length")));
				film.setRentalRate(Double.parseDouble(request.getParameter("rentalRate")));
				film.setReplacementCost(Double.parseDouble(request.getParameter("replacementCost")));
				
				if (!filmDaoImpl.updateFilm(film)) {
					request.getSession().setAttribute("add", false);
					request.getSession().setAttribute("delete", false);
					request.getSession().setAttribute("update", true);
					request.getRequestDispatcher("FailurePage.jsp").forward(request, response);
				} else {
					request.getSession().setAttribute("film", film);//available as ${film} in Film.jsp
					request.getSession().setAttribute("actors", film.getActorList()); //avail as ${actors} in Film.jsp
					request.getRequestDispatcher("Film.jsp").forward(request, response);
				}
				break;
			case "searchFilmPOST":
				filmIDParam = request.getParameter("title").toString();
				if (filmDaoImpl.searchFilmByTitle(filmIDParam)) {
					request.getSession().setAttribute("filmList", filmDaoImpl.getFilmsByTitle(filmIDParam));
					request.getRequestDispatcher("FilmList.jsp").forward(request, response);
				}
				break;
			case "addFilmPOST":
				filmIDParam = request.getParameter("id");
				filmID = Integer.parseInt(filmIDParam);
				String title = request.getParameter("title").toUpperCase();
				String description = request.getParameter("description");
				String rating = request.getParameter("rating").toUpperCase();
				//String[] specialFeatures = request.getParameterValues("specialFeatures");
				
				String languageIDParam = request.getParameter("languageID");
				int languageID = Integer.parseInt(languageIDParam);
				String rentalDurationParam = request.getParameter("rentalDuration");
				int rentalDuration = Integer.parseInt(rentalDurationParam);
				String lengthParam = request.getParameter("length");
				int length = Integer.parseInt(lengthParam);
				String rentalRateParam = request.getParameter("rentalRate");
				double rentalRate = Double.parseDouble(rentalRateParam);
				
				java.sql.Date releaseYear = null;
				try {
					SimpleDateFormat fmt = new SimpleDateFormat("yyyy");
					String releaseYearParam = request.getParameter("releaseYear");
					Date parsed = fmt.parse(releaseYearParam);
					releaseYear = new java.sql.Date(parsed.getTime());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				//List<String> specFeatures = new ArrayList<String>(Arrays.asList(specialFeatures));
				Film film = new Film(title, description, rating, filmID, languageID, rentalDuration, length, rentalRate, releaseYear);
				
				boolean filmExists = filmDaoImpl.filmExists(film);
				boolean addSuccessful = filmDaoImpl.addFilm(film);
				if (filmExists) {
					request.getSession().setAttribute("add", true);
					request.getRequestDispatcher("FailurePage.jsp").forward(request, response);
				} else {
					if (addSuccessful) {
						request.getSession().setAttribute("film", film);
						request.getSession().setAttribute("id", film.getId());
						request.getSession().setAttribute("filmsActorList", film.getActorList());
						request.getRequestDispatcher("Film.jsp").forward(request, response);
					} else {
						request.getSession().setAttribute("add", true);
						request.getRequestDispatcher("FailurePage.jsp").forward(request, response);
					}
				}
				break;
			case "assocActorsPOST":
				filmIDParam = request.getParameter("id");
				filmID = Integer.parseInt(filmIDParam);
				film = filmDaoImpl.getFilm(filmID);
				String[] assocActors = request.getParameterValues("hiddenActors");
				if (filmDaoImpl.assocActors(film, assocActors)) {
					request.getSession().setAttribute("filmList", filmDaoImpl.getAllFilms());
					request.getSession().setAttribute("id", film.getId());
					request.getSession().setAttribute("filmsActorList", film.getActorList());
					request.getRequestDispatcher("FilmList.jsp").forward(request, response);
				} else {
					request.getSession().setAttribute("update", true);
					request.getRequestDispatcher("FailurePage.jsp").forward(request, response);
				}
				break;
			}
		}
	}

}