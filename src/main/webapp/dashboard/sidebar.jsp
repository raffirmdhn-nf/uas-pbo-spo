<%@page import="dev.enep.sms3_pbo_spo.models.Users"%>
<%
    Users user = (Users) session.getAttribute("user-session");
    if (user == null) {
        return;
    }

    String currentPg = request.getParameter("pg"); // ambil query param ?pg
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
                <li class="nav-header" style="text-transform: uppercase"><%= user.getRole()%></li>

                <li class="nav-item">
                    <a href="?pg=dashboard/kategoriobat" class="nav-link <%= "dashboard/kategoriobat".equals(currentPg) ? "active" : ""%>">
                        <i class="nav-icon bi bi-tags"></i>
                        <p>Kategori Obat</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="?pg=dashboard/obat" class="nav-link <%= "dashboard/obat".equals(currentPg) ? "active" : ""%>">
                        <i class="nav-icon bi bi-box-seam"></i>
                        <p>Obat</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="?pg=dashboard/manajemenobat" class="nav-link <%= "dashboard/manajemenobat".equals(currentPg) ? "active" : ""%>">
                        <i class="nav-icon bi bi-gear"></i>
                        <p>Manajemen Obat</p>
                    </a>
                </li>
            </ul>
            <!--end::Sidebar Menu-->
        </nav>
    </div>
    <!--end::Sidebar Wrapper-->
</aside>
<!--end::Sidebar-->