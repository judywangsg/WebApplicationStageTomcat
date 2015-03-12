<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@attribute name="pageTitle" fragment="true" %>
<%@attribute name="css" fragment="true" %>
<%@attribute name="javascripts" fragment="true" %>

<%@attribute name="title" fragment="true" %>
<%@attribute name="content" fragment="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>
			<jsp:invoke fragment="pageTitle"/><% //Titre de la page %>
		</title>
		
		<link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.min.css">
		
		<jsp:invoke fragment="css"/> <% //Pour inclure des fichiers ou code css %>
		
		<script type="text/javascript" src="lib/jquery/jquery-1.11.2.min.js"></script>
		<script type="text/javascript" src="lib/bootstrap/js/bootstrap.min.js"></script>
	</head>
  	<body>
	    <div id="header">
	    	HEADER <!-- MENU -->
	    </div>
	    
	    <div class="container">
	    	<!-- TITLE -->
	    	<h1 class="text-center">
	    		<jsp:invoke fragment="title"/> <% //Titre %>
	    	</h1>
	  
	  		<!-- ALERTS -->
	    	<c:if test="${not empty messSuccess}">
	    		<div class="alert alert-success alert-dismissible" role="alert">
	    			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	    			${messSuccess}
	    		</div>
	    	</c:if>
	    	<c:if test="${not empty messInfo}">
	    		<div class="alert alert-info alert-dismissible" role="alert">
	    			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	    			${messInfo}
	    		</div>
	    	</c:if>
	    	<c:if test="${not empty messWarning}">
	    		<div class="alert alert-warning alert-dismissible" role="alert">
	    			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	    			${messWarning}
	    		</div>
	    	</c:if>
	    	<c:if test="${not empty messError}">
	    		<div class="alert alert-danger alert-dismissible" role="alert">
	    			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	    			${messError}
	    		</div>
	    	</c:if>
	    	
	    	<!--  CONTENT  -->
	    	<div id="content">
		      	<jsp:doBody /> <% //Contenu de la page %>
		    </div>
	    </div>
	   
	    <jsp:invoke fragment="javascripts"/> <% //Pour include des fichiers javascripts ou code javascript %>
  	</body>
</html>