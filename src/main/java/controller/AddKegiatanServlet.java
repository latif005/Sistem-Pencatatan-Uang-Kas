/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.KegiatanDAO;
import model.Kegiatan;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig; // PENTING!
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part; // PENTING!

@WebServlet(name = "AddKegiatanServlet", urlPatterns = {"/AddKegiatanServlet"})
@MultipartConfig // Wajib ada untuk fitur upload
public class AddKegiatanServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Ambil Data Teks
            String judul = request.getParameter("judul");
            String deskripsi = request.getParameter("deskripsi");
            String tanggalStr = request.getParameter("tanggal");
            
            // 2. Proses Upload Gambar
            Part filePart = request.getPart("gambar"); // Ambil file dari form
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            
            // Tentukan lokasi simpan (Folder 'images/kegiatan' di dalam project)
            // Note: Di NetBeans, path ini mungkin sementara. Untuk tugas kuliah ini sudah cukup.
            String uploadPath = getServletContext().getRealPath("") + File.separator + "images" + File.separator + "kegiatan";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir(); // Buat folder jika belum ada
            
            // Simpan file ke folder
            filePart.write(uploadPath + File.separator + fileName);
            
            // 3. Simpan ke Database
            Kegiatan k = new Kegiatan();
            k.setJudul(judul);
            k.setDeskripsi(deskripsi);
            k.setTanggal(Date.valueOf(tanggalStr));
            k.setGambar(fileName); // Simpan nama filenya saja
            
            KegiatanDAO dao = new KegiatanDAO();
            boolean sukses = dao.tambahKegiatan(k);
            
            if (sukses) {
                response.sendRedirect("kegiatan/form.jsp?status=sukses");
            } else {
                response.sendRedirect("kegiatan/form.jsp?status=gagal");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("kegiatan/form.jsp?status=error");
        }
    }
}