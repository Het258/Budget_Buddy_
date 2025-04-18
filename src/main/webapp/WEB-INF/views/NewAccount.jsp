<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>New Account | Budget Buddy</title>
  	<meta content="" name="description">
  	<meta content="" name="keywords">

  	<!-- Favicons -->
  	<link href="assets/img/favicon.png" rel="icon">
  	<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  	<!-- Google Fonts -->	
  	<link href="https://fonts.gstatic.com" rel="preconnect">
  	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  	<!-- Vendor CSS Files -->
  	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  	<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  	<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  	<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  	<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  	<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  	<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
	
  	<!-- Template Main CSS File -->
  	<link href="assets/css/style.css" rel="stylesheet">
  	
  	<!-- Custom CSS for the account form -->
  	<style>
  	    .account-form {
  	        background-color: #fff;
  	        border-radius: 8px;
  	        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  	        padding: 30px;
  	        max-width: 600px;
  	        margin: 20px auto;
  	    }
  	    
  	    .account-form .form-group {
  	        margin-bottom: 20px;
  	        display: flex;
  	        flex-wrap: wrap;
  	        align-items: center;
  	    }
  	    
  	    .account-form label {
  	        font-weight: 600;
  	        color: #4154f1;
  	        width: 120px;
  	        margin-right: 15px;
  	    }
  	    
  	    .account-form input[type="text"],
  	    .account-form input[type="number"],
  	    .account-form select {
  	        flex: 1;
  	        min-width: 250px;
  	        padding: 10px 15px;
  	        border: 1px solid #dee2e6;
  	        border-radius: 4px;
  	        font-size: 14px;
  	        transition: border-color 0.3s, box-shadow 0.3s;
  	    }
  	    
  	    .account-form input[type="text"]:focus,
  	    .account-form input[type="number"]:focus,
  	    .account-form select:focus {
  	        border-color: #4154f1;
  	        box-shadow: 0 0 0 0.2rem rgba(65, 84, 241, 0.25);
  	        outline: none;
  	    }
  	    
  	    .account-form select {
  	        cursor: pointer;
  	        background-color: #f8f9fa;
  	    }
  	    
  	    .checkbox-container {
  	        display: flex;
  	        align-items: center;
  	        margin-bottom: 20px;
  	        margin-left: 135px;
  	    }
  	    
  	    .account-form input[type="checkbox"] {
  	        margin-right: 10px;
  	        cursor: pointer;
  	        width: 16px;
  	        height: 16px;
  	    }
  	    
  	    .action-buttons {
  	        text-align: center;
  	        margin-top: 10px;
  	    }
  	    
  	    .account-form input[type="submit"] {
  	        background-color: #4154f1;
  	        color: white;
  	        border: none;
  	        padding: 12px 25px;
  	        border-radius: 4px;
  	        cursor: pointer;
  	        font-weight: 600;
  	        transition: background-color 0.3s;
  	    }
  	    
  	    .account-form input[type="submit"]:hover {
  	        background-color: #364af0;
  	    }
  	    
  	    /* Optional animation for form elements */
  	    @keyframes fadeIn {
  	        from { opacity: 0; transform: translateY(10px); }
  	        to { opacity: 1; transform: translateY(0); }
  	    }
  	    
  	    .form-group {
  	        animation: fadeIn 0.5s ease-out forwards;
  	    }
  	    
  	    .form-group:nth-child(1) { animation-delay: 0.1s; }
  	    .form-group:nth-child(2) { animation-delay: 0.2s; }
  	    .form-group:nth-child(3) { animation-delay: 0.3s; }
  	    .checkbox-container { animation-delay: 0.4s; animation: fadeIn 0.5s ease-out forwards; }
  	    .action-buttons { animation-delay: 0.5s; animation: fadeIn 0.5s ease-out forwards; }
  	</style>
  	
	<!-- =======================================================
  	* Template Name: NiceAdmin
  	* Updated: Jan 29 2024 with Bootstrap v5.3.2
  	* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  	* Author: BootstrapMade.com
  	* License: https://bootstrapmade.com/license/
  	======================================================== -->
</head>

<body>

	<!-- ======= Session Validate ======= -->
  	<%@include file="SessionValidate.jsp" %>
  	<!-- End Session Validate -->

  	<!-- ======= Header ======= -->
  	<jsp:include page="AdminHeader.jsp"></jsp:include>
  	<!-- End Header -->

  	<!-- ======= Sidebar ======= -->
  	<jsp:include page="AdminSidebar.jsp"></jsp:include>
  	<!-- End Sidebar-->

  	<main id="main" class="main">

    	<div class="pagetitle">
      		<h1>New Account</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="/">Home</a></li>
          			<li class="breadcrumb-item active">New Account</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
    	    <div class="account-form">
			    <form action="saveaccount" method="post">
			        <div class="form-group">
			            <label for="title">Title:</label>
			            <input type="text" id="title" name="title" required>
			        </div>
			        
			        <div class="form-group">
			            <label for="amount">Amount:</label>
			            <input type="number" id="amount" name="amount" required>
			        </div>
			        
			        <div class="form-group">
			            <label for="userId">User:</label>
			            <select id="userId" name="userId" required>
			                <option value="-1">Select User</option>
			                <c:forEach items="${userList}" var="user">
			                    <option value="${user.userId}">${user.firstName} ${user.lastName}</option>
			                </c:forEach>
			            </select>
			        </div>
			        
			        <div class="checkbox-container">
			            <input type="checkbox" id="isDefault" name="isDefault">
			            <label for="isDefault">Set as Default</label>
			        </div>
			        
			        <div class="action-buttons">
			            <input type="submit" value="Save Account">
			        </div>
			    </form>
		    </div>
    	</section>

  	</main><!-- End #main -->

  	<!-- ======= Footer ======= -->
  	<jsp:include page="AdminFooter.jsp"></jsp:include>
  	<!-- End Footer -->

  	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  	<!-- Vendor JS Files -->
  	<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	<script src="assets/vendor/chart.js/chart.umd.js"></script>
  	<script src="assets/vendor/echarts/echarts.min.js"></script>
  	<script src="assets/vendor/quill/quill.min.js"></script>
  	<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
  	<script src="assets/vendor/php-email-form/validate.js"></script>

  	<!-- Template Main JS File -->
  	<script src="assets/js/main.js"></script>

</body>

</html>