<%-- 
    Document   : index
    Created on : 10 Jan 2026, 15.42.49
    Author     : LATIF WIBOWO
--%>
<%-- File: beranda.jsp (Tema Modern) --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home - Sistem Pencatatan Uang Kas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>
            :root {
                --primary-dark: #2c3e50;
                --primary-accent: #1abc9c; /* Emerald */
                --accent-hover: #16a085;
            }

            /* Hero Section Modern */
            .hero-section {
                background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%); /* Dark Slate Gradient */
                color: white;
                padding: 100px 0 80px; /* Padding atas lebih besar agar pas dengan navbar fixed */
                border-radius: 0 0 50px 50px;
                margin-bottom: 60px;
                position: relative;
                overflow: hidden;
            }

            /* Hiasan Background Hero (Opsional) */
            .hero-section::before {
                content: '';
                position: absolute;
                top: -50%;
                right: -10%;
                width: 600px;
                height: 600px;
                background: rgba(255,255,255,0.03);
                border-radius: 50%;
            }

            /* Tombol CTA Custom */
            .btn-accent {
                background-color: var(--primary-accent);
                border: none;
                color: white;
                padding: 12px 40px;
                transition: all 0.3s;
                box-shadow: 0 4px 15px rgba(26, 188, 156, 0.4);
            }
            .btn-accent:hover {
                background-color: var(--accent-hover);
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(26, 188, 156, 0.6);
                color: white;
            }

            /* Kartu Fitur */
            .feature-card {
                transition: all 0.3s ease;
                cursor: default;
                border: none;
                background: #fff;
                border-radius: 15px;
            }
            .feature-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 30px rgba(0,0,0,0.1) !important;
            }

            .icon-box {
                width: 80px;
                height: 80px;
                border-radius: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 20px;
                font-size: 32px;
                transition: transform 0.3s;
            }
            .feature-card:hover .icon-box {
                transform: rotate(5deg) scale(1.1);
            }

            /* Warna Ikon Spesifik */
            .icon-db {
                background: rgba(26, 188, 156, 0.1);
                color: var(--primary-accent);
            }
            .icon-dash {
                background: rgba(52, 152, 219, 0.1);
                color: #3498db;
            }
            .icon-rep {
                background: rgba(155, 89, 182, 0.1);
                color: #9b59b6;
            }
            .icon-user {
                background: rgba(231, 76, 60, 0.1);
                color: #e74c3c;
            }

        </style>
    </head>
    <body class="bg-light font-sans">

        <%@ include file="navbar_landing.jsp" %>

        <div class="hero-section text-center">
            <div class="container position-relative" style="z-index: 2;">
                <h1 class="display-4 fw-bold mb-3">Sistem Pencatatan Uang Kas</h1>
                <p class="lead mb-5 opacity-75 mx-auto" style="max-width: 700px;">
                    Tinggalkan cara lama. Kelola keuangan kelas dengan transparansi penuh, 
                    akuntabilitas tinggi, dan teknologi modern berbasis Cloud Database.
                </p>
                <a href="login.jsp" class="btn btn-accent btn-lg fw-bold rounded-pill">
                    Mulai Sekarang <i class="fas fa-arrow-right ms-2"></i>
                </a>
            </div>
        </div>

        <div class="container mb-5">
            <div class="text-center mb-5">
                <h6 class="text-uppercase fw-bold text-muted ls-2">Kenapa Memilih Kami?</h6>
                <h2 class="fw-bold" style="color: var(--primary-dark);">Fitur Unggulan</h2>
            </div>

            <div class="row g-4">
                <div class="col-md-3 col-6">
                    <div class="card feature-card h-100 py-4 text-center shadow-sm">
                        <div class="card-body">
                            <div class="icon-box icon-db">
                                <i class="fas fa-database"></i>
                            </div>
                            <h5 class="fw-bold text-dark">Secure Data</h5>
                            <p class="small text-muted px-2">Data tersimpan aman di PostgreSQL dengan struktur yang terorganisir.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-6">
                    <div class="card feature-card h-100 py-4 text-center shadow-sm">
                        <div class="card-body">
                            <div class="icon-box icon-dash">
                                <i class="fas fa-desktop"></i>
                            </div>
                            <h5 class="fw-bold text-dark">Modern UI</h5>
                            <p class="small text-muted px-2">Antarmuka Dashboard yang responsif, bersih, dan mudah dipahami.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-6">
                    <div class="card feature-card h-100 py-4 text-center shadow-sm">
                        <div class="card-body">
                            <div class="icon-box icon-rep">
                                <i class="fas fa-chart-pie"></i>
                            </div>
                            <h5 class="fw-bold text-dark">Real-time Stats</h5>
                            <p class="small text-muted px-2">Grafik visualisasi keuangan otomatis tanpa hitung manual.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-6">
                    <div class="card feature-card h-100 py-4 text-center shadow-sm">
                        <div class="card-body">
                            <div class="icon-box icon-user">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                            <h5 class="fw-bold text-dark">Transparency</h5>
                            <p class="small text-muted px-2">Akses terbuka bagi anggota untuk memantau penggunaan dana.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="text-center py-4 bg-white mt-5 border-top">
            <p class="mb-0 text-muted">&copy; 2026 Sistem Uang Kas. Designed by group 21.</p>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            window.onload = function () {
                var navbar = document.querySelector('.navbar');
                if (navbar) {
                    navbar.classList.remove('bg-primary');
                    navbar.style.backgroundColor = '#2c3e50'; // Dark Slate
                    navbar.classList.add('shadow');
                }
                var btnLogin = document.querySelector('.navbar .btn');
                if (btnLogin) {
                    btnLogin.classList.remove('text-primary');
                    btnLogin.style.color = '#2c3e50';
                }
            };
        </script>
    </body>
</html>