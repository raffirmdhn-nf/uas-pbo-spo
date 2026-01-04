<%@page import="dev.enep.sms3_pbo_spo.models.Users"%>
<%
    String aksi = request.getParameter("aksi");
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        if (aksi.equals("logout")) {
            session.invalidate();
%>
<script>window.location.href = "./";</script>
<%
            return;
        }
    }
    Users user = (Users) session.getAttribute("user-session");

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
                    <span class="navbar-badge badge text-bg-warning">15</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
                    <span class="dropdown-item dropdown-header">15 Notifications</span>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="bi bi-envelope me-2"></i> 4 new messages
                        <span class="float-end text-secondary fs-7">3 mins</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="bi bi-people-fill me-2"></i> 8 friend requests
                        <span class="float-end text-secondary fs-7">12 hours</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="bi bi-file-earmark-fill me-2"></i> 3 new reports
                        <span class="float-end text-secondary fs-7">2 days</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">
                        See All Notifications
                    </a>
                </div>
            </li>
            <li class="nav-item dropdown user-menu">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                    <span class="d-none d-md-inline" style="text-transform: capitalize;"><%= user.getUsername()%></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
                
                    <!-- Menu Footer-->
                    <li class="d-flex justify-content-between align-items-center p-2">
                        <form method="POST" class="w-100">
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