/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dev.enep.sms3_pbo_spo.controllers;

import dev.enep.sms3_pbo_spo.dao.UserDAO;
import dev.enep.sms3_pbo_spo.models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class UserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO dao = new UserDAO();
        String aksi = request.getParameter("aksi");

        // ===== EKSEKUSI TOMBOL HAPUS DATA =====
        if ("hapus".equalsIgnoreCase(aksi)) {
            try {
                dao.softDelete(Integer.parseInt(request.getParameter("id")));
                response.sendRedirect("index.jsp?pg=dashboard/user");
            } catch (Exception ex) {
                System.getLogger(UserServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
                response.sendRedirect("index.jsp?pg=dashboard/user&error=" + ex.getMessage());
            }
            return;
        }

        // ===== EKSEKUSI TAMBAH DATA =====
        if ("tambah".equals(aksi)) {
            try {
                User u = new User();
                u.setUsername(request.getParameter("username"));
                u.setPassword(request.getParameter("password"));
                u.setRole_id(Integer.parseInt(request.getParameter("role_id")));
                dao.insert(u);
                response.sendRedirect("index.jsp?pg=dashboard/user");
            } catch (Exception ex) {
                System.getLogger(UserServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
                response.sendRedirect("index.jsp?pg=dashboard/user&error=" + ex.getMessage());
            }
            return;
        }

        // ===== EKSEKUSI TAMBAH DATA =====
        if ("edit".equals(aksi)) {
            try {
                User u = new User();
                u.setId(Integer.parseInt(request.getParameter("id")));
                u.setUsername(request.getParameter("username"));
                u.setPassword(request.getParameter("password"));
                u.setRole_id(Integer.parseInt(request.getParameter("role_id")));
                dao.update(u);
                response.sendRedirect("index.jsp?pg=dashboard/user");
            } catch (Exception ex) {
                System.getLogger(KategoriObatServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
                response.sendRedirect("index.jsp?pg=dashboard/user&error=" + ex.getMessage());
            }
            return;
        }

        response.sendRedirect("index.jsp?pg=dashboard/user");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
