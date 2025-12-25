<%-- 
    Document   : mingguan
    Created on : 10 Dec 2025, 12.17.23
    Author     : LATIF WIBOWO
--%>

<%@page import="java.util.List"%>
<%@page import="model.Setoran"%>
<%@page import="model.Pengeluaran"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>

<%-- 1. LAYOUT UTAMA --%>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>

<%
    // Helper Format Rupiah
    NumberFormat rp = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
    
    // Ambil Data Angka
    double tMasuk = (double) request.getAttribute("totalMasuk");
    double tKeluar = (double) request.getAttribute("totalKeluar");
    double selisih = tMasuk - tKeluar;
%>

<div class="container mt-4 mb-5">
    
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h3 class="fw-bold text-secondary mb-0"><i class="fas fa-chart-line me-2"></i>Laporan Mingguan</h3>
            <p class="text-muted small mb-0">
                Periode: <span class="badge bg-light text-dark border"><%= request.getAttribute("startDate") %></span> s/d <span class="badge bg-light text-dark border"><%= request.getAttribute("endDate") %></span>
            </p>
        </div>
        <div>
             <a href="${pageContext.request.contextPath}/DashboardServlet" class="btn btn-light btn-sm shadow-sm me-2">
                <i class="fas fa-arrow-left"></i> Dashboard
            </a>
            <button onclick="window.print()" class="btn btn-primary btn-sm shadow-sm">
                <i class="fas fa-print me-2"></i> Cetak Laporan
            </button>
        </div>
    </div>

    <div class="row g-3 mb-4">
        <div class="col-md-4">
            <div class="card border-0 shadow-sm text-white" style="background: linear-gradient(45deg, #11998e, #38ef7d);">
                <div class="card-body">
                    <h6 class="text-uppercase mb-1 opacity-75">Total Pemasukan</h6>
                    <h3 class="fw-bold mb-0"><%= rp.format(tMasuk) %></h3>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card border-0 shadow-sm text-white" style="background: linear-gradient(45deg, #cb2d3e, #ef473a);">
                <div class="card-body">
                    <h6 class="text-uppercase mb-1 opacity-75">Total Pengeluaran</h6>
                    <h3 class="fw-bold mb-0"><%= rp.format(tKeluar) %></h3>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card border-0 shadow-sm text-white" style="background: linear-gradient(45deg, #2980b9, #6dd5fa);">
                <div class="card-body">
                    <h6 class="text-uppercase mb-1 opacity-75">Surplus / Defisit</h6>
                    <h3 class="fw-bold mb-0"><%= rp.format(selisih) %></h3>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        
        <div class="col-lg-6 mb-4">
            <div class="card card-custom border-0 h-100 shadow-sm">
                <div class="card-header bg-success text-white py-2">
                    <i class="fas fa-arrow-down me-2"></i> Rincian Pemasukan
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover mb-0 align-middle small">
                            <thead class="table-light">
                                <tr>
                                    <th>Tgl</th>
                                    <th>Nama Mahasiswa</th>
                                    <th class="text-end">Jumlah</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Setoran> listMasuk = (List<Setoran>) request.getAttribute("listMasuk");
                                    if (listMasuk != null && !listMasuk.isEmpty()) {
                                        for (Setoran s : listMasuk) {
                                %>
                                <tr>
                                    <td><%= s.getTanggal() %></td>
                                    <td class="fw-bold text-secondary"><%= s.getNamaMahasiswa() %></td>
                                    <td class="text-end text-success fw-bold"><%= rp.format(s.getJumlah()) %></td>
                                </tr>
                                <% 
                                        }
                                    } else { 
                                %>
                                <tr><td colspan="3" class="text-center text-muted py-3">Tidak ada data.</td></tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-6 mb-4">
            <div class="card card-custom border-0 h-100 shadow-sm">
                <div class="card-header bg-danger text-white py-2">
                    <i class="fas fa-arrow-up me-2"></i> Rincian Pengeluaran
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover mb-0 align-middle small">
                            <thead class="table-light">
                                <tr>
                                    <th>Tgl</th>
                                    <th>Keperluan</th>
                                    <th class="text-end">Jumlah</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Pengeluaran> listKeluar = (List<Pengeluaran>) request.getAttribute("listKeluar");
                                    if (listKeluar != null && !listKeluar.isEmpty()) {
                                        for (Pengeluaran p : listKeluar) {
                                %>
                                <tr>
                                    <td><%= p.getTanggal() %></td>
                                    <td><%= p.getKeperluan() %></td>
                                    <td class="text-end text-danger fw-bold"><%= rp.format(p.getJumlah()) %></td>
                                </tr>
                                <% 
                                        }
                                    } else { 
                                %>
                                <tr><td colspan="3" class="text-center text-muted py-3">Tidak ada data.</td></tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div> </div>

<%@ include file="../footer.jsp" %>