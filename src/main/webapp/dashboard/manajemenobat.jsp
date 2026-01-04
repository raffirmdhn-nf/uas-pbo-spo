<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="dev.enep.sms3_pbo_spo.models.Obat"%>
<%@page import="dev.enep.sms3_pbo_spo.dao.ObatDAO"%>

<%
    request.setAttribute("pageTitle", "Manajemen Stok Obat | Dashboard");
    ObatDAO dao = new ObatDAO();

    // Aksi tambah / kurang stok
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String aksi = request.getParameter("aksi");
        int id = Integer.parseInt(request.getParameter("id"));

        if ("tambah-stok".equals(aksi)) {
            dao.tambahStok(id);
        } else if ("kurangi-stok".equals(aksi)) {
            dao.kurangStok(id);
        }
%>
<script>
    window.location.href = "?pg=dashboard/manajemenobat"
</script>
<%
    }

    List<Obat> list = dao.findAll();
%>

<div class="app-content-header">
    <!--begin::Container-->
    <div class="container-fluid">
        <!--begin::Row-->
        <div class="row">
            <div class="col-sm-6"><h3 class="mb-0">Manajemen Stok Obat</h3></div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-end">
                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Stok Obat</li>
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
                <% for (Obat o : list) {%>
                <tr>
                    <td><%= o.getId()%></td>
                    <td><%= o.getNama()%></td>
                    <td><%= o.getStok()%></td>
                    <td><%= o.getExpired_date()%></td>
                    <td><%= o.getUpdated_at()%></td>
                    <td>
                        <form method="post" style="display:inline">
                            <input type="hidden" name="id" value="<%= o.getId()%>">
                            <button name="aksi" value="kurangi-stok" class="btn btn-primary btn-sm">
                                -
                            </button>
                        </form>
                        <form method="post" style="display:inline">
                            <input type="hidden" name="id" value="<%= o.getId()%>">
                            <button name="aksi" value="tambah-stok" class="btn btn-primary btn-sm">
                                +
                            </button>
                        </form>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </div>
</section>