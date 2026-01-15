<%@page import="dev.enep.sms3_pbo_spo.models.Role"%>
<%@page import="dev.enep.sms3_pbo_spo.dao.RoleDAO"%>
<!DOCTYPE html>

<%@page import="dev.enep.sms3_pbo_spo.models.User"%>
<%@page import="dev.enep.sms3_pbo_spo.dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>

<%
    request.setAttribute("pageTitle", "Manajemen User | Dashboard");

    User user = (User) session.getAttribute("user-session");
    if (user == null) {
        response.sendRedirect("index.jsp?pg=login");
        return;
    }

    UserDAO dao = new UserDAO();
    List<User> list = dao.findAll();

    RoleDAO roleDao = new RoleDAO();
    List<Role> listRole = roleDao.findAll();

    String err = request.getParameter("err");
%>

<div class="app-content-header">
    <!--begin::Container-->
    <div class="container-fluid">
        <!--begin::Row-->
        <div class="row">
            <div class="col-sm-6"><h3 class="mb-0">Manajemen User</h3></div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-end">
                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">User</li>
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

        <!-- Button Tambah -->
        <div class="d-flex justify-content-end mb-3">
            <button type="button"
                    class="btn btn-primary"
                    data-bs-toggle="modal"
                    data-bs-target="#modalUser">
                <i class="bi bi-plus-circle me-2"></i> Tambah User
            </button>
        </div>


        <!-- Table list user -->
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Tgl Dibuat</th>
                    <th>Tgl Dirubah</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <% for (User u : list) {%>
                <tr>
                    <td><%= u.getId()%></td>
                    <td><%= u.getUsername()%></td>
                    <td><%= u.getRole_nama()%></td>
                    <td><%= u.getFormattedCreatedAt()%></td>
                    <td><%= u.getFormattedUpdatedAt()%></td>
                    <td>
                        <!-- Edit User -->
                        <button type="button"
                                class="btn btn-warning btn-sm me-1"
                                style="width:100px"
                                data-bs-toggle="modal"
                                data-bs-target="#modalUser"
                                data-id="<%= u.getId()%>"
                                data-username="<%= u.getUsername()%>"
                                data-role_id="<%= u.getRole_id()%>">
                            <i class="bi bi-pencil-square me-1"></i>Edit
                        </button>
                        <form method="post" action="UserServlet" style="display:inline" onsubmit="return confirm('Apakah Anda yakin ingin menghapus data ini?');">
                            <input type="hidden" name="id" value="<%= u.getId()%>">
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

<!-- ===== Modal Tambah / Edit User ===== -->
<div class="modal fade" id="modalUser" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="UserServlet">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">Tambah User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">
                    <input type="hidden" name="aksi" id="aksi" value="tambah">

                    <div class="mb-2">
                        <label>Username</label>
                        <input type="text" name="username" id="username" class="form-control" required>
                    </div>
                    <div class="mb-2">
                        <label>Password</label>
                        <input type="password" name="password" id="password" class="form-control" required>
                    </div>
                    <div class="mb-2">
                        <label>Role</label>
                        <select name="role_id" id="role_id" class="form-control" required>
                            <option value="">-- Pilih Role --</option>
                            <% for (Role r : listRole) {%>
                            <option value="<%= r.getId()%>"><%= r.getNama()%></option>
                            <% }%>
                        </select>
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
    const modal = document.getElementById('modalUser');

    modal.addEventListener('show.bs.modal', function (event) {
        const btn = event.relatedTarget;

        document.getElementById('id').value = '';
        document.getElementById('username').value = '';
        document.getElementById('password').value = '';
        document.getElementById('role_id').value = '';
        document.getElementById('aksi').value = 'tambah';
        document.getElementById('modalTitle').innerText = 'Tambah User';

        if (btn && btn.dataset.id) {
            document.getElementById('id').value = btn.dataset.id;
            document.getElementById('username').value = btn.dataset.username;
            document.getElementById('role_id').value = btn.dataset.role_id;
            document.getElementById('aksi').value = 'edit';
            document.getElementById('modalTitle').innerText = 'Edit User';
        }
    });
</script>