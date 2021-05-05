<%-- 
    Document   : faq
    Created on : Aug 12, 2020, 3:43:50 PM
    Author     : ThinhNguyenCong
--%>

<%@page import="dao.productDAO"%>
<%@page import="java.util.Map"%>
<%@page import="com.model.category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.categoryDAO"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.model.product"%>
<%@page import="com.model.cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

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
                                    <li class="menu-item">
                                        <a href="shop-grid-left-sidebar.jsp">Cửa hàng</a>
                                    </li>
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
                                        <li><a href="">Tài khoản</a></li>
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
            <section class="breadcrumb-section">
                <h2 class="sr-only">Site Breadcrumb</h2>
                <div class="container">
                    <div class="breadcrumb-contents">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home.jsp">Trang chủ</a></li>
                                <li class="breadcrumb-item active">FAQ - Những câu hỏi thường gặp</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </section>

            <!-- faq Page Start -->
            <div class="faq-area inner-page-sec-padding-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="inner text-center">
                                <h1>MỘT SỐ CÂU HỎI THƯỜNG GẶP</h1>
                            </div>
                        </div>
                    </div>
                    <div class="row mbn-30">

                        <div class="col-lg-6 col-12">
                            <!--FAQ (Accordion) Start-->
                            <div class="accordion" id="gq-faqs-1">

                                <!--Cart Start-->
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="mb-0"><button class="collapsed" data-toggle="collapse" data-target="#gq-faq-1">Các bước đặt mua sách trên ThinhNguyenCong Bookstore?</button></h5>
                                    </div>
                                    <div id="gq-faq-1" class="collapse show" data-parent="#gq-faqs-1">
                                        <div class="card-body">
                                            <ol>
                                                <li><a href="login-register.jsp" style="color: goldenrod">Đăng nhập</a>. Nếu chưa có tài khoản xin vui lòng đăng ký tại <a href="login-register.jsp" style="color: goldenrod">đây</a>.</li>
                                                <li>Lựa chọn sản phẩm rồi thêm vào <a href="cart.jsp" style="color: goldenrod"> giỏ hàng</a>.</li>
                                                <li>Bấm <a href="cart.jsp" style="color: goldenrod"> thanh toán</a> để tiến hành đặt hàng.</li>
                                                <li>Cung cấp thông tin về địa chỉ nhận hàng và bấm "Đặt hàng" để xác nhận.</li>
                                                <li>Theo dõi trạng thái đơn hàng trong phần <a href="history.jsp" style="color: goldenrod">lịch sử mua hàng</a>.</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div><!--Cart End-->

                                <!--Cart Start-->
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="mb-0"><button class="collapsed" data-toggle="collapse" data-target="#gq-faq-2">Đơn hàng của tôi sau khi đặt mua sẽ được xử lý như thế nào ?</button></h5>
                                    </div>
                                    <div id="gq-faq-2" class="collapse" data-parent="#gq-faqs-1">
                                        <div class="card-body">
                                            Sau khi đặt mua, đơn hàng sẽ được xử lý theo 4 bước:
                                            <ol>
                                                <li>Đưa vào hàng chờ xử lý.</li>
                                                <li>Xử lý đơn hàng, đóng gói và giao cho bên vận chuyển.</li>
                                                <li>Bên vận chuyển giao hàng.</li>
                                                <li>Thanh toán khi nhận được sản phẩm.</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div><!--Cart End-->

                                <!--Cart Start-->
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="mb-0"><button class="collapsed" data-toggle="collapse" data-target="#gq-faq-3">Bao lâu kể từ khi đặt hàng thì tôi nhận được sản phẩm ?</button></h5>
                                    </div>
                                    <div id="gq-faq-3" class="collapse" data-parent="#gq-faqs-1">
                                        <div class="card-body">
                                            <p>Thông thường, quy trình kể từ khi quý khách đặt hàng cho tới khi nhận được sản phẩm kéo dài trong 3 - 5 ngày.</p>
                                        </div>
                                    </div>
                                </div><!--Cart End-->

                                <!--Cart Start-->
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="mb-0"><button class="collapsed" data-toggle="collapse" data-target="#gq-faq-4">Tôi có thể hủy đơn hàng hay không ?</button></h5>
                                    </div>
                                    <div id="gq-faq-4" class="collapse" data-parent="#gq-faqs-1">
                                        <div class="card-body">
                                            <p>Đơn hàng sẽ được xử lý sau khoảng 12 giờ, vì vậy quý khách có thể hủy đơn hàng trong khoảng thời gian này. Sau khi đơn hàng được xử lý thì không thể hủy đơn.</p>
                                        </div>
                                    </div>
                                </div><!--Cart End-->

                            </div><!--FAQ (Accordion) End-->
                        </div>

                        <div class="col-lg-6 col-12 accordion-2">
                            <!--FAQ (Accordion) Start-->
                            <div class="accordion" id="gq-faqs-2">

                                <!--Cart Start-->
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="mb-0"><button class="collapsed" data-toggle="collapse" data-target="#gq-faq-5">Phạm vi giao hàng và phí vận chuyển được tính như thế nào ?</button></h5>
                                    </div>
                                    <div id="gq-faq-5" class="collapse show" data-parent="#gq-faqs-2">
                                        <div class="card-body">
                                            <p>Cửa hàng chỉ nhận giao hàng với những khách hàng sinh sống trên địa bàn TP. Hà Nội.</p>
                                            <p>Với những đơn hàng có giá trị trên 200.000 đồng sẽ được miễn hoàn toàn phí vận chuyển. Những đơn hàng dưới 200.000 đồng sẽ được tính phí vận chuyển là 11.000 đồng.</p>
                                        </div>
                                    </div>
                                </div><!--Cart End-->

                                <!--Cart Start-->
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="mb-0"><button class="collapsed" data-toggle="collapse" data-target="#gq-faq-6">Có hỗ trợ thanh toán bằng thẻ ghi nợ/thẻ ngân hàng hay không ?</button></h5>
                                    </div>
                                    <div id="gq-faq-6" class="collapse" data-parent="#gq-faqs-2">
                                        <div class="card-body">
                                            <p>Hiện tại cửa hàng vẫn chưa hỗ trợ thanh toán bằng thẻ ghi nợ/thẻ ngân hàng, quý khách vui lòng thanh toán tiền mặt khi nhận hàng hoặc đến trực tiếp cửa hàng để mua hàng.</p>
                                        </div>
                                    </div>
                                </div><!--Cart End-->

                                <!--Cart Start-->
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="mb-0"><button class="collapsed" data-toggle="collapse" data-target="#gq-faq-7">Tôi có thể liên hệ với cửa hàng bằng cách nào ?</button></h5>
                                    </div>
                                    <div id="gq-faq-7" class="collapse" data-parent="#gq-faqs-2">
                                        <div class="card-body">
                                            <p>Quý khách vui lòng liên hệ với cửa hàng bằng số điện thoại <b>(+84)705443301</b> hoặc qua địa chỉ email <a href="http://mail.google.com">nguyencongthinh1999@gmail.com</a>.</p>
                                        </div>
                                    </div>
                                </div><!--Cart End-->

                                <!--Cart Start-->
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="mb-0"><button class="collapsed" data-toggle="collapse" data-target="#gq-faq-8">Tôi có thể đăng ký nhiều tài khoản bằng một địa chỉ email không ?</button></h5>
                                    </div>
                                    <div id="gq-faq-8" class="collapse" data-parent="#gq-faqs-2">
                                        <div class="card-body">
                                            <p>Quý khách chỉ có thể đăng ký một tài khoản ứng với một địa chỉ email.</p>
                                        </div>
                                    </div>
                                </div><!--Cart End-->

                            </div><!--FAQ (Accordion) End-->
                        </div>

                    </div>
                </div>
            </div>
            <!-- faq Page End -->
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
                    <%! productDAO v888 = new productDAO();
                        List<product> ds888 = new ArrayList<>();%>
                    <% Object CATEGORY_ID1 = session.getAttribute("category_id");%>
                    <%if (CATEGORY_ID1 != null) {
                            int CATEGORY_ID2 = Integer.parseInt(CATEGORY_ID1.toString());
                            ds888 = v888.getListProductCategoryID(CATEGORY_ID2);
                            for (product vv : ds888) {%>
                    <div class="single-slide">
                        <a href="product-details.jsp?product_id=<%=vv.getPRODUCT_ID()%>"><span style="width: 155px; height: 255px"><img src="image/products/<%=vv.getIMAGE()%>" alt=""></span></a>
                    </div>
                    <%}
                    } else {
                        ds888 = v888.getListProduct();
                        for (product vv : ds888) {%>
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
