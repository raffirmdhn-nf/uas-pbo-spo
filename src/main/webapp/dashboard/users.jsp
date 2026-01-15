<%-- 
    Document   : Users
    Created on : Jan 13, 2026, 10:11:17 PM
    Author     : Admin
--%>

<%@page import="dev.enep.sms3_pbo_spo.dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="dev.enep.sms3_pbo_spo.models.Users"%>

<%
    request.setAttribute("pageTitle", "User | Dashboard");
    UserDAO dao = new UserDAO();

    List<Users> list = dao.findAll();
    Users userEdit = null;

    String aksi = request.getParameter("aksi"); // dari query param
    String editIdParam = request.getParameter("id");
    int editId = (editIdParam != null && !editIdParam.isEmpty()) ? Integer.parseInt(editIdParam) : 0;

    if ("edit".equals(aksi) && editId > 0) {
        userEdit = dao.findById(editId);
    }

    String err = request.getParameter("error");
%>

<div class="app-content-header">
    <!--begin::Container-->
    <div class="container-fluid">
        <!--begin::Row-->
        <div class="row">
            <div class="col-sm-6"><h3 class="mb-0">User</h3></div>
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

        <!-- Form tambah / edit -->
        <form method="POST" action="UserServlet" class="mb-4 row g-2">
            <% if (userEdit != null) {%>
            <input type="hidden" name="id" value="<%= userEdit.getId()%>">
            <div class="col-md-4">
                <input type="text" name="username" class="form-control" placeholder="username" value="<%= userEdit.getUsername()%>" required>
            </div>
            <div class="col-md-6">
                <input type="text" name="password" class="form-control" placeholder="password" value="<%= userEdit.getPassword()%>" >
            </div>
            <div class="col-md-6">
                <input type="text" name="role" class="form-control" placeholder="role" value="<%= userEdit.getRole()%>" >
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">
                    <i class="bi bi-plus-circle"></i> Update
                </button>
            </div>
            <% } else { %>
            <div class="col-md-4">
                <input type="text" name="username" class="form-control" placeholder="Username" required>
            </div>
            <div class="col-md-6">
                <input type="text" name="password" class="form-control" placeholder="Password">
            </div>
            <div class="col-md-2">
                <input type="text" name="role" class="form-control" placeholder="Role">
            </div>
            <div class="col-md-2">
                <button type="submit" name="aksi" value="tambah" class="btn btn-success w-100">
                    <i class="bi bi-plus-circle"></i> Tambah
                </button>
            </div>
            <% } %>
        </form>


        <!-- Table list user -->
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Role</th>
                    <th>Created At</th>
                    <th>Updated At</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <% for (Users u : list) {%>
                <tr>
                    <td><%= u.getId()%></td>
                    <td><%= u.getUsername()%></td>
                    <td><%= u.getPassword()%></td>
                    <td><%= u.getRole()%></td>
                    <td><%= u.getFormattedCreatedAt()%></td>
                    <td><%= u.getFormattedUpdatedAt()%></td>
                    <td>
                        <a href="?pg=dashboard/users&aksi=edit&id=<%= u.getId()%>" class="btn btn-warning btn-sm me-1">
                            <i class="bi bi-pencil-square"></i> Edit
                        </a>
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
