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
  			border-radius: 15px;
  			box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
  			padding: 25px;
  			margin-bottom: 30px;
  		}
  		
  		.vendor-header {
  			display: flex;
  			justify-content: space-between;
  			align-items: center;
  			margin-bottom: 20px;
  			padding-bottom: 15px;
  			border-bottom: 1px solid #ebeef4;
  		}
  		
  		.vendor-title {
  			font-size: 1.2rem;
  			font-weight: 700;
  			color: #012970;
  			margin: 0;
  		}
  		
  		.vendor-count {
  			background-color: #f6f9ff;
  			color: #4154f1;
  			border-radius: 20px;
  			padding: 5px 15px;
  			font-weight: 600;
  			font-size: 0.875rem;
  		}
  		
  		.vendor-table {
  			width: 100%;
  			border-collapse: separate;
  			border-spacing: 0;
  		}
  		
  		.vendor-table th {
  			background-color: #f6f9ff;
  			color: #012970;
  			font-weight: 600;
  			padding: 12px 15px;
  			text-align: left;
  			border: none;
  			position: relative;
  			transition: all 0.3s;
  		}
  		
  		.vendor-table th:first-child {
  			border-top-left-radius: 8px;
  			border-bottom-left-radius: 8px;
  		}
  		
  		.vendor-table th:last-child {
  			border-top-right-radius: 8px;
  			border-bottom-right-radius: 8px;
  		}
  		
  		.vendor-table td {
  			padding: 15px;
  			vertical-align: middle;
  			border-bottom: 1px solid #ebeef4;
  			color: #444444;
  			font-size: 0.95rem;
  		}
  		
  		.vendor-table tr:last-child td {
  			border-bottom: none;
  		}
  		
  		.vendor-table tr {
  			transition: all 0.2s;
  		}
  		
  		.vendor-table tr:hover {
  			background-color: #f9fafc;
  			transform: translateY(-2px);
  			box-shadow: 0 5px 12px rgba(0, 0, 0, 0.05);
  		}
  		
  		.vendor-id {
  			font-weight: 600;
  			color: #012970;
  			background-color: #f6f9ff;
  			border-radius: 5px;
  			padding: 3px 10px;
  			display: inline-block;
  		}
  		
  		.vendor-name {
  			font-weight: 500;
  		}
  		
  		.vendor-actions {
  			display: flex;
  			gap: 10px;
  		}
  		
  		.btn-delete {
  			background-color: #ff5a5a;
  			color: white;
  			border: none;
  			border-radius: 4px;
  			padding: 5px 15px;
  			cursor: pointer;
  			transition: all 0.3s;
            text-decoration: none;
            font-size: 0.85rem;
            display: inline-flex;
            align-items: center;
  		}
  		
  		.btn-delete:hover {
  			background-color: #ff3838;
  			transform: translateY(-2px);
  			box-shadow: 0 3px 8px rgba(255, 90, 90, 0.3);
            color: white;
  		}
  		
  		.btn-edit {
  			background-color: #4154f1;
  			color: white;
  			border: none;
  			border-radius: 4px;
  			padding: 5px 15px;
  			cursor: pointer;
  			transition: all 0.3s;
            text-decoration: none;
            font-size: 0.85rem;
            display: inline-flex;
            align-items: center;
  		}
  		
  		.btn-edit:hover {
  			background-color: #2839d9;
  			transform: translateY(-2px);
  			box-shadow: 0 3px 8px rgba(65, 84, 241, 0.3);
            color: white;
  		}
  		
  		.btn-add {
  			background-color: #2ecc71;
  			color: white;
  			border: none;
  			border-radius: 30px;
  			padding: 10px 20px;
  			cursor: pointer;
  			font-weight: 600;
  			transition: all 0.3s;
  			text-decoration: none;
  			display: inline-flex;
  			align-items: center;
  			margin-top: 20px;
  		}
  		
  		.btn-add:hover {
  			background-color: #27ae60;
  			transform: translateY(-2px);
  			box-shadow: 0 5px 12px rgba(46, 204, 113, 0.3);
            color: white;
  		}
  		
  		.btn-icon {
  			margin-right: 5px;
  		}
  		
  		.empty-state {
  			text-align: center;
  			padding: 40px 20px;
  			color: #6c757d;
  		}
  		
  		.empty-icon {
  			font-size: 3rem;
  			margin-bottom: 15px;
  			color: #adb5bd;
  		}
  		
  		.search-container {
  			margin-bottom: 20px;
  		}
  		
  		.search-input {
  			border: 1px solid #ebeef4;
  			border-radius: 30px;
  			padding: 8px 20px;
  			width: 100%;
  			font-size: 0.9rem;
  			color: #444444;
  			transition: all 0.3s;
  		}
  		
  		.search-input:focus {
  			outline: none;
  			border-color: #4154f1;
  			box-shadow: 0 0 0 3px rgba(65, 84, 241, 0.15);
  		}
  		
  		.pagination {
  			display: flex;
  			justify-content: center;
  			margin-top: 20px;
  			gap: 5px;
  		}
  		
  		.page-item {
  			list-style: none;
  		}
  		
  		.page-link {
  			border: 1px solid #ebeef4;
  			color: #444444;
  			padding: 5px 12px;
  			border-radius: 5px;
  			text-decoration: none;
  			transition: all 0.3s;
  		}
  		
  		.page-link:hover, .page-link.active {
  			background-color: #4154f1;
  			border-color: #4154f1;
  			color: white;
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
  	<jsp:include page="UserHeader.jsp"></jsp:include>
  	<!-- End Header -->

  	<!-- ======= Sidebar ======= -->
  	<jsp:include page="UserSidebar.jsp"></jsp:include>
  	<!-- End Sidebar-->

  	<main id="main" class="main">

    	<div class="pagetitle">
      		<h1>List of Vendors</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">List Vendor</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
    		<div class="row">
    			<div class="col-12">
    				<div class="vendor-container">
    					<div class="vendor-header">
    						<h5 class="vendor-title"><i class="bi bi-shop me-2"></i>Vendor List</h5>
    						<span class="vendor-count">${vendorList.size()} vendors</span>
    					</div>
    					
    					<div class="row mb-3">
    						<div class="col-md-6">
    							<div class="search-container">
    								<input type="text" class="search-input" id="vendorSearch" placeholder="Search vendors...">
    							</div>
    						</div>
    						<div class="col-md-6 text-md-end">
    							<a href="usernewvendor" class="btn-add">
    								<i class="bi bi-plus-circle me-2"></i> Add New Vendor
    							</a>
    						</div>
    					</div>
    					
    					<c:choose>
    						<c:when test="${empty vendorList}">
    							<div class="empty-state">
    								<i class="bi bi-shop empty-icon"></i>
    								<h5>No vendors found</h5>
    								<p>You don't have any vendors yet. Add your first vendor to get started.</p>
    							</div>
    						</c:when>
    						<c:otherwise>
    							<div class="table-responsive">
    								<table class="vendor-table">
    									<thead>
    										<tr>
    											<th>Vendor ID</th>
    											<th>Vendor Name</th>
    											<th>Actions</th>
    										</tr>
    									</thead>
    									<tbody id="vendorTableBody">
    										<c:forEach items="${vendorList}" var="vendor">
    											<tr>
    												<td><span class="vendor-id">#${vendor.vendorId}</span></td>
    												<td class="vendor-name">${vendor.vendorName}</td>
    												<td>
    													<div class="vendor-actions">
    														<a href="editvendor?vendorId=${vendor.vendorId}" class="btn-edit">
    															<i class="bi bi-pencil-square btn-icon"></i> Edit
    														</a>
    														<a href="deletevendor?vendorId=${vendor.vendorId}" class="btn-delete" onclick="return confirm('Are you sure you want to delete this vendor?')">
    															<i class="bi bi-trash btn-icon"></i> Delete
    														</a>
    													</div>
    												</td>
    											</tr>
    										</c:forEach>
    									</tbody>
    								</table>
    							</div>
    							
    							<!-- Pagination (Optional) -->
    							<ul class="pagination">
    								<li class="page-item"><a class="page-link" href="#">Previous</a></li>
    								<li class="page-item"><a class="page-link active" href="#">1</a></li>
    								<li class="page-item"><a class="page-link" href="#">2</a></li>
    								<li class="page-item"><a class="page-link" href="#">3</a></li>
    								<li class="page-item"><a class="page-link" href="#">Next</a></li>
    							</ul>
    						</c:otherwise>
    					</c:choose>
    				</div>
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
  	
  	<!-- Custom JS for Vendor Search -->
  	<script>
  		document.addEventListener('DOMContentLoaded', function() {
  			// Search functionality
  			document.getElementById('vendorSearch').addEventListener('keyup', function() {
  				let searchValue = this.value.toLowerCase();
  				let tableRows = document.getElementById('vendorTableBody').getElementsByTagName('tr');
  				
  				for (let i = 0; i < tableRows.length; i++) {
  					let vendorName = tableRows[i].getElementsByClassName('vendor-name')[0].textContent.toLowerCase();
  					let vendorId = tableRows[i].getElementsByClassName('vendor-id')[0].textContent.toLowerCase();
  					
  					if (vendorName.includes(searchValue) || vendorId.includes(searchValue)) {
  						tableRows[i].style.display = '';
  					} else {
  						tableRows[i].style.display = 'none';
  					}
  				}
  			});
  		});
  	</script>

</body>

</html>