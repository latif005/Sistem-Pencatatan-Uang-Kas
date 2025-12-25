<%-- 
    Document   : form
    Created on : 25 Dec 2025, 12.29.37
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

<%-- 2. PANGGIL LAYOUT MODULAR --%>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>

<div class="container mt-4 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            
            <div class="card card-custom border-0 shadow-lg">
                <div class="card-header text-white py-3" 
                     style="background: linear-gradient(45deg, #6a11cb, #2575fc); border-radius: 15px 15px 0 0;">
                    <h5 class="mb-0 fw-bold text-center">
                        <i class="fas fa-camera-retro me-2"></i> Upload Dokumentasi
                    </h5>
                </div>
                
                <div class="card-body p-4">
                    
                    <% 
                        String status = request.getParameter("status");
                        if ("sukses".equals(status)) { 
                    %>
                        <div class="alert alert-success d-flex align-items-center rounded-3 shadow-sm" role="alert">
                            <i class="fas fa-check-circle fa-lg me-3"></i>
                            <div><strong>Berhasil!</strong> Foto kegiatan telah ditambahkan ke galeri.</div>
                        </div>
                    <% } else if ("error".equals(status) || "gagal".equals(status)) { %>
                        <div class="alert alert-danger d-flex align-items-center rounded-3 shadow-sm" role="alert">
                            <i class="fas fa-exclamation-triangle fa-lg me-3"></i>
                            <div><strong>Gagal!</strong> Terjadi kesalahan saat upload gambar.</div>
                        </div>
                    <% } %>

                    <form action="${pageContext.request.contextPath}/AddKegiatanServlet" method="POST" enctype="multipart/form-data">
                        
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted text-uppercase">Judul Kegiatan</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="fas fa-heading text-primary"></i></span>
                                <input type="text" class="form-control" name="judul" placeholder="Contoh: Buka Puasa Bersama" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted text-uppercase">Tanggal Pelaksanaan</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="fas fa-calendar-day text-primary"></i></span>
                                <input type="date" class="form-control" name="tanggal" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted text-uppercase">Foto Dokumentasi</label>
                            <div class="input-group mb-2">
                                <span class="input-group-text bg-light"><i class="fas fa-image text-primary"></i></span>
                                <input type="file" class="form-control" name="gambar" accept="image/*" required onchange="previewImage(event)">
                            </div>
                            <div class="form-text text-muted small"><i class="fas fa-info-circle me-1"></i> Format: JPG, PNG, JPEG.</div>
                            
                            <div class="mt-3 text-center d-none" id="previewContainer">
                                <img id="imgPreview" src="#" alt="Preview" class="img-fluid rounded shadow-sm border p-1" style="max-height: 200px;">
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold small text-muted text-uppercase">Deskripsi Singkat</label>
                            <textarea class="form-control" name="deskripsi" rows="3" placeholder="Ceritakan sedikit tentang kegiatan ini..."></textarea>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg shadow-sm" 
                                    style="background: linear-gradient(45deg, #6a11cb, #2575fc); border: none;">
                                <i class="fas fa-cloud-upload-alt me-2"></i> Upload ke Galeri
                            </button>
                            <a href="${pageContext.request.contextPath}/DashboardServlet" class="btn btn-light text-primary fw-bold">
                                Batal / Kembali ke Dashboard
                            </a>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
    function previewImage(event) {
        var reader = new FileReader();
        reader.onload = function(){
            var output = document.getElementById('imgPreview');
            var container = document.getElementById('previewContainer');
            
            output.src = reader.result;
            container.classList.remove('d-none'); // Tampilkan container gambar
        };
        reader.readAsDataURL(event.target.files[0]);
    }
</script>

<%-- 3. PANGGIL FOOTER --%>
<%@ include file="../footer.jsp" %>