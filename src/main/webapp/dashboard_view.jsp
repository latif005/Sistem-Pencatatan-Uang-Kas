<%-- 
    Document   : dashboard_view
    Updated    : Full Features (Stats + Gallery + Delete + Chart)
--%>

<%@page import="model.Kegiatan"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>

<%
    // 1. CEK SESSION (Keamanan)
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // 2. AMBIL DATA DARI SERVLET
    // Data Keuangan
    double tSetoran = (request.getAttribute("totalSetoran") != null) ? (double) request.getAttribute("totalSetoran") : 0;
    double tPengeluaran = (request.getAttribute("totalPengeluaran") != null) ? (double) request.getAttribute("totalPengeluaran") : 0;
    double tSaldo = (request.getAttribute("saldoAkhir") != null) ? (double) request.getAttribute("saldoAkhir") : 0;
    
    // Data Galeri Kegiatan
    List<Kegiatan> listKegiatan = (List<Kegiatan>) request.getAttribute("listKegiatan");

    // Helper Format Rupiah
    NumberFormat rp = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
%>

<%-- 3. PANGGIL HEADER & MENU --%>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>

<div class="container mt-4 mb-5">
    <div class="row">
        
        <div class="col-md-3 mb-4">
            <%@ include file="sidebar.jsp" %>
        </div>

        <div class="col-md-9">
            
            <div class="row g-3 mb-4">
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm text-white h-100" style="background: linear-gradient(45deg, #11998e, #38ef7d);">
                        <div class="card-body p-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="text-uppercase small opacity-75 fw-bold">Pemasukan</h6>
                                    <h4 class="mb-0 fw-bold"><%= rp.format(tSetoran) %></h4>
                                </div>
                                <i class="fas fa-arrow-down fa-2x opacity-50"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm text-white h-100" style="background: linear-gradient(45deg, #cb2d3e, #ef473a);">
                        <div class="card-body p-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="text-uppercase small opacity-75 fw-bold">Pengeluaran</h6>
                                    <h4 class="mb-0 fw-bold"><%= rp.format(tPengeluaran) %></h4>
                                </div>
                                <i class="fas fa-arrow-up fa-2x opacity-50"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm text-white h-100" style="background: linear-gradient(45deg, #2980b9, #6dd5fa);">
                        <div class="card-body p-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="text-uppercase small opacity-75 fw-bold">Saldo Akhir</h6>
                                    <h4 class="mb-0 fw-bold"><%= rp.format(tSaldo) %></h4>
                                </div>
                                <i class="fas fa-wallet fa-2x opacity-50"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card card-custom border-0 shadow-sm mb-4">
                <div class="card-header bg-white border-0 pt-3 pb-2">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold text-secondary mb-0"><i class="fas fa-images me-2 text-primary"></i> Dokumentasi Kegiatan</h5>
                        
                        <% if ("admin".equals(session.getAttribute("userRole"))) { %>
                            <a href="kegiatan/form.jsp" class="btn btn-sm btn-primary rounded-pill px-3">
                                <i class="fas fa-plus me-1"></i> Upload Foto
                            </a>
                        <% } %>
                    </div>
                </div>
                
                <div class="card-body p-2">
                    <div id="carouselKegiatan" class="carousel slide rounded-3 overflow-hidden shadow-sm" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <% 
                                if (listKegiatan != null && !listKegiatan.isEmpty()) {
                                    boolean first = true;
                                    for (Kegiatan k : listKegiatan) {
                            %>
                            <div class="carousel-item <%= first ? "active" : "" %>">
                                <img src="images/kegiatan/<%= k.getGambar() %>" class="d-block w-100" 
                                     style="height: 350px; object-fit: cover; filter: brightness(0.7);" alt="Foto Kegiatan">
                                
                                <% if ("admin".equals(session.getAttribute("userRole"))) { %>
                                    <div class="position-absolute top-0 end-0 m-3" style="z-index: 10;">
                                        <button onclick="konfirmasiHapusKegiatan('<%= k.getId() %>')" 
                                                class="btn btn-danger btn-sm shadow-sm rounded-circle p-2" 
                                                title="Hapus Foto Ini">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </div>
                                <% } %>
                                
                                <div class="carousel-caption d-none d-md-block text-start">
                                    <span class="badge bg-primary mb-2"><%= k.getTanggal() %></span>
                                    <h4 class="fw-bold text-shadow"><%= k.getJudul() %></h4>
                                    <p class="text-light"><%= k.getDeskripsi() %></p>
                                </div>
                            </div>
                            <% 
                                        first = false; 
                                    }
                                } else {
                            %>
                            <div class="carousel-item active">
                                <div class="d-block w-100 bg-light d-flex align-items-center justify-content-center text-secondary" style="height: 200px;">
                                    <div class="text-center">
                                        <i class="fas fa-camera fa-3x mb-3 text-muted"></i>
                                        <h5>Belum ada dokumentasi kegiatan.</h5>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                        
                        <% if (listKegiatan != null && listKegiatan.size() > 1) { %>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselKegiatan" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselKegiatan" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        </button>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="card card-custom border-0 shadow-sm">
                <div class="card-header bg-white border-0 pt-3">
                    <h5 class="fw-bold text-secondary mb-0"><i class="fas fa-chart-bar me-2 text-warning"></i> Statistik Arus Kas</h5>
                </div>
                <div class="card-body">
                    <div style="height: 300px; width: 100%;">
                        <canvas id="kasChart"></canvas>
                    </div>
                </div>
            </div>

        </div> </div> </div> <%-- 4. SCRIPT (Chart.js & SweetAlert Hapus) --%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // === SCRIPT GRAFIK ===
    const totalMasuk = <%= tSetoran %>;
    const totalKeluar = <%= tPengeluaran %>;
    const sisaSaldo = <%= tSaldo %>;

    const ctx = document.getElementById('kasChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Total Pemasukan', 'Total Pengeluaran', 'Saldo Saat Ini'],
            datasets: [{
                label: 'Nominal (Rp)',
                data: [totalMasuk, totalKeluar, sisaSaldo],
                backgroundColor: [
                    'rgba(56, 239, 125, 0.7)',
                    'rgba(239, 71, 58, 0.7)',
                    'rgba(109, 213, 250, 0.7)'
                ],
                borderColor: [
                    'rgba(56, 239, 125, 1)',
                    'rgba(239, 71, 58, 1)',
                    'rgba(109, 213, 250, 1)'
                ],
                borderWidth: 1,
                borderRadius: 5
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return ' Rp ' + new Intl.NumberFormat('id-ID').format(context.raw);
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            return 'Rp ' + new Intl.NumberFormat('id-ID', { notation: "compact" }).format(value);
                        }
                    }
                }
            }
        }
    });

    // === SCRIPT HAPUS KEGIATAN (YANG TADI HILANG) ===
    function konfirmasiHapusKegiatan(id) {
        Swal.fire({
            title: 'Hapus Dokumentasi?',
            text: "Foto ini akan dihapus permanen dari galeri!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Ya, Hapus!',
            cancelButtonText: 'Batal'
        }).then((result) => {
            if (result.isConfirmed) {
                // Arahkan ke Servlet Hapus
                window.location.href = '${pageContext.request.contextPath}/DeleteKegiatanServlet?id=' + id;
            }
        });
    }
</script>

<%-- 5. PANGGIL FOOTER --%>
<%@ include file="footer.jsp" %>