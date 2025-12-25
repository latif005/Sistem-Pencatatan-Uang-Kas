/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SetoranDAO;
import dao.PengeluaranDAO;
import model.Setoran;
import model.Pengeluaran;
import model.Tunggakan;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ReportServlet", urlPatterns = {"/ReportServlet"})
public class ReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String type = request.getParameter("type");
        
        // =====================================================================
        // 1. LAPORAN KESELURUHAN (Sebelumnya Mingguan/Weekly)
        //    Logika: Menampilkan SEMUA data tanpa filter tanggal
        // =====================================================================
        if ("weekly".equals(type) || type == null) { 
            // Kita tetap pakai "weekly" agar tidak perlu ubah link di menu.jsp
            
            SetoranDAO setoranDAO = new SetoranDAO();
            PengeluaranDAO pengeluaranDAO = new PengeluaranDAO();

            // AMBIL SEMUA DATA (Pastikan method getAll() sudah ada di DAO Anda)
            // Jika merah, cek nama method di SetoranDAO.java (misal: getAllSetoran() atau getSetoran())
            List<Setoran> listMasuk = setoranDAO.getAll(); 
            List<Pengeluaran> listKeluar = pengeluaranDAO.getAll(); 
            
            // HITUNG TOTAL MANUAL
            double totalMasuk = 0;
            if (listMasuk != null) {
                for (Setoran s : listMasuk) {
                    totalMasuk += s.getJumlah();
                }
            }
            
            double totalKeluar = 0;
            if (listKeluar != null) {
                for (Pengeluaran p : listKeluar) {
                    totalKeluar += p.getJumlah();
                }
            }
            
            // Kirim Data ke JSP
            request.setAttribute("listMasuk", listMasuk);
            request.setAttribute("listKeluar", listKeluar);
            request.setAttribute("totalMasuk", totalMasuk);
            request.setAttribute("totalKeluar", totalKeluar);
            
            // Forward ke halaman mingguan.jsp (yang tampilannya sudah diubah jadi Keseluruhan)
            request.getRequestDispatcher("report/mingguan.jsp").forward(request, response);

        // =====================================================================
        // 2. LAPORAN TUNGGAKAN
        // =====================================================================
        } else if ("tunggakan".equals(type)) {
            
            SetoranDAO setoranDAO = new SetoranDAO();

            // 1. Tentukan Tarif & Target
            double kasPerMinggu = 5000; 
            int mingguBerjalan = 4; // Nanti bisa dibuat otomatis berdasarkan tanggal
            double targetWajib = kasPerMinggu * mingguBerjalan; 
            
            // 2. Ambil Data
            // Pastikan method getRekapTunggakan ada di SetoranDAO Anda
            List<Tunggakan> listTunggakan = setoranDAO.getRekapTunggakan(targetWajib);
            
            // 3. Kirim ke JSP
            request.setAttribute("targetWajib", targetWajib);
            request.setAttribute("mingguKe", mingguBerjalan);
            request.setAttribute("dataTunggakan", listTunggakan);
            
            request.getRequestDispatcher("report/tunggakan.jsp").forward(request, response);

        } else {
            // Jika tipe tidak dikenali, kembalikan ke dashboard
            response.sendRedirect("DashboardServlet");
        }
    }
}