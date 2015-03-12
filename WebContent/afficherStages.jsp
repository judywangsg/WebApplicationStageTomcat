<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
	<jsp:attribute name="pageTitle">Affichage de tous les stages</jsp:attribute>
	
    <jsp:attribute name="css">
    	<style type="text/css">
    		th {
    			text-align:center;
    		}
    	</style>
    </jsp:attribute>
	
    <jsp:attribute name="title">
    	Listing des Stages
    </jsp:attribute>
    
    <jsp:body>
        <P><A href="index.jsp"><FONT face="Arial" color="#004080">Retour Accueil</FONT></A></P>
        
        <table class="table">
	  		<CAPTION> Tableau des Stages </CAPTION>
	  		<tr>
			 	<TH> Numero </TH>
				<TH> Libellé  </TH>
			 	<TH> Date début  </TH>
			 	<TH> Date fin </TH>
			 	<TH>Nombre de places </TH>
		  		<TH>Nombre d'inscrits </TH>
	 		</tr>
		 
		 	<c:forEach  items="${liste}"  var="item" >
		 	<tr class="text-center">
		     	<td>${item.id}</td>
		     	<td class="text-left">${item.libelle}</td>
		      	<td>
		      		<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${item.datedebut}" pattern="dd/MM/yyyy"/>
		      	</td>
		       	<td>
		       		<fmt:formatDate type="both" dateStyle="short"  timeStyle="short" value="${item.datefin}" pattern="dd/MM/yyyy" />
		      	</td>
		       
		      	<td>${item.nbplaces}</td>
			  	<td>${item.nbinscrits}</td>
			  	<td><a class="btn btn-default" href="Controleur?action=saisieStage&id=${item.id}">Modifier</a>
		  	</tr>
		 	</c:forEach>
		</TABLE>
    </jsp:body>
</t:layout>
