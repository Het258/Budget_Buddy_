<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="editport">

<title>Edit User | Budget Buddy</title>
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
    /* Main Card Styling */
    .card {
        border-radius: 10px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        border: none;
    }
    
    .card-body {
        padding: 2rem;
    }
    
    .card-title {
        color: #2c3e50;
        font-size: 1.5rem;
        font-weight: 600;
        margin-bottom: 1.5rem;
        padding-bottom: 1rem;
        border-bottom: 1px solid #e9ecef;
    }
    
    /* Form Styling */
    .form-label {
        font-weight: 500;
        color: #495057;
        padding-top: 0.5rem;
    }
    
    .form-control {
        border-radius: 6px;
        border: 1px solid #ced4da;
        padding: 0.6rem 1rem;
        transition: all 0.3s;
    }
    
    .form-control:focus {
        border-color: #86b7fe;
        box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
    }
    
    select.form-control {
        height: calc(2.25rem + 8px);
    }
    
    /* Button Styling */
    .btn-primary {
        background-color: #4e73df;
        border: none;
        padding: 0.6rem 2rem;
        border-radius: 6px;
        font-weight: 500;
        letter-spacing: 0.5px;
        transition: all 0.3s;
        margin-top: 1rem;
    }
    
    .btn-primary:hover {
        background-color: #2e59d9;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(78, 115, 223, 0.3);
    }
    
    /* Row Spacing */
    .row.mb-3 {
        margin-bottom: 1.5rem !important;
    }
    
    /* Edit Link Styling */
    a[href^="/editUser"] {
        display: none; /* Hide the redundant edit link */
    }
    
    /* Responsive Adjustments */
    @media (max-width: 768px) {
        .form-label, .col-lg-9, .col-md-8 {
            padding-left: 0;
            padding-right: 0;
        }
    }
</style>
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
			<h1>Edit User</h1>
		</div>
		<!-- End Page Title -->

		<div class="row">
			<div class="col-xl-8">

				<div class="card">
					<div class="card-body pt-3">
						<h5 class="card-title">Edit Profile Details</h5>
						<form action="updateUser" method="post">

							<input type="hidden" name="userId" value="${user.userId}">
							<a href="/editUser?userId=${user.userId}">Edit</a>

							<div class="row mb-3">
								<label class="col-lg-3 col-md-4 form-label">First Name</label>
								<div class="col-lg-9 col-md-8">
									<input type="text" class="form-control" name="firstName" value="${user.firstName}" required>
								</div>
							</div>

							<div class="row mb-3">
								<label class="col-lg-3 col-md-4 form-label">Last Name</label>
								<div class="col-lg-9 col-md-8">
									<input type="text" class="form-control" name="lastName" value="${user.lastName}" required>
								</div>
							</div>

							<div class="row mb-3">
								<label class="col-lg-3 col-md-4 form-label">Gender</label>
								<div class="col-lg-9 col-md-8">
									<select class="form-control" name="gender" required>
										<option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
										<option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
									</select>
								</div>
							</div>

							<div class="row mb-3">
								<label class="col-lg-3 col-md-4 form-label">Contact Num</label>
								<div class="col-lg-9 col-md-8">
									<input type="text" class="form-control" name="contactNum" value="${user.contactNum}" required>
								</div>
							</div>

							<div class="row mb-3">
								<label class="col-lg-3 col-md-4 form-label">Email</label>
								<div class="col-lg-9 col-md-8">
									<input type="email" class="form-control" name="email" value="${user.email}" required>
								</div>
							</div>
							
							<div class="row mb-3">
								<label class="col-lg-3 col-md-4 form-label">D.O.B</label>
								<div class="col-lg-9 col-md-8">
									<input type="text" class="form-control" name="bornYear" value="${user.bornYear}" required>
								</div>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Save Changes</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<jsp:include page="UserFooter.jsp"></jsp:include>
	<!-- End Footer -->

</body>

</html>