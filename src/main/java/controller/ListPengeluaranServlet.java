/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PengeluaranDAO;
import model.Pengeluaran;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ListPengeluaranServlet", urlPatterns = {"/ListPengeluaranServlet"})
public class ListPengeluaranServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PengeluaranDAO dao = new PengeluaranDAO();
        List<Pengeluaran> list = dao.getAll();
        
        request.setAttribute("dataPengeluaran", list);
        request.getRequestDispatcher("pengeluaran/list.jsp").forward(request, response);
    }
}