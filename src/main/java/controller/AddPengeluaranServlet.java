/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PengeluaranDAO;
import model.Pengeluaran;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AddPengeluaranServlet", urlPatterns = {"/AddPengeluaranServlet"})
public class AddPengeluaranServlet extends HttpServlet {

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

        try {
            String tglStr = request.getParameter("tanggal");
            double jumlah = Double.parseDouble(request.getParameter("jumlah"));
            String keperluan = request.getParameter("keperluan");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date tanggal = sdf.parse(tglStr);

            Pengeluaran p = new Pengeluaran(tanggal, jumlah, keperluan);
            PengeluaranDAO dao = new PengeluaranDAO();
            
            if(dao.tambahPengeluaran(p)){
                response.sendRedirect("pengeluaran/form.jsp?status=sukses");
            } else {
                response.sendRedirect("pengeluaran/form.jsp?status=gagal");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pengeluaran/form.jsp?status=error");
        }
    }
}