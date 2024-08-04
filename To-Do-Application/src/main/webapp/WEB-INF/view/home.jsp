<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:out value="${str}"></c:out></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>

	<div class="container mt-3">
		<h1 class="text-center">Welcome to To-Do App</h1>



		<div class="row mt-5">

				<div class="col-md-3 mt-5">
					<div class="list-group">
					   <c:choose>
                            <c:when test="${str=='Home'}">
                                  <div class="col-md-5 mt-5">
                                        <div class="list-group">
                                              <a href='<c:url value='/Home' ></c:url>'  class="list-group-item list-group-item-action active">
                                                   Home
                                               </a>
                                               <a href='<c:url value='/Add'></c:url>' class="list-group-item list-group-item-action">Add Task</a>
                                        </div>
                                  </div>
    						</c:when>      
    						<c:otherwise>
       	 							<div class="col-md-5 mt-5">
                                        <div class="list-group">
                                              <a href='<c:url value='/Home'></c:url>' class="list-group-item list-group-item-action " >
                                                   Home
                                               </a>
                                               <a href='<c:url value='/Add'></c:url>' class="list-group-item list-group-item-action active">Add Task</a>
                                        </div>
                                  </div>
    						</c:otherwise>
					  </c:choose>
	                </div> 
			  </div>
			
			<div class="col-md-9">
				<c:if test="${str=='Home' }">
				  <c:if test="${not empty todos }">
					<h2 class="text-center">All Todos</h2>
				  </c:if>	

						<c:forEach items="${todos }" var="t">

							<div class="card"  style="margin-top: 3%">
								<div class="card-body">
									<h3>
											<c:out value="${t.title}"></c:out>
					                  <div>
									    	<button class="btn btn-success" style="margin-left: 88%">  <a href='<c:url value='/done' />?title=${t.title}&content=${t.content} '  class="list-group-item list-group-item-action " >Done</a> </button>  
									   
									  </div>   
									</h3>
									<p>
										<c:out value="${t.content}"></c:out>        
									</p>
							  </div>
						 </div>

					  </c:forEach>
					
				   <c:if test="${not empty msg}">	
				  
				          <div class="alert alert-success">
					    		<b><c:out value="${msg}"></c:out></b>
						  </div>
				  	
				   </c:if>	

				</c:if>
				<c:if test="${str=='Add' }">
					<h2 class="text-center">Add Todos</h2>
					<br>
					<form:form action="saveToDo" method="post" modelAttribute="todo">

						<div class="form-group">
							<form:input path="title" cssClass="form-control"
								placeholder="Enter Title" />
						</div>

						<br>

						<div class="form-group">
							<form:textarea path="content" cssClass="form-control"
								placeholder="Enter Content" cssStyle="height:300px" />
						</div>

						<br>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add ToDo</button>
						</div>

					</form:form>

				</c:if>
			</div>
		</div>


	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>