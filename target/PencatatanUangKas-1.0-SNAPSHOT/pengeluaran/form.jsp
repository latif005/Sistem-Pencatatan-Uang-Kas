<%-- 
    Document   : form
    Created on : 5 Dec 2025, 07.47.18
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
                <div class="card-header bg-danger text-white py-3" style="border-radius: 15px 15px 0 0;">
                    <h5 class="mb-0 fw-bold text-center">
                        <i class="fas fa-shopping-cart me-2"></i> Catat Pengeluaran
                    </h5>
                </div>
                
                <div class="card-body p-4">
                    
                    <% if ("sukses".equals(request.getParameter("status"))) { %>
                        <div class="alert alert-success d-flex align-items-center"><i class="fas fa-check me-2"></i> Berhasil disimpan!</div>
                    <% } else if ("gagal".equals(request.getParameter("status"))) { %>
                        <div class="alert alert-danger d-flex align-items-center"><i class="fas fa-times me-2"></i> Gagal menyimpan data.</div>
                    <% } %>

                    <form action="${pageContext.request.contextPath}/AddPengeluaranServlet" method="POST">
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted text-uppercase">Tanggal</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="fas fa-calendar-day text-danger"></i></span>
                                    <input type="date" class="form-control" name="tanggal" required>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted text-uppercase">Jumlah Keluar (Rp)</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light fw-bold text-danger">Rp</span>
                                    <input type="number" class="form-control" name="jumlah" placeholder="0" min="0" required>
                                </div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold small text-muted text-uppercase">Keperluan / Deskripsi</label>
                            <textarea class="form-control" name="keperluan" rows="3" placeholder="Contoh: Membeli Spidol dan Penghapus..." required></textarea>
                            <div class="form-text">Jelaskan pengeluaran sedetail mungkin.</div>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-danger btn-lg shadow-sm">
                                <i class="fas fa-save me-2"></i> Simpan Pengeluaran
                            </button>
                            <a href="${pageContext.request.contextPath}/ListPengeluaranServlet" class="btn btn-light text-danger fw-bold">
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