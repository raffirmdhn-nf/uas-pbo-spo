<%@page import="dev.enep.sms3_pbo_spo.models.User"%>
<%@page import="java.util.List"%>
<%@page import="dev.enep.sms3_pbo_spo.models.Obat"%>
<%@page import="dev.enep.sms3_pbo_spo.dao.ObatDAO"%>

<%
    request.setAttribute("pageTitle", "Manajemen Obat | Dashboard");

    User user = (User) session.getAttribute("user-session");
    if (user == null) {
        response.sendRedirect("index.jsp?pg=login");
        return;
    }
    Boolean isAdmin = user.getRole_id() == 1;

    ObatDAO dao = new ObatDAO();
    String search = request.getParameter("search");
    search = search != null ? search : "";
    List<Obat> list = dao.findAll(search);

    String err = request.getParameter("err");
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

<div class="container-fluid">
    <% if (err != null) {%>
    <div class="alert alert-danger" role="alert">
        <%= err%>
    </div>
    <% } %>


    <% if (isAdmin) { %>
    <!-- Button Tambah -->
    <div class="d-flex justify-content-end mb-3">
        <button type="button"
                class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#modalObat">
            <i class="bi bi-plus-circle me-2"></i> Tambah Data
        </button>
    </div>
    <% }%>

    <form method="GET" class="d-flex" onsubmit="doSearch(event)">
        <div class="input-group mb-3">
            <input type="text" name="search" class="form-control" placeholder="Cari data..." value="<%= search%>">
            <button class="btn btn-primary" type="submit">Cari</button>
        </div>
    </form>


    <!-- Tabel Data -->
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nama Obat</th>
                <th>Stok</th>
                <th>Expired Date</th>
                    <% if (isAdmin) { %>
                <th>Aksi</th>
                    <% } %>
            </tr>
        </thead>
        <tbody>
            <% for (Obat o : list) {%>
            <tr>
                <td><%= o.getId()%></td>
                <td><%= o.getNama()%></td>
                <td><%= o.getStok()%></td>
                <td><%= o.getExpired_date()%></td>
                <% if (isAdmin) {%>
                <td>
                    <!-- Edit Data -->
                    <button type="button"
                            class="btn btn-warning btn-sm me-1"
                            style="width:100px"
                            data-bs-toggle="modal"
                            data-bs-target="#modalObat"
                            data-id="<%= o.getId()%>"
                            data-nama="<%= o.getNama()%>"
                            data-stok="<%= o.getStok()%>"
                            data-expired="<%= o.getExpired_date()%>">
                        <i class="bi bi-pencil-square me-1"></i>Edit
                    </button>
                    <!-- Hapus Data -->
                    <form method="post" action="ObatServlet"
                          style="display:inline"
                          onsubmit="return confirm('Anda yakin ingin menghapus data ini?');">
                        <input type="hidden" name="id" value="<%= o.getId()%>">
                        <button name="aksi" value="hapus"
                                class="btn btn-danger btn-sm"
                                style="width:100px">
                            <i class="bi bi-trash me-1"></i>Hapus
                        </button>
                    </form>
                </td>
                <% } %>
            </tr>
            <% }%>
        </tbody>
    </table>
</div>

<!-- ===== Modal Tambah / Edit ===== -->
<div class="modal fade" id="modalObat" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="ObatServlet">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">Tambah Data Obat</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">
                    <input type="hidden" name="aksi" id="aksi" value="tambah">
                    <div class="mb-2">
                        <label>Nama Obat</label>
                        <input type="text" name="nama" id="nama" class="form-control" required>
                    </div>
                    <div class="mb-2">
                        <label>Stok</label>
                        <input type="number" name="stok" id="stok" class="form-control" required>
                    </div>
                    <div class="mb-2">
                        <label>Expired Date</label>
                        <input type="date" name="expired_date" id="expired_date" class="form-control" required>
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
    function doSearch(e) {
        e.preventDefault();

        const searchValue = document.querySelector('input[name="search"]').value.trim();
        const url = new URL(window.location.href);
        url.searchParams.set('search', searchValue);
        window.location.href = url.toString();
    }
</script>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const searchInput = document.querySelector('input[name="search"]');
        if (searchInput) {
            searchInput.focus();
        }
    });
    
    const modal = document.getElementById('modalObat');

    modal.addEventListener('show.bs.modal', function (event) {
        const btn = event.relatedTarget;

        document.getElementById('id').value = '';
        document.getElementById('nama').value = '';
        document.getElementById('stok').value = '';
        document.getElementById('expired_date').value = '';
        document.getElementById('aksi').value = 'tambah';
        document.getElementById('modalTitle').innerText = 'Tambah Data Obat';

        if (btn && btn.dataset.id) {
            document.getElementById('id').value = btn.dataset.id;
            document.getElementById('nama').value = btn.dataset.nama;
            document.getElementById('stok').value = btn.dataset.stok;
            document.getElementById('expired_date').value = btn.dataset.expired;
            document.getElementById('aksi').value = 'edit';
            document.getElementById('modalTitle').innerText = 'Edit Data Obat';
        }
    });
</script>
