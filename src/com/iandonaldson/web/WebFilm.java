package com.iandonaldson.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			switch(request.getParameter("action")) {
			case "getAllFilms":
				request.getSession().setAttribute("filmList", filmDaoImpl.getAllFilms());
				request.getRequestDispatcher("FilmList.jsp").forward(request, response);
				break;
			case "getFilm":
				filmIDParam = request.getParameter("id");
				filmID = Integer.parseInt(filmIDParam);
				film = filmDaoImpl.getFilm(filmID);
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
			}
		}
	}

}