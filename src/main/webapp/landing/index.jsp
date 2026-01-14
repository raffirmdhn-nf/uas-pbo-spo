<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Farmacare</title>
        <meta name="description" content="">
        <meta name="keywords" content="">

        <!-- Favicons -->
        <link href="landing/assets/css/style.css" rel="stylesheet">

        <link href="landing/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="landing/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="landing/assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="landing/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="landing/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: OnePage
        * Template URL: https://bootstrapmade.com/onepage-multipurpose-bootstrap-template/
        * Updated: Aug 07 2024 with Bootstrap v5.3.3
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body class="index-page">

        <header id="header" class="header d-flex align-items-center sticky-top">
            <div class="container-fluid container-xl position-relative d-flex align-items-center">

                <a href="index.jsp" class="logo d-flex align-items-center me-auto" style="text-decoration: none;">
    <h1 class="sitename">FarmaCare</h1>
</a>

                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="#hero" class="active">Halaman<br></a></li>
                        <li><a href="#about">Tentang kami</a></li>
                        <li><a href="#portfolio">Portfolio</a></li>
                        <li><a href="#team">Tim</a></li>
                        <li><a href="#blog">Galeri</a></li>
                        <li><a href="#contact">Kontak</a></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>

                <a class="btn-getstarted" href="?pg=login">Login</a>

            </div>
        </header>

        <main class="main">

            <!-- Hero Section -->
            <section id="hero" class="hero section">

                <img src="landing/assets/img/putih.jpg" alt="" data-aos="fade-in" class="">

                <div class="container">
                    <div class="row justify-content-center" data-aos="zoom-out">
                        <div class="col-xl-7 col-lg-9 text-center">
                            <h1>Farma Care</h1>
                            <p>Solusi Obat Terpercaya, Kesehatan Anda Utama.</p>
                        </div>
                    </div>
                    <div class="text-center" data-aos="zoom-out" data-aos-delay="100">
                        <a href="?pg=login" class="btn-get-started">Cek selengkapnya</a>
                    </div>

                    <div class="row gy-4 mt-5">
                        <div class="col-md-6 col-lg-4" data-aos="zoom-out" data-aos-delay="100">
                            <div class="icon-box">
                                <div class="icon"><i class="bi bi-capsule"></i></div>
                                <h4 class="title"><a href="">Farmasi Terpercaya</a></h4>
                                <p class="description">Menyediakan obat-obatan asli dengan kualitas terjamin dan penyimpanan yang sesuai standar medis.</p>
                            </div>
                        </div><!--End Icon Box -->

                        <div class="col-md-6 col-lg-4" data-aos="zoom-out" data-aos-delay="200">
                            <div class="icon-box">
                                <div class="icon"><i class="bi-heart-pulse"></i></div>
                                <h4 class="title"><a href="">Skrining resep</a></h4>
                                <p class="description">Pemeriksaan menyeluruh terhadap resep Anda untuk mencegah interaksi obat yang berbahaya dan memastikan dosis yang diberikan sudah tepat.</p>
                            </div>
                        </div><!--End Icon Box -->

                        <div class="col-md-6 col-lg-4" data-aos="zoom-out" data-aos-delay="300">
                            <div class="icon-box">
                                <div class="icon"><i class="bi-person-badge"></i></div>
                                <h4 class="title"><a href="">Stok obat</a></h4>
                                <p class="description">Seluruh produk kami berasal dari distributor resmi dengan sertifikasi BPOM untuk menjamin keamanan konsumsi Anda.</p>
                            </div>
                        </div><!--End Icon Box -->

                    </div>
                </div>

            </section><!-- /Hero Section -->

            <!-- About Section -->
            <section id="about" class="about section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>Tentang kami<br></h2>
                    <p>Sistem FarmaCare Management dirancang khusus sebagai solusi digital untuk membantu apoteker mengelola siklus hidup produk farmasi secara presisi. Kami fokus pada penyederhanaan manajemen inventaris, mulai dari pencatatan stok masuk, pemantauan masa kedaluwarsa, hingga otomatisasi laporan ketersediaan obat secara real-time.</p>
                </div><!-- End Section Title -->

                <div class="container">

                    <div class="row gy-4">

                        <div class="col-lg-6 content" data-aos="fade-up" data-aos-delay="100">
                            <ul>
                                <li><i class="bi bi-check2-circle"></i> <span>Stok Terpantau Akurat: Cek ketersediaan obat secara real-time tanpa perlu hitung manual.</span></li>
                                <li><i class="bi bi-check2-circle"></i> <span>Kendali Masa Expired: Pantau tanggal kedaluwarsa lebih mudah untuk jamin keamanan produk.</span></li>
                                <li><i class="bi bi-check2-circle"></i> <span>Laporan Otomatis: Rekapitulasi data stok jadi lebih cepat dan minim kesalahan.</span></li>
                            </ul>
                        </div>

                        <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
                            <p>Bagaimana cara pre order obat? Anda bisa mendaftar melalui tombol disini</p>
                            <a href="?pg=login" class="read-more"><span>Daftar</span><i class="bi bi-arrow-right"></i></a>
                        </div>

                    </div>

                </div>

            </section><!-- /About Section -->

            <!-- Stats Section -->
            <section id="stats" class="stats section light-background">

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="row gy-4">

                        <div class="col-lg-3 col-md-6">
                            <div class="stats-item text-center w-100 h-100">
                                <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1" class="purecounter"></span>
                                <p>Penjualan Obat</p>
                            </div>
                        </div><!-- End Stats Item -->

                        <div class="col-lg-3 col-md-6">
                            <div class="stats-item text-center w-100 h-100">
                                <span data-purecounter-start="0" data-purecounter-end="100" data-purecounter-duration="1" class="purecounter"></span>
                                <p>Keamanan produk</p>
                            </div>
                        </div><!-- End Stats Item -->

                        <div class="col-lg-3 col-md-6">
                            <div class="stats-item text-center w-100 h-100">
                                <span data-purecounter-start="0" data-purecounter-end="1453" data-purecounter-duration="1" class="purecounter"></span>
                                <p>Jam Penjualan</p>
                            </div>
                        </div><!-- End Stats Item -->

                        <div class="col-lg-3 col-md-6">
                            <div class="stats-item text-center w-100 h-100">
                                <span data-purecounter-start="0" data-purecounter-end="32" data-purecounter-duration="1" class="purecounter"></span>
                                <p>Jenis obat</p>
                            </div>
                        </div><!-- End Stats Item -->

                    </div>

                </div>

            </section><!-- /Stats Section -->

            <!-- Clients Section -->
            <section id="clients" class="clients section light-background">

                <div class="container" data-aos="fade-up">

                    <div class="row gy-4">

                        <div class="col-xl-2 col-md-3 col-6 client-logo">
                            <img src="landing/assets/img/clients/clients-1.png" class="img-fluid" alt="">
                        </div><!-- End Client Item -->

                        <div class="col-xl-2 col-md-3 col-6 client-logo">
                            <img src="landing/assets/img/clients/clients-2.png" class="img-fluid" alt="">
                        </div><!-- End Client Item -->

                        <div class="col-xl-2 col-md-3 col-6 client-logo">
                            <img src="landing/assets/img/clients/clients-3.png" class="img-fluid" alt="">
                        </div><!-- End Client Item -->

                        <div class="col-xl-2 col-md-3 col-6 client-logo">
                            <img src="landing/assets/img/clients/clients-4.png" class="img-fluid" alt="">
                        </div><!-- End Client Item -->

                        <div class="col-xl-2 col-md-3 col-6 client-logo">
                            <img src="landing/assets/img/clients/clients-5.png" class="img-fluid" alt="">
                        </div><!-- End Client Item -->

                        <div class="col-xl-2 col-md-3 col-6 client-logo">
                            <img src="landing/assets/img/clients/clients-6.png" class="img-fluid" alt="">
                        </div><!-- End Client Item -->

                    </div>

                </div>

            </section><!-- /Clients Section -->

            <!-- Testimonials Section -->
            <section id="testimonials" class="testimonials section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>Testimoni</h2>
                    <p>Beberapa rating hasil testimoni dari pembeli</p>
                </div><!-- End Section Title -->

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="swiper init-swiper" data-speed="600" data-delay="5000" data-breakpoints="{ &quot;320&quot;: { &quot;slidesPerView&quot;: 1, &quot;spaceBetween&quot;: 40 }, &quot;1200&quot;: { &quot;slidesPerView&quot;: 3, &quot;spaceBetween&quot;: 40 } }">
                        <script type="application/json" class="swiper-config">
                            {
                            "loop": true,
                            "speed": 600,
                            "autoplay": {
                            "delay": 5000
                            },
                            "slidesPerView": "auto",
                            "pagination": {
                            "el": ".swiper-pagination",
                            "type": "bullets",
                            "clickable": true
                            },
                            "breakpoints": {
                            "320": {
                            "slidesPerView": 1,
                            "spaceBetween": 40
                            },
                            "1200": {
                            "slidesPerView": 3,
                            "spaceBetween": 20
                            }
                            }
                            }
                        </script>
                        <div class="swiper-wrapper">

                            <div class="swiper-slide">
                                <div class="testimonial-item" "="">
                                    <p>
                                        <i class=" bi bi-quote quote-icon-left"></i>
                                        <span>Sangat puas belanja di sini. Awalnya ragu beli obat online, tapi ternyata produknya 100% asli dan ada segel resminya. Benar-benar Farmasi Terpercaya</span>
                                        <i class="bi bi-quote quote-icon-right"></i>
                                    </p>
                                    <img src="landing/assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                                    <h3>Saul Goodman</h3>
                                    <h4>Ceo &amp; Founder</h4>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <p>
                                        <i class="bi bi-quote quote-icon-left"></i>
                                        <span>Obat yang dikirim masa kedaluwarsanya masih lama. Penyimpanannya juga rapi sehingga kemasan tidak rusak saat sampai. Rekomendasi banget buat yang cari obat aman.</span>
                                        <i class="bi bi-quote quote-icon-right"></i>
                                    </p>
                                    <img src="landing/assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                                    <h3>Sara Wilsson</h3>
                                    <h4>Designer</h4>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <p>
                                        <i class="bi bi-quote quote-icon-left"></i>
                                        <span>Luar biasa cepat! Butuh obat darurat jam 9 malam, langsung diproses dan sampai kurang dari satu jam. Layanan Pengiriman Cepat yang sangat membantu.</span>
                                        <i class="bi bi-quote quote-icon-right"></i>
                                    </p>
                                    <img src="landing/assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                                    <h3>Jena Karlis</h3>
                                    <h4>Store Owner</h4>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <p>
                                        <i class="bi bi-quote quote-icon-left"></i>
                                        <span>Cari obat resep yang susah didapat di apotek lain, ternyata di sini stoknya lengkap. Proses tebus resepnya juga tidak ribet</span>
                                        <i class="bi bi-quote quote-icon-right"></i>
                                    </p>
                                    <img src="landing/assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                                    <h3>Matt Brandon</h3>
                                    <h4>Freelancer</h4>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <p>
                                        <i class="bi bi-quote quote-icon-left"></i>
                                        <span>Terima kasih atas penjelasannya mengenai cara minum obat yang benar. Sangat informatif bagi saya yang sering lupa aturan minum obat.</span>
                                        <i class="bi bi-quote quote-icon-right"></i>
                                    </p>
                                    <img src="landing/assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                                    <h3>John Larson</h3>
                                    <h4>Entrepreneur</h4>
                                </div>
                            </div><!-- End testimonial item -->

                        </div>
                        <div class="swiper-pagination"></div>
                    </div>

                </div>

            </section><!-- /Testimonials Section -->

            <!-- Services Section -->
            

            <!-- Portfolio Section -->
            <section id="portfolio" class="portfolio section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>Portfolio</h2>
                    <p>Foto berbagai obat yang kami sediakan</p>
                </div><!-- End Section Title -->

                <div class="container">

                    <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">

                 
                        </ul><!-- End Portfolio Filters -->

                        <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">

                            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
                                <img src="landing/assets/img/masonry-portfolio/obat1.jpg" class="img-fluid" alt="">
                                <div class="portfolio-info">
                                    <h4>OskaPil</h4>
                                    <p>Pil</p>
                                </div>
                            </div><!-- End Portfolio Item -->

                            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
                                <img src="landing/assets/img/masonry-portfolio/obat2.jpg" class="img-fluid" alt="">
                                <div class="portfolio-info">
                                    <h4>Paracetamol</h4>
                                    <p>Pil</p>
                                </div>
                            </div><!-- End Portfolio Item -->

                            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
                                <img src="landing/assets/img/masonry-portfolio/obat4.jpg" class="img-fluid" alt="">
                                <div class="portfolio-info">
                                    <h4>Obat</h4>
                                    <p>P3K</p>
                                </div>
                            </div><!-- End Portfolio Item -->
                            
                            <div class="text-center mt-4 mb-5">
    <a href="?pg=login" class="btn btn-primary px-5 rounded shadow">Cek selengkapnya</a>
</div>
                                

                            

                        </div><!-- End Portfolio Container -->

                    </div>

                </div>

            </section><!-- /Portfolio Section -->

            <!-- Team Section --><section id="team" class="team section light-background">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Team</h2>
        <p>Tim Pengembang Website</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row justify-content-center">

          <div class="col-lg-2 col-md-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="team-member">
              <div class="member-img">
                <img src="landing/assets/img/team/raffi.jpeg" class="img-fluid" alt="">
              </div>
              <div class="member-info">
                <h4>Raffi Ramadhan Tajudin</h4>
                <span>0110224204</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-2 col-md-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="team-member">
              <div class="member-img">
                <img src="landing/assets/img/team/rumai.jpeg" class="img-fluid" alt="">
              </div>
              <div class="member-info">
                <h4>Rumaisha</h4>
                <span>0110224087</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-2 col-md-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="team-member">
              <div class="member-img">
                <img src="landing/assets/img/team/ikal.jpeg" class="img-fluid" alt="">
              </div>
              <div class="member-info">
                <h4>Haikal Pilar Yudhistira</h4>
                <span>0110224141</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-2 col-md-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="team-member">
              <div class="member-img">
                <img src="landing/assets/img/team/nopal.jpeg" class="img-fluid" alt="">
              </div>
              <div class="member-info">
                <h4>Noval Putra Siregar</h4>
                <span>0110224135</span>
              </div>
            </div>
          </div><!-- End Team Member -->
          
          <div class="col-lg-2 col-md-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="team-member">
              <div class="member-img">
                <img src="landing/assets/img/team/akmal.jpeg" class="img-fluid" alt="">
              </div>
              <div class="member-info">
                <h4>Akmal Maulana</h4>
                <span>0110224037</span>
              </div>
            </div>
          </div><!-- End Team Member -->

        </div>

      </div>

    </section><!-- /Team Section --><!-- /Team Section -->

            

            <!-- Faq Section -->
            <section id="faq" class="faq section light-background">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>PERTANYAAN YANG SERING DIAJUKAN</h2>
                    <p>Temukan informasi penting mengenai panduan penggunaan obat dan layanan kesehatan kami di bawah ini.</p>
                </div><!-- End Section Title -->

                
                <div class="container">

                    <div class="row justify-content-center">

                        <div class="col-lg-10" data-aos="fade-up" data-aos-delay="100">

                            <div class="faq-container">

                                <div class="faq-item faq-active">
                                    <h3>Obat flu apa yang paling laku keras di farmasi ini?</h3>
                                    <div class="faq-content">
                                        <p>Flutrop sangat dianjurkan untuk keadaan yang sangat dibutuhkan</div>
                                    <i class="faq-toggle bi bi-chevron-right"></i>
                                </div><!-- End Faq item-->

                                <div class="faq-item">
                                    <h3>Aapakah stok barang akan selalu ada jika apotek butuh stok banyak??</h3>
                                    <div class="faq-content">
                                        <p>Stok kami sangat cukup untuk apotek yang butuh banyak stok</div>
                                    <i class="faq-toggle bi bi-chevron-right"></i>
                                </div><!-- End Faq item-->

                                <div class="faq-item">
                                    <h3>Apakah sudah terjamin aman pembelian disini?</h3>
                                    <div class="faq-content">
                                        <p>Sudah terjamin 100% keamanan kami selalu memantau stok dan kadarluarsa obat yang kami miliki</div>
                                    <i class="faq-toggle bi bi-chevron-right"></i>
                                </div><!-- End Faq item-->

                            </div>

                        </div><!-- End Faq Column-->

                    </div>

                </div>

            </section><!-- /Faq Section -->
<script>
  // Mengambil semua elemen FAQ
  const faqItems = document.querySelectorAll('.faq-item');

  faqItems.forEach(item => {
    // Mencari judul (h3) dan tombol toggle (i) di dalam setiap item
    const header = item.querySelector('h3');
    const toggle = item.querySelector('.faq-toggle');

    // Fungsi untuk buka-tutup
    const toggleFaq = () => {
      // Hapus class 'faq-active' dari item lain jika ingin hanya satu yang terbuka (opsional)
      // faqItems.forEach(otherItem => {
      //   if (otherItem !== item) otherItem.classList.remove('faq-active');
      // });

      // Tambah atau hapus class 'faq-active' pada item yang diklik
      item.classList.toggle('faq-active');
    };

    // Jalankan fungsi saat judul atau tombol diklik
    header.addEventListener('click', toggleFaq);
    toggle.addEventListener('click', toggleFaq);
  });
</script>

<style>
  /* Tambahan CSS agar kursor berubah jadi jari saat diarahkan ke judul */
  .faq-item h3, .faq-toggle {
    cursor: pointer;
  }
  
  /* Pastikan konten tersembunyi jika tidak ada class faq-active */
  .faq-item .faq-content {
    display: none;
  }
  
  /* Tampilkan konten jika ada class faq-active */
  .faq-item.faq-active .faq-content {
    display: block;
  }

  /* Animasi putar ikon chevron (>) saat aktif */
  .faq-item.faq-active .faq-toggle {
    transform: rotate(90deg);
    transition: 0.3s;
  }
</style>
                                

                            </div>

                        </div><!-- End Faq Column-->

                    </div>

                </div>

            </section><!-- /Faq Section -->

            <!-- Internal CSS -->
    <style>
        /* Reset dasar */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 60px;
            background: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .logo {
            font-size: 1.8em;
            font-weight: 700;
        }

        .logo span {
            color: #3b82f6;
        }

        .navbar nav a {
            margin: 0 15px;
            color: #333;
            text-decoration: none;
            font-weight: 500;
        }

        .navbar nav a:hover {
            color: #3b82f6;
        }

        .btn {
            background: #3b82f6;
            color: #fff;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn:hover {
            background: #2563eb;
        }

        /* Blog Section */
        .blog {
            text-align: center;
            padding: 80px 60px;
            background: #f9f9ff;
        }

        .blog h2 {
            font-size: 2em;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .blog p {
            color: #666;
            margin-bottom: 40px;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
            line-height: 1.6;
        }

        /* Blog Cards */
        .blog-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
        }

        .blog-card {
            background: white;
            width: 350px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }

        .blog-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .blog-card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            transition: 0.3s ease;
        }

        .blog-card:hover img {
            filter: brightness(0.9);
        }

        .blog-info {
            padding: 20px;
            text-align: left;
        }

        .blog-info small {
            display: block;
            color: #777;
            margin-bottom: 8px;
        }

        .blog-info h3 {
            font-size: 1.1em;
            margin-bottom: 10px;
            color: #111;
        }

        .blog-info p {
            color: #555;
            font-size: 0.95em;
            line-height: 1.6;
        }

        /* Popup Image (Lightbox) */
        .popup {
  display: none;
  position: fixed;
  z-index: 9999; /* pastikan di atas elemen lain */
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0,0,0,0.8);
  justify-content: center;
  align-items: center;
}

.popup img {
  max-width: 90%;
  max-height: 90%;
  border-radius: 10px;
  box-shadow: 0 0 20px rgba(255,255,255,0.3);
  animation: fadeIn 0.3s ease;
}

@keyframes fadeIn {
  from {opacity: 0;}
  to {opacity: 1;}
}


        @media (max-width: 1024px) {
            .navbar {
                flex-direction: column;
                gap: 10px;
            }

            .blog-container {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
            <!-- Portfolio Section -->
            <section id="blog" class="blog section">
        <h2>Galeri</h2>
        <p>Dokumentasi</p>

        <div class="blog-container">
            <!-- Blog 1 -->
            <div class="blog-card" onclick="openPopup(this)">
                <img src="landing/assets/img/masonry-portfolio/masonry-portfolio-7.jpg" class="img-fluid" alt="">
                <div class="blog-info">
                    <small>LOREM</small>
                    <h3>LOREM</h3>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.</p>
                </div>
            </div>

            <!-- Blog 2 -->
            <div class="blog-card" onclick="openPopup(this)">
                <img src="landing/assets/img/masonry-portfolio/masonry-portfolio-9.jpg" class="img-fluid" alt="">
                <div class="blog-info">
                    <small>LOREM</small>
                    <h3>LOREM</h3>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.</p>
                </div>
            </div>

            <!-- Blog 3 -->
            <div class="blog-card" onclick="openPopup(this)">
                <img src="landing/assets/img/masonry-portfolio/masonry-portfolio-5.jpg" class="img-fluid" alt="">
                <div class="blog-info">
                    <small>LOREM</small>
                    <h3>LOREM</h3>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.</p>
                </div>
            </div>
        </div>
    </section>
            <!-- Popup Image -->
<div class="popup" id="popup" onclick="closePopup()">
  <img id="popup-img" src="" alt="Popup">
</div>

<!-- Script -->
<script>
  function openPopup(element) {
    const imgSrc = element.querySelector("img").src;
    document.getElementById("popup-img").src = imgSrc;
    document.getElementById("popup").style.display = "flex";
  }

  function closePopup() {
    document.getElementById("popup").style.display = "none";
  }
</script>

            <!-- /Portfolio Section -->
            
            <!-- Contact Section -->
            <section id="contact" class="contact section">

                <!-- Section Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>Kontak</h2>
                    <p>Pelayanan kami hingga 24 jam kami sangat berkenan jika ada berkebutuhan mungkin dapat kami hubungi</p>
                </div><!-- End Section Title -->

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="mb-4" data-aos="fade-up" data-aos-delay="200">
                        <iframe style="border:0; width: 100%; height: 270px;"  src="https://www.google.com/maps/d/embed?mid=1soqvLoYGu575omHL8EY4mBYQrp6-Rtk&ehbc=2E312F" width="640" height="480" width="640" height="480" frameborder="0" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div><!-- End Google Maps -->

                    <div class="row gy-4">

                        <div class="col-lg-4">
                            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="300">
                                <i class="bi bi-geo-alt flex-shrink-0"></i>
                                <div>
                                    <h3>Alamat</h3>
                                    <p>Jalan Raya Lenteng Agung No. 20-21, Jakarta Selatan</p>
                                </div>
                            </div><!-- End Info Item -->

                            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="400">
                                <i class="bi bi-telephone flex-shrink-0"></i>
                                <div>
                                    <h3>Hubungi kami</h3>
                                    <p>+62 887-2311-4456</p>
                                </div>
                            </div><!-- End Info Item -->

                            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="500">
                                <i class="bi bi-envelope flex-shrink-0"></i>
                                <div>
                                    <h3>Email kami</h3>
                                    <p>healthcare@gmail.com</p>
                                </div>
                            </div><!-- End Info Item -->

                        </div>

                        <div class="col-lg-8">
                            <form action="forms/?pg=login" method="post" class="php-email-form" data-aos="fade-up" data-aos-delay="200">
                                <div class="row gy-4">

                                    <div class="col-md-6">
                                        <input type="text" name="name" class="form-control" placeholder="Nama" required="">
                                    </div>

                                    <div class="col-md-6 ">
                                        <input type="email" class="form-control" name="email" placeholder="Email" required="">
                                    </div>

                                    <div class="col-md-12">
                                        <input type="text" class="form-control" name="subject" placeholder="Alamat" required="">
                                    </div>

                                    <div class="col-md-12">
                                        <textarea class="form-control" name="message" rows="6" placeholder="Pesan" required=""></textarea>
                                    </div>

                                    <div class="col-md-12 text-center">
                                        <div class="loading">Loading</div>
                                        <div class="error-message"></div>
                                        <div class="sent-message">Your message has been sent. Thank you!</div>

                                        <button type="submit">Send Message</button>
                                    </div>

                                </div>
                            </form>
                        </div><!-- End Contact Form -->

                    </div>

                </div>

            </section><!-- /Contact Section -->

        </main>

        <footer id="footer" class="footer light-background">

            

            <div class="container copyright text-center mt-4">
                <p>© <span>Copyright</span> <strong class="px-1 sitename">FarmaCare</strong> <span>All Rights Reserved</span></p>
                <div class="credits">
                    <!-- All the links in the footer should remain intact. -->
                    <!-- You can delete the links only if you've purchased the pro version. -->
                    <!-- Licensing information: https://bootstrapmade.com/license/ -->
                    <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
                    
                </div>
            </div>

        </footer>

        <!-- Scroll Top -->
        <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Preloader -->
        <div id="preloader"></div>

        <!-- Vendor JS Files -->
        <script src="landing/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="landing/assets/vendor/php-email-form/validate.js"></script>
        <script src="landing/assets/vendor/aos/aos.js"></script>
        <script src="landing/assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="landing/assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="landing/assets/vendor/swiper/swiper-bundle.min.js"></script>

        <script src="landing/assets/js/main.js"></script>

        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>