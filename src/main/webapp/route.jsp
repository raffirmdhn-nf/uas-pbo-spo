<%
    String pg = request.getParameter("pg");
    String filePg = "";
    String content = "";

    // ==== MIDDLEWARE AUTH ====
    if (session.getAttribute("user-session") != null) {
        if ("login".equals(pg) || "register".equals(pg)) {
            response.sendRedirect("?pg=dashboard/obat");
            return;
        }
    }
    
    if (session.getAttribute("user-session") == null) {
        if (pg != null && pg.startsWith("dashboard")) {
            response.sendRedirect("?pg=login&error=Silahkan login terlebih dahulu");
            return;
        }
    }

    // ==== NAVIGASI ====   
    if (pg == null || pg.isEmpty()) {
        filePg = "landing/index.jsp";
    } else {
        filePg = pg + ".jsp";

        if (pg.startsWith("dashboard")) {
            filePg = "dashboard/template.jsp";

            if (pg.contains("/")) {
                content = pg + ".jsp";
            } else {
                content = "dashboard/dashboard.jsp";
            }
        }
    }

    String realPath = application.getRealPath("/" + content);

    if (realPath == null || !new java.io.File(realPath).exists()) {
        content = "dashboard/404.jsp";
    }

    request.setAttribute("contentPage", content);

    Boolean stop = (Boolean) request.getAttribute("STOP_RENDER");
    if (stop != null && stop) {
        return;
    }
%>
<jsp:include page="<%= filePg%>" />