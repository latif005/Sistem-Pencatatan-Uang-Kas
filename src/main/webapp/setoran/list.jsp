<%-- 
    Document   : list
    Created on : 5 Dec 2025
    Updated    : Full Width Layout (Tanpa Sidebar)
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@page import="model.Setoran"%>

<%-- 1. PANGGIL HEADER & MENU ATAS --%>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>

<div class="container mt-4 mb-5">
    
    <div class="row justify-content-center">
        <div class="col-md-12">
            
            <div class="card card-custom border-0 shadow-lg">
                <div class="card-header bg-success text-white py-3" style="border-radius: 15px 15px 0 0;">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="mb-0 fw-bold">
                            <i class="fas fa-file-invoice-dollar me-2"></i> Data Riwayat Pemasukan
                        </h5>
                        <a href="${pageContext.request.contextPath}/DashboardServlet" class="btn btn-light btn-sm fw-bold text-success shadow-sm">
                            <i class="fas fa-arrow-left me-1"></i> Kembali ke Dashboard
                        </a>
                    </div>
                </div>
                
                <div class="card-body p-4">
                    
                    <div class="alert alert-light border-start border-success border-4 shadow-sm mb-4" role="alert">
                        <i class="fas fa-info-circle text-success me-2"></i>
                        Halaman ini menampilkan seluruh data uang kas yang telah masuk. Gunakan fitur <b>Search</b> di sebelah kanan untuk mencari nama mahasiswa.
                    </div>

                    <div class="d-flex justify-content-between mb-3">
                        <% 
                            String userRole = (String) session.getAttribute("userRole");
                            if ("admin".equals(userRole)) { 
                        %>
                            <a href="${pageContext.request.contextPath}/setoran/form.jsp" class="btn btn-success shadow-sm px-4">
                                <i class="fas fa-plus-circle me-2"></i> Catat Setoran Baru
                            </a>
                        <% } else { %>
                            <button onclick="tampilkanPeringatanAkses()" class="btn btn-secondary shadow-sm opacity-75 border-0">
                                <i class="fas fa-lock me-2"></i> Catat Setoran Baru
                            </button>
                        <% } %>
                        
                        <button onclick="window.print()" class="btn btn-outline-secondary shadow-sm">
                            <i class="fas fa-print me-1"></i> Cetak
                        </button>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle border">
                            <thead class="table-success text-center">
                                <tr>
                                    <th width="5%">No</th>
                                    <th width="15%">NIM</th>
                                    <th>Nama Mahasiswa</th>
                                    <th width="15%">Tanggal</th>
                                    <th>Keterangan</th>
                                    <th width="15%">Jumlah</th>
                                    <% if ("admin".equals(userRole)) { %>
                                        <th width="10%">Aksi</th>
                                    <% } %>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Setoran> list = (List<Setoran>) request.getAttribute("dataSetoran");
                                    NumberFormat rp = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));

                                    if (list != null && !list.isEmpty()) {
                                        int no = 1;
                                        for (Setoran s : list) {
                                %>
                                <tr>
                                    <td class="text-center"><%= no++ %></td>
                                    <td class="text-center fw-bold text-secondary"><%= s.getNim() %></td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-light rounded-circle p-2 me-2 text-success">
                                                <i class="fas fa-user"></i>
                                            </div>
                                            <%= (s.getNamaMahasiswa() == null) ? "-" : s.getNamaMahasiswa() %>
                                        </div>
                                    </td>
                                    <td class="text-center"><%= s.getTanggal() %></td>
                                    <td class="text-muted small"><%= s.getKeterangan() %></td>
                                    <td class="text-end fw-bold text-success"><%= rp.format(s.getJumlah()) %></td>
                                    
                                    <% if ("admin".equals(userRole)) { %>
                                        <td class="text-center">
                                            <button class="btn btn-sm btn-outline-danger" 
                                                    onclick="konfirmasiHapus('${pageContext.request.contextPath}/DeleteSetoranServlet?id=<%= s.getId() %>')">
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
    function tampilkanPeringatanAkses() {
        Swal.fire({ icon: 'error', title: 'Akses Ditolak!', text: 'Maaf, hanya Bendahara (Admin) yang berhak mencatat setoran baru.', confirmButtonColor: '#d33' });
    }
    function konfirmasiHapus(url) {
        Swal.fire({ title: 'Hapus Setoran?', text: "Data akan dihapus permanen!", icon: 'warning', showCancelButton: true, confirmButtonColor: '#d33', cancelButtonColor: '#3085d6', confirmButtonText: 'Ya, Hapus!' }).then((result) => { if (result.isConfirmed) window.location.href = url; });
    }
</script>

<%-- 3. PANGGIL FOOTER --%>
<%@ include file="../footer.jsp" %>