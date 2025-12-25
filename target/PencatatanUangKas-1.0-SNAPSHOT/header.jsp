<%-- 
    Document   : header
    Created on : 11 Dec 2025, 15.24.29
    Author     : LATIF WIBOWO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sistem Uang Kas</title>
    
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css" rel="stylesheet">

    <style>
        body { background-color: #f0f2f5; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; display: flex; flex-direction: column; min-height: 100vh; }
        main { flex: 1; }
        .hero-header {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('${pageContext.request.contextPath}/images/banner-uang.jpg');
            background-size: cover; background-position: center; color: white; padding: 40px 0; margin-bottom: 20px; border-radius: 0 0 20px 20px; box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        .card-custom { background: rgba(255, 255, 255, 0.95); border: none; border-radius: 15px; box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.07); }
        @media print {
        /* Sembunyikan elemen navigasi saat nge-print */
        .navbar, .col-md-3, .btn, footer, .hero-header, .alert-info {
            display: none !important;
        }
        /* Pastikan konten tabel lebar penuh */
        .container, .col-md-9, .col-md-12 {
            width: 100% !important;
            max-width: 100% !important;
            margin: 0 !important;
            padding: 0 !important;
        }
        /* Hilangkan bayangan kartu biar hemat tinta */
        .card {
            border: 1px solid #ddd !important;
            box-shadow: none !important;
        }
    }
    </style>
</head>
<body>
    <div class="container-fluid hero-header text-center">
        <h1 class="fw-bold display-5"><i class="fas fa-wallet me-3"></i>Sistem Pencatatan Uang Kas</h1>
        <p class="lead">Kelola Keuangan Kelas dengan Transparan & Akuntabel</p>
    </div>