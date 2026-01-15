<%@page import="dev.enep.sms3_pbo_spo.models.Users"%>
<%@page import="java.util.List"%>
<%@page import="dev.enep.sms3_pbo_spo.models.KategoriObat"%>
<%@page import="dev.enep.sms3_pbo_spo.dao.KategoriObatDAO"%>

<%
    request.setAttribute("pageTitle", "Manajemen Kategori Obat | Dashboard");

    Users user = (Users) session.getAttribute("user-session");
    if (user == null) {
        response.sendRedirect("index.jsp?pg=login");
        return;
    }

    KategoriObatDAO dao = new KategoriObatDAO();
    List<KategoriObat> list = dao.findAll();
%>

<div class="app-content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6">
                <h3 class="mb-0">Manajemen Kategori Obat</h3>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-end">
                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                    <li class="breadcrumb-item active">Kategori Obat</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">

    <!-- Button Tambah -->
    <div class="d-flex justify-content-end mb-3">
        <button type="button"
                class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#modalKategori">
            <i class="bi bi-plus-circle me-2"></i> Tambah Data
        </button>
    </div>

    <!-- Tabel Data -->
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nama</th>
                <th>Deskripsi</th>
                <th>Tanggal Dibuat</th>
                <th>Tanggal Diubah</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <% for (KategoriObat k : list) { %>
            <tr>
                <td><%= k.getId() %></td>
                <td><%= k.getNama() %></td>
                <td><%= k.getDeskripsi() %></td>
                <td><%= k.getFormattedCreatedAt() %></td>
                <td><%= k.getFormattedUpdatedAt() %></td>
                <td>
                    <!-- Edit Data -->
                    <button type="button"
                            class="btn btn-warning btn-sm me-1"
                            style="width:100px"
                            data-bs-toggle="modal"
                            data-bs-target="#modalKategori"
                            data-id="<%= k.getId() %>"
                            data-nama="<%= k.getNama() %>"
                            data-deskripsi="<%= k.getDeskripsi() %>">
                        <i class="bi bi-pencil-square me-1"></i>Edit
                    </button>
                    <!-- Hapus Data -->
                    <form method="post"
                          action="KategoriObatServlet"
                          style="display:inline"
                          onsubmit="return confirm('Anda yakin ingin menghapus data ini?');">
                        <input type="hidden" name="id" value="<%= k.getId() %>">
                        <button name="aksi" value="hapus"
                                class="btn btn-danger btn-sm"
                                style="width:100px">
                            <i class="bi bi-trash me-1"></i>Hapus
                        </button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<!-- ===== Modal Tambah / Edit ===== -->
<div class="modal fade" id="modalKategori" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="KategoriObatServlet">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">Tambah Data</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">
                    <input type="hidden" name="aksi" id="aksi" value="tambah">
                    <div class="mb-2">
                        <label>Nama Kategori</label>
                        <input type="text" name="nama" id="nama" class="form-control" required>
                    </div>
                    <div class="mb-2">
                        <label>Deskripsi</label>
                        <input type="text" name="deskripsi" id="deskripsi" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
const modal = document.getElementById('modalKategori');

modal.addEventListener('show.bs.modal', function (event) {
    const btn = event.relatedTarget;

    document.getElementById('id').value = '';
    document.getElementById('nama').value = '';
    document.getElementById('deskripsi').value = '';
    document.getElementById('aksi').value = 'tambah';
    document.getElementById('modalTitle').innerText = 'Tambah Kategori Obat';

    if (btn && btn.dataset.id) {
        document.getElementById('id').value = btn.dataset.id;
        document.getElementById('nama').value = btn.dataset.nama;
        document.getElementById('deskripsi').value = btn.dataset.deskripsi;
        document.getElementById('aksi').value = 'edit';
        document.getElementById('modalTitle').innerText = 'Edit Kategori Obat';
    }
});
</script>
