/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dev.enep.sms3_pbo_spo.controllers;

import dev.enep.sms3_pbo_spo.dao.AutentikasiDao;
import dev.enep.sms3_pbo_spo.models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;

/**
 *
 * @author raffi
 */
public class AutentikasiServlet extends HttpServlet {

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
            out.println("<title>Servlet AutentikasiServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AutentikasiServlet at " + request.getContextPath() + "</h1>");
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

        AutentikasiDao dao = new AutentikasiDao();
        String aksi = request.getParameter("aksi");

        // ======= LOGIN =======
        if ("login".equalsIgnoreCase(aksi)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            try {
                User user = dao.login(username, password);
                if (user == null) {
                    response.sendRedirect("index.jsp?pg=login&error=Username atau Password salah" + "&usn=" + username);
                    return;
                }

                HttpSession session = request.getSession(true);
                session.setAttribute("user-session", user);

                response.sendRedirect("index.jsp?pg=dashboard/obat");
                return;
            } catch (SQLException ex) {
                System.getLogger(AutentikasiServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
                response.sendRedirect("index.jsp?pg=login&error=" + ex.getMessage());
                return;
            }
        }

        // ======= REGISTER =======
        if ("register".equalsIgnoreCase(aksi)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            try {
                User user = new User();
                user.setUsername(username);
                user.setPassword(password); // idealnya sudah di-hash di service

                String result = dao.register(user);
                String postMsg;
                int isSuccess = 0;

                if (null == result) {
                    postMsg = "Registrasi gagal";
                } else {
                    switch (result) {
                        case "REGISTER_SUCCESS":
                            postMsg = "Login berhasil, anda akan diarahkan ke halaman login...";
                            isSuccess = 1;
                            break;
                        case "USERNAME_EXISTS":
                            postMsg = "Username sudah digunakan";
                            break;
                        default:
                            postMsg = "Registrasi gagal";
                            break;
                    }
                }
                response.sendRedirect("index.jsp?pg=register&postMsg=" + postMsg + "&isSuccess=" + isSuccess + "&usn=" + username);
                return;
            } catch (SQLException ex) {
                System.getLogger(AutentikasiServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
                response.sendRedirect("index.jsp?pg=register&error=" + ex.getMessage());
                return;
            }
        }

        // ======= LOGOUT =======
        if ("logout".equalsIgnoreCase(aksi)) {
            try {
                HttpSession session = request.getSession(true);
                session.invalidate();
                response.sendRedirect(
                        "index.jsp");
                return;
            } catch (Exception ex) {
                System.getLogger(AutentikasiServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
                return;
            }
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
