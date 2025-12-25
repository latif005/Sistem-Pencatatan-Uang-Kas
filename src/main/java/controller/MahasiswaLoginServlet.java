///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package controller;
//
//import dao.MahasiswaDAO;
//import model.Mahasiswa;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebServlet("/mahasiswaLogin")
//public class MahasiswaLoginServlet extends HttpServlet {
//    private MahasiswaDAO mdao = new MahasiswaDAO();
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.getRequestDispatcher("mahasiswaLogin.jsp").forward(req, resp);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String nim = req.getParameter("nim");
//        Mahasiswa m = mdao.findByNim(nim);
//        if (m != null) {
//            HttpSession s = req.getSession();
//            s.setAttribute("mahasiswa", m);
//            s.setMaxInactiveInterval(30 * 60);
//            resp.sendRedirect(req.getContextPath() + "/mahasiswa/riwayatSetoran.jsp?nim=" + nim);
//        } else {
//            req.setAttribute("error", "NIM tidak terdaftar");
//            req.getRequestDispatcher("mahasiswaLogin.jsp").forward(req, resp);
//        }
//    }
//}
