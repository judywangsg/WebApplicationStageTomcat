<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
	<jsp:attribute name="pageTitle">Exemple Layout</jsp:attribute>

    <jsp:attribute name="title">
    	TITRE
    </jsp:attribute>
    
    <jsp:body>
        <p>Hi I'm the heart of the message</p>
    </jsp:body>
</t:layout>