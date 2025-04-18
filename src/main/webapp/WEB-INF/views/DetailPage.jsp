<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
    <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SignUp Details</title>
</head>
<body>
    <h2>SignUp Details</h2>
    <table  border="1">
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Contact Number</th>
                <th>Password</th>
            </tr>
        </thead>
        <tbody>
          <c:forEach items="${userslist}" var="users">
    <tr>
        <td>${users.firstName}</td>
        <td>${users.lastName}</td>
        <td>${users.email}</td>
        <td>${users.gender}</td>
        <td>${users.contactNum}</td>
        <td>${users.password}</td>
    </tr>
</c:forEach>

        </tbody> 
    </table>
</body>
</html>