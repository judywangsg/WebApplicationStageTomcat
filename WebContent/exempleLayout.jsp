<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>
    <jsp:attribute name="header">
       <!--  HEADER  -->
       <h1>Welcome</h1>
    </jsp:attribute>
    
    <jsp:attribute name="footer">
    	<!--  FOOTER  -->
      <p id="copyright">Copyright 1927, Future Bits When There Be Bits Inc.</p>
    </jsp:attribute>
    
    <jsp:body>
    	<!-- CONTENT  -->
        <p>Hi I'm the heart of the message</p>
    </jsp:body>
</t:genericpage>