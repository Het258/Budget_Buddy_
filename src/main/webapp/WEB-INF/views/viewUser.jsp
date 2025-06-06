<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>User profile | Budget Buddy</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
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
	<%@include file="SessionValidate.jsp"%>
	<!-- End Session Validate -->

	<!-- ======= Header ======= -->
<jsp:include page="AdminHeader.jsp"></jsp:include>	

	<!-- ======= Sidebar ======= -->
	<jsp:include page="AdminSidebar.jsp"></jsp:include>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>User Profile</h1>
			<nav>
				
			</nav>
		</div>
		<!-- End Page Title -->

	
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered" role="tablist">

                <li class="nav-item" role="presentation">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview" aria-selected="true" role="tab" fdprocessedid="6b607">Overview</button>
                </li>

                

                

                

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade profile-overview active show" id="profile-overview" role="tabpanel">
<!--                   <h5 class="card-title">About</h5>
                  <p class="small fst-italic">Sunt est soluta temporibus accusantium neque nam maiores cumque temporibus. Tempora libero non est unde veniam est qui dolor. Ut sunt iure rerum quae quisquam autem eveniet perspiciatis odit. Fuga sequi sed ea saepe at unde.</p>
 -->
                  <h5 class="card-title">Profile Details</h5>
                    
                   
				   <div class="row">
                    <div class="col-lg-3 col-md-4 label ">User ID</div>
                    <div class="col-lg-9 col-md-8">${user.userId} </div>
                  </div>
                    
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">First Name</div>
                    <div class="col-lg-9 col-md-8">${user.firstName} </div>
                  </div>

                   <div class="row">
                    <div class="col-lg-3 col-md-4 label ">Last Name</div>
                    <div class="col-lg-9 col-md-8">${user.lastName} </div>
                  </div>
 
                    <div class="row">
                    <div class="col-lg-3 col-md-4 label">Gender</div>
                    <div class="col-lg-9 col-md-8">${user.gender }</div>
                  </div>
                   
                    <div class="row">
                    <div class="col-lg-3 col-md-4 label">Contact Num</div>
                    <div class="col-lg-9 col-md-8">${user.contactNum}</div>
                  </div>
 
                    <div class="row">
                    <div class="col-lg-3 col-md-4 label">Email</div>
                    <div class="col-lg-9 col-md-8">${user.email}</div>
                  </div>
 
                   <div class="row">
                    <div class="col-lg-3 col-md-4 label">D.O.B</div>
                    <div class="col-lg-9 col-md-8">${user.bornYear}</div>
                  </div>
 
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Role</div>
                    <div class="col-lg-9 col-md-8">${user.role}</div>
                  </div>

                </div>

                

                

                

              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>
    
    
    
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<jsp:include page="UserFooter.jsp"></jsp:include>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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