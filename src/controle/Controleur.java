package controle;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

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
	private static final String RECHERCHER_STAGE = "rechercheStage";
	private static final String ERROR_PAGE = "/index.jsp";

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
		
		/*
		 * Un message s'affiche (alert bootstrap dans layout) 
		 * en utilisant les attributs suivant (request.setAttribut('', '')) :
		 * 	- messSuccess : message en cas de succès (cadre vert)
		 * 	- messInfo (cadre bleu)
		 * 	- messWarning (cadre orange)
		 * 	- messError (cadre rouge)
		 */
		
		//Executer les actions
		if (SAISIE_STAGE.equals(actionName))
		{
			String typeAction = request.getParameter("typeAction");
			
			try {
				Stage unStage = null;
				if ((typeAction == null || (typeAction != null && typeAction.contentEquals("modif"))) 
						&& request.getParameter("id") != null)
				{ //Page modif et variable ID existe
					unStage = Stage.find(request.getParameter("id")); //Rechercher le stage par son ID
					request.setAttribute("type", "modif"); //Attribut pour la vue
				} else {
					unStage = new Stage();
					request.setAttribute("type", "ajout"); //Attribut pour la vue
				}
				
				request.setAttribute("stage", unStage); 
				
				if (typeAction != null && (typeAction.contentEquals("ajout") || typeAction.contentEquals("modif")))
				{ //Formulaire envoyé avec les champs pour un stage
					boolean valid = true;
					try {
						unStage.setId(request.getParameter("id"));
						unStage.setLibelle(request.getParameter("libelle"));
						unStage.setDatedebut(conversionChaineenDate(request.getParameter("datedebut"), "yyyy/MM/dd"));
						unStage.setDatefin(conversionChaineenDate(request.getParameter("datefin"), "yyyy/MM/dd"));
						unStage.setNbplaces(Integer.parseInt(request.getParameter("nbplaces")));
						unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbplaces"))).intValue());
						unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbinscrits"))).intValue());
					} catch (ParseException pe) {
						request.setAttribute("messError", "Impossible de convertir une date (yyyy/MM/dd).");
						System.out.println(pe);
						valid = false;
					} catch (NumberFormatException nfe) {
						request.setAttribute("messError", "Nombre de place incorrect");
						System.out.println(nfe);
						valid = false;
					}

					if (valid)
					{
						if (typeAction.contentEquals("ajout"))
						{
							unStage.insertionStage(); //insertion en bd
							request.setAttribute("messSuccess", "Le stage a bien été inséré!");
							request.setAttribute("type", "modif"); //Vue modification
						} else if (typeAction.contentEquals("modif")) 
						{
							unStage.updateStage();
							request.setAttribute("messSuccess", "Le stage a bien été mise à jour!");
						}
					}
				} 
			} catch (Exception e)
			{
				request.setAttribute("messError", e.getMessage());
				System.out.println(e);
			}
			
			destinationPage = "/saisieStage.jsp";
		} 
		else if (AFFICHER_STAGE.equals(actionName))
		{
			try {
				request.setAttribute("affichageListe", 1);
				
				List<Stage> listeStages = Stage.rechercheLesStages("");
				request.setAttribute("liste", listeStages);
			} catch (Exception e)
			{
				request.setAttribute("messError", e.getMessage());
				System.out.println(e.getMessage());
			}
			
			destinationPage = "/afficherStages.jsp";
		} 
		else if (RECHERCHER_STAGE.equals(actionName))
		{
			try {
				if (request.getParameter("champ") != null)
				{ //Quand le formulaire de la vue rechercherStage est envoyé, le paramètre champ existe (champ text)
					//On recherche un ou plusieurs stage selon le mot clé que l'utilisateur a tapé
					List<Stage> listeStages = Stage.rechercheLesStages(request.getParameter("champ")); 
					
					//On ajoute la liste comme attribut pour y avoir accès dans la vue
					request.setAttribute("liste", listeStages);
				}
			} catch (Exception e)
			{ //Si un problème survient, on ajoute l'attribut messError pour afficher l'alerte dans la vue
				request.setAttribute("messError", e.getMessage());
				System.out.println(e.getMessage());
			}
			
			//Affichage de la vue rechercherStage par défaut
			destinationPage = "/rechercherStage.jsp";
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