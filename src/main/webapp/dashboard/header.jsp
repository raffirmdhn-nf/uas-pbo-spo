<%@page import="dev.enep.sms3_pbo_spo.models.Obat"%>
<%@page import="java.util.List"%>
<%@page import="dev.enep.sms3_pbo_spo.dao.ObatDAO"%>
<%@page import="dev.enep.sms3_pbo_spo.models.User"%>
<%
    User user = (User) session.getAttribute("user-session");
    ObatDAO obatDao = new ObatDAO();
    List<Obat> listObatExpiring = obatDao.findExpiring();
%>

<!-- Navbar -->
<nav class="app-header navbar navbar-expand bg-body">
    <!--begin::Container-->
    <div class="container-fluid">
        <!-- Start navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-lte-toggle="sidebar" href="#" role="button">
                    <i class="bi bi-list"></i>
                </a>
            </li>
        </ul>
        <!-- End navbar links -->

        <ul class="navbar-nav ms-auto">
            <!-- Notifications Dropdown Menu -->
            <li class="nav-item dropdown">
                <a class="nav-link" data-bs-toggle="dropdown" href="#">
                    <i class="bi bi-bell-fill"></i>
                    <span class="navbar-badge badge text-bg-warning"><%= listObatExpiring.size()%></span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
                    <% if (listObatExpiring.isEmpty()) { %>
                    <span class="dropdown-item text-center text-muted">
                        Tidak ada obat mendekati expired
                    </span>
                    <% } else {
                        for (Obat o : listObatExpiring) {%>
                    <%
                        java.time.LocalDate today = java.time.LocalDate.now();
                        java.time.LocalDate expDate = o.getExpired_date().toLocalDate();
                        long sisaHari = java.time.temporal.ChronoUnit.DAYS.between(today, expDate);
                    %>

                    <div class="dropdown-item">
                        <i class="bi bi-exclamation-triangle-fill text-warning me-2"></i>
                        <strong><%= o.getNama()%></strong><br>
                        <small class="text-muted">
                            Expired <%= sisaHari%> hari lagi
                        </small>
                    </div>
                    <div class="dropdown-divider"></div>
                    <%   }
                        }
                    %>
                </div>
            </li>
            <li class="nav-item dropdown user-menu">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <span class="d-none d-md-inline" style="text-transform: capitalize;"><%= user.getUsername()%></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-end">

                    <!-- Menu Footer-->
                    <li class="d-flex justify-content-between align-items-center p-2">
                        <form method="POST" action="AutentikasiServlet" class="w-100">
                            <button class="btn btn-default btn-flat w-100" name="aksi" value="logout">Sign out</button>
                        </form>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <!--end::Container-->
</nav>
<!-- /.navbar -->