<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<H1> Gestion des Stages  HIGH TECH </H1> <BR> <BR> 
<H2> Nous sommes le <%= DateFormat.getDateTimeInstance(DateFormat.FULL,DateFormat.FULL).format(new Date()) %> </H2>
<div id="menu">
  <ul>
      <li><a href="Controleur?action=saisieStage">Saisie d'un stage</a></li>
      <li><a href="Controleur?action=afficheStage">Affichage liste des stages</a></li>
      <!--  <li><a href="Controleur?action=rechercheStage">Recherche d'un stage</a></li>   -->
  </ul>
</div>
</body>
</html> 
