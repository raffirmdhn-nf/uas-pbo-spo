<%
    String pg = request.getParameter("pg");
    String filePg = "";
    String content = "";

    if (pg == null || pg.isEmpty()) {
        filePg = "landing/index.jsp";
    } else {
        filePg = pg + ".jsp";

        if (pg.startsWith("dashboard")) {
            filePg = "dashboard/template.jsp";
            content = pg + ".jsp";
        }
    }

    String realPath = application.getRealPath("/" + content);

        if (realPath == null || !new java.io.File(realPath).exists()) {
            content = "dashboard/404.jsp";
        }

    request.setAttribute("contentPage", content);
%>
<jsp:include page="<%= filePg%>" />