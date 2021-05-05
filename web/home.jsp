<%-- 
    Document   : home
    Created on : Aug 11, 2020, 12:42:00 PM
    Author     : ThinhNguyenCong
--%>

<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.model.cart"%>
<%@page import="com.model.category"%>
<%@page import="dao.categoryDAO"%>
<%@page import="com.model.product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.productDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Nhà sách ThinhNguyenCong</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <script type="text/javascript">
            function myFunction() {
                alert("Bạn chưa đăng nhập");
            }

            function logOut() {
                alert("Đăng xuất thành công!")
            }
        </script>
    </head>

    <body>
        <%
            Object UserName = session.getAttribute("UserName");
            cart cart = (cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new cart();
                session.setAttribute("cart", cart);
            }
            TreeMap<product, Integer> list = cart.getList();
        %>

        <%
            int total1 = 0;
            for (Map.Entry<product, Integer> ds : list.entrySet()) {
                int val = ds.getValue() * ds.getKey().getNEW_PRICE();
                total1 += val;
            }
        %>

        <div class="site-wrapper" id="top">
            <div class="site-header d-none d-lg-block">
                <div class="header-middle pt--10 pb--10">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-3 ">
                                <a href="home.jsp" class="site-brand">
                                    <img src="image/logo.png" alt="">
                                </a>
                            </div>
                            <div class="col-lg-3">
                                <div class="header-phone ">
                                    <div class="icon">
                                        <i class="fas fa-headphones-alt"></i>
                                    </div>
                                    <div class="text">
                                        <p>Hỗ trợ 24/7</p>
                                        <p class="font-weight-bold number">+84-705-44-33-01</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="main-navigation flex-lg-right">
                                    <ul class="main-menu menu-right ">
                                        <li class="menu-item has-children">
                                            <a href="javascript:void(0)">Trang chủ <i
                                                    class="fas fa-chevron-down dropdown-arrow"></i></a>
                                            <ul class="sub-menu">
                                                <li> <a href="home.jsp">Website</a></li>
                                                <li> <a href="https://www.facebook.com/thinh.nguyencong.9887/">Fanpage Fabebook</a></li>
                                                <li> <a href="https://www.instagram.com/nguyencongthinh1999/?hl=vi">Instagram</a></li>
                                                <li> <a href="https://twitter.com/ThinhNguyenCong">Twitter</a></li>
                                            </ul>
                                        </li>
                                        <!-- Shop -->
                                        <li class="menu-item">
                                            <a href="shop-grid-left-sidebar.jsp">Cửa hàng</a>
                                        </li>
                                        <!-- Pages -->
                                        <li class="menu-item has-children">
                                            <a href="javascript:void(0)">Trang<i
                                                    class="fas fa-chevron-down dropdown-arrow"></i></a>
                                                <%
                                                    if (UserName != null) {
                                                %>
                                            <ul class="sub-menu">
                                                <li><a href="cart.jsp">Giỏ hàng</a></li>
                                                <li><a href="checkout.jsp">Thanh toán</a></li>
                                                <li><a href="login-register.jsp">Đăng nhập/Đăng ký</a></li>
                                                <li><a href="my-account.jsp">Tài khoản</a></li>
                                                <li><a href="history.jsp">Lịch sử mua hàng</a></li>
                                                <li><a href="faq.jsp">FAQ</a></li>
                                                <li><a href="contact.jsp">Liên hệ</a></li>
                                            </ul>
                                            <%} else {%>
                                            <ul class="sub-menu">
                                                <li><a onclick="myFunction()" href="login-register.jsp">Giỏ hàng</a></li>
                                                <li><a onclick="myFunction()" href="login-register.jsp">Thanh toán</a></li>
                                                <li><a href="login-register.jsp">Đăng nhập/Đăng ký</a></li>
                                                <li><a onclick="myFunction()" href="login-register.jsp">Tài khoản</a></li>
                                                <li><a onclick="myFunction()" href="login-register.jsp">Lịch sử mua hàng</a></li>
                                                <li><a href="faq.jsp">FAQ</a></li>
                                                <li><a onclick="myFunction()" href="login-register.jsp">Liên hệ</a></li>
                                            </ul>
                                            <%}%>
                                        </li>
                                        <li class="menu-item">
                                            <a href="contact.jsp">Liên hệ</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-bottom pb--10">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-3">
                                <nav class="category-nav   ">

                                    <div>
                                        <%! categoryDAO v3 = new categoryDAO();
                                            List<category> ds2 = new ArrayList<>();%>
                                        <% ds2 = v3.getListCategory(); %>

                                        <a href="javascript:void(0)" class="category-trigger"><i
                                                class="fa fa-bars"></i>Browse
                                            categories</a>

                                        <ul class="category-menu">
                                            <% for (category c : ds2) {%>
                                            <li class="cat-item"><a href="categorylistproduct?Id=<%=c.getCATEGORY_ID()%>"><%=c.getCATEGORY_NAME()%></a></li>
                                                <%}%>
                                        </ul>

                                    </div>

                                </nav>
                            </div>
                            <div class="col-lg-5">
                                <form class="header-search-block" action="searchservlet" method="post">          
                                    <input name="product_name" type="text" placeholder="Nhập tên sản phẩm tại đây">
                                    <button type="submit">Tìm kiếm</button>
                                </form>
                            </div>
                            <div class="col-lg-4">
                                <div class="main-navigation flex-lg-right">
                                    <div class="cart-widget">
                                        <div class="login-block">
                                            <%
                                                if (UserName != null) {%>
                                            <a href="my-account.jsp" class="font-weight-bold"><%=UserName%></a><br>
                                            <a href="#" data-toggle="modal" data-target="#logoutModal">Đăng xuất</a>
                                            <%} else {%>
                                            <a href="login-register.jsp" class="font-weight-bold">Đăng nhập</a> <br>
                                            <span>or</span><a href="login-register.jsp">Đăng kí</a>
                                            <%}%>
                                        </div>
                                        <div class="cart-block">
                                            <div class="cart-total">
                                                <span class="text-number">
                                                    <%=list.size()%>
                                                </span>
                                                <span class="text-item">
                                                    Giỏ hàng
                                                </span>
                                                <span class="price">
                                                    <%=total1%> VNĐ
                                                    <i class="fas fa-chevron-down"></i>
                                                </span>
                                            </div>
                                            <div class="cart-dropdown-block">
                                                <div class=" single-cart-block ">
                                                    <%
                                                        for (Map.Entry<product, Integer> ds : list.entrySet()) {
                                                    %>
                                                    <div class="cart-product">
                                                        <a href="product-details.jsp" class="image">
                                                            <img src="image/products/<%=ds.getKey().getIMAGE()%>" alt="">
                                                        </a>
                                                        <div class="content">
                                                            <h3 class="title"><a href="product-details.jsp"><%=ds.getKey().getPRODUCT_NAME()%></a>
                                                            </h3>
                                                            <p class="price"><span class="qty"><%=ds.getValue()%>×</span> <%=ds.getKey().getNEW_PRICE()%> VNĐ</p>
                                                            <button class="cross-btn"><a href="cartservlet?command=remove&product_id=<%=ds.getKey().getPRODUCT_ID()%>&cartID=<%=System.currentTimeMillis()%>"><i class="far fa-trash-alt"></i></a></button>
                                                        </div>
                                                    </div>
                                                    <%}%>
                                                </div>
                                                <div class=" single-cart-block ">
                                                    <div class="btn-block">
                                                        <% if (UserName != null) {%>
                                                        <a href="cart.jsp" class="btn">Giỏ hàng <i
                                                                class="fas fa-chevron-right"></i></a>
                                                        <a href="checkout.jsp" class="btn btn--primary">Thanh toán <i
                                                                class="fas fa-chevron-right"></i></a>
                                                            <%} else {%>
                                                        <a onclick="myFunction()" href="login-register.jsp" class="btn">Giỏ hàng <i
                                                                class="fas fa-chevron-right"></i></a>
                                                        <a onclick="myFunction()" href="login-register.jsp" class="btn btn--primary">Thanh toán <i
                                                                class="fas fa-chevron-right"></i></a>
                                                            <%}%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="site-mobile-menu">
                <header class="mobile-header d-block d-lg-none pt--10 pb-md--10">
                    <div class="container">
                        <div class="row align-items-sm-end align-items-center">
                            <div class="col-md-4 col-7">
                                <a href="home.jsp" class="site-brand">
                                    <img src="image/logo.png" alt="">
                                </a>
                            </div>
                            <div class="col-md-5 order-3 order-md-2">
                                <nav class="category-nav   ">
                                    <div>
                                        <a href="javascript:void(0)" class="category-trigger"><i
                                                class="fa fa-bars"></i>Danh sách thể loại</a>

                                        <ul class="category-menu">
                                            <% for (category c : ds2) {%>
                                            <li class="cat-item"><a href="categorylistproduct?Id=<%=c.getCATEGORY_ID()%>"><%=c.getCATEGORY_NAME()%></a></li>
                                                <%}%>
                                        </ul>
                                    </div>
                                </nav>
                            </div>
                            <div class="col-md-3 col-5  order-md-3 text-right">
                                <div class="mobile-header-btns header-top-widget">
                                    <ul class="header-links">
                                        <% if (UserName == null) {%>
                                        <li class="sin-link">
                                            <a onclick="myFunction()" href="login-register.jsp" class="cart-link link-icon"><i class="ion-bag"></i></a>
                                        </li>
                                        <%} else {%>
                                        <li class="sin-link">
                                            <a href="cart.jsp" class="cart-link link-icon"><i class="ion-bag"></i></a>
                                        </li>
                                        <%}%>
                                        <li class="sin-link">
                                            <a href="javascript:" class="link-icon hamburgur-icon off-canvas-btn"><i
                                                    class="ion-navicon"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                <!--                Off Canvas Navigation Start-->
                <aside class="off-canvas-wrapper">
                    <div class="btn-close-off-canvas">
                        <i class="ion-android-close"></i>
                    </div>
                    <div class="off-canvas-inner">
                        <!--                         search box start -->
                        <div class="search-box offcanvas">
                            <form>
                                <input type="text" placeholder="Tìm kiếm tại đây">
                                <button class="search-btn"><i class="ion-ios-search-strong"></i></button>
                            </form>
                        </div>
                        <!--                         search box end 
                                                 mobile menu start -->
                        <div class="mobile-navigation">
                            <!--                             mobile menu navigation start -->
                            <nav class="off-canvas-nav">
                                <ul class="mobile-menu main-mobile-menu">
                                    <li class="menu-item-has-children">
                                        <a href="#">Trang chủ</a>
                                        <ul class="sub-menu">
                                            <li> <a href="home.jsp">Website</a></li>
                                            <li> <a href="https://www.facebook.com/thinh.nguyencong.9887/">Fanpage Fabebook</a></li>
                                            <li> <a href="https://www.instagram.com/nguyencongthinh1999/?hl=vi">Instagram</a></li>
                                            <li> <a href="https://twitter.com/ThinhNguyenCong">Twitter</a></li>
                                        </ul>
                                    </li>
                                    <li class="menu-item-has-children">
                                        <a href="shop-grid-left-sidebar.jsp">Cửa hàng</a>
                                    </li>
                                    <li class="menu-item">
                                        <a href="javascript:void(0)">Trang<i
                                                class="fas fa-chevron-down dropdown-arrow"></i></a>
                                            <%
                                                if (UserName != null) {
                                            %>
                                        <ul class="sub-menu">
                                            <li><a href="cart.jsp">Giỏ hàng</a></li>
                                            <li><a href="checkout.jsp">Thanh toán</a></li>
                                            <li><a href="login-register.jsp">Đăng nhập/Đăng ký</a></li>
                                            <li><a href="my-account.jsp">Tài khoản</a></li>
                                            <li><a href="history.jsp">Lịch sử mua hàng</a></li>
                                            <li><a href="faq.jsp">FAQ</a></li>
                                            <li><a href="contact.jsp">Liên hệ</a></li>
                                        </ul>
                                        <%} else {%>
                                        <ul class="sub-menu">
                                            <li><a onclick="myFunction()" href="login-register.jsp">Giỏ hàng</a></li>
                                            <li><a onclick="myFunction()" href="login-register.jsp">Thanh toán</a></li>
                                            <li><a href="login-register.jsp">Đăng nhập/Đăng ký</a></li>
                                            <li><a onclick="myFunction()" href="login-register.jsp">Tài khoản</a></li>
                                            <li><a onclick="myFunction()" href="login-register.jsp">Lịch sử mua hàng</a></li>
                                            <li><a href="faq.jsp">FAQ</a></li>
                                            <li><a onclick="myFunction()" href="login-register.jsp">Liên hệ</a></li>
                                        </ul>
                                        <%}%>
                                    </li>
                                    <li><a href="contact.jsp">Liên hệ</a></li>
                                </ul>
                            </nav>
                            <!--                             mobile menu navigation end -->
                        </div>
                        <!--                         mobile menu end -->
                        <nav class="off-canvas-nav">
                            <ul class="mobile-menu menu-block-2">

                                <a href="#">Đơn vị tiền tệ - VNĐ</a>
                                <li class="menu-item-has-children">
                                    <a href="#">Ngôn ngữ - Tiếng Việt<i class="fas fa-angle-down"></i></a>
                                    <ul class="sub-menu">
                                        <li>Eng</li>
                                        <li>Ban</li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Tài khoản <i class="fas fa-angle-down"></i></a>
                                    <ul class="sub-menu">
                                        <li><a href="my-account.jsp">Tài khoản</a></li>
                                        <li><a href="history.jsp">Lịch sử mua hàng</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                        <div class="off-canvas-bottom">
                            <div class="contact-list mb--10">
                                <a href="" class="sin-contact"><i class="fas fa-mobile-alt"></i>(84) 705-44-33-01</a>
                                <a href="" class="sin-contact"><i class="fas fa-envelope"></i>nguyencongthinh1999@gmail.com</a>
                            </div>
                            <div class="off-canvas-social">
                                <a href="#" class="single-icon"><i class="fab fa-facebook-f"></i></a>
                                <a href="#" class="single-icon"><i class="fab fa-twitter"></i></a>
                                <a href="#" class="single-icon"><i class="fas fa-rss"></i></a>
                                <a href="#" class="single-icon"><i class="fab fa-youtube"></i></a>
                                <a href="#" class="single-icon"><i class="fab fa-google-plus-g"></i></a>
                                <a href="#" class="single-icon"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </aside>
                <!--                Off Canvas Navigation End-->
            </div>
            <div class="sticky-init fixed-header common-sticky">
                <div class="container d-none d-lg-block">
                    <div class="row align-items-center">
                        <div class="col-lg-4">
                            <a href="home.jsp" class="site-brand">
                                <img src="image/logo.png" alt="">
                            </a>
                        </div>
                        <div class="col-lg-8">
                            <div class="main-navigation flex-lg-right">
                                <ul class="main-menu menu-right ">
                                    <li class="menu-item has-children">
                                        <a href="javascript:void(0)">Trang chủ<i
                                                class="fas fa-chevron-down dropdown-arrow"></i></a>
                                        <ul class="sub-menu">
                                            <li> <a href="home.jsp">Website</a></li>
                                            <li> <a href="https://www.facebook.com/thinh.nguyencong.9887/">Fanpage Fabebook</a></li>
                                            <li> <a href="https://www.instagram.com/nguyencongthinh1999/?hl=vi">Instagram</a></li>
                                            <li> <a href="https://twitter.com/ThinhNguyenCong">Twitter</a></li>
                                        </ul>
                                    </li>
                                    <!--                                     Shop -->
                                    <li class="menu-item">
                                        <a href="shop-grid-left-sidebar.jsp">Cửa hàng</a>
                                    </li>
                                    <!--                                     Pages -->
                                    <li class="menu-item has-children">
                                        <a href="javascript:void(0)">Trang<i
                                                class="fas fa-chevron-down dropdown-arrow"></i></a>
                                            <%
                                                if (UserName != null) {
                                            %>
                                        <ul class="sub-menu">
                                            <li><a href="cart.jsp">Giỏ hàng</a></li>
                                            <li><a href="checkout.jsp">Thanh toán</a></li>
                                            <li><a href="login-register.jsp">Đăng nhập/Đăng ký</a></li>
                                            <li><a href="my-account.jsp">Tài khoản</a></li>
                                            <li><a href="history.jsp">Lịch sử mua hàng</a></li>
                                            <li><a href="faq.jsp">FAQ</a></li>
                                            <li><a href="contact.jsp">Liên hệ</a></li>
                                        </ul>
                                        <%} else {%>
                                        <ul class="sub-menu">
                                            <li><a onclick="myFunction()" href="login-register.jsp">Giỏ hàng</a></li>
                                            <li><a onclick="myFunction()" href="login-register.jsp">Thanh toán</a></li>
                                            <li><a href="login-register.jsp">Đăng nhập/Đăng ký</a></li>
                                            <li><a onclick="myFunction()" href="login-register.jsp">Tài khoản</a></li>
                                            <li><a onclick="myFunction()" href="login-register.jsp">Lịch sử mua hàng</a></li>
                                            <li><a href="faq.jsp">FAQ</a></li>
                                            <li><a onclick="myFunction()" href="login-register.jsp">Liên hệ</a></li>
                                        </ul>
                                        <%}%>
                                    </li>
                                    <li class="menu-item">
                                        <a href="contact.jsp">Liên hệ</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--            =================================
                        Hero Area
                        ===================================== -->
            <section class="hero-area hero-slider-1">
                <div class="sb-slick-slider" data-slick-setting='{
                     "autoplay": true,
                     "fade": true,
                     "autoplaySpeed": 3000,
                     "speed": 3000,
                     "slidesToShow": 1,
                     "dots":true
                     }'>
                    <div class="single-slide bg-shade-whisper  ">
                        <div class="container">
                            <div class="home-content text-center text-sm-left position-relative">
                                <%
                                    productDAO v99 = new productDAO();
                                    product pd = productDAO.selectProduct(14);
                                %>
                                <div class="hero-partial-image image-right">
                                    <img src="image/bg-images/<%=pd.getIMAGE()%>" alt="" ">
                                </div>
                                <div class="row no-gutters ">
                                    <div class="col-xl-6 col-md-6 col-sm-7">
                                        <div class="home-content-inner content-left-side">

                                            <h1><%=pd.getAUTHOR_NAME()%></h1>
                                            <h2><%=pd.getPRODUCT_NAME()%></h2>
                                            <a href="" class="btn btn-outlined--primary">
                                                <%=pd.getNEW_PRICE()%> VNĐ - Mua ngay!
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="single-slide bg-ghost-white">
                        <div class="container">
                            <div class="home-content text-center text-sm-left position-relative">
                                <%
                                    productDAO v77 = new productDAO();
                                    product pd7 = productDAO.selectProduct(23);
                                %>
                                <div class="hero-partial-image image-left">
                                    <img src="image/bg-images/<%=pd7.getIMAGE()%>" alt="">
                                </div>
                                <div class="row align-items-center justify-content-start justify-content-md-end">
                                    <div class="col-lg-6 col-xl-7 col-md-6 col-sm-7">
                                        <div class="home-content-inner content-right-side">
                                            <h1><%=pd7.getAUTHOR_NAME()%></h1>
                                            <h2><%=pd7.getPRODUCT_NAME()%></h2>
                                            <a href="shop-grid.html" class="btn btn-outlined--primary">
                                                <%=pd7.getNEW_PRICE()%> VNĐ - Đọc thêm
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--=================================
            Home Features Section
            ===================================== -->
            <section class="mb--30">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-3 col-md-6 mt--30">
                            <div class="feature-box h-100">
                                <div class="icon">
                                    <i class="fas fa-shipping-fast"></i>
                                </div>
                                <div class="text">
                                    <h5>Miễn phí vận chuyển</h5>
                                    <p> Đơn hàng > 200.000 VNĐ</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mt--30">
                            <div class="feature-box h-100">
                                <div class="icon">
                                    <i class="fas fa-redo-alt"></i>
                                </div>
                                <div class="text">
                                    <h5>Hoàn trả lại tiền</h5>
                                    <p>Đảm bảo trả lại 100%</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mt--30">
                            <div class="feature-box h-100">
                                <div class="icon">
                                    <i class="fas fa-piggy-bank"></i>
                                </div>
                                <div class="text">
                                    <h5>Thanh toán tiền mặt</h5>
                                    <p>An toàn- Tiện lợi</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mt--30">
                            <div class="feature-box h-100">
                                <div class="icon">
                                    <i class="fas fa-life-ring"></i>
                                </div>
                                <div class="text">
                                    <h5>Điện thoại hỗ trợ</h5>
                                    <p>Liên hệ : +84-705-44-33-01</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--=================================
            Promotion Section One
            ===================================== -->
            <section class="section-margin">
                <h2 class="sr-only">Promotion Section</h2>
                <div class="container">
                    <div class="row space-db--30">
                        <div class="col-lg-6 col-md-6 mb--30">
                            <a href="categorylistproduct?Id=3" class="promo-image promo-overlay">
                                <img src="image/bg-images/pastel.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-lg-6 col-md-6 mb--30">
                            <a href="categorylistproduct?Id=15" class="promo-image promo-overlay">
                                <img src="image/bg-images/pastel-2.jpeg" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </section>
            <!--=================================
            Home Slider Tab
            ===================================== -->
            <section class="section-padding">
                <h2 class="sr-only">Home Tab Slider Section</h2>
                <div class="container">
                    <div class="sb-custom-tab">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="shop-tab" data-toggle="tab" href="#shop" role="tab"
                                   aria-controls="shop" aria-selected="true">
                                    Gợi ý Sách
                                </a>
                                <span class="arrow-icon"></span>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane show active" id="shop" role="tabpanel" aria-labelledby="shop-tab">
                                <div class="product-slider multiple-row  slider-border-multiple-row  sb-slick-slider"
                                     data-slick-setting='{
                                     "autoplay": true,
                                     "autoplaySpeed": 8000,
                                     "slidesToShow": 5,
                                     "rows":2,
                                     "dots":true
                                     }' data-slick-responsive='[
                                     {"breakpoint":1200, "settings": {"slidesToShow": 3} },
                                     {"breakpoint":768, "settings": {"slidesToShow": 2} },
                                     {"breakpoint":480, "settings": {"slidesToShow": 1} },
                                     {"breakpoint":320, "settings": {"slidesToShow": 1} }
                                     ]'>
                                    <%! productDAO v1 = new productDAO();
                                        List<product> ds = new ArrayList<>();%>
                                    <% ds = v1.getListProduct(); %>
                                    <% for (product vv : ds) {%>
                                    <div class="single-slide">
                                        <div class="product-card">

                                            <div class="product-header">
                                                <a href="" class="author">
                                                    <%=vv.getAUTHOR_NAME()%>
                                                </a>
                                                <h3><a href="product-details.jsp?product_id=<%=vv.getPRODUCT_ID()%>"><span style="height: 40px" ><%=vv.getPRODUCT_NAME()%></span></a></h3>
                                            </div>
                                            <br>

                                            <div class="product-card--body">
                                                <div class="card-image">
                                                    <span style="height: 350px"><img src="image/products/<%=vv.getIMAGE()%>" alt=""></span>
                                                    <div class="hover-contents">
                                                        <a href="product-details.jsp?product_id=<%=vv.getPRODUCT_ID()%>" class="hover-image">
                                                            <img src="image/products/<%=vv.getIMAGE()%>" alt="">
                                                        </a>
                                                        <div class="hover-btns">
                                                            <a href="cartservlet?command=insert&product_id=<%=vv.getPRODUCT_ID()%>&cartID=<%=System.currentTimeMillis()%>" class="single-btn">
                                                                <i class="fas fa-shopping-basket"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="price-block">
                                                    <span class="price"><%=vv.getNEW_PRICE()%> VNĐ</span><br>
                                                    <del class="price-old"><%=vv.getPRICE()%> VNĐ</del>
                                                    <span class="price-discount"><%=vv.getDISCOUNT()%> %</span>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>

            <!--=================================
            Best Seller Product
            ===================================== -->
            <section class="section-margin bg-image section-padding-top section-padding"
                     data-bg="image/bg-images/best-seller-bg.jpg">
                <div class="container">
                    <div class="section-title section-title--bordered mb-0">
                        <h2>TÁC GIẢ CÓ NHIỀU ĐẦU SÁCH BÁN CHẠY NHẤT</h2>
                        <br><br>
                    </div>
                    <div class="best-seller-block">
                        <div class="row align-items-center">
                            <div class="col-lg-5 col-md-6">
                                <div class="author-image">
                                    <img src="image/others/nna.jpg" alt="">
                                    <p></p>
                                    <i>Ảnh: Nhà văn Nguyễn Nhật Ánh</i>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-6">
                                <div class="sb-slick-slider product-slider product-list-slider multiple-row slider-border-multiple-row"
                                     data-slick-setting='{
                                     "autoplay": false,
                                     "autoplaySpeed": 8000,
                                     "slidesToShow":2,
                                     "rows":2,
                                     "dots":true
                                     }' data-slick-responsive='[
                                     {"breakpoint":1200, "settings": {"slidesToShow": 1} },
                                     {"breakpoint":992, "settings": {"slidesToShow": 1} },
                                     {"breakpoint":768, "settings": {"slidesToShow": 1} },
                                     {"breakpoint":575, "settings": {"slidesToShow": 1} },
                                     {"breakpoint":490, "settings": {"slidesToShow": 1} }
                                     ]'>
                                    <%! productDAO v2 = new productDAO();
                                        List<product> ds1 = new ArrayList<>();%>
                                    <% ds1 = v2.getListProductAuthorID(15);%>
                                    <% for (product a : ds1) {%>
                                    <div class="single-slide">
                                        <div class="product-card card-style-list">

                                            <div class="card-image">
                                                <span style="width:150px ;height:255px "><img src="image/products/<%=a.getIMAGE()%>" alt=""></span>
                                            </div>
                                            <div class="product-card--body">
                                                <div class="product-header">
                                                    <a href="#" class="author">
                                                        <%=a.getAUTHOR_NAME()%>
                                                    </a>
                                                    <h3><a href="product-details.jsp?product_id=<%=a.getPRODUCT_ID()%>"><%=a.getPRODUCT_NAME()%>
                                                        </a></h3>
                                                </div>
                                                <div class="price-block">
                                                    <span class="price"><%=a.getNEW_PRICE()%> VNĐ</span> <br>
                                                    <del class="price-old"><%=a.getPRICE()%> VNĐ</del>
                                                    <span class="price-discount"><%=a.getDISCOUNT()%> %</span>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--=================================
            CHILDREN’S BOOKS 
            ===================================== -->
            <section class="section-margin">
                <div class="container">
                    <div class="section-title section-title--bordered">
                        <h2>SÁCH THIẾU NHI</h2>
                    </div>
                    <div class="product-list-slider slider-two-column product-slider multiple-row sb-slick-slider slider-border-multiple-row"
                         data-slick-setting='{
                         "autoplay": true,
                         "autoplaySpeed": 8000,
                         "slidesToShow":3,
                         "rows":2,
                         "dots":true
                         }' data-slick-responsive='[
                         {"breakpoint":1200, "settings": {"slidesToShow": 2} },
                         {"breakpoint":992, "settings": {"slidesToShow": 2} },
                         {"breakpoint":768, "settings": {"slidesToShow": 1} },
                         {"breakpoint":575, "settings": {"slidesToShow": 1} },
                         {"breakpoint":490, "settings": {"slidesToShow": 1} }
                         ]'>
                        <%! productDAO v8 = new productDAO();
                            List<product> ds8 = new ArrayList<>();%>
                        <% ds8 = v8.getListProductCategoryID(17);%>
                        <% for (product t : ds8) {%>
                        <div class="single-slide">
                            <div class="product-card card-style-list">

                                <div class="card-image">
                                    <span style="width: 155px;height: 255px"><img src="image/products/<%=t.getIMAGE()%>" alt=""></span>
                                </div>
                                <div class="product-card--body">
                                    <div class="product-header">
                                        <a href="#" class="author">
                                            <%=t.getAUTHOR_NAME()%>
                                        </a>
                                        <h3><a href="product-details.jsp?product_id=<%=t.getPRODUCT_ID()%>"><%=t.getPRODUCT_NAME()%></a></h3>
                                    </div>
                                    <div class="price-block">
                                        <span class="price"><%=t.getNEW_PRICE()%> VNĐ</span>
                                        <br>
                                        <del class="price-old"><%=t.getPRICE()%> VNĐ</del>
                                        <span class="price-discount"><%=t.getDISCOUNT()%> %</span>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </section>
            <!--=================================
            Promotion Section Two
            ===================================== -->
            <div class="section-margin">
                <div class="container">
                    <div class="row space-db--30">
                        <%
                            productDAO v65 = new productDAO();
                            product pd65 = productDAO.selectProduct(25);
                        %>
                        <div class="col-lg-8 mb--30">
                            <div class="promo-wrapper promo-type-one">
                                <a href="product-details.jsp?product_id=<%=pd65.getPRODUCT_ID()%>" class="promo-image  promo-overlay bg-image"
                                   data-bg="image/bg-images/<%=pd65.getIMAGE()%>">
                                    <!-- <img src="image/bg-images/promo-banner-mid.jpg" alt=""> -->
                                </a>
                                <div class="promo-text">
                                    <div class="promo-text-inner">
                                        <h2 style="color: yellow"><%=pd65.getPRODUCT_NAME()%></h2>
                                        <h3 style="color: aquamarine"><%=pd65.getAUTHOR_NAME()%></h3>
                                        <a style="color: white" href="cartservlet?command=insert&product_id=<%=pd65.getPRODUCT_ID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-outlined"><%=pd65.getNEW_PRICE()%> VNĐ - Mua ngay!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            productDAO v68 = new productDAO();
                            product pd68 = productDAO.selectProduct(33);
                        %>
                        <div class="col-lg-4 mb--30">
                            <div class="promo-wrapper promo-type-two ">
                                <a href="product-details.jsp?product_id=<%=pd68.getPRODUCT_ID()%>" class="promo-image promo-overlay bg-image"
                                   data-bg="image/bg-images/<%=pd68.getIMAGE()%>">
                                    <!-- <img src="image/bg-images/promo-banner-small.jpg" alt=""> -->
                                </a>
                                <div class="promo-text">
                                    <div class="promo-text-inner">
                                        <span class="d-block price" style="color: #093b29"><%=pd68.getNEW_PRICE()%> VNĐ</span>
                                        <h2 style="color: #ff9999"><%=pd68.getPRODUCT_NAME()%></h2>
                                        <a href="cartservlet?command=insert&product_id=<%=pd68.getPRODUCT_ID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-outlined--primary">Buy Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--=================================
            SÁCH VĂN HỌC VIỆT NAM
            ===================================== -->
            <section class="section-margin">
                <div class="container">
                    <div class="section-title section-title--bordered">
                        <h2>SÁCH VĂN HỌC VIỆT NAM</h2>
                    </div>
                    <div class="product-slider sb-slick-slider slider-border-single-row" data-slick-setting='{
                         "autoplay": true,
                         "autoplaySpeed": 8000,
                         "slidesToShow": 5,
                         "dots":true
                         }' data-slick-responsive='[
                         {"breakpoint":1500, "settings": {"slidesToShow": 4} },
                         {"breakpoint":992, "settings": {"slidesToShow": 3} },
                         {"breakpoint":768, "settings": {"slidesToShow": 2} },
                         {"breakpoint":480, "settings": {"slidesToShow": 1} },
                         {"breakpoint":320, "settings": {"slidesToShow": 1} }
                         ]'>

                        <%! productDAO v34 = new productDAO();
                            List<product> ds34 = new ArrayList<>();%>
                        <% ds34 = v34.getListProductCategoryID(15);%>
                        <% for (product t : ds34) {%>
                        <div class="single-slide">
                            <div class="product-card">
                                <div class="product-header">
                                    <a href="#" class="author">
                                        <%=t.getAUTHOR_NAME()%>
                                    </a>
                                    <h3><a href="product-details.jsp?product_id=<%=t.getPRODUCT_ID()%>"><%=t.getPRODUCT_NAME()%>
                                        </a></h3>
                                </div>
                                <div class="product-card--body">
                                    <div class="card-image">
                                        <img style="width: 255px; height: 400px"src="image/products/<%=t.getIMAGE()%>" alt="">
                                        <div class="hover-contents">
                                            <a href="product-details.jsp?product_id=<%=t.getPRODUCT_ID()%>" class="hover-image">
                                                <img style="width: 255px; height: 400px" src="image/products/<%=t.getIMAGE()%>" alt="">
                                            </a>
                                            <div class="hover-btns">
                                                <a href="product-details.jsp?product_id=<%=t.getPRODUCT_ID()%>" class="single-btn">
                                                    <i class="fas fa-shopping-basket"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="price-block">
                                        <span class="price"><%=t.getNEW_PRICE()%> VNĐ</span><br>
                                        <del class="price-old"><%=t.getPRICE()%> VNĐ</del>
                                        <span class="price-discount"><%=t.getDISCOUNT()%> %</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </section>
            <!--=================================
                Promotion Section Three
            ===================================== -->
            <section class="section-margin">
                <%
                    productDAO v44 = new productDAO();
                    product pd44 = productDAO.selectProduct(24);
                %>
                <div class="promo-wrapper promo-type-three">
                    <a href="product-details.jsp?product_id=<%=pd44.getPRODUCT_ID()%>"" class="promo-image promo-overlay bg-image" data-bg="image/bg-images/<%=pd44.getIMAGE()%>">
                    </a>
                    <div class="promo-text w-100 ml-0">
                        <div class="container">
                            <div class="row w-100">
                                <div class="col-lg-4">
                                    <h3><%=pd44.getAUTHOR_NAME()%></h3>
                                    <a href="cartservlet?command=insert&product_id=<%=pd44.getPRODUCT_ID()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn--yellow"><%=pd.getNEW_PRICE()%> VNĐ - Đọc thêm</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!--=================================
            Footer
            ===================================== -->
        </div>
        <!--=================================
        Brands Slider
        ===================================== -->
        <section class="section-margin">
            <div class="container">
                <div class="section-title section-title--bordered">
                    <h2>SẢN PHẨM CÓ LIÊN QUAN</h2>
                </div>
                <div class="brand-slider sb-slick-slider border-top border-bottom" data-slick-setting='{
                     "autoplay": true,
                     "autoplaySpeed": 8000,
                     "slidesToShow": 6
                     }' data-slick-responsive='[
                     {"breakpoint":992, "settings": {"slidesToShow": 4} },
                     {"breakpoint":768, "settings": {"slidesToShow": 3} },
                     {"breakpoint":575, "settings": {"slidesToShow": 3} },
                     {"breakpoint":480, "settings": {"slidesToShow": 2} },
                     {"breakpoint":320, "settings": {"slidesToShow": 1} }
                     ]'>

                    <% Object CATEGORY_ID1 = session.getAttribute("category_id");%>
                    <%if (CATEGORY_ID1 != null) {
                            int CATEGORY_ID2 = Integer.parseInt(CATEGORY_ID1.toString());
                            ds1 = v2.getListProductCategoryID(CATEGORY_ID2);
                            for (product vv : ds1) {%>
                    <div class="single-slide">
                        <a href="product-details.jsp?product_id=<%=vv.getPRODUCT_ID()%>"><span style="width: 155px; height: 255px"><img src="image/products/<%=vv.getIMAGE()%>" alt=""></span></a>
                    </div>
                    <%}
                    } else {
                        ds1 = v2.getListProduct();
                        for (product vv : ds1) {%>
                    <div class="single-slide">
                        <a href="product-details.jsp?product_id=<%=vv.getPRODUCT_ID()%>"><span style="width: 155px; height: 255px"><img src="image/products/<%=vv.getIMAGE()%>" alt=""></span></a>
                    </div>
                    <%}
                        }%>
                </div>
            </div>
        </section>
        <!--=================================
        Footer Area
        ===================================== -->
        <footer class="site-footer">
            <div class="container">
                <div class="row justify-content-between  section-padding">
                    <div class=" col-xl-5 col-lg-5 col-sm-6">
                        <div class="single-footer pb--40">
                            <div class="brand-footer footer-title">
                                <img src="image/logo--footer.png" alt="">
                            </div>
                            <div class="footer-contact">
                                <p><span class="label">Địa chỉ:</span><span class="text">Thắng Lợi, La Phù, Hoài Đức,
                                        Hà Nội</span></p>
                                <p><span class="label">Liên hệ:</span><span class="text">+84-705-44-33-01</span></p>
                                <p><span class="label">Email:</span><span class="text">nguyencongthinh1999@gmail.com</span></p>
                            </div>
                        </div>
                    </div>


                    <div class=" col-xl-5 col-lg-4 col-sm-6">
                        <div class="footer-title">
                            <h3>Đăng kí nhận email</h3>
                        </div>
                        <div class="newsletter-form mb--30">
                            <form action="./php/mail.php">
                                <input type="email" class="form-control" placeholder="Nhập email tại đây...">
                                <button class="btn btn--primary w-100">Đăng ký</button>
                            </form>
                        </div>
                        <div class="social-block">
                            <h3 class="title">LIÊN HỆ</h3>
                            <ul class="social-list list-inline">
                                <li class="single-social facebook"><a href=""><i class="ion ion-social-facebook"></i></a>
                                </li>
                                <li class="single-social twitter"><a href=""><i class="ion ion-social-twitter"></i></a></li>
                                <li class="single-social google"><a href=""><i
                                            class="ion ion-social-googleplus-outline"></i></a></li>
                                <li class="single-social youtube"><a href=""><i class="ion ion-social-youtube"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="container">
                    <p class="copyright-heading">Bản quyền trang web thuộc về ThinhNguyenCong</p>
                    <a href="#" class="payment-block">
                        <img src="image/icon/payment.png" alt="">
                    </a>
                    <p class="copyright-text">Copyright © 2020 <a href="#" class="author">ThinhNguyenCong</a>. All Right Reserved.
                        <br>
                        Design By ThinhNguyenCong</p>
                </div>
            </div>
        </footer>
        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Đăng xuất?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Nhấn "Đăng xuất" để thoát hoăc "Hủy" để tiếp tục!</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
                        <a class="btn btn-danger" href="logoutservlet">Đăng xuất</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <script src="js/plugins.js"></script>
        <script src="js/ajax-mail.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>
