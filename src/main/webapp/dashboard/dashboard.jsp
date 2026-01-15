<%@page import="dev.enep.sms3_pbo_spo.dao.StokLogDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="dev.enep.sms3_pbo_spo.dao.UserDAO"%>
<%@page import="dev.enep.sms3_pbo_spo.models.User"%>
<%@page import="dev.enep.sms3_pbo_spo.models.KategoriObat"%>
<%@page import="dev.enep.sms3_pbo_spo.models.Obat"%>
<%@page import="java.util.List"%>
<%@page import="dev.enep.sms3_pbo_spo.dao.KategoriObatDAO"%>
<%@page import="dev.enep.sms3_pbo_spo.dao.ObatDAO"%>
<%
    ObatDAO obatDao = new ObatDAO();
    KategoriObatDAO ktgObatDao = new KategoriObatDAO();
    UserDAO userDao = new UserDAO();
    StokLogDAO stokLogDao = new StokLogDAO();

    List<Obat> listObat = obatDao.findAll();
    List<KategoriObat> listKtgObat = ktgObatDao.findAll();

    List<User> listUser = userDao.findAll();

    // Ambil data untuk grafik
    int currentYear = Calendar.getInstance().get(Calendar.YEAR);
    List<Object[]> stokLogData = stokLogDao.getStokLogPerBulan(currentYear);

    // Inisialisasi array untuk chart
    int[] stokMasukData = new int[12];  // 12 bulan
    int[] stokKeluarData = new int[12]; // 12 bulan

    // Set semua nilai awal ke 0
    for (int i = 0; i < 12; i++) {
        stokMasukData[i] = 0;
        stokKeluarData[i] = 0;
    }

    // Isi array dengan data dari database
    for (Object[] row : stokLogData) {
        int bulan = (Integer) row[0]; // Bulan (1-12)
        int stokMasuk = (Integer) row[1];
        int stokKeluar = (Integer) row[2];

        // Array index dimulai dari 0, bulan dari 1
        stokMasukData[bulan - 1] = stokMasuk;
        stokKeluarData[bulan - 1] = stokKeluar;
    }
%>

<style>
    .small-box {
        border-radius: 0.25rem;
        box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);
        margin-bottom: 20px;
        padding: 20px;
        position: relative;
        display: block;
    }
    .small-box > .inner {
        padding: 10px;
    }
    .small-box h3 {
        font-size: 2.2rem;
        font-weight: bold;
        margin: 0 0 10px 0;
        padding: 0;
    }
    .small-box p {
        font-size: 1rem;
        margin: 0;
    }
    .small-box .icon {
        color: rgba(0,0,0,.15);
        font-size: 70px;
        position: absolute;
        right: 15px;
        top: 15px;
    }
    .small-box .small-box-footer {
        background-color: rgba(0,0,0,.1);
        color: rgba(255,255,255,.8);
        display: block;
        padding: 3px 0;
        position: relative;
        text-align: center;
        text-decoration: none;
        z-index: 10;
        margin: 10px -20px -20px -20px;
    }
    .small-box .small-box-footer:hover {
        background-color: rgba(0,0,0,.15);
        color: #fff;
    }
    .bg-info {
        background-color: #17a2b8 !important;
        color: #fff !important;
    }
    .bg-success {
        background-color: #28a745 !important;
        color: #fff !important;
    }
    .bg-warning {
        background-color: #ffc107 !important;
        color: #fff !important;
    }
    .card {
        box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);
    }
</style>

<div class="app-content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6">
                <h3 class="mb-0">Dashboard</h3>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-end">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="app-content">
    <div class="container-fluid">
        <!-- Info Boxes -->
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="small-box bg-info">
                    <div class="inner">
                        <h3><%= listObat.size()%></h3>
                        <p>Jumlah Obat</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-pills"></i>
                    </div>
                    <a href="?pg=dashboard/obat" class="small-box-footer">
                        Lihat Detail <i class="fas fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-4 col-md-6">
                <div class="small-box bg-success">
                    <div class="inner">
                        <h3><%= listKtgObat.size()%></h3>
                        <p>Jumlah Kategori Obat</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-list"></i>
                    </div>
                    <a href="?pg=dashboard/kategoriobat" class="small-box-footer">
                        Lihat Detail <i class="fas fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-4 col-md-6">
                <div class="small-box bg-warning">
                    <div class="inner">
                        <h3><%= listUser.size()%></h3>
                        <p>Jumlah User</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <a href="?pg=dashboard/user" class="small-box-footer">
                        Lihat Detail <i class="fas fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- Chart Stok Log -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h3 class="card-title mb-0">
                            <i class="fas fa-chart-line me-1"></i>
                            Grafik Stok Log
                        </h3>
                    </div>
                    <div class="card-body">
                        <canvas id="stokLogChart" height="80"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
<script>
    // Data untuk chart stok log dari database
    const ctx = document.getElementById('stokLogChart').getContext('2d');

    // Data untuk chart
    const chartData = {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
            'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'],
        datasets: [{
                label: 'Stok Masuk',
                data: [
    <%= stokMasukData[0]%>, <%= stokMasukData[1]%>, <%= stokMasukData[2]%>,
    <%= stokMasukData[3]%>, <%= stokMasukData[4]%>, <%= stokMasukData[5]%>,
    <%= stokMasukData[6]%>, <%= stokMasukData[7]%>, <%= stokMasukData[8]%>,
    <%= stokMasukData[9]%>, <%= stokMasukData[10]%>, <%= stokMasukData[11]%>
                ],
                borderColor: 'rgb(40, 167, 69)',
                backgroundColor: 'rgba(40, 167, 69, 0.1)',
                tension: 0.4,
                fill: true,
                borderWidth: 2
            }, {
                label: 'Stok Keluar',
                data: [
    <%= stokKeluarData[0]%>, <%= stokKeluarData[1]%>, <%= stokKeluarData[2]%>,
    <%= stokKeluarData[3]%>, <%= stokKeluarData[4]%>, <%= stokKeluarData[5]%>,
    <%= stokKeluarData[6]%>, <%= stokKeluarData[7]%>, <%= stokKeluarData[8]%>,
    <%= stokKeluarData[9]%>, <%= stokKeluarData[10]%>, <%= stokKeluarData[11]%>
                ],
                borderColor: 'rgb(220, 53, 69)',
                backgroundColor: 'rgba(220, 53, 69, 0.1)',
                tension: 0.4,
                fill: true,
                borderWidth: 2
            }]
    };

    const stokLogChart = new Chart(ctx, {
        type: 'line',
        data: chartData,
        options: {
            responsive: true,
            maintainAspectRatio: true,
            plugins: {
                legend: {
                    display: true,
                    position: 'top',
                },
                tooltip: {
                    mode: 'index',
                    intersect: false
                },
                title: {
                    display: true,
                    text: 'Grafik Stok Log Tahun <%= currentYear%>',
                    font: {
                        size: 16
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Jumlah Stok'
                    },
                    ticks: {
                        callback: function (value) {
                            return value + ' unit';
                        }
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Bulan'
                    }
                }
            },
            interaction: {
                intersect: false,
                mode: 'nearest'
            }
        }
    });
</script>