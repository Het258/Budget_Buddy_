<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>New Category | Budget Buddy</title>
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
      		<h1>New Category</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="/">Home</a></li>
          			<li class="breadcrumb-item active">New Category</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
			<style>
    /* Form Container Styling */
    .category-form-container {
        background-color: white;
        border-radius: 12px;
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
        padding: 35px;
        max-width: 600px;
        margin: 0 auto;
        border: 1px solid #e0e0e0;
    }

    /* Form Header */
    .form-header {
        margin-bottom: 30px;
        text-align: center;
        position: relative;
    }

    .form-header h2 {
        color: #4154f1;
        font-weight: 600;
        margin-bottom: 10px;
    }

    .form-header p {
        color: #6c757d;
        font-size: 0.95rem;
    }

    .form-header::after {
        content: '';
        display: block;
        width: 60px;
        height: 3px;
        background: #4154f1;
        margin: 15px auto;
        border-radius: 3px;
    }

    /* Form Group Styling */
    .form-group {
        margin-bottom: 25px;
        position: relative;
    }

    .form-group label {
        display: block;
        margin-bottom: 10px;
        font-weight: 500;
        color: #495057;
        font-size: 0.95rem;
    }

    .form-control {
        width: 100%;
        padding: 14px 16px;
        border: 1px solid #ced4da;
        border-radius: 8px;
        font-size: 15px;
        transition: all 0.3s ease;
        background-color: #f8f9fa;
    }

    .form-control:focus {
        border-color: #4154f1;
        box-shadow: 0 0 0 3px rgba(65, 84, 241, 0.15);
        outline: none;
        background-color: white;
    }

    /* Submit Button Styling */
    .submit-btn {
        background: linear-gradient(135deg, #4154f1, #6577f3);
        color: white;
        border: none;
        padding: 14px 25px;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 100%;
        margin-top: 20px;
        box-shadow: 0 4px 6px rgba(65, 84, 241, 0.2);
    }

    .submit-btn:hover {
        background: linear-gradient(135deg, #314199, #5468e2);
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(65, 84, 241, 0.25);
    }

    .submit-btn i {
        margin-right: 10px;
        font-size: 1.1rem;
    }

    /* Form Note */
    .form-note {
        font-size: 0.85rem;
        color: #6c757d;
        margin-top: 8px;
        font-style: italic;
    }

    /* Icon Input */
    .input-with-icon {
        position: relative;
    }

    .input-icon {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #6c757d;
    }

    .input-with-icon .form-control {
        padding-left: 45px;
    }

    /* Responsive Adjustments */
    @media (max-width: 768px) {
        .category-form-container {
            padding: 25px;
        }
        
        .form-header h2 {
            font-size: 1.5rem;
        }
    }
</style>

<div class="category-form-container">
    <div class="form-header">
        <h2>Create New Category</h2>
        <p>Organize your expenses with custom categories</p>
    </div>

    <form action="savecategory" method="post">
        <div class="form-group input-with-icon">
            <i class="bi bi-tag-fill input-icon"></i>
            <label for="categoryName">Category Name</label>
            <input type="text" id="categoryName" name="categoryName" class="form-control" 
                   placeholder="Enter category name (e.g. Groceries, Utilities)" required>
            <p class="form-note">Use descriptive names for better organization</p>
        </div>

        <!-- Additional fields can be added here if needed -->
        <!-- Example:
        <div class="form-group">
            <label for="categoryType">Category Type</label>
            <select id="categoryType" name="categoryType" class="form-control">
                <option value="expense">Expense</option>
                <option value="income">Income</option>
            </select>
        </div>
        -->

        <button type="submit" class="submit-btn">
            <i class="bi bi-plus-circle-fill"></i> Create Category
        </button>
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