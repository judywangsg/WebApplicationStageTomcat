<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ page import="java.text.DateFormat, java.text.SimpleDateFormat, metier.Stage" %>
<% 
	//Traitement des dates
	Stage stage = (Stage)request.getAttribute("stage");
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	
	String dd = stage.getDatedebut() != null ? dateFormat.format(stage.getDatedebut()) : "";
	String df = stage.getDatefin() != null ? dateFormat.format(stage.getDatefin()) : "";
	
	request.setAttribute("dd", dd);
	request.setAttribute("df", df);
%>

<t:layout>
	<jsp:attribute name="pageTitle">Saisie d'un stage</jsp:attribute>

    <jsp:attribute name="title">
    	Formulaire <c:if test="${type == 'ajout'}">d'ajout</c:if><c:if test="${type == 'modif'}">de modification</c:if> d'un stage
    </jsp:attribute>
    
    <jsp:body>
	  	<form method="post" action="Controleur?action=saisieStage">
	  		<input type="hidden" name="typeAction" value="${type}"  id="type"/>
		  	<table>
		    	<!-- input fields -->
			    <tr>
			      <td>Numéro</td>
			      <td><input type="text" name="id" value="${stage.id}" id="id" /></td>
			    </tr>
			    <tr>
			      <td>Libellé</td>
			      <td><input type="text" name="libelle" value="${stage.libelle}" id="libelle"/></td>
			    </tr>
			    <tr>
			    <td>Date de début du stage</td>
			     <td><input type="text" name="datedebut" value="${dd}" id="datedebut"/></td>
			     </tr>
			      <tr>
			      <td>Date de fin de stage</td>
			     <td><input type="text" name="datefin" value="${df}" id="datefin"/></td>
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
			      	<c:if test="${type == 'ajout'}">
					   <input type="submit" name="ajouter" value="Ajouter" />
					</c:if>
			        <c:if test="${type == 'modif'}">
					   <input type="submit" name="ajouter" value="Modifier" />
					</c:if>
			        &nbsp;&nbsp;
			        <input type="reset" name="reset" value="Reset" />
			      </td>
			    </tr>
		  	</table>
	  	</form>
    </jsp:body>
</t:layout>
