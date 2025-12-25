<%-- 
    Document   : sidebar
    Created on : 11 Dec 2025, 15.25.52
    Author     : LATIF WIBOWO
--%>

<%
    // Ambil role untuk pengecekan tampilan menu
    String sideRole = (session.getAttribute("userRole") != null) ? (String) session.getAttribute("userRole") : "";
%>

<div class="card border-0 shadow-sm rounded-3">
    <div class="card-body p-0">
        
        <div class="bg-primary text-white p-3 rounded-top">
            <h6 class="mb-0 fw-bold"><i class="fas fa-compass me-2"></i> Menu Utama</h6>
        </div>
        <div class="list-group list-group-flush">
            <a href="${pageContext.request.contextPath}/DashboardServlet" class="list-group-item list-group-item-action py-3">
                <i class="fas fa-home me-2 text-primary"></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/ListSetoranServlet" class="list-group-item list-group-item-action py-3">
                <i class="fas fa-hand-holding-usd me-2 text-success"></i> Riwayat Setoran
            </a>
            <a href="${pageContext.request.contextPath}/ListPengeluaranServlet" class="list-group-item list-group-item-action py-3">
                <i class="fas fa-shopping-cart me-2 text-danger"></i> Riwayat Pengeluaran
            </a>
        </div>

        <div class="bg-light p-3 mt-2 border-top border-bottom">
            <h6 class="mb-0 fw-bold text-muted small text-uppercase">Laporan</h6>
        </div>
        <div class="list-group list-group-flush">
            <a href="${pageContext.request.contextPath}/ReportServlet?type=weekly" class="list-group-item list-group-item-action py-3">
                <i class="fas fa-book-open me-2 text-warning"></i> Laporan Keseluruhan
            </a>
            
            <a href="${pageContext.request.contextPath}/ReportServlet?type=tunggakan" class="list-group-item list-group-item-action py-3">
                <i class="fas fa-exclamation-circle me-2 text-secondary"></i> Laporan Tunggakan
            </a>
        </div>

        <% 
            String roleSidebar = (session.getAttribute("userRole") != null) ? (String) session.getAttribute("userRole") : "";
            if ("admin".equals(roleSidebar)) { 
        %>
            <div class="bg-light p-3 mt-2 border-top border-bottom">
                <h6 class="mb-0 fw-bold text-muted small text-uppercase">Administrasi</h6>
            </div>
            <div class="list-group list-group-flush">
                <a href="${pageContext.request.contextPath}/ListMahasiswaServlet" class="list-group-item list-group-item-action py-3">
                    <i class="fas fa-users-cog me-2 text-info"></i> Kelola Mahasiswa
                </a>
            </div>
        <% } %>

    </div>
</div>