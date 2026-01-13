<%-- 
    Document   : login
    Created on : 5 Dec 2025
    Author     : LATIF WIBOWO
    Updated    : Added Error Alert & Modern Styling
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login - Sistem Uang Kas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>
            :root {
                --primary-dark: #2c3e50; /* Dark Slate */
                --primary-accent: #1abc9c; /* Emerald Green */
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                overflow-x: hidden;
            }

            .login-wrapper {
                min-height: 100vh;
            }

            /* BAGIAN KIRI: BRANDING (GELAP) */
            .brand-section {
                background: linear-gradient(135deg, #2c3e50 0%, #1a252f 100%);
                color: white;
                position: relative;
                overflow: hidden;
            }

            .brand-section::before {
                content: '';
                position: absolute;
                top: -10%;
                left: -10%;
                width: 300px;
                height: 300px;
                background: rgba(26, 188, 156, 0.1);
                border-radius: 50%;
            }
            .brand-section::after {
                content: '';
                position: absolute;
                bottom: -10%;
                right: -10%;
                width: 400px;
                height: 400px;
                background: rgba(255, 255, 255, 0.05);
                border-radius: 50%;
            }

            /* BAGIAN KANAN: FORM (PUTIH) */
            .form-section {
                background-color: #ffffff;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .login-card {
                width: 100%;
                max-width: 400px;
                padding: 20px;
            }

            .form-control, .form-select {
                background-color: #f8f9fa;
                border: 2px solid #e9ecef;
                border-radius: 12px;
                padding: 12px 15px;
                font-size: 0.95rem;
                transition: all 0.3s;
            }

            .form-control:focus, .form-select:focus {
                background-color: #fff;
                border-color: var(--primary-accent);
                box-shadow: 0 0 0 4px rgba(26, 188, 156, 0.1);
            }

            .btn-login {
                background-color: var(--primary-accent);
                color: white;
                font-weight: 700;
                padding: 12px;
                border-radius: 12px;
                border: none;
                transition: all 0.3s;
                width: 100%;
            }

            .btn-login:hover {
                background-color: #16a085;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(26, 188, 156, 0.3);
                color: white;
            }

            .back-link {
                color: var(--primary-dark);
                text-decoration: none;
                font-weight: 600;
                font-size: 0.9rem;
                transition: color 0.3s;
            }
            .back-link:hover {
                color: var(--primary-accent);
            }

            .input-group-text {
                background: #f8f9fa;
                border: 2px solid #e9ecef;
                border-right: none;
                border-radius: 12px 0 0 12px;
                color: #adb5bd;
            }
            .form-control-icon {
                border-left: none;
                border-radius: 0 12px 12px 0;
            }
            .form-control-icon:focus {
                border-left: none;
            }
        </style>
    </head>
    <body>

        <div class="row g-0 login-wrapper">

            <div class="col-lg-7 d-none d-lg-flex align-items-center justify-content-center brand-section">
                <div class="text-center position-relative z-1 px-5">
                    <div class="mb-4">
                        <i class="fas fa-wallet fa-5x" style="color: var(--primary-accent);"></i>
                    </div>
                    <h1 class="display-4 fw-bold mb-3">Sistem Uang Kas</h1>
                    <p class="lead opacity-75">
                        Platform manajemen keuangan kelas yang transparan,<br>
                        akuntabel, dan terintegrasi secara real-time.
                    </p>
                    <div class="mt-5">
                        <small class="text-white-50">&copy; 2026 Sistem Uang Kas. Designed by group 21.</small>
                    </div>
                </div>
            </div>

            <div class="col-lg-5 form-section">
                <div class="login-card">

                    <div class="text-center mb-4">
                        <div class="d-lg-none mb-3">
                            <i class="fas fa-wallet fa-3x text-success"></i>
                        </div>
                        <h3 class="fw-bold" style="color: var(--primary-dark);">Selamat Datang</h3>
                        <p class="text-muted small">Silakan masuk ke akun Anda</p>
                    </div>

                    <%-- === BAGIAN PENTING: ALERT ERROR === --%>
                    <%-- Kode ini menangkap pesan dari LoginServlet jika login gagal --%>
                    <%
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                    %>
                    <div class="alert alert-danger alert-dismissible fade show shadow-sm border-0 mb-4" role="alert">
                        <div class="d-flex align-items-center">
                            <i class="fas fa-exclamation-circle me-2 fs-5"></i>
                            <div>
                                <strong>Login Gagal!</strong><br>
                                <small><%= errorMessage %></small>
                            </div>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <%
                        }
                    %>
                    <%-- ===================================== --%>

                    <form action="LoginServlet" method="post">

                        <div class="mb-4">
                            <label class="form-label small fw-bold text-secondary ms-1">Masuk Sebagai</label>
                            <select class="form-select" name="role" required>
                                <option value="mahasiswa">Mahasiswa (User)</option>
                                <option value="admin">Bendahara (Admin)</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary ms-1">Username / NIM</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                <input type="text" class="form-control form-control-icon" name="username" placeholder="Masukkan ID Anda" required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label small fw-bold text-secondary ms-1">Password</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                <input type="password" class="form-control form-control-icon" name="password" placeholder="••••••••" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-login mb-4 shadow-sm">
                            MASUK SEKARANG <i class="fas fa-arrow-right ms-2"></i>
                        </button>

                        <div class="text-center">
                            <a href="beranda.jsp" class="back-link">
                                <i class="fas fa-arrow-left me-1"></i> Kembali ke Beranda
                            </a>
                        </div>
                    </form>

                </div>
            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>