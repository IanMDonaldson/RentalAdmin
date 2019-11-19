package com.iandonaldson.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iandonaldson.data.ActorDaoImpl;
import com.iandonaldson.data.Actor;

/**
 * Servlet implementation class Actor
 */
@WebServlet("/WebActor")
public class WebActor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private String actorIDParam;
       private int actorID;
       private Actor actor;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WebActor() {
        super();
 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		if (request.getParameter("action") == null) {
			request.getRequestDispatcher("ActorList.jsp").forward(request, response);
		}
		else {
			ActorDaoImpl actorDaoImpl = new ActorDaoImpl();
			switch (request.getParameter("action")) {
			case "getAllActors":
				request.getSession().setAttribute("actorList", actorDaoImpl.getAllActors());
				request.getRequestDispatcher("ActorList.jsp").forward(request, response);
				break;
			case "getActor":
				actorIDParam = request.getParameter("id");
				actorID = Integer.parseInt(actorIDParam);
				actor = actorDaoImpl.getActor(actorID);
				request.getSession().setAttribute("actor", actor);
				request.getSession().setAttribute("actorsFilmList", actor.getFilmList());
				request.getRequestDispatcher("Actor.jsp").forward(request, response);
				break;
			case "updateActorGET":
				actorIDParam = request.getParameter("id");
				actorID = Integer.parseInt(actorIDParam);
				actor = actorDaoImpl.getActor(actorID);
				request.getSession().setAttribute("id", Integer.toString(actorID));
				request.getSession().setAttribute("firstName", actor.getFirstName());
				request.getSession().setAttribute("lastName", actor.getLastName());
				request.getRequestDispatcher("ActorUpdate.jsp").forward(request, response);
				break;
			case "manageActors":
				request.getRequestDispatcher("ActorManagement.jsp").forward(request, response);
				break;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActorDaoImpl actorDaoImpl = new ActorDaoImpl();
		if (request.getParameter("action") == null) {
			request.getRequestDispatcher("Menu.jsp").forward(request, response);
		}
		else {
			switch (request.getParameter("action")) {
			case "updateActorPOST":
				actorIDParam = request.getParameter("id");
				actorID = Integer.parseInt(actorIDParam);
				actor = actorDaoImpl.getActor(actorID);
				actor.setFirstName(request.getParameter("firstName").toString());
				actor.setLastName(request.getParameter("lastName").toString());
				
				if (!actorDaoImpl.updateActor(actor) ) {
					request.getRequestDispatcher("updateFailure.jsp").forward(request, response);
				}
				else {
					request.getSession().setAttribute("actor", actor);
					request.getSession().setAttribute("films", actor.getFilmList());
					request.getRequestDispatcher("Actor.jsp").forward(request, response);		
				}
				break;
			case "searchActorPOST":
				actorIDParam = request.getParameter("actorName").toString();
				if (actorDaoImpl.validActorNameSearch(actorIDParam)) {
					request.getSession().setAttribute("actorList", actorDaoImpl.getActorsByName(actorIDParam));
					request.getRequestDispatcher("ActorList.jsp").forward(request, response);
				}
				break;
			
			}
		}
}

}
