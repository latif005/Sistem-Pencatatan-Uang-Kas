<%-- 
    Document   : tunggakan
    Created on : 10 Dec 2025, 11.57.37
    Author     : LATIF WIBOWO
--%>

<%@page import="java.util.List"%>
<%@page import="model.Tunggakan"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>

<%-- 1. LAYOUT UTAMA --%>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>

<%
    double target = (double) request.getAttribute("targetWajib");
    int minggu = (int) request.getAttribute("mingguKe");
    NumberFormat rp = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
%>

<div class="container mt-4 mb-5">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h3 class="fw-bold text-secondary mb-0"><i class="fas fa-file-invoice-dollar me-2"></i>Laporan Status Pembayaran</h3>
            <p class="text-muted small mb-0">Monitoring kelancaran pembayaran kas mahasiswa.</p>
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/DashboardServlet" class="btn btn-light btn-sm shadow-sm me-2">
                <i class="fas fa-arrow-left"></i> Dashboard
            </a>
            <button onclick="window.print()" class="btn btn-secondary btn-sm shadow-sm">
                <i class="fas fa-print me-2"></i> Cetak
            </button>
        </div>
    </div>

    <div class="alert alert-info border-0 shadow-sm d-flex align-items-center mb-4" role="alert">
        <i class="fas fa-bullseye fa-2x me-3 text-info"></i>
        <div>
            <h6 class="alert-heading fw-bold mb-0">Target Minggu Ke-<%= minggu %></h6>
            <small>Setiap mahasiswa seharusnya sudah menyetor total: <b class="text-dark"><%= rp.format(target) %></b></small>
        </div>
    </div>

    <div class="card card-custom border-0 shadow-lg">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light text-center">
                        <tr>
                            <th class="py-3">NIM</th>
                            <th class="py-3 text-start ps-4">Nama Mahasiswa</th>
                            <th class="py-3">Total Disetor</th>
                            <th class="py-3">Status</th>
                            <th class="py-3 text-end pe-4">Kekurangan</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Tunggakan> list = (List<Tunggakan>) request.getAttribute("dataTunggakan");
                            if (list != null && !list.isEmpty()) {
                                for (Tunggakan t : list) {
                                    boolean isLunas = t.getStatus().equalsIgnoreCase("Lunas");
                                    // Beri warna background merah tipis jika nunggak
                                    String rowClass = isLunas ? "" : "bg-danger bg-opacity-10";
                        %>
                        <tr class="<%= rowClass %>">
                            <td class="text-center fw-bold text-muted"><%= t.getNim() %></td>
                            <td class="ps-4 fw-bold"><%= t.getNama() %></td>
                            <td class="text-center text-success"><%= rp.format(t.getTotalDibayar()) %></td>
                            
                            <td class="text-center">
                                <% if (isLunas) { %>
                                    <span class="badge rounded-pill bg-success px-3 py-2 shadow-sm">
                                        <i class="fas fa-check-circle me-1"></i> AMAN
                                    </span>
                                <% } else { %>
                                    <span class="badge rounded-pill bg-warning text-dark px-3 py-2 shadow-sm">
                                        <i class="fas fa-clock me-1"></i> BELUM LUNAS
                                    </span>
                                <% } %>
                            </td>

                            <td class="text-end pe-4 fw-bold text-danger">
                                <%= (t.getJumlahTunggakan() > 0) ? "- " + rp.format(t.getJumlahTunggakan()) : "" %>
                            </td>
                        </tr>
                        <% 
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="card-footer bg-white text-muted text-center py-3 small border-0">
            Data dihitung otomatis berdasarkan total setoran yang masuk ke sistem.
        </div>
    </div>

</div>

<%@ include file="../footer.jsp" %>