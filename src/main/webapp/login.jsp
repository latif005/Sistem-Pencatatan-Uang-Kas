<%-- 
    Document   : login
    Created on : 5 Dec 2025, 00.18.19
    Author     : LATIF WIBOWO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - Sistem Kas Kelas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card-login {
            width: 100%;
            max-width: 400px;
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        .card-header {
            background-color: #fff;
            border-bottom: none;
            padding-top: 30px;
            text-align: center;
            border-radius: 15px 15px 0 0 !important;
        }
        .btn-login {
            background: #9b59b6;
            border: none;
            padding: 10px;
            font-size: 18px;
            transition: 0.3s;
        }
        .btn-login:hover { background: #8e44ad; }
    </style>
</head>
<body>

    <div class="card card-login p-4">
        <div class="card-header">
            <h3 class="fw-bold text-secondary">💰 Uang Kas</h3>
            <p class="text-muted">Silakan masuk untuk melanjutkan</p>
        </div>
        <div class="card-body">
            
            <%-- Alert Error --%>
            <% if("gagal".equals(request.getParameter("status"))) { %>
                <div class="alert alert-danger text-center py-2" role="alert">
                    Login Gagal! Cek Username/Password.
                </div>
            <% } %>

            <form action="LoginServlet" method="POST">
                <div class="mb-3">
                    <label class="form-label">Masuk Sebagai</label>
                    <select name="role" class="form-select">
                        <option value="admin">Admin (Bendahara)</option>
                        <option value="mahasiswa">Mahasiswa</option>
                    </select>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Username / NIM</label>
                    <input type="text" name="username" class="form-control" placeholder="Masukkan ID Anda" required>
                </div>
                
                <div class="mb-4">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Masukkan Password" required>
                </div>
                
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary btn-login text-white">MASUK</button>
                </div>
            </form>
        </div>
        <div class="card-footer text-center bg-white border-0 text-muted small">
            &copy; 2025 Sistem Pencatatan Kas
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>