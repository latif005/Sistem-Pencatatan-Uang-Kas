<%-- 
    Document   : gallery_public
    Created on : 10 Jan 2026, 15.46.00
    Author     : LATIF WIBOWO
--%>
<%-- File: gallery_public.jsp (Revisi: Tunggakan & Laporan Keseluruhan) --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gallery - Sistem Uang Kas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>
            :root {
                --primary-dark: #2c3e50; /* Dark Slate */
                --primary-accent: #1abc9c; /* Emerald Green */
                --accent-hover: #16a085;
            }

            /* Header Custom */
            .gallery-header {
                background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
                color: white;
                padding: 80px 0 60px;
                margin-bottom: 40px;
                border-bottom-right-radius: 50px;
                border-bottom-left-radius: 50px;
            }

            /* Filter Buttons Styling */
            .filter-btn {
                border: 2px solid var(--primary-dark);
                color: var(--primary-dark);
                background: transparent;
                border-radius: 30px;
                padding: 8px 25px;
                margin: 0 5px 10px;
                font-weight: 600;
                transition: all 0.3s ease;
            }

            .filter-btn:hover {
                background: rgba(44, 62, 80, 0.1);
                transform: translateY(-2px);
            }

            /* Tombol Aktif (Terpilih) */
            .filter-btn.active {
                background-color: var(--primary-dark);
                color: white;
                box-shadow: 0 5px 15px rgba(44, 62, 80, 0.3);
            }

            /* Frame Gambar Modern */
            .gallery-item {
                transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            }

            /* Animasi saat filter */
            .gallery-item.hide {
                opacity: 0;
                transform: scale(0.8);
                position: absolute; /* Supaya layout bergeser */
                pointer-events: none;
                width: 0;
                padding: 0;
                margin: 0;
            }

            .img-frame {
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 10px 25px rgba(0,0,0,0.1);
                background: #fff;
                position: relative;
            }

            .img-frame img {
                transition: transform 0.5s ease;
                width: 100%;
                height: 240px;
                object-fit: cover;
                object-position: top center;
            }

            .img-frame:hover img {
                transform: scale(1.08);
            }

            /* Badge Kategori di atas gambar */
            .category-badge {
                position: absolute;
                top: 15px;
                right: 15px;
                background: rgba(44, 62, 80, 0.85);
                color: white;
                padding: 5px 15px;
                border-radius: 20px;
                font-size: 0.8rem;
                backdrop-filter: blur(5px);
                z-index: 10;
            }
        </style>
    </head>
    <body class="bg-light">

        <%@ include file="navbar_landing.jsp" %>

        <div class="gallery-header text-center">
            <div class="container">
                <h1 class="fw-bold display-5">Koleksi Gambar</h1>
                <p class="opacity-75 lead">Lihat tampilan dan fitur aplikasi Sistem Uang Kas</p>
            </div>
        </div>

        <div class="container mb-5">

            <div class="row justify-content-center mb-5">
                <div class="col-12 text-center">
                    <button class="btn filter-btn active" data-filter="all">Semua</button>
                    <button class="btn filter-btn" data-filter="dashboard">Dashboard</button>
                    <button class="btn filter-btn" data-filter="tunggakan">Laporan Tunggakan</button>
                    <button class="btn filter-btn" data-filter="keseluruhan">Laporan Keseluruhan</button>
                    <button class="btn filter-btn" data-filter="login">Login & Keamanan</button>
                </div>
            </div>

            <div class="row g-4" id="gallery-container">

                <div class="col-md-4 gallery-item dashboard">
                    <div class="card h-100 border-0 bg-transparent">
                        <div class="img-frame">
                            <span class="category-badge">Dashboard</span>
                            <img src="images/dashboard.png" alt="Dashboard">
                        </div>
                        <div class="mt-3 text-center">
                            <h6 class="fw-bold text-dark">Dashboard Utama</h6>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 gallery-item tunggakan">
                    <div class="card h-100 border-0 bg-transparent">
                        <div class="img-frame">
                            <span class="category-badge bg-danger">Tunggakan</span>
                            <img src="images/tunggakan.png" alt="Tunggakan">
                        </div>
                        <div class="mt-3 text-center">
                            <h6 class="fw-bold text-dark">Data Tunggakan Siswa</h6>
                            <p class="small text-muted">Monitoring siswa yang belum bayar kas.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 gallery-item login">
                    <div class="card h-100 border-0 bg-transparent">
                        <div class="img-frame">
                            <span class="category-badge">Keamanan</span>
                            <img src="images/login.png" alt="Login">
                        </div>
                        <div class="mt-3 text-center">
                            <h6 class="fw-bold text-dark">Halaman Login</h6>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 gallery-item dashboard">
                    <div class="card h-100 border-0 bg-transparent">
                        <div class="img-frame">
                            <span class="category-badge">Statistik</span>
                            <img src="images/visualissasi.png" alt="Grafik">
                        </div>
                        <div class="mt-3 text-center">
                            <h6 class="fw-bold text-dark">Visualisasi Data</h6>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 gallery-item keseluruhan">
                    <div class="card h-100 border-0 bg-transparent">
                        <div class="img-frame">
                            <span class="category-badge bg-success">Rekap Total</span>
                            <img src="images/keseluruhan.png" alt="Laporan Total">
                        </div>
                        <div class="mt-3 text-center">
                            <h6 class="fw-bold text-dark">Laporan Keseluruhan</h6>
                            <p class="small text-muted">Rekapitulasi total pemasukan & pengeluaran.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 gallery-item tunggakan">
                    <div class="card h-100 border-0 bg-transparent">
                        <div class="img-frame">
                            <span class="category-badge">Cetak Tagihan</span>
                            <img src="images/cetak.png" alt="Fitur Cetak">
                        </div>
                        <div class="mt-3 text-center">
                            <h6 class="fw-bold text-dark">Cetak Laporan Tunggakan</h6>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <footer class="text-center py-4 bg-white mt-5 border-top">
            <p class="mb-0 text-muted small">&copy; 2026 Sistem Uang Kas. Built with Java JSP.</p>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            // 1. Ubah Warna Navbar
            window.onload = function () {
                var navbar = document.querySelector('.navbar');
                if (navbar) {
                    navbar.classList.remove('bg-primary');
                    navbar.style.backgroundColor = '#2c3e50';
                    navbar.classList.add('shadow');
                }
                var btnLogin = document.querySelector('.navbar .btn');
                if (btnLogin) {
                    btnLogin.classList.remove('text-primary');
                    btnLogin.style.color = '#2c3e50';
                }
            };

            // 2. Logic Filter Gallery
            const filterButtons = document.querySelectorAll('.filter-btn');
            const galleryItems = document.querySelectorAll('.gallery-item');

            filterButtons.forEach(button => {
                button.addEventListener('click', () => {
                    // Hapus class 'active' dari semua tombol
                    filterButtons.forEach(btn => btn.classList.remove('active'));
                    // Tambah class 'active' ke tombol yang diklik
                    button.classList.add('active');

                    const filterValue = button.getAttribute('data-filter');

                    galleryItems.forEach(item => {
                        if (filterValue === 'all' || item.classList.contains(filterValue)) {
                            item.classList.remove('hide');
                            item.style.position = 'relative';
                        } else {
                            item.classList.add('hide');
                            setTimeout(() => {
                                if (item.classList.contains('hide'))
                                    item.style.position = 'absolute';
                            }, 400);
                        }
                    });
                });
            });
        </script>
    </body>
</html>