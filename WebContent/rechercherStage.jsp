<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
	<jsp:attribute name="pageTitle">Recherche de stage</jsp:attribute>

    <jsp:attribute name="title">
    	Recherche de stage
    </jsp:attribute>
    
    <jsp:body>
        <form method="post" action="Controleur">
        	<input type="hidden" value="rechercheStage" name="action" />
        	
        	<input type="text" value="" name="keyword" required />&nbsp;&nbsp;&nbsp;
        	<input type="submit" value="Rechercher" />
        </form>
    </jsp:body>
</t:layout>