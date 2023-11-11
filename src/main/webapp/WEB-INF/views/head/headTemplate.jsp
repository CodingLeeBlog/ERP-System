<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Dashboard | Hyper - Responsive Bootstrap 5 Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
		
		<!-- Sweet Alarm -->
		<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css" rel="stylesheet">
		
		<!-- SimpleMDE css -->
        <link href="${pageContext.request.contextPath }/resources/assets/vendor/simplemde/simplemde.min.css" rel="stylesheet" type="text/css" />
        
        <!-- App favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico">

        <!-- Daterangepicker css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendor/daterangepicker/daterangepicker.css">

		<!-- Bootstrap Datepicker css -->
    	<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    	
        <!-- Vector Map css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendor/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css">

        <!-- Theme Config Js -->
        <script src="${pageContext.request.contextPath }/resources/assets/js/hyper-config.js"></script>

        <!-- App css -->
        <link href="${pageContext.request.contextPath }/resources/assets/css/app-saas.min.css" rel="stylesheet" type="text/css" id="app-style" />

        <!-- Icons css -->
        <link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        
        <!-- Font Awesome CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        
        <!-- JQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        
        <!-- Datatables css -->
	    <link href="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-keytable-bs5/css/keyTable.bootstrap5.min.css" rel="stylesheet" type="text/css" />
		
		<!-- Daum주소 CDN -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </head>

    <body>

<c:if test="${not empty message }">
	<script type="text/javascript">
		alert("${message}");
		<c:remove var="message" scope="request"/>
		<c:remove var="message" scope="session"/>
	</script>
</c:if>
<body>

    <div class="wrapper">

	<tiles:insertAttribute name="header"/>
		
	<div>
		<tiles:insertAttribute name="content"/>
	</div>
		
		<tiles:insertAttribute name="footer"/>

    </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->

        <!-- END wrapper -->       
        
        <!-- Vendor js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>

    <!-- Daterangepicker js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/daterangepicker/moment.min.js"></script>

    <!-- Apex Charts js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/daterangepicker/moment.min.js"></script>

    <!-- Apex Chart Area Demo js -->
    <script src="https://apexcharts.com/samples/assets/stock-prices.js"></script>
    <script src="https://apexcharts.com/samples/assets/series1000.js"></script>
    <script src="https://apexcharts.com/samples/assets/github-data.js"></script>
    <script src="https://apexcharts.com/samples/assets/irregular-data-series.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.apex-area.js"></script>     

    <!-- Code Highlight js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/highlightjs/highlight.pack.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/clipboard/clipboard.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/hyper-syntax.js"></script>
    <!-- Bootstrap Datepicker js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    <!-- Chart js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/chart.js/chart.min.js"></script>
    <!-- Chart.js Area Demo js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.chartjs-area.js"></script>
    <!-- Projects Analytics Dashboard App js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.dashboard-projects.js"></script>
    <!-- Vector Map js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/admin-resources/jquery.vectormap/maps/jquery-jvectormap-world-mill-en.js"></script>

    <!-- Dashboard App js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.dashboard.js"></script>
    
    <!-- SimpleMDE js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/simplemde/simplemde.min.js"></script>

    <!-- App js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>

    <!-- Google Maps API -->
    <script src="https://maps.google.com/maps/api/js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/gmaps/gmaps.min.js"></script>

    <!-- Google Maps Demo js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.google-maps.js"></script>
    <!-- Bootstrap Datepicker js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    
    <!-- Page init js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.inbox.js"></script>
    
    <!-- Datatables js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>

    <!-- Datatable Init js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.datatable-init.js"></script>
    
    <!-- SweetAlert CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
    </body>
</html> 