package controle;

import java.beans.DesignMode;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Date;

import meserreurs.MonException;
import metier.Stage;

@WebServlet("/Controleur")
public class Controleur extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private static final String ACTION_TYPE = "action";
	private static final String SAISIE_STAGE = "saisieStage";
	private static final String AFFICHER_STAGE = "afficheStage";
	private static final String AJOUT_STAGE = "ajoutStage";
	private static final String MODIFIER_STAGE = "modifierStage";
	private static final String RECHERCHER_STAGE = "rechercheStage";
	private static final String ERROR_PAGE = null;

	// le format est une combinaison de MM dd yyyy avec / ou –
	// exemple dd/MM/yyyy
	public Date conversionChaineenDate(String unedate, String unformat) throws Exception
	{
		Date datesortie;
		// on définit un format de sortie
		SimpleDateFormat defFormat = new SimpleDateFormat(unformat);
		datesortie = defFormat.parse(unedate);
		return datesortie;
	}


	protected void processusTraiteRequete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, MonException, Exception
	{
		String actionName = request.getParameter(ACTION_TYPE);
		String destinationPage = ERROR_PAGE;
			
		try 
		{
			//Executer les actions
			if (SAISIE_STAGE.equals(actionName))
			{
				request.setAttribute("stage", new Stage());
				
				destinationPage = "/saisieStage.jsp";
			} else if (AJOUT_STAGE.equals(actionName))
			{
				Stage unStage = new Stage();
				unStage.setId(request.getParameter("id"));
				unStage.setLibelle(request.getParameter("libelle"));
				unStage.setDatedebut(conversionChaineenDate(request.getParameter("datedebut"), "yyyy/MM/dd"));
				unStage.setDatefin(conversionChaineenDate(request.getParameter("datefin"), "yyyy/MM/dd"));
				unStage.setNbplaces(Integer.parseInt(request.getParameter("nbplaces")));
				unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbplaces"))).intValue());
				unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbinscrits"))).intValue());
				unStage.insertionStage();
				
				destinationPage = "/index.jsp";
			} else if (MODIFIER_STAGE.equals(actionName))
			{
				/*
				int id = Integer.valueOf(request.getParameter("id")); //ID stage
				
				Stage monStage = Stage.find(id);
				
				if (request.getParameter("submitted") != null)
				{ //formulaire envoyé
					monStage.setLibelle(request.getParameter("libelle"));
					//faire pareil pour le reste des attributs
					
					monStage.update(); //mis à jour SQL du stage
				}
				
				destinationPage = "/modifierStage.jsp";
				*/
			}
			else if (AFFICHER_STAGE.equals(actionName))
			{
				Stage unStage = new Stage();
				request.setAttribute("affichageListe", 1);
				
				List<Stage> listeStages = unStage.rechercheLesStages();
				request.setAttribute("liste", listeStages);
				
				destinationPage = "/afficherStages.jsp";
			} 
			else if (RECHERCHER_STAGE.equals(actionName))
			{
				if (request.getParameter("submitted") != null)
				{ //formulaire envoyé
					List<Stage> listeStages = Stage.rechercheUnStage(request.getParameter("keyword"));
					request.setAttribute("liste", listeStages);
				}
			
				destinationPage = "/rechercherStage.jsp";
			} 	
		} catch (Exception e) 
		{ //Erreurs
			request.setAttribute("MesErreurs", e.getMessage());
			destinationPage = "/Erreur.jsp";
			System.out.println(e.getMessage());
		}
			
		// Redirection vers la page jsp appropriee 
	    RequestDispatcher dispatcher =getServletContext().getRequestDispatcher(destinationPage);
        dispatcher.forward(request, response); 
	} 

	//L’appel de cette procédure se fait avec :
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		try
	    {
			processusTraiteRequete(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace(); 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		try
		{
			processusTraiteRequete(request, response);
		}
		catch( Exception e)
		{
			e.printStackTrace();;
		}
	}
}