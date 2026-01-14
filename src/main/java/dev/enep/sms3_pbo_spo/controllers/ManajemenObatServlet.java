/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dev.enep.sms3_pbo_spo.controllers;

import dev.enep.sms3_pbo_spo.dao.ObatDAO;
import dev.enep.sms3_pbo_spo.models.Obat;
import dev.enep.sms3_pbo_spo.models.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 *
 * @author ASUS
 */
public class ManajemenObatServlet extends HttpServlet {

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
            out.println("<title>Servlet ManajemenObatServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManajemenObatServlet at " + request.getContextPath() + "</h1>");
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

        ObatDAO dao = new ObatDAO();
        String aksi = request.getParameter("aksi");

        Users user = (Users) request.getSession().getAttribute("user-session");
        if (user == null) {
            response.sendRedirect("index.jsp?pg=login");
            return;
        }

        // ===== KURANGI STOK =====
        if ("kurangi-stok".equalsIgnoreCase(aksi)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                int stok = Integer.parseInt(request.getParameter("stok"));

                Obat o = new Obat();
                o.setId(id);
                o.setStok(stok);

                dao.kurangStok(o, user.getId());
                response.sendRedirect("index.jsp?pg=dashboard/manajemenobat");
            } catch (Exception ex) {
                System.getLogger(ManajemenObatServlet.class.getName())
                        .log(System.Logger.Level.ERROR, "Error update stok", ex);
                response.sendRedirect("index.jsp?pg=dashboard/manajemenobat&error=" + ex.getMessage());
            }
            return;
        }

        // ===== TAMBAH STOK =====
        if ("tambah-stok".equalsIgnoreCase(aksi)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                int stok = Integer.parseInt(request.getParameter("stok"));

                Obat o = new Obat();
                o.setId(id);
                o.setStok(stok);

                dao.tambahStok(o, user.getId());
                response.sendRedirect("index.jsp?pg=dashboard/manajemenobat");
            } catch (Exception ex) {
                System.getLogger(ManajemenObatServlet.class.getName())
                        .log(System.Logger.Level.ERROR, "Error update stok", ex);
                response.sendRedirect("index.jsp?pg=dashboard/manajemenobat&error=" + ex.getMessage());
            }
            return;
        }

        response.sendRedirect("index.jsp?pg=dashboard/manajemenobat");
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
