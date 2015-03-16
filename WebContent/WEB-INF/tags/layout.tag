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
			<jsp:invoke fragment="pageTitle"/> ~ Gestion Stages<% //Titre de la page %>
		</title>
		
		<link rel="icon" type="image/png" href="images/icone.png" />
		
		<link rel="stylesheet" type="text/css" href="lib/bootstrap/css/theme.min.css">
		<link rel="stylesheet" type="text/css" href="lib/bootstrapDialog/css/bootstrap-dialog.min.css">
		<link rel="stylesheet" type="text/css" href="css/layout.css">
		
		<jsp:invoke fragment="css"/> <% //Pour inclure des fichiers ou code css %>
		
		<script type="text/javascript" src="lib/jquery/jquery-1.11.2.min.js"></script>
		<script type="text/javascript" src="lib/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="lib/bootstrapDialog/js/bootstrap-dialog.min.js"></script>
	</head>
  	<body>
  		<!--  MENU  -->
	    <nav class="navbar navbar-inverse" style="margin-bottom:0px;">
		  	<div class="container-fluid">
			    <div class="navbar-header">
			      	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
			      	</button>
			      <a class="navbar-brand" href="index.jsp">Gestion des Stages</a>
		    	</div>
		
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			    	<form class="navbar-form navbar-left" role="search" action="Controleur">
			    		<input type="hidden" value="rechercheStage" name="action" />
				        <div class="form-group">
				        	<div class="input-group">
					        	<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
					         	<input type="text" class="form-control" placeholder="Rechercher un stage">
					         </div>
				        </div>
			     	</form>
		     		<ul class="nav navbar-nav">
				        <li><a href="Controleur?action=afficheStage">Liste complète</a></li>
				        <li><a href="Controleur?action=saisieStage">Ajouter</a></li>
				        <li><a href="Controleur?action=rechercheStage">Rechercher</a></li>
			      	</ul>
		  		</div><!-- /.navbar-collapse -->
	  		</div><!-- /.container-fluid -->
		</nav>
	    
	    <div class="container-fluid">
	    	<!-- TITLE -->
	    	<div class="row">
	    		<div class="col-md-12">
	    			<h2>
	    				<jsp:invoke fragment="title"/> <% //Titre %>
	    			</h2>
	    		</div>
	    	</div>
	    	
	  		<div class="row">
	  			<div class="col-md-12">
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
	  			</div>
	  		</div>
	    	
	    	<!--  CONTENT  -->
	    	<div class="row">
	    		<div class="col-md-12">
	    			<div class="well well-lg">
		      			<jsp:doBody /> <% //Contenu de la page %>
		      		</div>
		      	</div>
		    </div>
	    </div>
	   
	    <jsp:invoke fragment="javascripts"/> <% //Pour include des fichiers javascripts ou code javascript %>
  	</body>
</html>