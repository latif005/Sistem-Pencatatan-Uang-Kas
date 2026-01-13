<%-- 
    Document   : navbar_landing
    Created on : 10 Jan 2026, 15.37.50
    Author     : LATIF WIBOWO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm fixed-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="beranda.jsp">
            <i class="fas fa-book-open me-2"></i>Sistem Kas
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link text-white mx-2" href="beranda.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white mx-2" href="about.jsp">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white mx-2" href="gallery_public.jsp">Gallery</a>
                </li>
                <li class="nav-item ms-3">
                    <a class="btn btn-light text-primary fw-bold rounded-pill px-4" href="login.jsp">
                        <i class="fas fa-sign-in-alt me-1"></i> Login
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div style="margin-top: 80px;"></div>