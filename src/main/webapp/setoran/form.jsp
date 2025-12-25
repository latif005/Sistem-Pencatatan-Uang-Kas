<%-- 
    Document   : form
    Created on : 5 Dec 2025, 07.46.25
    Author     : LATIF WIBOWO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 1. SECURITY CHECK (Hanya Admin) --%>
<%
    if (session.getAttribute("userRole") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
    String role = (String) session.getAttribute("userRole");
    if (!"admin".equals(role)) {
        response.sendRedirect("../DashboardServlet");
        return;
    }
%>

<%-- 2. PANGGIL LAYOUT UTAMA --%>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>

<div class="container mt-4 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            
            <div class="card card-custom border-0 shadow-lg">
                <div class="card-header bg-success text-white py-3" style="border-radius: 15px 15px 0 0;">
                    <h5 class="mb-0 fw-bold text-center">
                        <i class="fas fa-hand-holding-usd me-2"></i> Form Setoran Baru
                    </h5>
                </div>
                
                <div class="card-body p-4">
                    
                    <% 
                        String status = request.getParameter("status");
                        if ("sukses".equals(status)) { 
                    %>
                        <div class="alert alert-success d-flex align-items-center" role="alert">
                            <i class="fas fa-check-circle fa-lg me-3"></i>
                            <div>Data setoran berhasil disimpan!</div>
                        </div>
                    <% } else if ("gagal".equals(status)) { %>
                        <div class="alert alert-danger d-flex align-items-center" role="alert">
                            <i class="fas fa-exclamation-triangle fa-lg me-3"></i>
                            <div>Gagal! Pastikan NIM Mahasiswa terdaftar.</div>
                        </div>
                    <% } %>

                    <form action="${pageContext.request.contextPath}/AddSetoranServlet" method="POST">
                        
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted text-uppercase">NIM Mahasiswa</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="fas fa-id-card text-success"></i></span>
                                <input type="text" class="form-control form-control-lg" name="nim" placeholder="Masukkan NIM..." required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted text-uppercase">Tanggal</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="fas fa-calendar-alt text-success"></i></span>
                                    <input type="date" class="form-control" name="tanggal" required>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted text-uppercase">Nominal (Rp)</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light fw-bold text-success">Rp</span>
                                    <input type="number" class="form-control" name="jumlah" placeholder="0" min="0" required>
                                </div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold small text-muted text-uppercase">Keterangan</label>
                            <textarea class="form-control" name="keterangan" rows="3" placeholder="Contoh: Kas Bulan Januari..."></textarea>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success btn-lg shadow-sm">
                                <i class="fas fa-save me-2"></i> Simpan Data
                            </button>
                            <a href="${pageContext.request.contextPath}/ListSetoranServlet" class="btn btn-light text-success fw-bold">
                                Batal / Kembali
                            </a>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

<%-- 3. PANGGIL FOOTER --%>
<%@ include file="../footer.jsp" %>