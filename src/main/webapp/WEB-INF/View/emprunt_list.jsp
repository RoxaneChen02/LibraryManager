<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Library Management</title>
  <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="assets/css/custom.css" rel="stylesheet" type="text/css" />
</head>

<body>
  <jsp:include page='menu.jsp'></jsp:include>
  <main>
    <section class="content">
      <div class="page-announce valign-wrapper">
        <a href="#" data-activates="slide-out" class="button-collapse valign hide-on-large-only"><i class="material-icons">menu</i></a>
        <h1 class="page-announce-text valign">Liste des emprunts</h1>
      </div>
      <div class="row">
        <div class="container">
	        <div class="col s12">
	          <table class="striped">
                <thead>
                    <tr>
                        <th>Livre</th>
                        <th>Membre emprunteur</th>
                        <th>Date d'emprunt</th>
                        <th>Retour</th>
                    </tr>
                </thead>
                <tbody id="results">
                
                  
					<c:forEach items="${listEmprunt}" var="emprunt">
                    	<tr>
                        	<td> ${livreInstance.getById(emprunt.getIdLivre()).getTitre()}, <em>${livreInstance.getById(emprunt.getIdLivre()).getAuteur()}</em></td>
                        	<td>  ${membreInstance.getById(emprunt.getIdMembre()).getPrenom()}  ${membreInstance.getById(emprunt.getIdMembre()).getNom()} </td>
                        	<td> ${emprunt.getDateEmprunt()} </td>
                        	
                        	<c:if test="${emprunt.getDateRetour() == null}">
								<td>
                            		<a href="emprunt_return?id=${emprunt.getId() }"><ion-icon class="table-item" name="log-in"></a>
                        		</td>
							</c:if>
							
							<c:if test="${emprunt.getDateRetour() != null}">
								<td>
                            		${emprunt.getDateRetour()}
                        		</td>
							</c:if>
                    	</tr>
					</c:forEach>

					
					
                </tbody>
            </table>
          </div>
        </div>
      </div>
    </section>
  </main>
  <jsp:include page='footer.jsp'></jsp:include>
</body>
</html>
