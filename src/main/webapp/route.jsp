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

    request.setAttribute("contentPage", content);
%>
<jsp:include page="<%= filePg%>" />