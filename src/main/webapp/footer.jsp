<%-- 
    Document   : footer
    Created on : 11 Dec 2025, 15.26.20
    Author     : LATIF WIBOWO
--%>

<footer class="text-center py-4 mt-5 text-muted border-top bg-white">
        <small>&copy; 2025 Sekolah Tinggi Teknologi Terpadu Nurul Fikri - Projek PBO</small>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>

    <script>
        $(document).ready(function () {
            // Cari tabel yang punya class 'table' dan ubah jadi DataTables
            $('.table').DataTable({
                language: {
                    url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/id.json' // Ubah bahasa jadi Indonesia
                },
                // Opsi tambahan agar tabel responsif di HP
                scrollX: true 
            });
        });
    </script>
</body>
</html>