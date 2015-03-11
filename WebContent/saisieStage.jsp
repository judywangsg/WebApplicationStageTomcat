<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
	<jsp:attribute name="pageTitle">Ajout d'un stage</jsp:attribute>

    <jsp:attribute name="title">
    	Formulaire d'ajout d'un stage
    </jsp:attribute>
    
    <jsp:body>
  		<input type ="hidden" name="uneErreur"  value="${MesErreurs}"  id ="id_erreur" >
  
	  	<form method="post" action="Controleur?action=saisieStage">
	  		<input type="hidden" name="typeAction" value="ajout"  id="type"/>
		  	<table>
		    	<!-- input fields -->
			    <tr>
			      <td>Numéro</td>
			      <td><input type="text" name="id" value="${stage.id}" id="id"/></td>
			    </tr>
			    <tr>
			      <td>Libellé</td>
			      <td><input type="text" name="libelle" value="${stage.libelle}" id="libelle"/></td>
			    </tr>
			    <tr>
			    <td>Date de début du stage</td>
			     <td><input type="text" name="datedebut" value="${stage.datedebut}" id="datedebut"/></td>
			     </tr>
			      <tr>
			      <td>Date de fin de stage</td>
			     <td><input type="text" name="datefin" value="${stage.datefin}" id="datefin"/></td>
			    </tr>
			    
			    <tr>
			      <td>Nombre de places </td>
			      <td><input type="text" name="nbplaces" value="${stage.nbplaces}" id="nbplaces"/></td>
			    </tr>
			    <tr>
			      <td>Nombre d'inscrits </td>
			      <td><input type="text" name="nbinscrits" value="${stage.nbinscrits}" id="nbinscrits"/></td>
			    </tr>
			    <!-- Boutons Ajouter/Reset -->
			    <tr>
			      <td colspan="2">
			        <input type="submit" name="ajouter" value="Ajouter"/>
			        &nbsp;&nbsp;
			        <input type="reset" name="reset" value="Reset" />
			      </td>
			    </tr>
		  	</table>
	  	</form>
    </jsp:body>
</t:layout>
