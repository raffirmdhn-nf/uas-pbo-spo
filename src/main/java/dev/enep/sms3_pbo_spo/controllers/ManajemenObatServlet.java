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

    try {
        int id = Integer.parseInt(request.getParameter("id"));

        // Ambil userId dari session (sesuaikan nama attribute session lu)
        Integer userIdObj = (Integer) request.getSession().getAttribute("userId");
        int userId = (userIdObj != null) ? userIdObj : 0; // kalau belum ada, minimal 0 dulu

        // Buat objek Obat minimal untuk isi id dan stok
        // (stok ini idealnya stok terbaru dari DB, tapi kita sesuaikan dengan DAO lu)
        Obat o = new Obat();
        o.setId(id);

        // stok_awal & stok_akhir di log DAO lu pakai o.getStok()
        // jadi kalau lu ngirim stok dari form hidden, isi di sini:
        String stokStr = request.getParameter("stok");
        if (stokStr != null && !stokStr.isEmpty()) {
            o.setStok(Integer.parseInt(stokStr));
        } else {
            // kalau gak ada parameter stok, default 0 (log bisa jadi gak akurat)
            o.setStok(0);
        }

        if ("kurangi-stok".equalsIgnoreCase(aksi)) {
            dao.kurangStok(o, userId);
            response.sendRedirect("index.jsp?pg=dashboard/manajemenobat");
            return;
        }

        if ("tambah-stok".equalsIgnoreCase(aksi)) {
            dao.tambahStok(o, userId);
            response.sendRedirect("index.jsp?pg=dashboard/manajemenobat");
            return;
        }

        response.sendRedirect("index.jsp?pg=dashboard/manajemenobat&error=Aksi tidak dikenal");

    } catch (Exception ex) {
        System.getLogger(ManajemenObatServlet.class.getName())
              .log(System.Logger.Level.ERROR, "Error stok", ex);
        response.sendRedirect("index.jsp?pg=dashboard/manajemenobat&error=" + ex.getMessage());
    }

    response.sendRedirect("index.jsp?pg=dashboard/manajemenobat");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
