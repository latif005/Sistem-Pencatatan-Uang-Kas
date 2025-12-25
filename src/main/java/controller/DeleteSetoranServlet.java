/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SetoranDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "DeleteSetoranServlet", urlPatterns = {"/DeleteSetoranServlet"})
public class DeleteSetoranServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Cek Security (Hanya Admin yang boleh hapus)
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("userRole"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. Ambil ID dari URL (?id=...)
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            
            // 3. Panggil DAO
            SetoranDAO dao = new SetoranDAO();
            dao.deleteSetoran(id);
            
            // 4. Kembali ke List
            response.sendRedirect("ListSetoranServlet");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ListSetoranServlet");
        }
    }
}