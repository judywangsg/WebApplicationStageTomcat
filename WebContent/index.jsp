<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date,java.text.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<% request.setAttribute("dateNow",  DateFormat.getDateTimeInstance(DateFormat.FULL,DateFormat.FULL).format(new Date())); %>

<t:layout>
	<jsp:attribute name="pageTitle">Accueil</jsp:attribute>

    <jsp:attribute name="title">Gestion des Stages  HIGH TECH</jsp:attribute>
    
    <jsp:body>
   		<div>Nous sommes le ${dateNow}</div>
   		<br/>
        <div id="menu">
		  <ul>
		      <li><a href="Controleur?action=saisieStage">Saisie d'un stage</a></li>
		      <li><a href="Controleur?action=afficheStage">Affichage liste des stages</a></li>
		      <li><a href="Controleur?action=rechercheStage">Recherche d'un stage</a></li>
		  </ul>
		</div>
    </jsp:body>
</t:layout>
