<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css"/>
<!-- Include JS File Here -->
<script src="js/script.js"></script>
<title>MongoDB for Java Developers - Project Based by Sunil Gupta</title>
<style>

</style>
</head>
<body>
<div class="social">
	<img src="images/socialicons.png" height="21px" style="border:0" alt="" >
	<img src="images/socialiconsTweeter.png" height="21px" style="border:0" alt="" >
	<img src="images/socialYouTube.png" height="21px" style="border:0" alt="" >
</div>

	<div class="navigation" align="center">
	  		<ul class="nav">
			  <li><a href="#courses">Courses</a></li>
			  <li><a href="#tutorials">Tutorials</a></li>
			  <li><a href="#about">About Us</a></li>
			  <li><a href="#home">Home</a></li>
			</ul>
			
	</div>
<header>
<a href="./"><img src="images/mongo-db-alternate-logo.png" width="120px" height="100px" alt="" /></a>
 	
</header>


<h2 align="center">User Management System- Using MongoDB/Java/JSP/JSTL </h2>
<div class="container">
<div align="center" class="main">
    <%-- User Add/Edit logic --%>
    <c:if test="${requestScope.error ne null}">
        <strong style="color: red;"><c:out
                value="${requestScope.error}"></c:out></strong>
    </c:if>
    <c:if test="${requestScope.success ne null}">
        <strong style="color: green;"><c:out
                value="${requestScope.success}"></c:out></strong>
    </c:if>
    <c:url value="/addUser" var="addURL"></c:url>
    <c:url value="/editUser" var="editURL"></c:url>
 
    <%-- Edit Request --%>
    <c:if test="${requestScope.user ne null}">
        <form action='<c:out value="${editURL}"></c:out>' method="post">
            <label>ID:</label> 
            <input type="text" value="${requestScope.user.id}" readonly="readonly" name="id"><br> 
            <label>Name:</label> 
            <input type="text" value="${requestScope.user.name}" name="name"><br>
            <label>Email Id:</label> 
            <input type="text" value="${requestScope.user.email}" name="email"><br>  
            <label>Password:</label> 
            <input type="password" value="${requestScope.user.password}" name="password"><br>               
            <input type="submit" value="Edit User">
        </form>
    </c:if>
 
    <%-- Add Request --%>
    
    <c:if test="${requestScope.user eq null}">  
        <form action='<c:out value="${addURL}"></c:out>' method="post">
            <label>Name:</label> 
            <input type="text" name="name"><br> 
            <label>Email Id:</label> 
            <input type="text" name="email"><br> 
            <label>Password:</label> 
            <input type="password" name="password"><br> 
            <input type="submit" value="Add User">
        </form>
    </c:if>
 
    <%-- Users List Logic --%>
    <c:if test="${not empty requestScope.users}">
        <table>
        <caption>Registered Users Details </caption>
            <tbody>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email Id</th>
                    <th>Password</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach items="${requestScope.users}" var="user">
                    <c:url value="/editUser" var="editURL">
                        <c:param name="id" value="${user.id}"></c:param>
                    </c:url>
                    <c:url value="/deleteUser" var="deleteURL">
                        <c:param name="id" value="${user.id}"></c:param>
                    </c:url>
                    <tr>
                        <td><c:out value="${user.id}"></c:out></td>
                        <td><c:out value="${user.name}"></c:out></td>
                        <td><c:out value="${user.email}"></c:out></td>
                        <td><c:out  value="*********"></c:out></td>
                        <td><a
                            href='<c:out value="${editURL}" escapeXml="true"></c:out>'>Edit</a></td>
                        <td><a
                            href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
 </div>
 </div>
</body>

</html>