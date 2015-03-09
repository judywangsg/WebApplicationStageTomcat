<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="title" fragment="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.min.css">
	</head>
  	<body>
	    <div id="header">
	    	HEADER <!-- MENU -->
	    </div>
	    
	    <div class="container">
	    	<h1 class="text-center">
	    		<jsp:invoke fragment="title"/> <% //utiliser <jsp:attribute name="title"></jsp:attribute> %>
	    	</h1>
	    	
	    	<div id="content">
		      	<jsp:doBody/><% //Permet d'appeler ensuite <jsp:body></jsp:body> %>
		    </div>
	    </div>
	   
  	</body>
</html>