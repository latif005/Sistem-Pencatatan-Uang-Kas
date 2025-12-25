/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PengeluaranDAO;
import dao.SetoranDAO;
import dao.KegiatanDAO; // WAJIB ADA: Untuk mengambil data gambar/kegiatan
import model.Kegiatan;  // WAJIB ADA: Model data kegiatan
import java.util.List;  // WAJIB ADA: Untuk menampung list kegiatan

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession; // WAJIB ADA: Untuk cek session login

@WebServlet(name = "DashboardServlet", urlPatterns = {"/DashboardServlet", "/index.jsp"}) 
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // ==========================================
        // 1. CEK KEAMANAN (SESSION)
        // ==========================================
        // Jika user belum login (tidak punya session), tendang ke login.jsp
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return; // Stop proses di sini
        }

        // ==========================================
        // 2. HITUNG KEUANGAN (STATISTIK)
        // ==========================================
        SetoranDAO setoranDAO = new SetoranDAO();
        PengeluaranDAO pengeluaranDAO = new PengeluaranDAO();
        
        double totalSetoran = setoranDAO.getTotalSetoran();
        double totalPengeluaran = pengeluaranDAO.getTotalPengeluaran();
        double saldoAkhir = totalSetoran - totalPengeluaran;
        
        // Kirim data angka ke JSP
        request.setAttribute("totalSetoran", totalSetoran);
        request.setAttribute("totalPengeluaran", totalPengeluaran);
        request.setAttribute("saldoAkhir", saldoAkhir);
        
        // ==========================================
        // 3. AMBIL DATA GALERI KEGIATAN (FITUR BARU)
        // ==========================================
        try {
            KegiatanDAO kDao = new KegiatanDAO();
            List<Kegiatan> listKegiatan = kDao.getAll();
            
            // Kirim list kegiatan ke JSP agar Carousel bisa menampilkan gambar
            request.setAttribute("listKegiatan", listKegiatan);
            
            // (Opsional) Debugging di Output Netbeans untuk memastikan data ada
            System.out.println("Data Kegiatan ditemukan: " + listKegiatan.size());
            
        } catch (Exception e) {
            e.printStackTrace();
            // Jika error, program tetap jalan (hanya carousel yang kosong)
        }

        // ==========================================
        // 4. TAMPILKAN DASHBOARD
        // ==========================================
        request.getRequestDispatcher("dashboard_view.jsp").forward(request, response);
    }
}