package com.iandonaldson.web;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

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
       private String actorFName;
       private String actorLName;
       
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
			case "addActorGET":
				/* call actordaoimpl to return the last actor's id + 1
				 * push it to the addactor page to be verified with actorAddPOST and actordaoimpl*/
				actorID = actorDaoImpl.getNewActorID();
				request.getSession().setAttribute("id", Integer.toString(actorID));
				request.getRequestDispatcher("AddActor.jsp").forward(request, response);
				break;
			case "deleteActorGET":
				/* call actorDaoimpl to return a list of removable actors to present 
				 * on the deleteactor.jsp page if no Actors returned/list = NULL, refer to failure page
				 * eg, */
				List<Actor> actors = new LinkedList<Actor>();
				actors = actorDaoImpl.getRemovableActors();
				if (actors == null) {
					request.getSession().setAttribute("add", false);
					request.getSession().setAttribute("delete", false);
					request.getSession().setAttribute("update", false);
					request.getSession().setAttribute("noActorsToDelete", true);
				} else {
					request.getSession().setAttribute("removableActors", actorDaoImpl.getRemovableActors());
					request.getRequestDispatcher("ActorDelete.jsp").forward(request, response);
				}
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
					request.getSession().setAttribute("update", true);
					request.getRequestDispatcher("FailurePage.jsp").forward(request, response);
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
			case "addActorPOST":
				/* verify if the first and last name entered is a copy of another entry in the actor's table
				 * if so, add, if not present a failure page that redirects to the actor management page*/
				actorIDParam = request.getParameter("id");
				actorID = Integer.parseInt(actorIDParam);
				actorFName = request.getParameter("firstName");
				actorLName = request.getParameter("lastName");
				actor.setId(actorID);
				actor.setFirstName(actorFName);
				actor.setLastName(actorLName);
				//make if/else below easier to read
				boolean actorExists = actorDaoImpl.actorExists(actor);
				
				if (actorExists) {
					request.getSession().setAttribute("add", true);
					request.getRequestDispatcher("FailurePage.jsp").forward(request, response);
				}
				else {
					actorDaoImpl.addActor(actor);
					request.getSession().setAttribute("actor", actor.getId());
					request.getSession().setAttribute("films", actor.getFilmList());
					request.getRequestDispatcher("Actor.jsp").forward(request, response);
				}
				break;
				//TODO: add a film list to retrieve from form later when more advanced actor adding is implemented
			case "deleteActorPOST":
				/* call actordaoimpl function that executes the delete query, 
				 * 	then dispatch back to actor management*/
				actorIDParam = request.getParameter("removableActors").toString();
				actorID = Integer.parseInt(actorIDParam);
				actor = actorDaoImpl.getActor(actorID);
				if (!actorDaoImpl.deleteActor(actor)) {
					request.getSession().setAttribute("delete", true);
					request.getRequestDispatcher("FailurePage.jsp").forward(request, response);
				}
				else {
					request.getRequestDispatcher("ActorManagement.jsp").forward(request, response);
				}
				break;
			
			}
		}
}

}
