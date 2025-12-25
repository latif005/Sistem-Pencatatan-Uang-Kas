/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SetoranDAO;
import dao.PengeluaranDAO; // Tambahan untuk Mingguan
import model.Setoran;
import model.Pengeluaran; // Tambahan untuk Mingguan
import model.Tunggakan;
import java.io.IOException;
import java.time.LocalDate;
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
        SetoranDAO setoranDAO = new SetoranDAO(); // Ganti nama variabel jadi lebih jelas
        
        // =====================================================================
        // 1. LAPORAN KAS MINGGUAN (Fitur Baru)
        // =====================================================================
        if ("weekly".equals(type)) {
            
            // Tentukan Rentang Tanggal (7 hari terakhir)
            LocalDate endDate = LocalDate.now();
            LocalDate startDate = endDate.minusDays(6);
            
            // Konversi ke java.sql.Date
            java.sql.Date sqlStart = java.sql.Date.valueOf(startDate);
            java.sql.Date sqlEnd = java.sql.Date.valueOf(endDate);
            
            // Ambil Data
            PengeluaranDAO pengeluaranDAO = new PengeluaranDAO();
            List<Setoran> listMasuk = setoranDAO.getSetoranByDate(sqlStart, sqlEnd);
            List<Pengeluaran> listKeluar = pengeluaranDAO.getPengeluaranByDate(sqlStart, sqlEnd);
            
            // Hitung Total
            double totalMasuk = listMasuk.stream().mapToDouble(Setoran::getJumlah).sum();
            double totalKeluar = listKeluar.stream().mapToDouble(Pengeluaran::getJumlah).sum();
            
            // Kirim ke JSP
            request.setAttribute("startDate", sqlStart);
            request.setAttribute("endDate", sqlEnd);
            request.setAttribute("listMasuk", listMasuk);
            request.setAttribute("listKeluar", listKeluar);
            request.setAttribute("totalMasuk", totalMasuk);
            request.setAttribute("totalKeluar", totalKeluar);
            
            request.getRequestDispatcher("report/mingguan.jsp").forward(request, response);

        // =====================================================================
        // 2. LAPORAN TUNGGAKAN (Kode Anda tadi ada di sini)
        // =====================================================================
        } else if ("tunggakan".equals(type)) {
            
            // 1. Tentukan Tarif
            double kasPerMinggu = 5000; 
            int mingguBerjalan = 4;     
            double targetWajib = kasPerMinggu * mingguBerjalan; 
            
            // 2. Ambil Data dari DAO
            List<Tunggakan> listTunggakan = setoranDAO.getRekapTunggakan(targetWajib);
            
            // 3. Kirim ke JSP
            request.setAttribute("targetWajib", targetWajib);
            request.setAttribute("mingguKe", mingguBerjalan);
            request.setAttribute("dataTunggakan", listTunggakan);
            
            request.getRequestDispatcher("report/tunggakan.jsp").forward(request, response);

        // =====================================================================
        // 3. LAPORAN SALDO (Opsional/Dashboard)
        // =====================================================================
        } else if ("saldo".equals(type)) {
            
            double total = setoranDAO.getTotalSetoran();
            request.setAttribute("reportTitle", "Laporan Saldo Akhir");
            request.setAttribute("totalAmount", total);
            request.getRequestDispatcher("report/index.jsp").forward(request, response);
            
        } else {
            // Jika tipe tidak dikenali, kembalikan ke dashboard
            response.sendRedirect("DashboardServlet");
        }
    }
}