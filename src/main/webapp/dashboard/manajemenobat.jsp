<%@page import="dev.enep.sms3_pbo_spo.models.User"%>
<%@page import="java.util.List"%>
<%@page import="dev.enep.sms3_pbo_spo.models.Obat"%>
<%@page import="dev.enep.sms3_pbo_spo.dao.ObatDAO"%>

<%
    request.setAttribute("pageTitle", "Manajemen Stok Obat | Dashboard");

    User user = (User) session.getAttribute("user-session");
    if (user == null) {
        response.sendRedirect("index.jsp?pg=login");
        return;
    }

    ObatDAO dao = new ObatDAO();
    List<Obat> list = dao.findAll();

    String err = request.getParameter("error");
%>

<div class="app-content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6"><h3 class="mb-0">Manajemen Stok Obat</h3></div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-end">
                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Stok Obat</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<section class="content">
    <div class="container-fluid">

        <% if (err != null) { %>
        <div class="alert alert-danger" role="alert">
            <%= err %>
        </div>
        <% } %>

        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nama</th>
                    <th>Stok</th>
                    <th>Expired</th>
                    <th>Update Terakhir</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <% for (Obat o : list) { %>
                <tr>
                    <td><%= o.getId() %></td>
                    <td><%= o.getNama() %></td>
                    <td><%= o.getStok() %></td>
                    <td><%= o.getFormattedExpiredDate() %></td>
                    <td><%= o.getFormattedUpdatedAt() %></td>
                    <td>
                        <form method="post" action="ManajemenObatServlet" style="display:inline">
                            <input type="hidden" name="id" value="<%= o.getId() %>">
                            <input type="hidden" name="stok" value="<%= o.getStok() %>">
                            <button name="aksi"
                                    value="kurangi-stok"
                                    class="btn btn-warning btn-sm"
                                    <%= (o.getStok() <= 0 ? "disabled" : "") %>>
                                -
                            </button>
                        </form>
                        <form method="post" action="ManajemenObatServlet" style="display:inline">
                            <input type="hidden" name="id" value="<%= o.getId() %>">
                            <input type="hidden" name="stok" value="<%= o.getStok() %>">
                            <button name="aksi" value="tambah-stok" class="btn btn-success btn-sm">
                                +
                            </button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</section>