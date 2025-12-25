<%-- 
    Document   : list
    Created on : 10 Dec 2025, 15.14.51
    Author     : LATIF WIBOWO
--%>

<%@page import="java.util.List"%>
<%@page import="model.Mahasiswa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 1. PANGGIL HEADER & MENU ATAS --%>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>

<div class="container mt-4 mb-5">
    
    <div class="row justify-content-center">
        <div class="col-md-12">
            
            <div class="card card-custom border-0 shadow-lg">
                <div class="card-header bg-primary text-white py-3" style="border-radius: 15px 15px 0 0;">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="mb-0 fw-bold">
                            <i class="fas fa-users me-2"></i> Data Mahasiswa
                        </h5>
                        <a href="${pageContext.request.contextPath}/DashboardServlet" class="btn btn-light btn-sm fw-bold text-primary shadow-sm">
                            <i class="fas fa-arrow-left me-1"></i> Kembali ke Dashboard
                        </a>
                    </div>
                </div>
                
                <div class="card-body p-4">
                    
                    <% 
                        // --- PERBAIKAN DISINI ---
                        // Kita deklarasikan variabel 'userRole' SATU KALI SAJA di sini.
                        // Di bawah nanti tinggal pakai variabel ini, tidak perlu tulis 'String' lagi.
                        String userRole = (String) session.getAttribute("userRole");
                    %>

                    <div class="alert alert-light border-start border-primary border-4 shadow-sm mb-4" role="alert">
                        <i class="fas fa-info-circle text-primary me-2"></i>
                        Ini adalah data induk mahasiswa. Menghapus mahasiswa akan otomatis menghapus seluruh riwayat setorannya.
                    </div>

                    <% if ("admin".equals(userRole)) { %>
                    <div class="d-flex justify-content-between mb-3">
                        <a href="${pageContext.request.contextPath}/mahasiswa/form.jsp" class="btn btn-primary shadow-sm px-4">
                            <i class="fas fa-user-plus me-2"></i> Registrasi Mahasiswa Baru
                        </a>
                        
                        <button onclick="window.print()" class="btn btn-outline-secondary shadow-sm ms-auto">
                            <i class="fas fa-print me-1"></i> Cetak Data
                        </button>
                    </div>
                    <% } %>

                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle border">
                            <thead class="table-primary text-center">
                                <tr>
                                    <th width="5%">No</th>
                                    <th width="15%">NIM</th>
                                    <th>Nama Lengkap</th>
                                    <th width="15%">Angkatan</th>
                                    <th width="15%">Password</th>
                                    
                                    <%-- Kita pakai variabel userRole yang sudah dibuat di atas --%>
                                    <% if ("admin".equals(userRole)) { %>
                                        <th width="10%">Aksi</th>
                                    <% } %>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Mahasiswa> list = (List<Mahasiswa>) request.getAttribute("dataMahasiswa");
                                    if (list != null && !list.isEmpty()) {
                                        int no = 1;
                                        for (Mahasiswa m : list) {
                                %>
                                <tr>
                                    <td class="text-center"><%= no++ %></td>
                                    <td class="text-center fw-bold text-primary"><%= m.getNim() %></td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-light rounded-circle p-2 me-2 text-primary">
                                                <i class="fas fa-user-circle"></i>
                                            </div>
                                            <span class="fw-bold text-secondary"><%= m.getNama() %></span>
                                        </div>
                                    </td>
                                    <td class="text-center"><span class="badge bg-info text-dark"><%= m.getAngkatan() %></span></td>
                                    <td class="text-center text-muted font-monospace">
                                        <%= "admin".equals(userRole) ? m.getPassword() : "••••••" %>
                                    </td>
                                    
                                    <% if ("admin".equals(userRole)) { %>
                                        <td class="text-center">
                                            <button class="btn btn-sm btn-outline-danger"
                                                    onclick="konfirmasiHapusMhs('${pageContext.request.contextPath}/DeleteMahasiswaServlet?nim=<%= m.getNim() %>', '<%= m.getNama() %>')">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </td>
                                    <% } %>
                                </tr>
                                <% } } else { %>
                                <tr>
                                    <td colspan="<%= "admin".equals(userRole) ? 6 : 5 %>" class="text-center py-5 text-muted">
                                        <i class="fas fa-users-slash fa-3x mb-3 text-secondary opacity-50"></i><br>
                                        Belum ada data mahasiswa.
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div> </div> </div> <script>
    function konfirmasiHapusMhs(url, nama) {
        Swal.fire({
            title: 'Hapus ' + nama + '?',
            text: "PERINGATAN: Menghapus mahasiswa ini juga akan MENGHAPUS SEMUA RIWAYAT SETORANNYA secara otomatis! Data tidak bisa kembali.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Ya, Hapus Semuanya!',
            cancelButtonText: 'Batal'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = url;
            }
        });
    }
</script>

<%-- 3. PANGGIL FOOTER --%>
<%@ include file="../footer.jsp" %>