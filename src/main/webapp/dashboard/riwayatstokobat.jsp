<%@page import="dev.enep.sms3_pbo_spo.dao.StokLogDAO"%>
<%@page import="dev.enep.sms3_pbo_spo.models.StokLog"%>
<%@page import="dev.enep.sms3_pbo_spo.models.Users"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>

<%
    request.setAttribute("pageTitle", "Riwayat Stok Obat | Dashboard");
    Users user = (Users) session.getAttribute("user-session");
    if (user == null) {
        return;
    }

    StokLogDAO dao = new StokLogDAO();

    int lastId = request.getParameter("lastId") != null ? Integer.parseInt(request.getParameter("lastId")) : 0;
    int limit = 10;
    List<StokLog> list = dao.findAll(lastId, limit);
%>

<div class="app-content-header">
    <!--begin::Container-->
    <div class="container-fluid">
        <!--begin::Row-->
        <div class="row">
            <div class="col-sm-6"><h3 class="mb-0">Riwayat Stok Obat</h3></div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-end">
                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Riwayat Stok Obat</li>
                </ol>
            </div>
        </div>
        <!--end::Row-->
    </div>
    <!--end::Container-->
</div>


<section class="content">
    <div class="container-fluid">
        <h2 class="mb-4"></h2>
        <!-- Table list obat -->
        <div class="table-responsive" style="max-height: 400px; overflow-y: auto">
            <table class="table table-striped table-bordered ">
                <thead class="table-dark sticky-top">
                    <tr>
                        <th>ID</th>
                        <th>Obat</th>
                        <th>Keterangan</th>
                        <th>Stok Awal</th>
                        <th>Stok Akhir</th>
                        <th>User</th>
                        <th>Waktu Perubahan</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (StokLog sl : list) {%>
                    <tr>
                        <td><%= sl.getId()%></td>
                        <td><%= sl.getObat_nama()%></td>
                        <td><%= sl.getKeterangan()%></td>
                        <td><%= sl.getStok_awal()%></td>
                        <td><%= sl.getStok_akhir()%></td>
                        <td><%= sl.getUser_nama()%></td>
                        <td><%= sl.getFormattedCreatedAt()%></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </div>
</section>