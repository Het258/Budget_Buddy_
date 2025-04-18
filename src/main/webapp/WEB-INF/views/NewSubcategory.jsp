<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>New Sub-category | Budget Buddy</title>
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
      		<h1>New Sub-category</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="/">Home</a></li>
          			<li class="breadcrumb-item active">New Sub-category</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
          <style>
            /* Form Card Styling */
            .subcategory-card {
                background: linear-gradient(145deg, #ffffff, #f5f7ff);
                border-radius: 16px;
                box-shadow: 0 10px 30px rgba(65, 84, 241, 0.1), 
                            0 5px 15px rgba(0, 0, 0, 0.05);
                padding: 30px;
                max-width: 650px;
                margin: 0 auto 40px;
                border: none;
                position: relative;
                overflow: hidden;
            }

            .subcategory-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 5px;
                background: linear-gradient(90deg, #4154f1, #7928ca, #ff0080);
            }

            .card-title {
                color: #012970;
                font-size: 1.5rem;
                font-weight: 700;
                margin-bottom: 25px;
                position: relative;
                padding-bottom: 15px;
                display: flex;
                align-items: center;
            }

            .card-title i {
                margin-right: 10px;
                font-size: 1.8rem;
                color: #4154f1;
            }

            .card-title::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 60px;
                height: 3px;
                background: #4154f1;
            }

            .card-subtitle {
                color: #6c757d;
                font-size: 0.95rem;
                margin-bottom: 30px;
                font-style: italic;
            }

            /* Form Controls */
            .form-floating {
                margin-bottom: 20px;
            }

            .form-floating label {
                color: #495057;
                font-weight: 500;
            }

            .form-control, .form-select {
                border-radius: 8px;
                border: 2px solid #e2e8f0;
                padding: 15px 20px;
                height: 58px;
                font-size: 1rem;
                transition: all 0.3s ease;
                background-color: #f8fafc;
            }

            .form-control:focus, .form-select:focus {
                border-color: #4154f1;
                box-shadow: 0 0 0 4px rgba(65, 84, 241, 0.1);
                background-color: #ffffff;
            }

            .form-floating > .form-control,
            .form-floating > .form-select {
                height: 58px;
            }

            /* Submit Button */
            .btn-gradient {
                background: linear-gradient(135deg, #4154f1, #7928ca);
                color: white;
                border: none;
                border-radius: 50px;
                padding: 12px 30px;
                font-size: 1rem;
                font-weight: 600;
                letter-spacing: 0.5px;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 5px 15px rgba(65, 84, 241, 0.4);
                display: inline-flex;
                align-items: center;
                justify-content: center;
            }

            .btn-gradient:hover {
                background: linear-gradient(135deg, #364bcf, #6923a7);
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(65, 84, 241, 0.5);
            }

            .btn-gradient i {
                margin-right: 8px;
                font-size: 1.1rem;
            }

            /* Table Section Styling - Modern Card Table */
            .table-section {
                margin-top: 50px;
            }

            .table-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 25px;
            }

            .table-title {
                font-size: 1.3rem;
                font-weight: 700;
                color: #012970;
                margin: 0;
                display: flex;
                align-items: center;
            }

            .table-title i {
                margin-right: 10px;
                color: #7928ca;
            }

            .table-actions {
                display: flex;
                gap: 10px;
            }

            .table-button {
                background-color: transparent;
                border: none;
                color: #4154f1;
                font-size: 0.9rem;
                cursor: pointer;
                display: flex;
                align-items: center;
                transition: all 0.2s ease;
                padding: 8px 16px;
                border-radius: 20px;
                border: 1px solid #e1e5ef;
            }

            .table-button:hover {
                background-color: #f0f3ff;
                color: #2c3ee5;
            }

            .table-button i {
                margin-right: 6px;
            }

            /* Card Based Table */
            .subcategory-cards {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                gap: 20px;
                margin-top: 25px;
            }

            .subcategory-item {
                background-color: white;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                transition: all 0.3s ease;
                border: 1px solid #e9ecef;
                position: relative;
            }

            .subcategory-item:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            }

            .subcategory-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 15px 20px;
                border-bottom: 1px solid #f1f1f1;
                background-color: #f8f9fa;
            }

            .subcategory-id {
                font-weight: 600;
                color: #6c757d;
                font-size: 0.85rem;
                background-color: #e9ecef;
                padding: 4px 10px;
                border-radius: 20px;
            }

            .subcategory-content {
                padding: 20px;
            }

            .subcategory-name {
                font-size: 1.1rem;
                font-weight: 600;
                color: #343a40;
                margin-bottom: 8px;
            }

            .subcategory-parent {
                font-size: 0.9rem;
                color: #6c757d;
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }

            .subcategory-parent i {
                margin-right: 5px;
                color: #20c997;
            }

            .subcategory-footer {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 20px;
                background-color: #f8f9fa;
                border-top: 1px solid #f1f1f1;
            }

            .subcategory-date {
                font-size: 0.85rem;
                color: #6c757d;
            }

            .subcategory-actions {
                display: flex;
                gap: 10px;
            }

            .action-btn {
                border: none;
                background-color: transparent;
                cursor: pointer;
                padding: 8px;
                border-radius: 6px;
                transition: all 0.2s ease;
                font-size: 1rem;
            }

            .edit-btn {
                color: #20c997;
            }

            .edit-btn:hover {
                background-color: rgba(32, 201, 151, 0.1);
            }

            .delete-btn {
                color: #ff6b6b;
            }

            .delete-btn:hover {
                background-color: rgba(255, 107, 107, 0.1);
            }

            .view-btn {
                color: #4154f1;
            }

            .view-btn:hover {
                background-color: rgba(65, 84, 241, 0.1);
            }

            /* Category Badge */
            .category-badge {
                display: inline-flex;
                align-items: center;
                padding: 5px 12px;
                border-radius: 50px;
                font-size: 0.85rem;
                font-weight: 500;
                margin-top: 5px;
                background-color: #e3e8ff;
                color: #4154f1;
            }

            .category-badge i {
                margin-right: 5px;
                font-size: 0.9rem;
            }

            /* Empty State */
            .empty-state {
                background-color: white;
                border-radius: 12px;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
                padding: 40px 20px;
                text-align: center;
                margin-top: 20px;
            }

            .empty-state i {
                font-size: 3rem;
                color: #e1e5ef;
                margin-bottom: 15px;
            }

            .empty-state h4 {
                color: #495057;
                font-weight: 600;
                margin-bottom: 10px;
            }

            .empty-state p {
                color: #6c757d;
                max-width: 300px;
                margin: 0 auto;
            }

            /* Search Box */
            .search-box {
                position: relative;
                max-width: 300px;
                margin-bottom: 20px;
            }

            .search-box input {
                width: 100%;
                padding: 12px 20px 12px 45px;
                border: 1px solid #e1e5ef;
                border-radius: 50px;
                font-size: 0.9rem;
                transition: all 0.3s ease;
                background-color: #f8f9fa;
            }

            .search-box input:focus {
                border-color: #4154f1;
                box-shadow: 0 0 0 4px rgba(65, 84, 241, 0.1);
                outline: none;
                background-color: white;
            }

            .search-box i {
                position: absolute;
                left: 18px;
                top: 50%;
                transform: translateY(-50%);
                color: #6c757d;
            }

            /* Responsive Adjustments */
            @media (max-width: 992px) {
                .subcategory-cards {
                    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                }
            }

            @media (max-width: 768px) {
                .subcategory-card {
                    padding: 20px;
                }
                
                .table-header {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 15px;
                }
                
                .table-actions {
                    width: 100%;
                    justify-content: space-between;
                }
                
                .search-box {
                    max-width: 100%;
                }
            }

            @media (max-width: 576px) {
                .subcategory-cards {
                    grid-template-columns: 1fr;
                }
            }
          </style>
          
          <!-- Subcategory Form Card -->
          <div class="subcategory-card">
              <h5 class="card-title"><i class="bi bi-diagram-3"></i> Create New Sub-category</h5>
              <p class="card-subtitle">Create sub-categories to further organize your budget items</p>
              
              <form action="savesubcategory" method="post">
                  <div class="form-floating mb-4">
                      <input type="text" class="form-control" id="subcategoryName" name="subcategoryName" placeholder="Enter sub-category name" required>
                      <label for="subcategoryName">Sub-category Name</label>
                  </div>
                  
                  <div class="form-floating mb-4">
                      <select class="form-select" id="categoryId" name="categoryId" required>
                          <option value="" selected disabled>Please select a category</option>
                          <c:forEach items="${categoryList}" var="category">
                              <option value="${category.categoryId}">${category.categoryName}</option>
                          </c:forEach>
                      </select>
                      <label for="categoryId">Parent Category</label>
                  </div>
                  
                  <div class="text-end">
                      <button type="submit" class="btn-gradient">
                          <i class="bi bi-plus-circle-fill"></i> Save Sub-category
                      </button>
                  </div>
              </form>
          </div>
          
          <!-- Subcategory Table Section -->
          <div class="table-section">
              <div class="table-header">
                  <h5 class="table-title"><i class="bi bi-grid-3x3-gap-fill"></i> Existing Sub-categories</h5>
                  
                  <div class="table-actions">
                      <button class="table-button">
                          <i class="bi bi-arrow-clockwise"></i> Refresh
                      </button>
                      <button class="table-button">
                          <i class="bi bi-filter"></i> Filter
                      </button>
                  </div>
              </div>
              
              <div class="search-box">
                  <i class="bi bi-search"></i>
                  <input type="text" id="subcategorySearch" placeholder="Search sub-categories...">
              </div>
              
              <c:choose>
                  <c:when test="${not empty subcategoryList && subcategoryList.size() > 0}">
                      <div class="subcategory-cards">
                          <c:forEach items="${subcategoryList}" var="subcategory">
                              <div class="subcategory-item">
                                  <div class="subcategory-header">
                                      <span class="subcategory-id">#${subcategory.subcategoryId}</span>
                                      <div class="subcategory-actions">
                                          <button class="action-btn view-btn" title="View Details">
                                              <i class="bi bi-eye"></i>
                                          </button>
                                      </div>
                                  </div>
                                  
                                  <div class="subcategory-content">
                                      <h6 class="subcategory-name">${subcategory.subcategoryName}</h6>
                                      <div class="subcategory-parent">
                                          <i class="bi bi-diagram-2"></i> 
                                          ${subcategory.category.categoryName}
                                      </div>
                                      
                                      <div class="category-badge">
                                          <i class="bi bi-tag-fill"></i> 
                                          ${subcategory.category.categoryName}
                                      </div>
                                  </div>
                                  
                                  <div class="subcategory-footer">
                                      <span class="subcategory-date">
                                          <i class="bi bi-calendar3"></i> 
                                          ${subcategory.createdDate}
                                      </span>
                                      
                                      <div class="subcategory-actions">
                                          <button class="action-btn edit-btn" title="Edit Sub-category">
                                              <i class="bi bi-pencil-square"></i>
                                          </button>
                                          <button class="action-btn delete-btn" title="Delete Sub-category">
                                              <i class="bi bi-trash"></i>
                                          </button>
                                      </div>
                                  </div>
                              </div>
                          </c:forEach>
                      </div>
                  </c:when>
                  <c:otherwise>
                      <div class="empty-state">
                          <i class="bi bi-folder"></i>
                          <h4>No Sub-categories Found</h4>
                          <p>Create your first sub-category using the form above.</p>
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
    
    <!-- Subcategory Search Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('subcategorySearch');
            
            if(searchInput) {
                searchInput.addEventListener('keyup', function() {
                    const searchValue = this.value.toLowerCase();
                    const items = document.querySelectorAll('.subcategory-item');
                    
                    items.forEach(item => {
                        const name = item.querySelector('.subcategory-name').textContent.toLowerCase();
                        const category = item.querySelector('.subcategory-parent').textContent.toLowerCase();
                        
                        if(name.includes(searchValue) || category.includes(searchValue)) {
                            item.style.display = '';
                        } else {
                            item.style.display = 'none';
                        }
                    });
                });
            }
            
            // Refresh button functionality
            const refreshBtn = document.querySelector('.table-button');
            if(refreshBtn) {
                refreshBtn.addEventListener('click', function() {
                    window.location.reload();
                });
            }
        });
    </script>

</body>

</html>