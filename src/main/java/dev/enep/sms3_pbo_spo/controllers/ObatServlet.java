/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dev.enep.sms3_pbo_spo.controllers;

import dev.enep.sms3_pbo_spo.dao.ObatDAO;
import dev.enep.sms3_pbo_spo.models.Obat;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author User
 */
public class ObatServlet extends HttpServlet {

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
            out.println("<title>Servlet ObatServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ObatServlet at " + request.getContextPath() + "</h1>");
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

        // ===== TAMBAH OBAT =====
        if ("tambah".equals(aksi)) {
            try {
                Obat o = new Obat();
                o.setNama(request.getParameter("nama"));
                o.setStok(Integer.parseInt(request.getParameter("stok")));
                o.setExpired_date(Date.valueOf(request.getParameter("expired_date")));
                dao.insert(o);
                response.sendRedirect("index.jsp?pg=dashboard/obat");
                return;
            } catch (Exception ex) {
                System.getLogger(ObatServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
                response.sendRedirect("index.jsp?pg=dashboard/obat&error=" + ex.getMessage());
            }
            return;
        }

        // ===== EDIT OBAT =====
        if ("edit".equals(aksi)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Obat oldO = dao.findById(id);
                Obat o = new Obat();
                o.setId(id);
                o.setNama(request.getParameter("nama"));
                o.setStok(Integer.parseInt(request.getParameter("stok")));
                o.setExpired_date(Date.valueOf(request.getParameter("expired_date")));
                o.setKategori_id(oldO.getKategori_id());
                int userId = 1;
                dao.update(o, oldO, userId);
                response.sendRedirect("index.jsp?pg=dashboard/obat");
            } catch (Exception ex) {
                System.getLogger(ObatServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
                response.sendRedirect("index.jsp?pg=dashboard/obat&error=" + ex.getMessage());
            }
            return;
        }

        // ===== HAPUS DATA =====
        if ("hapus".equalsIgnoreCase(aksi)) {
            try {
                dao.softDelete(Integer.parseInt(request.getParameter("id")));
                response.sendRedirect("index.jsp?pg=dashboard/obat");
            } catch (Exception ex) {
                System.getLogger(ObatServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
                response.sendRedirect("index.jsp?pg=dashboard/obat&error=" + ex.getMessage());
            }
            return;
        }
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
