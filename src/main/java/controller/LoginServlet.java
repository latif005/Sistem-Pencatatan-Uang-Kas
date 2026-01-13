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
import jakarta.servlet.RequestDispatcher; // PENTING: Import ini ditambah

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
        
        // 1. Cek Login ke Database
        if ("admin".equals(role)) {
            AdminDAO adminDAO = new AdminDAO();
            if (adminDAO.login(user, pass)) {
                isValid = true;
                namaUser = "Administrator"; 
            }
        } else if ("mahasiswa".equals(role)) {
            MahasiswaDAO mhsDAO = new MahasiswaDAO();
            if (mhsDAO.login(user, pass)) {
                isValid = true;
                namaUser = mhsDAO.getNamaByNim(user);
            }
        }
        
        // 2. Logika Redirect vs Forward
        if (isValid) {
            // === LOGIN SUKSES ===
            HttpSession session = request.getSession();
            session.setAttribute("userRole", role);
            session.setAttribute("userId", user); 
            session.setAttribute("userName", namaUser); 
            
            // Redirect aman dipakai kalau sukses (pindah halaman total)
            response.sendRedirect("DashboardServlet");
            
        } else {
            // === LOGIN GAGAL (BAGIAN INI YANG DIUBAH) ===
            
            // A. Simpan pesan error agar bisa dibaca di JSP
            request.setAttribute("errorMessage", "Username atau Password Anda salah!");
            
            // B. Gunakan RequestDispatcher (Forward) agar pesan TIDAK HILANG
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
}