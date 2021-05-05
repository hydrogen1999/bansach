<%-- 
    Document   : adminlogin
    Created on : Aug 29, 2020, 9:16:44 AM
    Author     : ThinhNguyenCong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title> TNC Bookstore - Đăng nhập</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <script src="js/validatelogin.js"></script>

    </head>

    <body class="bg-gradient-primary">

        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">
                
                <div class="col-xl-10 col-lg-12 col-md-9">
                    <br> <br> <br> <br> <br> <br><br>
                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">ĐĂNG NHẬP</h1>
                                        </div>
                                        <form class="user" action="adminlogin" method="post" name="login_form" onsubmit="return validatelogin()">
                                            <div class="form-group">
                                                <input type="email" name="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Nhập địa chỉ email...">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" name="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Mật khẩu">
                                            </div>
                                            <div class="form-group">
                                                <br>
                                                <p>Loại tài khoản:</p>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <input id="radio" type="radio" name="type" size="15" value="Admin"> Admin
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <input id="radio" type="radio" name="type" size="15" value="Manager"> Manager
                                                
                                            </div>
                                            <br>
                                            <div class="btn btn-primary btn-user btn-block">
                                                <button type="submit" class="btn btn-outlined"style="color: white">Đăng nhập</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

    </body>

</html>

