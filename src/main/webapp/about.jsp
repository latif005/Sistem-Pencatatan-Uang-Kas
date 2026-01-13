<%-- File: about.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>About Us - Sistem Uang Kas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>
            :root {
                /* Palette Warna Baru (Bukan Biru Standar) */
                --primary-dark: #2c3e50;  /* Dark Slate (Elegan) */
                --primary-accent: #1abc9c; /* Teal/Emerald (Kesan Keuangan) */
                --gradient-bg: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            }

            /* Override Navbar agar tidak Biru Polos */
            .navbar-custom {
                background: var(--primary-dark) !important;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }

            /* Styling Foto Tim */
            .team-photo {
                width: 70px;
                height: 70px;
                object-fit: cover;
                border: 3px solid #fff;
                box-shadow: 0 5px 15px rgba(0,0,0,0.15);
                transition: transform 0.3s ease;
            }

            .team-card:hover .team-photo {
                transform: scale(1.1);
                border-color: var(--primary-accent);
            }

            /* Styling Card Anggota */
            .team-card {
                transition: transform 0.3s, box-shadow 0.3s;
                border: none;
                background: #fff;
            }

            .team-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.08) !important;
            }

            /* Text Highlights */
            .text-modern {
                color: var(--primary-dark);
            }
            .text-accent {
                color: var(--primary-accent);
            }

            /* Badge Custom */
            .badge-role {
                background-color: rgba(26, 188, 156, 0.1);
                color: var(--primary-dark);
                padding: 5px 10px;
                border-radius: 20px;
                font-weight: 600;
            }
        </style>
    </head>
    <body class="bg-light d-flex flex-column min-vh-100">

        <%-- 
           PENTING: Karena navbar_landing.jsp isinya masih 'bg-primary' (biru),
           kita timpa warnanya lewat style di atas atau edit langsung navbar-nya.
           Di sini saya asumsikan kita pakai navbar yang sama tapi css-nya kita 'paksa' berubah.
        --%>
        <%@ include file="navbar_landing.jsp" %>

        <div class="container py-5 flex-grow-1">

            <div class="text-center mb-5 mt-4">
                <h6 class="text-accent fw-bold text-uppercase ls-2">Profile Tim</h6>
                <h1 class="fw-bold text-modern display-5">Siapa Di Balik Layar?</h1>
                <p class="text-muted mx-auto" style="max-width: 600px;">
                    Kami adalah sekelompok mahasiswa yang berdedikasi untuk menciptakan solusi digital yang efisien bagi manajemen keuangan kelas.
                </p>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="card border-0 shadow-lg overflow-hidden rounded-4">
                        <div class="card-body p-0">
                            <div class="row g-0">

                                <div class="col-lg-4 d-flex align-items-center justify-content-center p-5 text-white" 
                                     style="background: var(--gradient-bg);">
                                    <div class="text-center">
                                        <i class="fas fa-wallet fa-4x mb-4 text-accent"></i>
                                        <h3 class="fw-bold">Sistem Kas</h3>
                                        <p class="opacity-75 small">Transparan, Akuntabel, Modern.</p>
                                        <hr class="border-light opacity-25 my-4">
                                        <p class="small fst-italic">"Project ini dibangun dengan Java JSP & PostgreSQL."</p>
                                    </div>
                                </div>

                                <div class="col-lg-8 p-5 bg-white">
                                    <h4 class="fw-bold text-modern mb-4">Meet Our Squad</h4>

                                    <div class="row g-4">

                                        <div class="col-md-6">
                                            <div class="d-flex align-items-center p-3 rounded-3 team-card shadow-sm h-100">
                                                <img src="images/latif.jpg" 
                                                     class="rounded-circle team-photo me-3" alt="Foto Latif">
                                                <div>
                                                    <h6 class="fw-bold mb-1 text-modern">Latif Wibowo</h6>
                                                    <div class="mb-1 text-muted small" style="font-size: 0.8rem;">NIM: 0110224065</div>
                                                    <span class="badge-role" style="font-size: 0.7rem;">Fullstack & Laporan</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="d-flex align-items-center p-3 rounded-3 team-card shadow-sm h-100">
                                                <img src="images/yudis.jpeg" 
                                                     class="rounded-circle team-photo me-3" alt="Foto Anggota 2">
                                                <div>
                                                    <h6 class="fw-bold mb-1 text-modern">Ahmad Yudistira Ramdhany</h6>
                                                    <div class="mb-1 text-muted small" style="font-size: 0.8rem;">NIM: 0110224005</div>
                                                    <span class="badge-role" style="font-size: 0.7rem;">Frontend & Laporan</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="d-flex align-items-center p-3 rounded-3 team-card shadow-sm h-100">
                                                <img src="images/aby.jpeg" 
                                                     class="rounded-circle team-photo me-3" alt="Foto Anggota 3">
                                                <div>
                                                    <h6 class="fw-bold mb-1 text-modern">Aby Sofyan Hanafi</h6>
                                                    <div class="mb-1 text-muted small" style="font-size: 0.8rem;">NIM: 0110224114</div>
                                                    <span class="badge-role" style="font-size: 0.7rem;">Laporan</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="d-flex align-items-center p-3 rounded-3 team-card shadow-sm h-100">
                                                <img src="images/noval.jpeg" 
                                                     class="rounded-circle team-photo me-3" alt="Foto Anggota 4">
                                                <div>
                                                    <h6 class="fw-bold mb-1 text-modern">Noval Maulani</h6>
                                                    <div class="mb-1 text-muted small" style="font-size: 0.8rem;">NIM: 0110224042</div>
                                                    <span class="badge-role" style="font-size: 0.7rem;">Laporan</span>
                                                </div>
                                            </div>
                                        </div>

                                    </div> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="text-center py-4 mt-auto border-top bg-white">
            <p class="mb-0 text-muted small">&copy; 2026 Sistem Uang Kas. Designed by group 21.</p>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            // Script ini akan mencari navbar dan mengubah kelas warnanya
            // Agar sesuai dengan tema modern (Dark Slate) tanpa harus edit file navbar_landing.jsp
            window.onload = function () {
                var navbar = document.querySelector('.navbar');
                if (navbar) {
                    navbar.classList.remove('bg-primary'); // Hapus biru standar
                    navbar.style.backgroundColor = '#2c3e50'; // Ubah jadi Dark Slate
                    navbar.classList.add('shadow'); // Tambah bayangan
                }
                // Ubah tombol Login di navbar juga agar serasi
                var btnLogin = document.querySelector('.navbar .btn');
                if (btnLogin) {
                    btnLogin.classList.remove('text-primary');
                    btnLogin.style.color = '#2c3e50';
                    btnLogin.style.fontWeight = 'bold';
                }
            };
        </script>
    </body>
</html>