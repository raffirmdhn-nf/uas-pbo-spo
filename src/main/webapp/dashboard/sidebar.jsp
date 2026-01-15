<%@page import="dev.enep.sms3_pbo_spo.models.User"%>
<%
    User user = (User) session.getAttribute("user-session");
    if (user == null) {
        return;
    }

    String currentPg = request.getParameter("pg"); // ambil query param ?pg
    Boolean isAdmin = user.getRole_id() == 1;
%>

<!--begin::Sidebar-->
<aside class="app-sidebar bg-body-secondary shadow" data-bs-theme="dark">
    <!--begin::Sidebar Brand-->
    <div class="sidebar-brand">
        <!--begin::Brand Link-->
        <a href="./index.html" class="brand-link">
            <!--begin::Brand Image-->
            <img
                src="dashboard/assets/img/AdminLTELogo.png"
                alt="AdminLTE Logo"
                class="brand-image opacity-75 shadow"
                />
            <!--end::Brand Image-->
            <!--begin::Brand Text-->
            <span class="brand-text fw-light">Farma Care</span>
            <!--end::Brand Text-->
        </a>
        <!--end::Brand Link-->
    </div>
    <!--end::Sidebar Brand-->
    <!--begin::Sidebar Wrapper-->
    <div class="sidebar-wrapper">
        <nav class="mt-2">
            <!--begin::Sidebar Menu-->
            <ul
                class="nav sidebar-menu flex-column"
                data-lte-toggle="treeview"
                role="menu"
                data-accordion="false"
                >
                <li class="nav-header" style="text-transform: uppercase"><%= user.getRole_nama()%></li>

                <% if (isAdmin) {%>
                <li class="nav-item">
                    <a href="?pg=dashboard" class="nav-link <%= "dashboard".equals(currentPg) ? "active" : ""%>">
                        <i class="nav-icon bi bi-easel2"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <% } %>
                <% if (isAdmin) {%>
                <li class="nav-item">
                    <a href="?pg=dashboard/user" class="nav-link <%= "dashboard/user".equals(currentPg) ? "active" : ""%>">
                        <i class="nav-icon bi bi-tags"></i>
                        <p>Manajemen User</p>
                    </a>
                </li>
                <% }%>
                <% if (isAdmin) {%>
                <li class="nav-item">
                    <a href="?pg=dashboard/kategoriobat" class="nav-link <%= "dashboard/kategoriobat".equals(currentPg) ? "active" : ""%>">
                        <i class="nav-icon bi bi-tags"></i>
                        <p>Kategori Obat</p>
                    </a>
                </li>
                <% }%>
                <li class="nav-item">
                    <a href="?pg=dashboard/obat" class="nav-link <%= "dashboard/obat".equals(currentPg) ? "active" : ""%>">
                        <i class="nav-icon bi bi-box-seam"></i>
                        <p>Obat</p>
                    </a>
                </li>
                <% if (isAdmin) {%>
                <li class="nav-item">
                    <a href="?pg=dashboard/manajemenobat" class="nav-link <%= "dashboard/manajemenobat".equals(currentPg) ? "active" : ""%>">
                        <i class="nav-icon bi bi-gear"></i>
                        <p>Manajemen Obat</p>
                    </a>
                </li>
                <% }%>
                <% if (isAdmin) {%>
                <li class="nav-item">
                    <a href="?pg=dashboard/riwayatstokobat" class="nav-link <%= "dashboard/riwayatstokobat".equals(currentPg) ? "active" : ""%>">
                        <i class="nav-icon bi bi-file-earmark-medical"></i>
                        <p>Riwayat Stok Obat</p>
                    </a>
                </li>
                <% }%>
            </ul>
            <!--end::Sidebar Menu-->
        </nav>
    </div>
    <!--end::Sidebar Wrapper-->
</aside>
<!--end::Sidebar-->