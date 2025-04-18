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
	
  	<!-- =======================================================
  	* Template Name: NiceAdmin
  	* Updated: Jan 29 2024 with Bootstrap v5.3.2
  	* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  	* Author: BootstrapMade.com
  	* License: https://bootstrapmade.com/license/
  	======================================================== -->
    
    <style>
        /* Custom Income Table Styling */
        .income-table-container {
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            padding: 1.5rem;
            margin-bottom: 2rem;
            overflow: hidden;
        }
        
        .income-table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .income-table-title {
            font-size: 1.25rem;
            font-weight: 700;
            color: #012970;
            margin: 0;
            display: flex;
            align-items: center;
        }
        
        .income-table-title i {
            margin-right: 10px;
            color: #4154f1;
            font-size: 1.4rem;
        }
        
        .income-table-actions {
            display: flex;
            gap: 10px;
        }
        
        .income-table-button {
            padding: 8px 16px;
            background-color: #4154f1;
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
        }
        
        .income-table-button:hover {
            background-color: #2c3dde;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(65, 84, 241, 0.15);
        }
        
        .income-table-button i {
            margin-right: 8px;
        }
        
        .income-stats {
            display: flex;
            gap: 20px;
            margin-bottom: 1.5rem;
        }
        
        .income-stat-card {
            flex: 1;
            background: linear-gradient(135deg, #f6f9ff 0%, #eef1fa 100%);
            border-radius: 12px;
            padding: 1rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.03);
            border-left: 4px solid;
        }
        
        .income-stat-card.total {
            border-left-color: #4154f1;
        }
        
        .income-stat-card.average {
            border-left-color: #2eca6a;
        }
        
        .income-stat-card.recent {
            border-left-color: #ff771d;
        }
        
        .stat-title {
            font-size: 0.85rem;
            color: #67748e;
            margin-bottom: 0.5rem;
        }
        
        .stat-value {
            font-size: 1.5rem;
            font-weight: 700;
            color: #012970;
            margin-bottom: 0.25rem;
        }
        
        .stat-info {
            font-size: 0.8rem;
            color: #67748e;
        }
        
        .table-responsive {
            overflow-x: auto;
            border-radius: 8px;
        }
        
        .income-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 0.9rem;
        }
        
        .income-table th {
            background-color: #f6f9ff;
            color: #012970;
            font-weight: 600;
            text-align: left;
            padding: 1rem;
            border-bottom: 2px solid #eef1fa;
        }
        
        .income-table td {
            padding: 1rem;
            border-bottom: 1px solid #eef1fa;
            vertical-align: middle;
        }
        
        .income-table tbody tr {
            transition: all 0.2s ease;
        }
        
        .income-table tbody tr:hover {
            background-color: #f8f9fa;
        }
        
        .income-table tbody tr:last-child td {
            border-bottom: none;
        }
        
        .income-title {
            font-weight: 600;
            color: #012970;
        }
        
        .income-amount {
            font-weight: 700;
            color: #2eca6a;
        }
        
        .income-date {
            color: #67748e;
            font-size: 0.85rem;
        }
        
        .income-description {
            color: #67748e;
            max-width: 200px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .income-status {
            padding: 5px 12px;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
        }
        
        .status-1 {
            background-color: #e8f9ee;
            color: #2eca6a;
        }
        
        .status-2 {
            background-color: #fff8e9;
            color: #ff771d;
        }
        
        .status-3 {
            background-color: #feeae9;
            color: #dc3545;
        }
        
        .action-btn {
            background: none;
            border: none;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.2s ease;
            color: #67748e;
            padding: 5px;
        }
        
        .view-btn:hover {
            color: #4154f1;
        }
        
        .edit-btn:hover {
            color: #2eca6a;
        }
        
        .delete-btn:hover {
            color: #dc3545;
        }
        
        .account-badge {
            padding: 4px 10px;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
            background-color: #e8eaf6;
            color: #4154f1;
        }
        
        .empty-state {
            text-align: center;
            padding: 3rem 1rem;
        }
        
        .empty-state i {
            font-size: 3rem;
            color: #d1d7e0;
            margin-bottom: 1rem;
        }
        
        .empty-state h5 {
            color: #67748e;
            margin-bottom: 1rem;
        }
        
        .empty-state p {
            color: #a0a8b9;
            max-width: 400px;
            margin: 0 auto 1.5rem;
        }
        
        .pagination-container {
            display: flex;
            justify-content: flex-end;
            margin-top: 1.5rem;
        }
        
        .pagination {
            display: flex;
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .page-item {
            margin: 0 3px;
        }
        
        .page-link {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 36px;
            width: 36px;
            border-radius: 50%;
            background-color: #f6f9ff;
            color: #4154f1;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s ease;
        }
        
        .page-link:hover {
            background-color: #e8eaf6;
        }
        
        .page-item.active .page-link {
            background-color: #4154f1;
            color: white;
        }
        
        /* Responsive adjustments */
        @media (max-width: 992px) {
            .income-stats {
                flex-direction: column;
                gap: 10px;
            }
            
            .income-table th, 
            .income-table td {
                padding: 0.75rem;
            }
        }
        
        @media (max-width: 768px) {
            .income-table-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .income-table-actions {
                width: 100%;
                justify-content: space-between;
            }
        }
    </style>
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
      		<h1>Income Management</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">Income List</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
            <!-- Income Stats Cards -->
          
            
            <!-- Income Table Section -->
            <div class="income-table-container">
                <div class="income-table-header">
                    <h5 class="income-table-title">
                        <i class="bi bi-cash-coin"></i> Income Transactions
                    </h5>
                    
                    <div class="income-table-actions">
                        <a href="newincome" class="income-table-button">
                            <i class="bi bi-plus-circle"></i> Add Income
                        </a>
                    </div>
                </div>
                
                <c:choose>
                    <c:when test="${not empty incomeList && incomeList.size() > 0}">
                        <div class="table-responsive">
                            <table class="income-table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Account</th>
                                        <th>Status</th>
                                        <th>Amount</th>
                                        <th>Date</th>
                                        <th>Description</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${incomeList}" var="income">
                                        <tr>
                                            <td>${income.incomeId}</td>
                                            <td class="income-title">${income.title}</td>
                                            <td>
                                                <span class="account-badge">
                                                    <i class="bi bi-wallet2"></i> 
                                                    Account #${income.accountId}
                                                </span>
                                            </td>
                                            <td>
                                                <span class="income-status status-${income.statusId}">
                                                    <c:choose>
                                                        <c:when test="${income.statusId == 1}">Received</c:when>
                                                        <c:when test="${income.statusId == 2}">Pending</c:when>
                                                        <c:when test="${income.statusId == 3}">Cancelled</c:when>
                                                        <c:otherwise>Unknown</c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </td>
                                            <td class="income-amount">$${income.amount}</td>
                                            <td class="income-date">${income.date}</td>
                                            <td class="income-description" title="${income.description}">
                                                ${income.description}
                                            </td>
                                            <td>
                                               
                                                    <a href="deleteincome?incomeId=${income.incomeId}" class="action-btn delete-btn" title="Delete Income">
                                                        <i class="bi bi-trash"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        
                        <!-- Pagination -->
                        <div class="pagination-container">
                            <ul class="pagination">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#">
                                        <i class="bi bi-chevron-left"></i>
                                    </a>
                                </li>
                                <li class="page-item active">
                                    <a class="page-link" href="#">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">2</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">3</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">
                                        <i class="bi bi-chevron-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        
                    </c:when>
                    <c:otherwise>
                        <!-- Empty State -->
                        <div class="empty-state">
                            <i class="bi bi-cash"></i>
                            <h5>No Income Transactions Found</h5>
                            <p>You haven't recorded any income transactions yet. Start by adding your first income entry.</p>
                            <a href="newincome" class="income-table-button">
                                <i class="bi bi-plus-circle"></i> Add First Income
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
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