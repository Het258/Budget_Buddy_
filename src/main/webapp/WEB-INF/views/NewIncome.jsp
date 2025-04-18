<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>List Incomes | Budget Buddy</title>
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
        /* Custom Income Table Styles */
        .income-container {
            background-color: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
        }
        
        .income-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 20px;
        }
        
        .income-table thead tr {
            background-color: #2c7be5;
            color: white;
        }
        
        .income-table th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
            border: none;
        }
        
        .income-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e9ecef;
            vertical-align: middle;
        }
        
        .income-table tbody tr:nth-child(even) {
            background-color: #f8fafc;
        }
        
        .income-table tbody tr:hover {
            background-color: #f1f6fd;
        }
        
        .income-table tbody tr:last-child td {
            border-bottom: none;
        }
        
        .amount-cell {
            font-weight: 600;
            color: #28a745;
        }
        
        .date-cell {
            color: #6c757d;
            font-size: 0.9rem;
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
        
        .add-income-btn {
            display: inline-flex;
            align-items: center;
            padding: 10px 20px;
            background-color: #2c7be5;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(44, 123, 229, 0.2);
        }
        
        .add-income-btn:hover {
            background-color: #1a68d1;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(44, 123, 229, 0.3);
        }
        
        .add-income-btn i {
            margin-right: 8px;
            font-size: 1rem;
        }
        
        .income-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .income-title {
            color: #2c7be5;
            font-weight: 600;
            margin: 0;
        }
        
        .total-income {
            background-color: #e8f4ff;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
            font-weight: 600;
            color: #2c7be5;
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
      		<h1>My Income</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">List Income</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
            <div class="income-container">
                <div class="income-header">
                    <h3 class="income-title">Income Records</h3>
                    <a href="usernewincome" class="add-income-btn">
                        <i class="bi bi-plus-circle"></i> Add New Income
                    </a>
                </div>
                
                <table class="income-table">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Amount</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${income}" var="inc">
                            <tr>
                                <td>${inc.title}</td>
                                <td class="amount-cell">$${inc.amount}</td>
                                <td class="date-cell">${inc.date}</td>
                                <td>
                                    <a href="userdeleteincome?incomeId=${inc.incomeId}" class="action-btn">
                                        <i class="bi bi-trash"></i> Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <!-- Optional: Add total income calculation if available -->
                <!-- <div class="total-income">
                    <span>Total Income:</span>
                    <span>$5,000.00</span>
                </div> -->
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