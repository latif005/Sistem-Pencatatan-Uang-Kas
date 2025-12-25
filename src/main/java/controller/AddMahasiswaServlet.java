/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MahasiswaDAO;
import model.Mahasiswa;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AddMahasiswaServlet", urlPatterns = {"/AddMahasiswaServlet"})
public class AddMahasiswaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // --- 🛡️ SECURITY CHECK START ---
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userRole") == null || !"admin".equals(session.getAttribute("userRole"))) {
            response.sendRedirect("login.jsp");
            return;
        }
        // --- 🛡️ SECURITY CHECK END ---
        
        String nim = request.getParameter("nim");
        String nama = request.getParameter("nama");
        String password = request.getParameter("password");
        String angkatan = request.getParameter("angkatan");

        Mahasiswa m = new Mahasiswa(nim, nama, password, angkatan);
        MahasiswaDAO dao = new MahasiswaDAO();
        
        if(dao.tambahMahasiswa(m)) {
            response.sendRedirect("mahasiswa/form.jsp?status=sukses");
        } else {
            response.sendRedirect("mahasiswa/form.jsp?status=gagal");
        }
    }
}