<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>New Income | Budget Buddy</title>
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

<style>
    /* Custom Form Styling */
    .income-form-container {
        background-color: #ffffff;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        padding: 30px;
        margin-bottom: 30px;
    }
    
    .form-header {
        border-bottom: 1px solid #e9ecef;
        padding-bottom: 15px;
        margin-bottom: 25px;
    }
    
    .form-header h5 {
        color: #2c7be5;
        font-weight: 600;
        margin: 0;
    }
    
    .form-label {
        font-weight: 500;
        color: #495057;
        margin-bottom: 8px;
    }
    
    .form-control, .form-select {
        border-radius: 6px;
        padding: 10px 15px;
        border: 1px solid #dfe7f1;
        transition: all 0.3s ease;
    }
    
    .form-control:focus, .form-select:focus {
        border-color: #2c7be5;
        box-shadow: 0 0 0 0.25rem rgba(44, 123, 229, 0.25);
    }
    
    .form-group {
        margin-bottom: 20px;
    }
    
    .btn-submit {
        background-color: #2c7be5;
        border: none;
        padding: 10px 25px;
        font-weight: 500;
        border-radius: 6px;
        transition: all 0.3s ease;
    }
    
    .btn-submit:hover {
        background-color: #1a68d1;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(44, 123, 229, 0.3);
    }
    
    .btn-cancel {
        background-color: #f8f9fa;
        border: 1px solid #e9ecef;
        color: #495057;
        padding: 10px 25px;
        font-weight: 500;
        border-radius: 6px;
        transition: all 0.3s ease;
        margin-left: 10px;
    }
    
    .btn-cancel:hover {
        background-color: #e9ecef;
        transform: translateY(-2px);
    }
    
    .form-note {
        font-size: 0.875rem;
        color: #6c757d;
        margin-top: 5px;
    }
    
    textarea.form-control {
        min-height: 100px;
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
        .col-form-label {
            text-align: left !important;
            margin-bottom: 5px;
        }
    }
</style>
</head>

<body>

    <!-- ======= Session Validate ======= -->
    <%@include file="SessionValidate.jsp"%>
    <!-- End Session Validate -->

    <!-- ======= Header ======= -->
    <jsp:include page="UserHeader.jsp"></jsp:include>
    <!-- End Header -->

    <!-- ======= Sidebar ======= -->
    <jsp:include page="UserSidebar.jsp"></jsp:include>
    <!-- End Sidebar-->

    <main id="main" class="main">

        <div class="pagetitle">
            <h1>New Income</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                    <li class="breadcrumb-item active">New Income</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="col-lg-8">
                    <div class="income-form-container">
                        <div class="form-header">
                            <h5>Add New Income</h5>
                        </div>
                        <form action="usersaveincome" method="post">
                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label form-label">Title</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="title" required>
                                    <small class="form-note">Enter a descriptive title for this income</small>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label form-label">Amount</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="amount" step="0.01" required>
                                    <small class="form-note">Enter the income amount</small>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label form-label">Account</label>
                                <div class="col-sm-9">
                                    <select name="accountId" class="form-select" required>
                                        <option value="" selected disabled>-- Select Account --</option>
                                        <c:forEach items="${accountList}" var="account">
                                            <option value="${account.accountId}">${account.title}</option>
                                        </c:forEach>
                                    </select>
                                    <small class="form-note">Select the account to credit</small>
                                </div>
                            </div>
                            
                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label form-label">Date</label>
                                <div class="col-sm-9">
                                    <input type="date" class="form-control" name="date" required>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-3 col-form-label form-label">Description</label>
                                <div class="col-sm-9">
                                    <textarea name="description" class="form-control" rows="3"></textarea>
                                    <small class="form-note">Optional notes about this income</small>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-sm-9 offset-sm-3">
                                    <button type="submit" class="btn btn-submit">
                                        <i class="bi bi-save"></i> Save Income
                                    </button>
                                    <a href="userlistincome" class="btn btn-cancel">
                                        <i class="bi bi-x-circle"></i> Cancel
                                    </a>
                                </div>
                            </div>
                        </form>
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