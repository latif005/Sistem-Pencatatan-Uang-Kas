package controller;

import dao.KegiatanDAO;
import model.Kegiatan;
import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "DeleteKegiatanServlet", urlPatterns = {"/DeleteKegiatanServlet"})
public class DeleteKegiatanServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Cek Admin
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("userRole"))) {
            response.sendRedirect("DashboardServlet");
            return;
        }

        try {
            // 2. Ambil ID
            int id = Integer.parseInt(request.getParameter("id"));
            KegiatanDAO dao = new KegiatanDAO();
            
            // 3. Cari Data Dulu (Buat dapat nama gambarnya)
            Kegiatan k = dao.getKegiatanById(id);
            
            if (k != null) {
                // 4. HAPUS FILE GAMBAR DARI FOLDER
                String fileName = k.getGambar();
                if (fileName != null && !fileName.isEmpty()) {
                    // Cari lokasi folder images/kegiatan
                    String uploadPath = getServletContext().getRealPath("") + File.separator + "images" + File.separator + "kegiatan";
                    File file = new File(uploadPath + File.separator + fileName);
                    
                    // Hapus file jika ada
                    if (file.exists()) {
                        file.delete();
                    }
                }
                
                // 5. HAPUS RECORD DARI DATABASE
                dao.deleteKegiatan(id);
            }
            
            // Redirect kembali ke dashboard
            response.sendRedirect("DashboardServlet?status=hapus_sukses");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("DashboardServlet?status=error");
        }
    }
}