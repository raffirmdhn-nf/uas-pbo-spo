<%@page import="dev.enep.sms3_pbo_spo.dao.KategoriObatDAO"%>
<%@page import="dev.enep.sms3_pbo_spo.models.KategoriObat"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="dev.enep.sms3_pbo_spo.models.Obat"%>
<%@page import="dev.enep.sms3_pbo_spo.dao.ObatDAO"%>

<%
    request.setAttribute("pageTitle", "Manajemen Obat | Dashboard");
    ObatDAO dao = new ObatDAO();
    KategoriObatDAO ktgObatDao = new KategoriObatDAO();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        if ("tambah".equals(request.getParameter("aksi"))) {
            Obat o = new Obat();
            o.setNama(request.getParameter("nama"));
            o.setStok(Integer.parseInt(request.getParameter("stok")));
            String expiredStr = request.getParameter("expired_date");
            Date expiredDate = Date.valueOf(expiredStr);
            o.setExpired_date(expiredDate);
            dao.insert(o);
%>
<script>
    alert("Data berhasil ditambah!");
    window.location.href = "?pg=dashboard/obat";
</script>
<%
    }

    if ("hapus".equals(request.getParameter("aksi"))) {
        dao.softDelete(Integer.parseInt(request.getParameter("id")));
%>
<script>
    alert("Data berhasil dihapus!");
    window.location.href = "?pg=dashboard/obat";
</script>
<%
    }
    // Update obat
    if ("edit".equals(request.getParameter("aksi"))) {
        Obat o = new Obat();
        o.setId(Integer.parseInt(request.getParameter("id")));
        o.setNama(request.getParameter("nama"));
        o.setStok(Integer.parseInt(request.getParameter("stok")));
        System.out.println("Stop: " + o.getStok());
        String expiredStr = request.getParameter("expired_date");
        Date expiredDate = Date.valueOf(expiredStr);
        o.setExpired_date(expiredDate);
        o.setKategori_id(Integer.parseInt(request.getParameter("kategori_id")));
        dao.update(o); // Pastikan method update di DAO sudah ada
%>
<script>
    alert("Data berhasil diupdate!");
    window.location.href = "?pg=dashboard/obat";
</script>
<%
        }
    }

    List<KategoriObat> listKtgObat = ktgObatDao.findAll();
    List<Obat> list = dao.findAll();
    Obat obatEdit = null;

    String aksi = request.getParameter("aksi"); // dari query param
    String editIdParam = request.getParameter("id");
    int editId = (editIdParam != null && !editIdParam.isEmpty()) ? Integer.parseInt(editIdParam) : 0;

    if ("edit".equals(aksi) && editId > 0) {
        obatEdit = dao.findById(editId);
    }

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
        <h2 class="mb-4"></h2>

        <!-- Form tambah / edit -->
        <form method="post" class="mb-4 row g-2">
            <% if (obatEdit != null) {%>
            <input type="hidden" name="id" value="<%= obatEdit.getId()%>">
            <div class="col-md-3">
                <input type="text" name="nama" class="form-control" placeholder="Nama obat" value="<%= obatEdit.getNama()%>" required>
            </div>
            <div class="col-md-2">
                <input type="number" name="stok" class="form-control" placeholder="Stok"
                       <%= (obatEdit != null) ? "value=\"" + obatEdit.getStok() + "\"" : ""%> required>
            </div>

            <div class="col-md-2">
                <input type="date" name="expired_date" class="form-control" placeholder="Expired date" 
                       <%= (obatEdit != null) ? "value=\"" + obatEdit.getExpired_date() + "\"" : ""%> required>
            </div>

            <div class="col-md-3">
                <select class="form-select" name="kategori_id" required>
                    <option value="">Kategori Obat</option>
                    <% for (KategoriObat ktgObat : listKtgObat) {%>
                    <option 
                        value="<%= ktgObat.getId()%>" 
                        <%= (obatEdit != null && ktgObat.getId() == obatEdit.getKategori_id()) ? "selected" : ""%>>
                        <%= ktgObat.getNama()%>
                    </option>
                    <% } %>
                </select>
            </div>
            <div class="col-md-2">
                <button type="submit" name="aksi" value="edit" class="btn btn-primary w-100">
                    <i class="bi bi-plus-circle"></i> Update
                </button>
            </div>
            <% } else { %>
            <div class="col-md-3">
                <input type="text" name="nama" class="form-control" placeholder="Nama obat" required>
            </div>
            <div class="col-md-2">
                <input type="number" name="stok" class="form-control" placeholder="Stok" required>
            </div>
            <div class="col-md-2">
                <input type="date" name="expired_date" class="form-control" placeholder="Expired date" required>
            </div>
            <div class="col-md-3">
                <select class="form-select" name="kategori_id" required>
                    <option value="">Kategori Obat</option>
                    <% for (KategoriObat ktgObat : listKtgObat) {%>
                    <option value="<%= ktgObat.getId()%>"><%= ktgObat.getNama()%></option>
                    <% } %>
                </select>
            </div>
            <div class="col-md-2">
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
                    <th>Expired</th>
                    <th>Kategori</th>
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
                    <td><%= o.getKategori_nama()%></td>
                    <td>
                        <a href="?pg=dashboard/obat&aksi=edit&id=<%= o.getId()%>" class="btn btn-warning btn-sm me-1">
                            <i class="bi bi-pencil-square"></i> Edit
                        </a>
                        <form method="post" style="display:inline" onsubmit="return confirm('Apakah Anda yakin ingin menghapus data ini?');">
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