/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MahasiswaDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "DeleteMahasiswaServlet", urlPatterns = {"/DeleteMahasiswaServlet"})
public class DeleteMahasiswaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Security Check (Hanya Admin)
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("userRole"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. Ambil NIM dari URL
        String nim = request.getParameter("nim");
        
        if (nim != null && !nim.isEmpty()) {
            // 3. Panggil DAO
            MahasiswaDAO dao = new MahasiswaDAO();
            boolean sukses = dao.deleteMahasiswa(nim);
            
            if (!sukses) {
                System.out.println("Gagal menghapus mahasiswa NIM: " + nim);
            }
        }
        
        // 4. Kembali ke List
        response.sendRedirect("ListMahasiswaServlet");
    }
}