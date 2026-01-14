/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dev.enep.sms3_pbo_spo.controllers;

import dev.enep.sms3_pbo_spo.dao.KategoriObatDAO;
import dev.enep.sms3_pbo_spo.models.KategoriObat;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author raffi
 */
public class KategoriObatServlet extends HttpServlet {

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
            out.println("<title>Servlet KategoriObatServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet KategoriObatServlet at " + request.getContextPath() + "</h1>");
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
        KategoriObatDAO dao = new KategoriObatDAO();
        String aksi = request.getParameter("aksi");

        try {
            // ===== TAMBAH DATA =====
            if ("tambah".equalsIgnoreCase(aksi)) {
                KategoriObat k = new KategoriObat();
                k.setNama(request.getParameter("nama"));
                k.setDeskripsi(request.getParameter("deskripsi"));
                dao.insert(k);
            }

            // ===== EDIT DATA =====
            else if ("edit".equalsIgnoreCase(aksi)) {
                KategoriObat k = new KategoriObat();
                k.setId(Integer.parseInt(request.getParameter("id")));
                k.setNama(request.getParameter("nama"));
                k.setDeskripsi(request.getParameter("deskripsi"));
                dao.update(k);
            }

            // ===== HAPUS DATA =====
            else if ("hapus".equalsIgnoreCase(aksi)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.softDelete(id);
            }
            response.sendRedirect("index.jsp?pg=dashboard/kategoriobat");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(
                "index.jsp?pg=dashboard/kategoriobat&error=" + e.getMessage()
            );
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
