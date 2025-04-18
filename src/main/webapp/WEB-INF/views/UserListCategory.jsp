<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>List Categories | Expense Tracker</title>
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
	
  	<!-- =======================================================
  	* Template Name: NiceAdmin
  	* Updated: Jan 29 2024 with Bootstrap v5.3.2
  	* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  	* Author: BootstrapMade.com
  	* License: https://bootstrapmade.com/license/
  	======================================================== -->
  	
  	<style>
  	    /* Custom Table Styles */
  	    .category-table {
  	        width: 100%;
  	        border-collapse: separate;
  	        border-spacing: 0;
  	        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  	        border-radius: 10px;
  	        overflow: hidden;
  	        margin-bottom: 20px;
  	    }
  	    
  	    .category-table thead th {
  	        background-color: #4154f1;
  	        color: white;
  	        padding: 15px;
  	        text-align: left;
  	        font-weight: 600;
  	        text-transform: uppercase;
  	        letter-spacing: 0.5px;
  	    }
  	    
  	    .category-table tbody tr {
  	        transition: all 0.3s ease;
  	    }
  	    
  	    .category-table tbody tr:nth-child(even) {
  	        background-color: #f8f9fa;
  	    }
  	    
  	    .category-table tbody tr:hover {
  	        background-color: #f1f3ff;
  	        transform: translateX(5px);
  	    }
  	    
  	    .category-table td {
  	        padding: 12px 15px;
  	        border-bottom: 1px solid #e0e0e0;
  	    }
  	    
  	    .action-link {
  	        display: inline-block;
  	        padding: 6px 12px;
  	        background-color: #ff3d3d;
  	        color: white;
  	        border-radius: 4px;
  	        text-decoration: none;
  	        font-weight: 500;
  	        transition: all 0.3s ease;
  	    }
  	    
  	    .action-link:hover {
  	        background-color: #d63030;
  	        transform: translateY(-2px);
  	        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  	    }
  	    
  	    .add-category-btn {
  	        display: inline-block;
  	        padding: 10px 20px;
  	        background-color: #4154f1;
  	        color: white;
  	        border-radius: 4px;
  	        text-decoration: none;
  	        font-weight: 500;
  	        transition: all 0.3s ease;
  	        margin-top: 10px;
  	    }
  	    
  	    .add-category-btn:hover {
  	        background-color: #2c3fd1;
  	        transform: translateY(-2px);
  	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  	    }
  	    
  	    .section {
  	        padding: 20px;
  	        background-color: white;
  	        border-radius: 10px;
  	        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
  	    }
  	</style>
</head>

<body>

	<!-- ======= Session Validate ======= -->
  	<%@include file="SessionValidate.jsp" %>
  	<!-- End Session Validate -->

  	<!-- ======= Header ======= -->
  	<jsp:include page="UserHeader.jsp"></jsp:include>
  	<!-- End Header -->

  	<!-- ======= Sidebar ======= -->
  	<jsp:include page="UserSidebar.jsp"></jsp:include>
  	<!-- End Sidebar-->

  	<main id="main" class="main">

    	<div class="pagetitle">
      		<h1>List of Categories</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">List Category</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
			<div class="card">
			    <div class="card-body">
			        <h5 class="card-title">Your Categories</h5>
			        <table class="category-table">
			            <thead>
			                <tr>
			                    <th>Category Id</th>
			                    <th>Category Name</th>
			                    <th>Action</th>
			                </tr>
			            </thead>
			            <tbody>
			                <c:forEach items="${categoryList}" var="category">
			                    <tr>
			                        <td>${category.categoryId}</td>
			                        <td>${category.categoryName}</td>
			                        <td><a href="userdeletecategory?categoryId=${category.categoryId}" class="action-link">Delete</a></td>
			                    </tr>
			                </c:forEach>
			            </tbody>
			        </table>
			        <a href="usernewcategory" class="add-category-btn">
			            <i class="bi bi-plus-circle"></i> Add New Category
			        </a>
			    </div>
			</div>
    	</section>

  	</main><!-- End #main -->

  	<!-- ======= Footer ======= -->
  	<jsp:include page="UserFooter.jsp"></jsp:include>
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