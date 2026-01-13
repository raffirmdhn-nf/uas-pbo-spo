<%@page import="dev.enep.sms3_pbo_spo.dao.KategoriObatDAO"%>
<%@page import="dev.enep.sms3_pbo_spo.models.KategoriObat"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="dev.enep.sms3_pbo_spo.models.Obat"%>
<%@page import="dev.enep.sms3_pbo_spo.dao.ObatDAO"%>

<%
    request.setAttribute("pageTitle", "Manajemen Obat | Dashboard");
    ObatDAO dao = new ObatDAO();

    List<Obat> list = dao.findAll();
    Obat obatEdit = null;

    String aksi = request.getParameter("aksi"); // dari query param
    String editIdParam = request.getParameter("id");
    int editId = (editIdParam != null && !editIdParam.isEmpty()) ? Integer.parseInt(editIdParam) : 0;

    if ("edit".equals(aksi) && editId > 0) {
        obatEdit = dao.findById(editId);
    }

    String err = request.getParameter("error");
%>

<div class="app-content-header">
    <!--begin::Container-->
    <div class="container-fluid">
        <!--begin::Row-->
        <div class="row">
            <div class="col-sm-6"><h3 class="mb-0">Manajemen Obat</h3></div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-end">
                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Obat</li>
                </ol>
            </div>
        </div>
        <!--end::Row-->
    </div>
    <!--end::Container-->
</div>


<section class="content">
    <div class="container-fluid">
        <% if (err != null) {%>
        <div class="alert alert-danger" role="alert">
            <%= err%>
        </div>
        <% } %>
        
        <h2 class="mb-4"></h2>

        <!-- Form tambah / edit -->
        <form method="POST" action="ObatServlet" class="mb-4 row g-2">
            <% if (obatEdit != null) {%>
            <input type="hidden" name="id" value="<%= obatEdit.getId()%>">
            <div class="col-md-3">
                <input type="text" name="nama" class="form-control" placeholder="Nama obat" value="<%= obatEdit.getNama()%>" required>
            </div>
            <div class="col-md-3">
                <input type="number" name="stok" class="form-control" placeholder="Stok" value="<%= obatEdit.getStok()%>" >
            </div>
            <div class="col-md-3">
                <input type="date" name="expired_date" class="form-control" placeholder="Expired date" value="<%= obatEdit.getExpired_date()%>" >
            </div>
            <div class="col-md-3">
                <button type="submit" name="aksi" value="edit" class="btn btn-primary w-100">
                    <i class="bi bi-plus-circle"></i> Update
                </button>
            </div>
            <% } else { %>
            <div class="col-md-3">
                <input type="text" name="nama" class="form-control" placeholder="Nama obat" required>
            </div>
            <div class="col-md-3">
                <input type="number" name="stok" class="form-control" placeholder="Stok">
            </div>
            <div class="col-md-3">
                <input type="date" name="expired_date" class="form-control" placeholder="Expired date">
            </div>
            <div class="col-md-3">
                <button type="submit" name="aksi" value="tambah" class="btn btn-success w-100">
                    <i class="bi bi-plus-circle"></i> Tambah
                </button>
            </div>
            <% } %>
        </form>


        <!-- Table list obat -->
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nama</th>
                    <th>Stok</th>
                    <th>Expired date</th>
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
                    <td>
                        <a href="?pg=dashboard/obat&aksi=edit&id=<%= o.getId()%>" class="btn btn-warning btn-sm me-1">
                            <i class="bi bi-pencil-square"></i> Edit
                        </a>
                        <form method="post" action="ObatServlet" style="display:inline" onsubmit="return confirm('Apakah Anda yakin ingin menghapus data ini?');">
                            <input type="hidden" name="id" value="<%= o.getId()%>">
                            <button name="aksi" value="hapus" class="btn btn-danger btn-sm">
                                <i class="bi bi-trash"></i> Hapus
                            </button>
                        </form>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </div>
</section>
