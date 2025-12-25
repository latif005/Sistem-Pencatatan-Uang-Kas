<%-- 
    Document   : menu
    Created on : 11 Dec 2025, 15.25.16
    Author     : LATIF WIBOWO
--%>

<%
    // Ambil Data User (Supaya dinamis)
    String navRole = (session.getAttribute("userRole") != null) ? (String) session.getAttribute("userRole") : "GUEST";
    String navNama = (session.getAttribute("userName") != null) ? (String) session.getAttribute("userName") : "Pengunjung";
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm rounded-3 mb-4 mx-3">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/DashboardServlet">
            <i class="fas fa-chart-line me-2"></i>Dashboard
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item me-3 text-light">
                    <i class="fas fa-user-circle me-1"></i> Selamat Datang, <b><%= navNama%></b>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-outline-danger btn-sm rounded-pill px-3">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>