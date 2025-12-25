/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SetoranDAO;
import model.Setoran;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AddSetoranServlet", urlPatterns = {"/AddSetoranServlet"})
public class AddSetoranServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // =====================================================================
        // 1. SECURITY CHECK (PENGAMANAN)
        // =====================================================================
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userRole") == null || !"admin".equals(session.getAttribute("userRole"))) {
            // Jika bukan admin, tolak akses dan arahkan ke login
            System.out.println("DEBUG: Akses ditolak! User bukan admin.");
            response.sendRedirect("login.jsp");
            return;
        }
        
        // =====================================================================
        // 2. PROSES SIMPAN DATA
        // =====================================================================
        try {
            // A. Tangkap data dari form
            String nim = request.getParameter("nim");
            String tanggalStr = request.getParameter("tanggal");
            String jumlahStr = request.getParameter("jumlah");
            String keterangan = request.getParameter("keterangan");

            System.out.println("DEBUG: Menerima Input -> NIM: " + nim + ", Tgl: " + tanggalStr + ", Jml: " + jumlahStr);

            // B. Parsing Tanggal
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date tanggal = new Date(); // Default hari ini jika kosong
            try {
                if (tanggalStr != null && !tanggalStr.isEmpty()) {
                    tanggal = sdf.parse(tanggalStr);
                }
            } catch (ParseException e) {
                System.out.println("DEBUG: Error Parsing Tanggal: " + e.getMessage());
            }

            // C. Parsing Jumlah Uang
            double jumlah = 0;
            if (jumlahStr != null && !jumlahStr.isEmpty()) {
                jumlah = Double.parseDouble(jumlahStr);
            }

            // D. Masukkan ke Model
            Setoran s = new Setoran();
            s.setNim(nim);
            s.setTanggal(tanggal);
            s.setJumlah(jumlah);
            s.setKeterangan(keterangan);

            // E. Simpan via DAO
            SetoranDAO dao = new SetoranDAO();
            
            System.out.println("DEBUG: Mencoba menyimpan ke database...");
            boolean berhasil = dao.tambahSetoran(s);

            // F. Cek Hasil dan Redirect
            if (berhasil) {
                System.out.println("DEBUG: SUKSES! Data berhasil disimpan.");
                response.sendRedirect("setoran/form.jsp?status=sukses");
            } else {
                System.out.println("DEBUG: GAGAL! DAO mengembalikan false (Kemungkinan NIM tidak ditemukan).");
                response.sendRedirect("setoran/form.jsp?status=gagal");
            }

        } catch (NumberFormatException e) {
            System.out.println("DEBUG: ERROR Format Angka: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("setoran/form.jsp?status=gagal");
            
        } catch (Exception e) {
            System.out.println("DEBUG: TERJADI ERROR LAIN: " + e.getMessage());
            e.printStackTrace(); // Ini akan mencetak detail error merah di Output NetBeans
            response.sendRedirect("setoran/form.jsp?status=gagal");
        }
    }
}