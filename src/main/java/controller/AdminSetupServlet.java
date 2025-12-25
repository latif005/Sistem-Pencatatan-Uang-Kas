///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package controller;
//
//import dao.AdminDAO;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import java.io.IOException;
//
///**
// * Endpoint untuk membuat admin awal. Jalankan sekali lalu hapus/disable servlet ini.
// * Contoh request: POST ke /setupAdmin dengan param username & password
// */
//@WebServlet("/setupAdmin")
//public class AdminSetupServlet extends HttpServlet {
//    private final AdminDAO adminDAO = new AdminDAO();
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/plain");
//        resp.getWriter().println("POST username & password to create admin. After creation, remove or secure this servlet.");
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String username = req.getParameter("username");
//        String password = req.getParameter("password");
//
//        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
//            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "username & password required");
//            return;
//        }
//
//        boolean ok = adminDAO.createAdmin(username, password);
//        if (ok) {
//            resp.getWriter().println("Admin created: " + username + ". Disable this servlet now.");
//        } else {
//            resp.getWriter().println("Failed to create admin (maybe username exists).");
//        }
//    }
//}
