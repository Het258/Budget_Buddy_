<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>List Accounts | BudgetBuddy</title>
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
	
  	<style>
        /* Custom Accounts Table Styles */
        .accounts-container {
            background-color: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
        }
        
        .accounts-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 20px;
        }
        
        .accounts-table thead tr {
            background-color: #4154f1;
            color: white;
        }
        
        .accounts-table th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
            border: none;
        }
        
        .accounts-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e9ecef;
            vertical-align: middle;
        }
        
        .accounts-table tbody tr:nth-child(even) {
            background-color: #f8fafc;
        }
        
        .accounts-table tbody tr:hover {
            background-color: #f1f3ff;
        }
        
        .accounts-table tbody tr:last-child td {
            border-bottom: none;
        }
        
        .amount-cell {
            font-weight: 600;
            color: #28a745;
        }
        
        .default-cell {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        
        .default-true {
            background-color: #d4edda;
            color: #155724;
        }
        
        .default-false {
            background-color: #f8d7da;
            color: #721c24;
        }
        
        .action-btn {
            display: inline-flex;
            align-items: center;
            padding: 6px 12px;
            background-color: #ff5b5b;
            color: white;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.2s ease;
        }
        
        .action-btn:hover {
            background-color: #e04a4a;
            transform: translateY(-1px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        .action-btn i {
            margin-right: 5px;
            font-size: 0.9rem;
        }
        
        .add-account-btn {
            display: inline-flex;
            align-items: center;
            padding: 10px 20px;
            background-color: #4154f1;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(65, 84, 241, 0.2);
        }
        
        .add-account-btn:hover {
            background-color: #3142d1;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(65, 84, 241, 0.3);
        }
        
        .add-account-btn i {
            margin-right: 8px;
            font-size: 1rem;
        }
        
        .accounts-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .accounts-title {
            color: #4154f1;
            font-weight: 600;
            margin: 0;
        }
        
        .total-accounts {
            background-color: #e8f4ff;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
            font-weight: 600;
            color: #4154f1;
            display: flex;
            justify-content: space-between;
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
      		<h1>List of Accounts</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">List Account</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
            <div class="accounts-container">
                <div class="accounts-header">
                    <h3 class="accounts-title">Your Accounts</h3>
                    <a href="usernewaccount" class="add-account-btn">
                        <i class="bi bi-plus-circle"></i> Add Account
                    </a>
                </div>
                
                <table class="accounts-table">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Amount</th>
                            <th>Is Default</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${accountList}" var="account">
                            <tr>
                                <td>${account.title}</td>
                                <td class="amount-cell">$${account.amount}</td>
                                <td>
                                    <span class="default-cell ${account.isDefault ? 'default-true' : 'default-false'}">
                                        ${account.isDefault ? 'Yes' : 'No'}
                                    </span>
                                </td>
                                <td>
                                    <a href="userdeleteaccount?accountId=${account.accountId}" class="action-btn">
                                        <i class="bi bi-trash"></i> Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <!-- Optional: Add total accounts summary if needed -->
                <!-- <div class="total-accounts">
                    <span>Total Accounts:</span>
                    <span>${accountList.size()}</span>
                </div> -->
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