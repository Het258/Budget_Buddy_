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
      		<h1>List of Accounts</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="/">Home</a></li>
          			<li class="breadcrumb-item active">List Account</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
			<style>
    /* Modern Table Styling */
    #accountTable {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        border-radius: 10px;
        overflow: hidden;
        font-family: 'Poppins', sans-serif;
    }
    
    #accountTable thead th {
        background-color: #4154f1;
        color: white;
        padding: 15px;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.85rem;
        letter-spacing: 0.5px;
        border: none;
        position: sticky;
        top: 0;
    }
    
    #accountTable tbody tr {
        transition: all 0.3s ease;
    }
    
    #accountTable tbody tr:hover {
        background-color: rgba(65, 84, 241, 0.1);
    }
    
    #accountTable tbody td {
        padding: 12px 15px;
        border-bottom: 1px solid #e0e0e0;
        vertical-align: middle;
    }
    
    #accountTable tbody tr:last-child td {
        border-bottom: none;
    }
    
    /* Highlight default account */
    #accountTable tbody tr.default-account {
        background-color: rgba(46, 204, 113, 0.1);
    }
    
    /* Amount styling */
    .amount-cell {
        font-weight: 600;
        color: #2ecc71;
    }
    
    /* Action Links Styling */
    .action-links {
        display: flex;
        gap: 8px;
    }
    
    .action-links a {
        padding: 6px 12px;
        border-radius: 4px;
        font-size: 0.8rem;
        font-weight: 500;
        text-decoration: none;
        transition: all 0.2s ease;
        display: inline-flex;
        align-items: center;
    }
    
    .action-links a i {
        margin-right: 5px;
    }
    
    .action-links a.delete-link {
        background-color: #e74c3c;
        color: white;
    }
    
    .action-links a:hover {
        opacity: 0.9;
        transform: translateY(-1px);
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    
    /* Add Account Button */
    .add-account-btn {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #4154f1;
        color: white;
        border-radius: 5px;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
    }
    
    .add-account-btn:hover {
        background-color: #314199;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    
    .add-account-btn i {
        margin-right: 8px;
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
        #accountTable {
            display: block;
            overflow-x: auto;
        }
    }
</style>

<table id="accountTable">
    <thead>
        <tr>
            <th>Title</th>
            <th>Amount</th>
            <th>Is Default</th>
            <th>User Id</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${accountList}" var="account">
            <tr class="${account.isDefault ? 'default-account' : ''}">
                <td>${account.title}</td>
                <td class="amount-cell">$${account.amount}</td>
                <td>
                    <c:if test="${account.isDefault}">
                        <span class="badge bg-success">Yes</span>
                    </c:if>
                    <c:if test="${!account.isDefault}">
                        <span class="badge bg-secondary">No</span>
                    </c:if>
                </td>
                <td>${account.userId}</td>
                <td>
                    <div class="action-links">
                        <a href="deleteaccount?accountId=${account.accountId}" class="delete-link">
                            <i class="bi bi-trash-fill"></i> Delete
                        </a>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<br>
<a href="newaccount" class="add-account-btn">
    <i class="bi bi-plus-circle"></i> Add New Account
</a>
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