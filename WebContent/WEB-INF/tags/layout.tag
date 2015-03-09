<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="pageTitle" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="content" fragment="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title><jsp:invoke fragment="pageTitle"/></title>
		
		<link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.min.css">
	</head>
  	<body>
	    <div id="header">
	    	HEADER <!-- MENU -->
	    </div>
	    
	    <div class="container">
	    	<h1 class="text-center">
	    		<jsp:invoke fragment="title"/>
	    	</h1>
	    	
	    	<div id="content">
		      	<jsp:doBody />
		    </div>
	    </div>
	   
  	</body>
</html>