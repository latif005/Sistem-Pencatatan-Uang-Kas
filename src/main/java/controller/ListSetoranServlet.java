/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SetoranDAO;
import model.Setoran;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "ListSetoranServlet", urlPatterns = {"/ListSetoranServlet"})
public class ListSetoranServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Cek Session (Keamanan)
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userRole") == null) {
            System.out.println("DEBUG: Tidak ada sesi, redirect ke login.");
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. Ambil data User dari Session
        String role = (String) session.getAttribute("userRole");
        String userId = (String) session.getAttribute("userId"); // Ini adalah NIM jika mahasiswa

        System.out.println("DEBUG: User Login -> ID: " + userId + ", Role: " + role);

        SetoranDAO dao = new SetoranDAO();
        List<Setoran> listSetoran;

        // 3. Logika Pemisahan Data (FILTERING)
        if ("admin".equals(role)) {
            // Jika ADMIN -> Ambil SEMUA Data
            System.out.println("DEBUG: Akses Admin, mengambil getAll()");
            listSetoran = dao.getAll();
        } else {
            // Jika MAHASISWA -> Ambil Data berdasarkan NIM (userId)
            System.out.println("DEBUG: Akses Mahasiswa, mengambil getByNim(" + userId + ")");
            listSetoran = dao.getByNim(userId);
        }
        
        // 4. Kirim ke JSP
        request.setAttribute("dataSetoran", listSetoran);
        request.getRequestDispatcher("setoran/list.jsp").forward(request, response);
    }
}