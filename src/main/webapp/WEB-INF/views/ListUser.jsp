<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>List Users | Budget Buddy</title>
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
      		<h1>List of Users</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">List User</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
			<style>
    /* Modern Table Styling */
    #userTable {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
        font-family: 'Poppins', sans-serif;
    }
    
    #userTable thead th {
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
    
    #userTable tbody tr {
        transition: all 0.3s ease;
    }
    
    #userTable tbody tr:hover {
        background-color: rgba(65, 84, 241, 0.1);
        transform: translateY(-1px);
    }
    
    #userTable tbody td {
        padding: 12px 15px;
        border-bottom: 1px solid #e0e0e0;
        vertical-align: middle;
    }
    
    #userTable tbody tr:last-child td {
        border-bottom: none;
    }
    
    /* Action Links Styling */
    .action-links {
        display: flex;
        gap: 10px;
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
    
    .action-links a.view-link {
        background-color: #2ecc71;
        color: white;
    }
    
    .action-links a.edit-link {
        background-color: #3498db;
        color: white;
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
    
    /* Pagination Styling */
    .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 8px;
        margin-top: 25px;
    }
    
    .pagination a {
        padding: 8px 16px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.2s ease;
    }
    
    .pagination a.btn-primary {
        background-color: #4154f1;
        color: white;
        border: none;
    }
    
    .pagination a.btn-dark {
        background-color: #2c3e50;
        color: white;
    }
    
    .pagination a:hover:not(.btn-dark) {
        background-color: #314199;
        color: white;
    }
    
    /* Add User Button */
    .add-user-btn {
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
    
    .add-user-btn:hover {
        background-color: #314199;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    
    .add-user-btn i {
        margin-right: 8px;
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
        #userTable {
            display: block;
            overflow-x: auto;
        }
        
        .action-links {
            flex-direction: column;
            gap: 5px;
        }
    }
</style>

<table id="userTable" class="display">
    <thead>
        <tr>
            <th>User Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Gender</th>
            <th>ContactNum</th>
            <th>Email</th>
            <th>Born Year</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.userId}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.gender}</td>
                <td>${user.contactNum}</td>
                <td>${user.email}</td>
                <td>${user.bornYear}</td>
                <td>${user.role}</td>
                <td>
                    <div class="action-links">
                        <a href="viewUser?userId=${user.userId}" class="view-link">
                            <i class="bi bi-eye-fill"></i> View
                        </a>
                        <a href="editUser?userId=${user.userId}" class="edit-link">
                            <i class="bi bi-pencil-fill"></i> Edit
                        </a>
                        <a href="deleteUser?userId=${user.userId}" class="delete-link">
                            <i class="bi bi-trash-fill"></i> Delete
                        </a>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!-- Pagination Section -->
<div class="pagination">
    <c:if test="${currentPage > 1}">
        <a href="listuser?page=${currentPage - 1}" class="btn btn-primary">
            <i class="bi bi-chevron-left"></i> Previous
        </a>
    </c:if>

    <c:forEach begin="1" end="${totalPages}" var="i">
        <a href="listuser?page=${i}" 
           class="btn <c:if test="${i == currentPage}">btn-dark</c:if>">
            ${i}
        </a>
    </c:forEach>

    <c:if test="${currentPage < totalPages}">
        <a href="listuser?page=${currentPage + 1}" class="btn btn-primary">
            Next <i class="bi bi-chevron-right"></i>
        </a>
    </c:if>
</div>

<br>
<a href="newuser" class="add-user-btn">
    <i class="bi bi-plus-circle"></i> Add New User
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
  	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
					
	<script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>
	

  	<!-- Template Main JS File -->
  	<script src="assets/js/main.js"></script>

<!-- Include jQuery and DataTables -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

<!-- Initialize DataTables -->
<script>
    $(document).ready(function () {
        $('#userTable').DataTable({
            "paging": false,      // Disable DataTables pagination since we have custom pagination
            "lengthMenu": [5, 10, 25, 50], // Records per page
            "ordering": true,    // Enables sorting
            "info": true,        // Show table information
            "searching": true,   // Enables search box
            "dom": '<"top"f>rt<"bottom"lip><"clear">',
            "language": {
                "search": "Search users:",
                "searchPlaceholder": "Enter keyword..."
            },
            "responsive": true
        });
    });
</script>

</body>

</html>