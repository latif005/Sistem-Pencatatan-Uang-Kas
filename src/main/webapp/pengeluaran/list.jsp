<%-- 
    Document   : list
    Created on : 5 Dec 2025, 07.47.10
    Author     : LATIF WIBOWO
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@page import="model.Pengeluaran"%>

<%-- 1. PANGGIL HEADER & MENU ATAS --%>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>

<div class="container mt-4 mb-5">
    
    <div class="row justify-content-center">
        <div class="col-md-12">
            
            <div class="card card-custom border-0 shadow-lg">
                <div class="card-header bg-danger text-white py-3" style="border-radius: 15px 15px 0 0;">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="mb-0 fw-bold">
                            <i class="fas fa-shopping-cart me-2"></i> Data Riwayat Pengeluaran
                        </h5>
                        <a href="${pageContext.request.contextPath}/DashboardServlet" class="btn btn-light btn-sm fw-bold text-danger shadow-sm">
                            <i class="fas fa-arrow-left me-1"></i> Kembali ke Dashboard
                        </a>
                    </div>
                </div>
                
                <div class="card-body p-4">
                    
                    <div class="alert alert-light border-start border-danger border-4 shadow-sm mb-4" role="alert">
                        <i class="fas fa-info-circle text-danger me-2"></i>
                        Halaman ini mencatat seluruh penggunaan uang kas. Data yang dihapus tidak dapat dikembalikan.
                    </div>

                    <div class="d-flex justify-content-between mb-3">
                        <% 
                            String userRole = (String) session.getAttribute("userRole");
                            // Hanya Admin yang boleh mencatat pengeluaran
                            if ("admin".equals(userRole)) { 
                        %>
                            <a href="${pageContext.request.contextPath}/pengeluaran/form.jsp" class="btn btn-danger shadow-sm px-4">
                                <i class="fas fa-minus-circle me-2"></i> Catat Pengeluaran Baru
                            </a>
                        <% } %>
                        
                        <button onclick="window.print()" class="btn btn-outline-secondary shadow-sm ms-auto">
                            <i class="fas fa-print me-1"></i> Cetak
                        </button>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle border">
                            <thead class="table-danger text-center">
                                <tr>
                                    <th width="5%">No</th>
                                    <th width="15%">Tanggal</th>
                                    <th>Keperluan / Deskripsi</th>
                                    <th width="20%">Jumlah Keluar</th>
                                    <% if ("admin".equals(userRole)) { %>
                                        <th width="10%">Aksi</th>
                                    <% } %>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Pengeluaran> list = (List<Pengeluaran>) request.getAttribute("dataPengeluaran");
                                    NumberFormat rp = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));

                                    if (list != null && !list.isEmpty()) {
                                        int no = 1;
                                        for (Pengeluaran p : list) {
                                %>
                                <tr>
                                    <td class="text-center"><%= no++ %></td>
                                    <td class="text-center"><%= p.getTanggal() %></td>
                                    <td>
                                        <span class="d-block text-dark fw-bold"><%= p.getKeperluan() %></span>
                                    </td>
                                    <td class="text-end fw-bold text-danger">
                                        <i class="fas fa-arrow-down small me-1"></i>
                                        <%= rp.format(p.getJumlah()) %>
                                    </td>
                                    
                                    <% if ("admin".equals(userRole)) { %>
                                        <td class="text-center">
                                            <button class="btn btn-sm btn-outline-danger" 
                                                    onclick="konfirmasiHapus('${pageContext.request.contextPath}/DeletePengeluaranServlet?id=<%= p.getId() %>')">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </td>
                                    <% } %>
                                </tr>
                                <% 
                                        }
                                    } 
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div> </div> </div> <script>
    function konfirmasiHapus(url) {
        Swal.fire({
            title: 'Hapus Pengeluaran?',
            text: "Data yang dihapus tidak dapat dikembalikan!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Ya, Hapus!'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = url;
            }
        });
    }
</script>

<%-- 3. PANGGIL FOOTER --%>
<%@ include file="../footer.jsp" %>