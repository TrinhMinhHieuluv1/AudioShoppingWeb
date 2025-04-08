<%-- 
    Document   : home
    Created on : Oct 10, 2024, 4:33:29 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Minh Hieu</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <style>
            .price_off{
                background:url(images/icon_discount.png);
                color:#fff;
                width:53px;
                height:51px;
                float:left;
                text-align:center;
                border-radius:2px;
                font-size:15px;
                font-weight:bold;
                position:absolute;
                top:5px;
                right:5px;
                line-height:50px;
            }
        </style>
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row bg-secondary py-1 px-xl-5">
                <div class="col-lg-6 d-none d-lg-block">
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <c:if test="${sessionScope.account == null}">
                            <div class="btn-group">
                                <button class="acc" style="margin-right: 10px"><a href="/audio/signin">Sign In</a></button>
                                <button class="acc"><a href="/audio/signup">Sign Up</a></button>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">My Account</button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <button class="dropdown-item" type="button"><a href="/audio/profile">My Profile</a></button>
                                    <button class="dropdown-item" type="button"><a href="/audio/change_pass">Change Password</a></button>
                                    <button class="dropdown-item" type="button"><a href="/audio/purchase">My Purchase</a></button>
                                    <button class="dropdown-item" type="button"><a href="/audio/signout">Sign out</a></button>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <div class="d-inline-flex align-items-center d-block d-lg-none">
                        <a href="" class="btn px-0 ml-2">
                            <i class="fa-heart text-dark"></i>
                            <span class=" text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">5</span>
                        </a>
                        <a href="/audio/cart" class="btn px-0 ml-2">
                            <i class="fa-shopping-cart text-dark"></i>
                            <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">${requestScope.sciList.size()}</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
                <div class="col-lg-4">
                    <a href="/audio/home" class="text-decoration-none">
                        <span class="h1 text-uppercase text-primary bg-dark px-2">Minh</span>
                        <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Hieu</span>
                    </a>
                </div>
                <div class="col-lg-4 col-6 text-left">
                    <form action="/audio/shop?keyword=">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for products" name="keyword">
                            <div class="input-group-append">
                                <button class="input-group-text bg-transparent text-primary">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-4 col-6 text-right">
                    <p class="m-0">Customer Service</p>
                    <h5 class="m-0">+012 345 6789</h5>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid bg-dark mb-30">
            <div class="row px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                        <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Categories</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                        <div class="navbar-nav w-100">
                            <c:forEach items="${sessionScope.cList}" var="category">
                                <a href="/audio/shop?category_ID=${category.category_ID}" class="nav-item nav-link">${category.category_Name}</a>
                            </c:forEach>
                        </div>
                    </nav>
                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                        <a href="/audio/home" class="text-decoration-none d-block d-lg-none">
                            <span class="h1 text-uppercase text-dark bg-light px-2">Minh</span>
                            <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Hieu</span>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="/audio/home" class="nav-item nav-link active">Home</a>
                                <a href="/audio/shop" class="nav-item nav-link">Shop</a>
                                <a href="/audio/cart" class="nav-item nav-link">Shopping Cart</a>
                                <a href="/audio/checkout" class="nav-item nav-link">Checkout</a>
                            </div>
                            <c:if test="${sessionScope.account!=null}">
                                <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                                    <a href="" class="btn px-0">
                                        <i class="fas fa-heart text-primary"></i>
                                        <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                                    </a>
                                    <a href="/audio/cart" class="btn px-0 ml-3">
                                        <i class="fas fa-shopping-cart text-primary"></i>
                                        <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">${requestScope.sciList.size()}</span>
                                    </a>
                                </div>
                            </c:if>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Carousel Start -->
        <div class="container-fluid mb-3">
            <div class="row px-xl-5">
                <div class="col-lg-8">
                    <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel" data-interval="3000">
                        <ol class="carousel-indicators">
                            <c:set var="carouselSlideNum" value="0"></c:set>
                            <c:forEach items="${requestScope.top5SaleProduct}" var="product">                           
                                <li data-target="#header-carousel" data-slide-to="${carouselSlideNum}" class="${(carouselSlideNum == 0)?"active":""}"></li>
                                    <c:set var="carouselSlideNum" value="${carouselSlideNum + 1}"></c:set>
                                </c:forEach>
                        </ol>
                        <div class="carousel-inner">
                            <c:forEach items="${requestScope.top5SaleProduct}" var="product" varStatus="status">
                                <div class="carousel-item position-relative ${status.first ? 'active' : ''}" style="height: 430px;">
                                    <img class="position-absolute w-100 h-100" src="${product.product_Image}" style="object-fit: cover">
                                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                        <div class="p-3" style="max-width: 700px;">
                                            <h2 class="text-white mb-3 animate__animated animate__fadeInDown"><a href="/audio/detail?product_ID=${product.product_ID}">${product.product_Name}</a></h2>
                                            <h4 style="color: red; display: inline-block; width: 100%" ><fmt:formatNumber value="${product.price * (100 - product.discount) / 100}" pattern="###,###"/> VND</h4>
                                            <div class="price_off">${product.discount} %</div>
                                            <h5 class="text-muted ml-2"><del style="color: black"><fmt:formatNumber value="${product.price}" pattern="###,###"/> VND</del></h5>
                                            <a class="btn btn btn-primary" href="/audio/detail?product_ID=${product.product_ID}">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <c:forEach items="${requestScope.top2NewProduct}" var="product">
                        <div class="product-offer mb-30" style="height: 200px;">
                            <img style="width: 15%; height: auto; z-index: 10" src="https://cdn-icons-png.flaticon.com/512/179/179452.png">
                            <img style="z-index: -100;" src="${product.product_Image}">
                            <div class="offer-text">
                                <h3 class="text-white mb-3"><a href="/audio/detail?product_ID=${product.product_ID}" style="color: white">${product.product_Name}</a></h3>
                                <a href="/audio/detail?product_ID=${product.product_ID}" class="btn btn-primary" style="width: 45%">Shop Now</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- Carousel End -->

            <!-- Categories Start -->
            <div class="container-fluid pt-5">
                <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Categories</span></h2>
                <div class="row px-xl-5 pb-3">
                    <c:forEach items="${sessionScope.cList}" var="category">
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a class="text-decoration-none" href="/audio/shop?category_ID=${category.category_ID}">
                                <div class="cat-item d-flex align-items-center mb-4">
                                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                        <img class="img-fluid" src="${category.category_Image}">
                                    </div>
                                    <div class="flex-fill pl-3">
                                        <h6>${category.category_Name}</h6>
                                        <small class="text-body">${requestScope.numberOfProductsByCategory_ID[category.category_ID]} products</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- Categories End -->


            <!-- Products Start -->
            <div class="container-fluid pt-5 pb-3">
                <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Best seller</span></h2>
                <div class="row px-xl-5">
                    <c:forEach items="${requestScope.top4BestSeller}" var="product">
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <div class="product-item bg-light mb-4">
                                <div class="product-img position-relative overflow-hidden">
                                    <img class="img-fluid w-100" src="${product.product_Image}"  style="width: 262px; height: 230px">
                                    <div class="product-action">
                                        <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                        <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                        <a class="btn btn-outline-dark btn-square" href="/audio/detail?product_ID=${product.product_ID}"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                                <div class="text-center py-4">
                                    <div style="width: 100%; height: 50px; margin-bottom: 10px"><span style="font-weight: bold; font-size: larger ;width: 100%"><a href="/audio/detail?product_ID=${product.product_ID}" >${product.product_Name}</a></span></div>
                                    <div class="align-items-center justify-content-center mt-2" style="height: 50px">
                                        <c:if test="${product.discount!=0}">
                                            <h5 style="color: red"><fmt:formatNumber value="${product.price * (100 - product.discount) / 100}" pattern="###,###"/> VND</h5>
                                            <h6 class="text-muted ml-2"><del><fmt:formatNumber value="${product.price}" pattern="###,###"/> VND</del></h6>
                                        </c:if>
                                        <c:if test="${product.discount==0}">
                                            <h5 style="color: red"><fmt:formatNumber value="${product.price}" pattern="###,###"/> VND</h5>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- Products End -->

            <!-- Recent Products Start -->
            <div class="container-fluid pt-5 pb-3">
                <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Recent Products</span></h2>
                <div class="row px-xl-5">
                    <c:forEach items="${requestScope.top4BestSeller}" var="product">
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <div class="product-item bg-light mb-4">
                                <div class="product-img position-relative overflow-hidden">
                                    <img class="img-fluid w-100" src="${product.product_Image}"  style="width: 262px; height: 230px">
                                    <div class="product-action">
                                        <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                        <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                        <a class="btn btn-outline-dark btn-square" href="/audio/detail?product_ID=${product.product_ID}"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                                <div class="text-center py-4">
                                    <div style="width: 100%; height: 50px; margin-bottom: 10px"><span style="font-weight: bold; font-size: larger ;width: 100%"><a href="/audio/detail?product_ID=${product.product_ID}" >${product.product_Name}</a></span></div>
                                    <div class="align-items-center justify-content-center mt-2" style="height: 50px">
                                        <c:if test="${product.discount!=0}">
                                            <h5 style="color: red"><fmt:formatNumber value="${product.price * (100 - product.discount) / 100}" pattern="###,###"/> VND</h5>
                                            <h6 class="text-muted ml-2"><del><fmt:formatNumber value="${product.price}" pattern="###,###"/> VND</del></h6>
                                        </c:if>
                                        <c:if test="${product.discount==0}">
                                            <h5 style="color: red"><fmt:formatNumber value="${product.price}" pattern="###,###"/> VND</h5>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- Recent Products End -->

                    <!-- Featured Start -->
                    <div class="container-fluid pt-5">
                        <h1 style="text-align: center; margin-bottom: 30px; background-color: #ffc800">WHY SHOULD YOU BUY FROM MINHHIEU</h1>
                        <div class="row px-xl-5 pb-3">
                            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                                    <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                                    <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                                    <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                                    <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                                    <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Featured End -->

                    <!-- Footer Start -->
                    <div class="container-fluid bg-dark text-secondary mt-5 pt-5">
                        <div class="row px-xl-5 pt-5">
                            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                                <h5 class="text-secondary text-uppercase mb-4">MINH HIEU AUDIO</h5>
                                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>FPT University, Ha Noi, Viet Nam</p>
                                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>hieutmhe180724@.com</p>
                                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                            </div>
                            <div class="col-lg-8 col-md-12">
                                <div class="row">
                                    <div class="col-md-4 mb-5">
                                        <h5 class="text-secondary text-uppercase mb-4">Quick Shop</h5>
                                        <div class="d-flex flex-column justify-content-start">
                                            <a class="text-secondary mb-2" href="/audio/home"><i class="fa fa-angle-right mr-2 active"></i>Home</a>
                                            <a class="text-secondary mb-2" href="/audio/shop"><i class="fa fa-angle-right mr-2"></i>Shop</a>
                                            <a class="text-secondary mb-2" href="/audio/cart"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                            <a class="text-secondary mb-2" href="/audio/checkout"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                            <a class="text-secondary" href="/audio/contact"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-5">

                                    </div>
                                    <div class="col-md-4 mb-5">
                                        <h5 class="text-secondary text-uppercase mb-4">Newsletter</h5>
                                        <p>Duo stet tempor ipsum sit amet magna ipsum tempor est</p>
                                        <form action="">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Your Email Address">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary">Sign Up</button>
                                                </div>
                                            </div>
                                        </form>
                                        <h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
                                        <div class="d-flex">
                                            <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                                            <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                                            <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                                            <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Footer End -->


                    <!-- Back to Top -->
                    <button class="btn btn-primary back-to-top" id="backToTop"><i class="fa fa-angle-double-up"></i></button>

                    <!-- JavaScript Libraries -->
                    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
                    <script src="lib/easing/easing.min.js"></script>
                    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
                    <script>
                        document.getElementById("backToTop").onclick = function () {
                            window.scrollTo({
                                top: 0,
                                behavior: 'smooth'
                            });
                        };
                    </script>
                    <!-- Contact Javascript File -->
                    <script src="mail/jqBootstrapValidation.min.js"></script>
                    <script src="mail/contact.js"></script>

                    <!-- Template Javascript -->
                    <script src="js/main.js"></script>
                    </body>
                    </html>
