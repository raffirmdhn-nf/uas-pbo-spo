<%@page import="java.util.List"%>
<%@page import="dev.enep.sms3_pbo_spo.models.KategoriObat"%>
<%@page import="dev.enep.sms3_pbo_spo.dao.KategoriObatDAO"%>

<%
    request.setAttribute("pageTitle", "Manajemen Kategori | Dashboard");
    KategoriObatDAO dao = new KategoriObatDAO();

    List<KategoriObat> list = dao.findAll();
    KategoriObat kategoriEdit = null;

    String aksi = request.getParameter("aksi"); // dari query param
    String editIdParam = request.getParameter("id");
    int editId = (editIdParam != null && !editIdParam.isEmpty()) ? Integer.parseInt(editIdParam) : 0;

    if ("edit".equals(aksi) && editId > 0) {
        kategoriEdit = dao.findById(editId);
    }

    String err = request.getParameter("error");
%>

<div class="app-content-header">
    <!--begin::Container-->
    <div class="container-fluid">
        <!--begin::Row-->
        <div class="row">
            <div class="col-sm-6"><h3 class="mb-0">Manajemen Kategori Obat</h3></div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-end">
                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Kategori Obat</li>
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
        <form method="POST" action="KategoriObatServlet" class="mb-4 row g-2">
            <% if (kategoriEdit != null) {%>
            <input type="hidden" name="id" value="<%= kategoriEdit.getId()%>">
            <div class="col-md-4">
                <input type="text" name="nama" class="form-control" placeholder="Nama kategori" value="<%= kategoriEdit.getNama()%>" required>
            </div>
            <div class="col-md-6">
                <input type="text" name="deskripsi" class="form-control" placeholder="Deskripsi" value="<%= kategoriEdit.getDeskripsi()%>" >
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">
                    <i class="bi bi-plus-circle"></i> Update
                </button>
            </div>
            <% } else { %>
            <div class="col-md-4">
                <input type="text" name="nama" class="form-control" placeholder="Nama kategori" required>
            </div>
            <div class="col-md-6">
                <input type="text" name="deskripsi" class="form-control" placeholder="Deskripsi">
            </div>
            <div class="col-md-2">
                <button type="submit" name="aksi" value="tambah" class="btn btn-success w-100">
                    <i class="bi bi-plus-circle"></i> Tambah
                </button>
            </div>
            <% } %>
        </form>


        <!-- Table list kategori -->
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nama</th>
                    <th>Deskripsi</th>
                    <th>Tgl Dibuat</th>
                    <th>Tgl Dirubah</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <% for (KategoriObat k : list) {%>
                <tr>
                    <td><%= k.getId()%></td>
                    <td><%= k.getNama()%></td>
                    <td><%= k.getDeskripsi()%></td>
                    <td><%= k.getFormattedCreatedAt()%></td>
                    <td><%= k.getFormattedUpdatedAt()%></td>
                    <td>
                        <a href="?pg=dashboard/kategoriobat&aksi=edit&id=<%= k.getId()%>" class="btn btn-warning btn-sm me-1">
                            <i class="bi bi-pencil-square"></i> Edit
                        </a>
                        <form method="post" action="KategoriObatServlet" style="display:inline" onsubmit="return confirm('Apakah Anda yakin ingin menghapus data ini?');">
                            <input type="hidden" name="id" value="<%= k.getId()%>">
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
