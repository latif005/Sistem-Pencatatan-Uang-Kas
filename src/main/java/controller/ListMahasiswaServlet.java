/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MahasiswaDAO;
import model.Mahasiswa;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "ListMahasiswaServlet", urlPatterns = {"/ListMahasiswaServlet"})
public class ListMahasiswaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Cek Login (Security)
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userRole") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. Panggil DAO
        MahasiswaDAO dao = new MahasiswaDAO();
        List<Mahasiswa> listMahasiswa = dao.getAllMahasiswa();
        
        // 3. Kirim ke JSP
        request.setAttribute("dataMahasiswa", listMahasiswa);
        request.getRequestDispatcher("mahasiswa/list.jsp").forward(request, response);
    }
}