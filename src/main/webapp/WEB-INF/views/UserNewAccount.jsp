<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>New Account | BudgetBuddy</title>
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
    
    <!-- Custom CSS for form -->
    <style>
        .account-form {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 25px;
            margin-bottom: 30px;
        }
        
        .account-form h5 {
            color: #012970;
            border-bottom: 1px solid #ebeef4;
            padding-bottom: 15px;
            margin-bottom: 20px;
            font-weight: 700;
        }
        
        .account-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
        }
        
        .account-table td {
            padding: 10px 15px;
            vertical-align: middle;
        }
        
        .account-table td:first-child {
            font-weight: 600;
            width: 30%;
            color: #012970;
        }
        
        .form-control:focus {
            border-color: #4154f1;
            box-shadow: 0 0 5px rgba(65, 84, 241, 0.25);
        }
        
        .custom-checkbox {
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
        }
        
        .custom-checkbox input {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }
        
        .save-btn {
            background-color: #4154f1;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .save-btn:hover {
            background-color: #2c3ddc;
            transform: translateY(-2px);
            box-shadow: 0 3px 10px rgba(65, 84, 241, 0.3);
        }
        
        .form-helper {
            font-size: 0.85rem;
            color: #6c757d;
            margin-top: 5px;
        }
        
        .required-field::after {
            content: "*";
            color: #dc3545;
            margin-left: 3px;
        }
        
        /* Card styling */
        .account-card {
            border: 1px solid #ebeef4;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        
        .account-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
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
      		<h1>New Account</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">New Account</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
            <div class="row">
                <div class="col-lg-8">
                    <div class="account-form">
                        <h5><i class="bi bi-wallet me-2"></i>Create New Account</h5>
                        
                        <form action="usersaveaccount" method="post" class="needs-validation" novalidate>
                            <table class="account-table">
                                <tr>
                                    <td class="required-field">Account Title</td>
                                    <td>
                                        <input type="text" name="title" class="form-control" placeholder="Enter account title" required>
                                        <div class="form-helper">Choose a descriptive name for this account (e.g., Savings, Emergency Fund)</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="required-field">Initial Balance</td>
                                    <td>
                                        <div class="input-group">
                                            <span class="input-group-text">Rs.</span>
                                            <input type="number" name="amount" step="0.01" class="form-control" placeholder="0.00" required>
                                        </div>
                                        <div class="form-helper">Enter the current balance of this account</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Account Type</td>
                                    <td>
                                        <select class="form-select" name="accountType">
                                            <option value="checking">Checking</option>
                                            <option value="savings">Savings</option>
                                            <option value="investment">Investment</option>
                                            <option value="credit">Credit Card</option>
                                            <option value="cash">Cash</option>
                                            <option value="other">Other</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Default Account</td>
                                    <td>
                                        <label class="custom-checkbox">
                                            <input type="checkbox" name="isDefault" class="form-check-input">
                                            <span>Set as Default Account</span>
                                        </label>
                                        <div class="form-helper">The default account will be pre-selected for new transactions</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="text-center pt-4">
                                        <button type="submit" class="save-btn">
                                            <i class="bi bi-save me-1"></i> Save Account
                                        </button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                
                <div class="col-lg-4">
                    <div class="card account-card">
                        <div class="card-body">
                            <h5 class="card-title"><i class="bi bi-info-circle me-1"></i>Tips</h5>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><i class="bi bi-check-circle text-success me-2"></i>Create separate accounts for different financial purposes</li>
                                <li class="list-group-item"><i class="bi bi-check-circle text-success me-2"></i>Use descriptive names to easily identify accounts</li>
                                <li class="list-group-item"><i class="bi bi-check-circle text-success me-2"></i>Verify your initial balance amount carefully</li>
                                <li class="list-group-item"><i class="bi bi-check-circle text-success me-2"></i>Choose a default account for quick transactions</li>
                            </ul>
                        </div>
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
    
    <!-- Form validation script -->
    <script>
        // Form validation
        (function() {
            'use strict';
            
            // Fetch all forms that need validation
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