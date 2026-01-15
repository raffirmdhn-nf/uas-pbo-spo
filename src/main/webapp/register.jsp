<%@page import="dev.enep.sms3_pbo_spo.dao.AutentikasiDao"%>
<%@page import="dev.enep.sms3_pbo_spo.models.User"%>
<%
    String insUsn = request.getParameter("usn") != null ? request.getParameter("usn") : "";
    String isSuccess = request.getParameter("isSuccess");
    String postMsg = request.getParameter("postMsg");
    String errMessage = request.getParameter("error") != null ? request.getParameter("error") : "";
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    </head>
    <body>
        <!-- Login 2 - Bootstrap Brain Component -->
        <div class="bg-light py-3 py-md-5" style="width: 100%; height: 100dvh;">
            <div class="container" style="max-width: 60%;">
                <div class="row justify-content-md-center">
                    <div class="col-12 col-md-11 col-lg-8 col-xl-7 col-xxl-6">
                        <div class="bg-white p-4 p-md-5 rounded shadow-sm">
                            <div class="row">
                                <div class="col-12">
                                    <div class="mb-5">
                                        <a href="./" class="text-muted small text-decoration-none"><i class="bi bi-arrow-left-circle-fill"></i> Kembali</a>
                                        <h3>Register</h3>
                                    </div>
                                </div>
                            </div>
                            <form method="POST" action="AutentikasiServlet">
                                <% if (!errMessage.isEmpty()) {%>
                                <div class="alert alert-danger" role="alert">
                                    <%= errMessage%>
                                </div>
                                <% }%>

                                <% if (postMsg != null) {%>
                                <div class="alert <%= isSuccess == "1" ? "alert-success" : "alert-danger"%>" role="alert">
                                    <%= postMsg%>
                                </div>

                                <% if (isSuccess == "1") { %>
                                <script>
                                    setTimeout(function () {
                                        window.location.href = "?pg=login";
                                    }, 2000);
                                </script>
                                <% } %>
                                <% }%>

                                <div class="row gy-3 gy-md-4 overflow-hidden">
                                    <div class="col-12">
                                        <label for="username" class="form-label">username <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" name="username" id="username" value="<%= insUsn%>" required>
                                    </div>
                                    <div class="col-12">
                                        <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
                                        <input type="password" class="form-control" name="password" id="password" required>
                                    </div>

                                    <div class="col-12">
                                        <div class="d-grid">
                                            <button class="btn btn-lg btn-primary" type="submit" name="aksi" value="register">Register</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div class="row">
                                <div class="col-12">
                                    <hr class="mt-5 mb-4 border-secondary-subtle">
                                    <div class="d-flex gap-2 gap-md-4 flex-column flex-md-row justify-content-md-end">
                                        <a href="?pg=login" class="link-secondary text-decoration-none">Log in an existing account</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    </body>
</html>
