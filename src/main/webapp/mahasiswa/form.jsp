<%-- 
    Document   : form
    Created on : 8 Dec 2025, 14.57.00
    Author     : LATIF WIBOWO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 1. SECURITY CHECK --%>
<%
    if (session.getAttribute("userRole") == null) { response.sendRedirect("../login.jsp"); return; }
    if (!"admin".equals(session.getAttribute("userRole"))) { response.sendRedirect("../DashboardServlet"); return; }
%>

<%-- 2. LAYOUT --%>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>

<div class="container mt-4 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            
            <div class="card card-custom border-0 shadow-lg">
                <div class="card-header bg-primary text-white py-3" style="border-radius: 15px 15px 0 0;">
                    <h5 class="mb-0 fw-bold text-center">
                        <i class="fas fa-user-plus me-2"></i> Registrasi Mahasiswa
                    </h5>
                </div>
                
                <div class="card-body p-4">
                    
                    <% if ("sukses".equals(request.getParameter("status"))) { %>
                        <div class="alert alert-primary"><i class="fas fa-check me-2"></i> Mahasiswa berhasil ditambahkan!</div>
                    <% } else if ("gagal".equals(request.getParameter("status"))) { %>
                        <div class="alert alert-danger"><i class="fas fa-times me-2"></i> Gagal! NIM mungkin sudah ada.</div>
                    <% } %>

                    <form action="${pageContext.request.contextPath}/AddMahasiswaServlet" method="POST">
                        
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted text-uppercase">NIM (Nomor Induk)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="fas fa-id-badge text-primary"></i></span>
                                <input type="text" class="form-control" name="nim" placeholder="Masukkan NIM unik..." required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted text-uppercase">Nama Lengkap</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="fas fa-user text-primary"></i></span>
                                <input type="text" class="form-control" name="nama" placeholder="Nama sesuai KTM..." required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted text-uppercase">Angkatan</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="fas fa-graduation-cap text-primary"></i></span>
                                    <input type="number" class="form-control" name="angkatan" placeholder="Contoh: 2023" required>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted text-uppercase">Password Login</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="fas fa-lock text-primary"></i></span>
                                    <input type="password" class="form-control" name="password" placeholder="Password akun..." required>
                                </div>
                            </div>
                        </div>

                        <div class="d-grid gap-2 mt-4">
                            <button type="submit" class="btn btn-primary btn-lg shadow-sm">
                                <i class="fas fa-save me-2"></i> Simpan Data Mahasiswa
                            </button>
                            <a href="${pageContext.request.contextPath}/ListMahasiswaServlet" class="btn btn-light text-primary fw-bold">
                                Batal / Kembali
                            </a>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>