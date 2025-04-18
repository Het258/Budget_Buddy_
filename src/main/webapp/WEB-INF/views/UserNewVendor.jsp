<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>New Vendor | BudgetBuddy</title>
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
  	
  	<!-- Custom CSS for Vendor Form -->
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
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid #ebeef4;
        }
        
        .vendor-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: #012970;
            margin: 0;
            display: flex;
            align-items: center;
        }

        .vendor-title i {
            margin-right: 10px;
            font-size: 1.4rem;
            color: #4154f1;
        }
        
        .vendor-badge {
            background-color: #e7f1ff;
            color: #4154f1;
            border-radius: 20px;
            padding: 5px 15px;
            font-weight: 600;
            font-size: 0.875rem;
        }
        
        .vendor-form {
            background-color: #f9fafe;
            border-radius: 10px;
            padding: 30px;
            border: 1px dashed #d8e2f6;
            margin-bottom: 20px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            font-weight: 600;
            color: #012970;
            margin-bottom: 8px;
            display: block;
        }
        
        .form-control {
            height: 45px;
            border-radius: 8px;
            border: 1px solid #ced4da;
            padding: 10px 15px;
            transition: all 0.3s;
            width: 100%;
            font-size: 0.95rem;
        }
        
        .form-control:focus {
            box-shadow: 0 0 0 4px rgba(65, 84, 241, 0.15);
            border-color: #4154f1;
        }
        
        .required::after {
            content: "*";
            color: #ff3860;
            margin-left: 5px;
        }
        
        .form-helper {
            font-size: 0.85rem;
            color: #6c757d;
            margin-top: 5px;
        }
        
        .btn-submit {
            background-color: #4154f1;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px 25px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
        }
        
        .btn-submit:hover {
            background-color: #364be0;
            transform: translateY(-2px);
            box-shadow: 0 8px 15px rgba(65, 84, 241, 0.3);
        }
        
        .btn-cancel {
            background-color: #f5f5f5;
            color: #444444;
            border: none;
            border-radius: 8px;
            padding: 12px 25px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-right: 10px;
            display: inline-flex;
            align-items: center;
            text-decoration: none;
        }
        
        .btn-cancel:hover {
            background-color: #e9e9e9;
            transform: translateY(-2px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.05);
        }
        
        .btn-icon {
            margin-right: 8px;
        }
        
        .form-actions {
            display: flex;
            margin-top: 30px;
        }
        
        .form-card {
            border-radius: 10px;
            border: 1px solid #ebeef4;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .form-card-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #012970;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ebeef4;
        }
        
        .tip-card {
            background-color: #fff7e8;
            border-radius: 10px;
            padding: 20px;
            border-left: 4px solid #ffbf53;
        }
        
        .tip-icon {
            font-size: 2rem;
            color: #ffbf53;
            margin-bottom: 15px;
        }
        
        .tip-title {
            font-size: 1rem;
            font-weight: 600;
            color: #012970;
            margin-bottom: 10px;
        }
        
        .tip-text {
            color: #444444;
            font-size: 0.9rem;
            line-height: 1.6;
        }
        
        .vendor-image {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        
        .vendor-image img {
            width: 150px;
            height: auto;
            opacity: 0.8;
        }
        
        .form-bubble {
            position: relative;
            background-color: #e7f1ff;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 0.9rem;
            color: #012970;
        }
        
        .form-bubble::after {
            content: '';
            position: absolute;
            top: 100%;
            left: 30px;
            border: 10px solid transparent;
            border-top-color: #e7f1ff;
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
      		<h1>New Vendor</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item"><a href="userlistvendor">Vendors</a></li>
          			<li class="breadcrumb-item active">New Vendor</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
    		<div class="row">
    			<div class="col-lg-8">
    				<div class="vendor-container">
    					<div class="vendor-header">
    						<h5 class="vendor-title"><i class="bi bi-shop-window"></i> Add New Vendor</h5>
    						<span class="vendor-badge">New Entry</span>
    					</div>
    					
    					<div class="form-bubble">
    						<i class="bi bi-info-circle-fill me-2"></i>
    						Adding vendors helps you categorize your expenses and track spending patterns by merchant.
    					</div>
    					
    					<div class="vendor-form">
    						<form action="savevendor" method="post" class="needs-validation" novalidate>
    							<div class="form-group">
    								<label for="vendorName" class="form-label required">Vendor Name</label>
    								<input type="text" class="form-control" id="vendorName" name="vendorName" placeholder="Enter vendor name" required>
    								<div class="form-helper">Enter the name of the store, service provider, or business</div>
    							</div>
    							
    							<div class="form-group">
    								<label for="vendorCategory" class="form-label">Vendor Category</label>
    								<select class="form-control" id="vendorCategory" name="vendorCategory">
    									<option value="">-- Select Category --</option>
    									<option value="grocery">Grocery</option>
    									<option value="restaurant">Restaurant</option>
    									<option value="utilities">Utilities</option>
    									<option value="entertainment">Entertainment</option>
    									<option value="shopping">Shopping</option>
    									<option value="travel">Travel</option>
    									<option value="services">Services</option>
    									<option value="other">Other</option>
    								</select>
    								<div class="form-helper">Categorize this vendor for better expense reporting</div>
    							</div>
    							
    							<div class="form-group">
    								<label for="vendorDescription" class="form-label">Description</label>
    								<textarea class="form-control" id="vendorDescription" name="vendorDescription" rows="3" placeholder="Add notes about this vendor (optional)"></textarea>
    							</div>
    							
    							<div class="form-actions">
    								<a href="userlistvendor" class="btn-cancel">
    									<i class="bi bi-x-circle btn-icon"></i> Cancel
    								</a>
    								<button type="submit" class="btn-submit">
    									<i class="bi bi-check-circle btn-icon"></i> Save Vendor
    								</button>
    							</div>
    						</form>
    					</div>
    				</div>
    			</div>
    			
    			<
    					
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
  	
  	<!-- Form validation script -->
  	<script>
  		// Example starter JavaScript for disabling form submissions if there are invalid fields
  		(function() {
  			'use strict';
  			
  			// Fetch all forms we want to apply custom validation styles to
  			var forms = document.querySelectorAll('.needs-validation');
  			
  			// Loop over them and prevent submission
  			Array.prototype.slice.call(forms).forEach(function(form) {
  				form.addEventListener('submit', function(event) {
  					if (!form.checkValidity()) {
  						event.preventDefault();
  						event.stopPropagation();
  					}
  					
  					form.classList.add('was-validated');
  				}, false);
  			});
  		})();
  	</script>

</body>

</html>