<%-- 
    Document   : shop
    Created on : Oct 10, 2024, 11:44:03 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="Others.Tools"%>
<%@page import="model.Brand" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>MultiShop - Online Shop Website Template</title>
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

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <script>
            function getURLToFilter(attribute) {
                const radios = document.getElementsByName(attribute);
                for (let radio of radios) {
                    if (radio.checked) {
                        window.location.href = radio.value;
                        break;
                    }
                }
            }
        </script>
    </head>

    <body>
        <%!
            Tools tools = new Tools();
            public String getNewURL(String query, String newCondition) {
                return tools.URLToSearchByCondition(query, newCondition);
            };   
        %>
        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row bg-secondary py-1 px-xl-5">
                <div class="col-lg-6 d-none d-lg-block">
                    <div class="d-inline-flex align-items-center h-100">
                        <a class="text-body mr-3" href="/audio/about">About</a>
                        <a class="text-body mr-3" href="/audio/contact">Contact</a>
                        <a class="text-body mr-3" href="/audio/help">Help</a>
                    </div>
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
                            <i class="fas fa-heart text-dark"></i>
                            <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                        </a>
                        <a href="" class="btn px-0 ml-2">
                            <i class="fas fa-shopping-cart text-dark"></i>
                            <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
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
                                <a href="/audio/home" class="nav-item nav-link">Home</a>
                                <a href="/audio/shop" class="nav-item nav-link active">Shop</a>
                                <a href="/audio/cart" class="nav-item nav-link">Shopping Cart</a>
                                <a href="/audio/checkout" class="nav-item nav-link">Checkout</a>
                            </div>
                            <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                                <a href="" class="btn px-0">
                                    <i class="fas fa-heart text-primary"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                                </a>
                                <a href="" class="btn px-0 ml-3">
                                    <i class="fas fa-shopping-cart text-primary"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                                </a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->

        <!-- Shop Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->
                <div class="col-lg-3 col-md-4">
                    <!-- Price Start -->
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by price</span></h5>
                    <div class="bg-light p-4 mb-30">
                        <form>
                            <div class="align-items-center justify-content-between mb-3">
                                <input type="radio" name="price" onchange="getURLToFilter('price')" value=<%=getNewURL(request.getQueryString(), "price=0-100")%> checked ${requestScope.price == "0-100"?"checked":""}>
                                <label style="margin-left: 20px">All Price</label>
                            </div>
                            <div class="align-items-center justify-content-between mb-3">
                                <input type="radio" name="price" onchange="getURLToFilter('price')" value=<%=getNewURL(request.getQueryString(), "price=0-1")%> ${requestScope.price == "0-1"?"checked":""}>
                                <label style="margin-left: 20px"><1.000.000</label>
                            </div>
                            <div class="align-items-center justify-content-between mb-3">
                                <input type="radio" name="price" onchange="getURLToFilter('price')" value=<%=getNewURL(request.getQueryString(), "price=1-5")%> ${requestScope.price == "1-5"?"checked":""}>
                                <label style="margin-left: 20px">1.000.000 - 5.000.000</label>
                            </div>
                            <div class="align-items-center justify-content-between mb-3">
                                <input type="radio" name="price" onchange="getURLToFilter('price')" value=<%=getNewURL(request.getQueryString(), "price=5-10")%> ${requestScope.price == "5-10"?"checked":""}>
                                <label style="margin-left: 20px">5.000.000 - 10.000.000</label>
                            </div>
                            <div class="align-items-center justify-content-between mb-3">
                                <input type="radio" name="price" onchange="getURLToFilter('price')" value=<%=getNewURL(request.getQueryString(), "price=10-20")%> ${requestScope.price == "10-20"?"checked":""}>
                                <label style="margin-left: 20px">10.000.000 - 20.000.000</label>
                            </div>
                            <div class="align-items-center justify-content-between">
                                <input type="radio" name="price" onchange="getURLToFilter('price')" value=<%=getNewURL(request.getQueryString(), "price=20-100")%> ${requestScope.price == "20-100"?"checked":""}>
                                <label style="margin-left: 20px">>20.000.000</label>
                            </div>
                        </form>
                    </div>
                    <!-- Price End -->

                    <!-- Category Start -->
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by category</span></h5>
                    <div class="bg-light p-4 mb-30">
                        <form>
                            <div class="align-items-center justify-content-between mb-3">
                                <input type="radio" name="category" onchange="getURLToFilter('category')" value=<%=getNewURL(request.getQueryString(), "category_ID=")%> checked ${requestScope.category_ID == ""?"checked":""}>
                                <label style="margin-left: 20px">All Category</label>
                            </div>
                            <div class="align-items-center justify-content-between mb-3">
                                <input type="radio" name="category" onchange="getURLToFilter('category')" value=<%=getNewURL(request.getQueryString(), "category_ID=1")%> ${requestScope.category_ID == "1"?"checked":""}>
                                <label style="margin-left: 20px">Wireless Headphone</label>
                            </div>
                            <div class="align-items-center justify-content-between mb-3">
                                <input type="radio" name="category" onchange="getURLToFilter('category')" value=<%=getNewURL(request.getQueryString(), "category_ID=2")%> ${requestScope.category_ID == "2"?"checked":""}>
                                <label style="margin-left: 20px">Wired Headphone</label>
                            </div>
                            <div class="align-items-center justify-content-between mb-3">
                                <input type="radio" name="category" onchange="getURLToFilter('category')" value=<%=getNewURL(request.getQueryString(), "category_ID=3")%> ${requestScope.category_ID == "3"?"checked":""}>
                                <label style="margin-left: 20px">Sport Headphone</label>
                            </div>
                            <div class="align-items-center justify-content-between mb-3">
                                <input type="radio" name="category" onchange="getURLToFilter('category')" value=<%=getNewURL(request.getQueryString(), "category_ID=4")%> ${requestScope.category_ID == "4"?"checked":""}>
                                <label style="margin-left: 20px">Gaming Headphone</label>
                            </div>
                        </form>
                    </div>
                    <!-- Category End -->

                    <!-- Brand Start -->
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by brand</span></h5>
                    <div class="bg-light p-4 mb-30">
                        <form>
                            <div class="align-items-center justify-content-between mb-3">
                                <input type="radio" name="brand" onchange="getURLToFilter('brand')" value=<%=getNewURL(request.getQueryString(), "brand_ID=")%> checked ${(requestScope.brand_ID == "")?"checked":""}>
                                <label style="margin-left: 20px">All Brand</label>
                            </div>       
                            <%
                                String brand_ID_raw = (String)request.getParameter("brand_ID");
                                int brand_ID_checked = 0;
                                if (brand_ID_raw != null && !brand_ID_raw.isEmpty()) {
                                    brand_ID_checked = Integer.parseInt(brand_ID_raw);
                                }
                                for (Brand brand: (List<Brand>)request.getAttribute("bList")) {
                            %>
                            <div class="align-items-center justify-content-between mb-3">
                                <input type="radio" name="brand" onchange="getURLToFilter('brand')" value=<%=getNewURL(request.getQueryString(), ("brand_ID=" + brand.getBrand_ID()))%> <%=(brand_ID_checked == brand.getBrand_ID())?"checked":""%>>
                                <label style="margin-left: 20px"><%=brand.getBrand_Name()%></label>
                            </div>
                            <%}
                            %>
                        </form>
                    </div>
                    <!-- Size End -->
                </div>
                <!-- Shop Sidebar End -->


                <!-- Shop Product Start -->
                <div class="col-lg-9 col-md-8">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <div class="ml-2">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Sort By</button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href=<%=getNewURL(request.getQueryString(), "sortby=")%>>None</a>
                                            <a class="dropdown-item" href=<%=getNewURL(request.getQueryString(), "sortby=cheapest")%>>Cheapest</a>
                                            <a class="dropdown-item" href=<%=getNewURL(request.getQueryString(), "sortby=expensive")%>>Most Expensive</a>
                                            <a class="dropdown-item" href=<%=getNewURL(request.getQueryString(), "sortby=latest")%>>Latest</a>
                                            <a class="dropdown-item" href=<%=getNewURL(request.getQueryString(), "sortby=oldest")%>>Oldest</a>
                                            <a class="dropdown-item" href=<%=getNewURL(request.getQueryString(), "sortby=sold")%>>Top sold</a>                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Product -->
                        <c:if test="${requestScope.pList.isEmpty() || requestScope.pList == null}">
                            <h3 style="color: red; text-align: center;width: 1000px">No result found</h3>
                        </c:if>
                        <c:forEach items="${requestScope.pList}" var="product">
                            <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                                <div class="product-item bg-light mb-4">
                                    <div class="product-img position-relative overflow-hidden">
                                        <img class="img-fluid w-100" src="${product.product_Image}" style="width: 262px; height: 230px">
                                        <div class="product-action">
                                            <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                            <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                            <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                        </div>
                                    </div>
                                    <div class="text-center py-4">
                                        <div style="width: 100%; height: 50px; margin-bottom: 10px"><span style="font-weight: bold; font-size: larger ;width: 100%"><a href="" >${product.product_Name}</a></span></div>
                                        <div class=" align-items-center justify-content-center mt-2" style="height: 50px; margin-top: 10px">
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

                        <!-- Shop Product End -->
                    </div>
                </div>
                <!-- Shop End -->


                <!-- Footer Start -->
                <div class="container-fluid bg-dark text-secondary mt-5 pt-5">
                    <div class="row px-xl-5 pt-5">
                        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                            <h5 class="text-secondary text-uppercase mb-4">Get In Touch</h5>
                            <p class="mb-4">No dolore ipsum accusam no lorem. Invidunt sed clita kasd clita et et dolor sed dolor. Rebum tempor no vero est magna amet no</p>
                            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                            <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                        </div>
                        <div class="col-lg-8 col-md-12">
                            <div class="row">
                                <div class="col-md-4 mb-5">
                                    <h5 class="text-secondary text-uppercase mb-4">Quick Shop</h5>
                                    <div class="d-flex flex-column justify-content-start">
                                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                        <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-5">
                                    <h5 class="text-secondary text-uppercase mb-4">My Account</h5>
                                    <div class="d-flex flex-column justify-content-start">
                                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                        <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                        <a class="text-secondary" href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                                    </div>
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
                    <div class="row border-top mx-xl-5 py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
                        <div class="col-md-6 px-xl-0">
                            <p class="mb-md-0 text-center text-md-left text-secondary">
                                &copy; <a class="text-primary" href="#">Domain</a>. All Rights Reserved. Designed
                                by
                                <a class="text-primary" href="https://htmlcodex.com">HTML Codex</a>
                                <br>Distributed By: <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                            </p>
                        </div>
                        <div class="col-md-6 px-xl-0 text-center text-md-right">
                            <img class="img-fluid" src="img/payments.png" alt="">
                        </div>
                    </div>
                </div>
                <!-- Footer End -->


                <!-- Back to Top -->
                <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


                <!-- JavaScript Libraries -->
                <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
                <script src="lib/easing/easing.min.js"></script>
                <script src="lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Contact Javascript File -->
                <script src="mail/jqBootstrapValidation.min.js"></script>
                <script src="mail/contact.js"></script>

                <!-- Template Javascript -->
                <script src="js/main.js"></script>
                </body>
                </html>
