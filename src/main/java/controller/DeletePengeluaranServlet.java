/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PengeluaranDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "DeletePengeluaranServlet", urlPatterns = {"/DeletePengeluaranServlet"})
public class DeletePengeluaranServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Security Check
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("userRole"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            PengeluaranDAO dao = new PengeluaranDAO();
            dao.deletePengeluaran(id);
            
            response.sendRedirect("ListPengeluaranServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ListPengeluaranServlet");
        }
    }
}