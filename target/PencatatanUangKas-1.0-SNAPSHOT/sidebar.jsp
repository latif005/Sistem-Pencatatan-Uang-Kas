<%-- 
    Document   : sidebar
    Created on : 11 Dec 2025, 15.25.52
    Author     : LATIF WIBOWO
--%>

<%
    // Ambil role untuk pengecekan tampilan menu
    String sideRole = (session.getAttribute("userRole") != null) ? (String) session.getAttribute("userRole") : "";
%>

<div class="card card-custom h-100 border-0 shadow-sm">
    <div class="card-header bg-primary text-white text-center py-3" style="border-radius: 15px 15px 0 0;">
        <h5 class="mb-0 fw-bold"><i class="fas fa-compass me-2"></i>Menu Utama</h5>
    </div>
    
    <div class="list-group list-group-flush p-2">
        
        <a href="${pageContext.request.contextPath}/DashboardServlet" class="list-group-item list-group-item-action rounded mb-1 border-0">
            <i class="fas fa-home me-2 text-primary"></i> Dashboard
        </a>
        
        <a href="${pageContext.request.contextPath}/ListSetoranServlet" class="list-group-item list-group-item-action rounded mb-1 border-0">
            <i class="fas fa-hand-holding-usd me-2 text-success"></i> Riwayat Setoran
        </a>
        
        <a href="${pageContext.request.contextPath}/ListPengeluaranServlet" class="list-group-item list-group-item-action rounded mb-1 border-0">
            <i class="fas fa-shopping-cart me-2 text-danger"></i> Riwayat Pengeluaran
        </a>
        
        <div class="mt-3 mb-1 text-muted small fw-bold px-3">LAPORAN</div>
        
        <a href="${pageContext.request.contextPath}/ReportServlet?type=weekly" class="list-group-item list-group-item-action rounded mb-1 border-0">
            <i class="fas fa-file-invoice me-2 text-warning"></i> Laporan Mingguan
        </a>
        
        <a href="${pageContext.request.contextPath}/ReportServlet?type=tunggakan" class="list-group-item list-group-item-action rounded mb-1 border-0">
            <i class="fas fa-exclamation-circle me-2 text-secondary"></i> Laporan Tunggakan
        </a>

        <% if ("admin".equals(sideRole)) { %>
            <div class="mt-3 mb-1 text-muted small fw-bold px-3">ADMINISTRASI</div>
            
            <a href="${pageContext.request.contextPath}/ListMahasiswaServlet" class="list-group-item list-group-item-action rounded mb-1 border-0 bg-light">
                <i class="fas fa-users-cog me-2 text-info"></i> Kelola Mahasiswa
            </a>
        <% } %>
        
    </div>
</div>