<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>List Categories | BudgetBuddy</title>
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
  	
  	<!-- Custom CSS for Category Table -->
  	<style>
  	    .category-container {
  	        background-color: #fff;
  	        border-radius: 12px;
  	        box-shadow: 0 5px 25px rgba(0, 0, 0, 0.08);
  	        padding: 30px;
  	        margin-bottom: 30px;
  	        position: relative;
  	        overflow: hidden;
  	    }
  	    
  	    .category-container::before {
  	        content: '';
  	        position: absolute;
  	        top: 0;
  	        left: 0;
  	        width: 100%;
  	        height: 5px;
  	        background: linear-gradient(90deg, #4154f1, #6776f4);
  	    }
  	    
  	    .category-table {
  	        width: 100%;
  	        border-collapse: separate;
  	        border-spacing: 0;
  	        border: none;
  	        overflow: hidden;
  	        margin-bottom: 20px;
  	        background-color: #fff;
  	        border-radius: 8px;
  	    }
  	    
  	    .category-table thead {
  	        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  	    }
  	    
  	    .category-table th {
  	        background-color: #4154f1;
  	        color: white;
  	        font-weight: 600;
  	        font-size: 15px;
  	        text-align: left;
  	        padding: 16px 20px;
  	        border: none;
  	        position: relative;
  	    }
  	    
  	    .category-table th:first-child {
  	        border-top-left-radius: 8px;
  	    }
  	    
  	    .category-table th:last-child {
  	        border-top-right-radius: 8px;
  	        text-align: center;
  	    }
  	    
  	    .category-table td {
  	        padding: 15px 20px;
  	        border: none;
  	        border-bottom: 1px solid #edf2f7;
  	        font-size: 14px;
  	        color: #495057;
  	        vertical-align: middle;
  	        transition: all 0.2s ease;
  	    }
  	    
  	    .category-table tr:last-child td {
  	        border-bottom: none;
  	    }
  	    
  	    .category-table tr:nth-child(even) {
  	        background-color: #f8f9fa;
  	    }
  	    
  	    .category-table tr:hover td {
  	        background-color: #f1f4ff;
  	    }
  	    
  	    .category-id {
  	        width: 120px;
  	        font-weight: 600;
  	    }
  	    
  	    .category-name {
  	        width: auto;
  	    }
  	    
  	    .category-actions {
  	        width: 120px;
  	        text-align: center;
  	    }
  	    
  	    .delete-btn {
  	        display: inline-flex;
  	        align-items: center;
  	        justify-content: center;
  	        padding: 8px 18px;
  	        background-color: #ff4d4d;
  	        color: white;
  	        text-decoration: none;
  	        border-radius: 6px;
  	        font-size: 13px;
  	        font-weight: 600;
  	        transition: all 0.3s ease;
  	        gap: 6px;
  	        box-shadow: 0 2px 5px rgba(255, 77, 77, 0.2);
  	    }
  	    
  	    .delete-btn:hover {
  	        background-color: #e63939;
  	        transform: translateY(-2px);
  	        box-shadow: 0 5px 15px rgba(255, 77, 77, 0.3);
  	        color: white;
  	    }
  	    
  	    .add-category-btn {
  	        display: inline-flex;
  	        align-items: center;
  	        gap: 8px;
  	        padding: 12px 24px;
  	        background-color: #4154f1;
  	        color: white;
  	        text-decoration: none;
  	        border-radius: 8px;
  	        font-weight: 600;
  	        font-size: 14px;
  	        transition: all 0.3s ease;
  	        box-shadow: 0 4px 10px rgba(65, 84, 241, 0.2);
  	    }
  	    
  	    .add-category-btn:hover {
  	        background-color: #3646d8;
  	        transform: translateY(-2px);
  	        box-shadow: 0 6px 15px rgba(65, 84, 241, 0.3);
  	        color: white;
  	    }
  	    
  	    .actions-container {
  	        display: flex;
  	        justify-content: flex-end;
  	        margin-top: 20px;
  	    }
  	    
  	    /* Empty state styling */
  	    .empty-state {
  	        text-align: center;
  	        padding: 50px 20px;
  	        color: #6c757d;
  	    }
  	    
  	    .empty-state-icon {
  	        font-size: 60px;
  	        margin-bottom: 15px;
  	        color: #c9cdf4;
  	    }
  	    
  	    .empty-state h4 {
  	        font-size: 18px;
  	        margin-bottom: 10px;
  	        color: #495057;
  	    }
  	    
  	    .empty-state p {
  	        font-size: 14px;
  	        color: #6c757d;
  	        margin-bottom: 20px;
  	    }
  	    
  	    /* Responsive adjustments */
  	    @media (max-width: 768px) {
  	        .category-table {
  	            display: block;
  	            overflow-x: auto;
  	        }
  	        
  	        .category-container {
  	            padding: 20px 15px;
  	        }
  	        
  	        .category-id {
  	            width: 80px;
  	        }
  	        
  	        .category-actions {
  	            width: 100px;
  	        }
  	        
  	        .add-category-btn {
  	            padding: 10px 18px;
  	            font-size: 13px;
  	        }
  	    }
  	    
  	    /* Category count badge */
  	    .category-count {
  	        display: inline-block;
  	        background-color: #4154f1;
  	        color: white;
  	        padding: 4px 10px;
  	        border-radius: 20px;
  	        font-size: 12px;
  	        font-weight: 600;
  	        margin-left: 10px;
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
      		<h1>
      		    List of Categories
      		    <c:if test="${not empty categoryList}">
                    <span class="category-count">${categoryList.size()}</span>
                </c:if>
      		</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="/">Home</a></li>
          			<li class="breadcrumb-item active">List Category</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
			<div class="category-container">
			    <c:choose>
			        <c:when test="${empty categoryList}">
			            <div class="empty-state">
			                <i class="bi bi-tags-fill empty-state-icon"></i>
			                <h4>No categories found</h4>
			                <p>Categories help you organize your expenses. Start by adding your first category.</p>
			                <div style="margin-top: 20px">
			                    <a href="newcategory" class="add-category-btn">
			                        <i class="bi bi-plus-circle"></i> Add Category
			                    </a>
			                </div>
			            </div>
			        </c:when>
			        <c:otherwise>
                        <table class="category-table">
                            <thead>
                                <tr>
                                    <th class="category-id">Category ID</th>
                                    <th class="category-name">Category Name</th>
                                    <th class="category-actions">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${categoryList}" var="category">
                                    <tr>
                                        <td class="category-id">${category.categoryId}</td>
                                        <td class="category-name">${category.categoryName}</td>
                                        <td class="category-actions">
                                            <a href="deletecategory?categoryId=${category.categoryId}" class="delete-btn" onclick="return confirm('Are you sure you want to delete this category?')">
                                                <i class="bi bi-trash"></i> Delete
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        
                        <div class="actions-container">
                            <a href="newcategory" class="add-category-btn">
                                <i class="bi bi-plus-circle"></i> Add Category
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