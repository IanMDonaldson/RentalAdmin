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
				request.getSession().setAttribute("FilmList", film.getActorList());
				request.getRequestDispatcher("Film.jsp").forward(request, response);
				break;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
