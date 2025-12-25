/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AdminDAO;
import dao.MahasiswaDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String role = request.getParameter("role");
        String user = request.getParameter("username"); // Ini bisa username admin atau NIM mhs
        String pass = request.getParameter("password");
        
        boolean isValid = false;
        String namaUser = "";
        
        if ("admin".equals(role)) {
            AdminDAO adminDAO = new AdminDAO();
            if (adminDAO.login(user, pass)) {
                isValid = true;
                namaUser = "Administrator"; // Atau ambil dari DB jika perlu
            }
        } else if ("mahasiswa".equals(role)) {
            MahasiswaDAO mhsDAO = new MahasiswaDAO();
            if (mhsDAO.login(user, pass)) {
                isValid = true;
                namaUser = mhsDAO.getNamaByNim(user);
            }
        }
        
        if (isValid) {
            // Login Sukses: Buat Session
            HttpSession session = request.getSession();
            session.setAttribute("userRole", role);
            session.setAttribute("userId", user); // Simpan Username/NIM
            session.setAttribute("userName", namaUser); // Simpan Nama Asli
            
            // Redirect ke Dashboard
            response.sendRedirect("DashboardServlet");
        } else {
            // Login Gagal
            response.sendRedirect("login.jsp?status=gagal");
        }
    }
}