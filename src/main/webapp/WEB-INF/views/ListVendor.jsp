<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>List Vendors | BudgetBuddy</title>
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
  	
  	<!-- Custom CSS for Vendor Table -->
  	<style>
  	    .vendor-container {
  	        background-color: #fff;
  	        border-radius: 8px;
  	        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  	        padding: 25px;
  	        margin-bottom: 30px;
  	    }
  	    
  	    .vendor-table {
  	        width: 100%;
  	        border-collapse: separate;
  	        border-spacing: 0;
  	        border: none;
  	        border-radius: 8px;
  	        overflow: hidden;
  	        margin-bottom: 20px;
  	        box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
  	    }
  	    
  	    .vendor-table th {
  	        background-color: #4154f1;
  	        color: white;
  	        font-weight: 600;
  	        font-size: 15px;
  	        text-align: left;
  	        padding: 15px 20px;
  	        border: none;
  	        position: relative;
  	    }
  	    
  	    .vendor-table th:first-child {
  	        border-top-left-radius: 8px;
  	    }
  	    
  	    .vendor-table th:last-child {
  	        border-top-right-radius: 8px;
  	    }
  	    
  	    .vendor-table td {
  	        padding: 14px 20px;
  	        border: none;
  	        border-bottom: 1px solid #e9ecef;
  	        font-size: 14px;
  	        color: #5a5c69;
  	        vertical-align: middle;
  	    }
  	    
  	    .vendor-table tr:last-child td {
  	        border-bottom: none;
  	    }
  	    
  	    .vendor-table tr:nth-child(even) {
  	        background-color: #f8f9fa;
  	    }
  	    
  	    .vendor-table tr:hover {
  	        background-color: #f2f4ff;
  	        transition: background-color 0.3s ease;
  	    }
  	    
  	    .vendor-id {
  	        width: 120px;
  	        font-weight: 600;
  	    }
  	    
  	    .vendor-name {
  	        width: auto;
  	    }
  	    
  	    .vendor-actions {
  	        width: 120px;
  	        text-align: center;
  	    }
  	    
  	    .delete-btn {
  	        display: inline-block;
  	        padding: 6px 16px;
  	        background-color: #f34141;
  	        color: white;
  	        text-decoration: none;
  	        border-radius: 4px;
  	        font-size: 13px;
  	        font-weight: 600;
  	        transition: all 0.3s ease;
  	    }
  	    
  	    .delete-btn:hover {
  	        background-color: #d63030;
  	        transform: translateY(-2px);
  	        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  	    }
  	    
  	    .add-vendor-btn {
  	        display: inline-block;
  	        padding: 10px 22px;
  	        background-color: #4154f1;
  	        color: white;
  	        text-decoration: none;
  	        border-radius: 5px;
  	        font-weight: 600;
  	        font-size: 14px;
  	        transition: all 0.3s ease;
  	    }
  	    
  	    .add-vendor-btn:hover {
  	        background-color: #3646d8;
  	        transform: translateY(-2px);
  	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
  	    }
  	    
  	    .add-vendor-btn i {
  	        margin-right: 8px;
  	    }
  	    
  	    /* Empty state styling */
  	    .empty-state {
  	        text-align: center;
  	        padding: 40px 20px;
  	        color: #6c757d;
  	    }
  	    
  	    .empty-state i {
  	        font-size: 50px;
  	        margin-bottom: 15px;
  	        color: #dee2e6;
  	    }
  	    
  	    /* Responsive adjustments */
  	    @media (max-width: 768px) {
  	        .vendor-table {
  	            display: block;
  	            overflow-x: auto;
  	        }
  	        
  	        .vendor-id {
  	            width: 80px;
  	        }
  	        
  	        .vendor-actions {
  	            width: 100px;
  	        }
  	    }
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
      		<h1>List of Vendors</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="/">Home</a></li>
          			<li class="breadcrumb-item active">List Vendor</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
			<div class="vendor-container">
				<c:choose>
					<c:when test="${empty vendorList}">
						<div class="empty-state">
							<i class="bi bi-shop"></i>
							<h4>No vendors found</h4>
							<p>Click the button below to add your first vendor</p>
						</div>
					</c:when>
					<c:otherwise>
						<table class="vendor-table">
							<thead>
								<tr>
									<th class="vendor-id">Vendor ID</th>
									<th class="vendor-name">Vendor Name</th>
									<th class="vendor-actions">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${vendorList}" var="vendor">
									<tr>
										<td class="vendor-id">${vendor.vendorId}</td>
										<td class="vendor-name">${vendor.vendorName}</td>
										<td class="vendor-actions">
											<a href="deletevendor?vendorId=${vendor.vendorId}" class="delete-btn" onclick="return confirm('Are you sure you want to delete this vendor?')">
												<i class="bi bi-trash"></i> Delete
											</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
				
				<div style="text-align: right; margin-top: 20px;">
					<a href="newvendor" class="add-vendor-btn">
						<i class="bi bi-plus-circle"></i> Add Vendor
					</a>
				</div>
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