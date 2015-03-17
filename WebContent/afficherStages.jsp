<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
	<jsp:attribute name="pageTitle">Affichage de tous les stages</jsp:attribute>
		
    <jsp:attribute name="title">
    	Listing des Stages
    </jsp:attribute>
    
    <jsp:attribute name="javascripts">
    	<script type="text/javascript">
    		$(document).ready(function() {
    			//Confirmation avant suppression
    			$(".btnSuppr").click(function() {
    				var btn = $(this);
    				
    				var num = $(this).parent().parent().find('.id').text(); //numéro stage
    				var libelle = $(this).parent().parent().find('.libelle').text(); //libelle stage
    	
    				//Dialog 
    				BootstrapDialog.confirm({
    					'title' : 'Êtes vous sûr de vouloir supprimer le stage n°<b>'+num+'</b> :',
    					'message' : '<div class="text-center">'+libelle+'</div>',
    					callback :  function(result){
	    		            if(result) {
	    		            	window.location.href = btn.attr('href'); //utiliser l'adresse du lien 
	    		            }
    					}
    		        }); 
    				
    				return false; //annulé envoi formulaire 
    			});
    		});
    	</script>
    </jsp:attribute>
    
    <jsp:body>       
        <table class="table">
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
		     	<td class="id"><a href="Controleur?action=saisieStage&id=${item.id}">${item.id}</a></td>
		     	<td class="text-left libelle">${item.libelle}</td>
		      	<td>
		      		<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${item.datedebut}" pattern="dd/MM/yyyy"/>
		      	</td>
		       	<td>
		       		<fmt:formatDate type="both" dateStyle="short"  timeStyle="short" value="${item.datefin}" pattern="dd/MM/yyyy" />
		      	</td>
		       
		      	<td>${item.nbplaces}</td>
			  	<td>${item.nbinscrits}</td>
			  	<td>
			  		<a class="btn btn-default" href="Controleur?action=saisieStage&id=${item.id}">Modifier</a>&nbsp;&nbsp;&nbsp;
			  		<a class="btn btn-danger btnSuppr" href="Controleur?action=supprimerStage&id=${item.id}">Supprimer</a>
			  	</td>
		  	</tr>
		 	</c:forEach>
		</TABLE>
    </jsp:body>
</t:layout>
