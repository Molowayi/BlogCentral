<%--
  Created by IntelliJ IDEA.
  User: AnastasiiaK
  Date: 23/03/2018
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/pages/loginPage/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/loginPage/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/loginPage/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/loginPage/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/loginPage/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/loginPage/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/loginPage/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/loginPage/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/loginPage/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/loginPage/css/util.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/loginPage/css/main.css">
</head>

<div class="limiter">

    <div class="container-login100">
        <div class="wrap-login100">
            <p align="left"><a href="${pageContext.request.contextPath}/Central"><-back Home</a></p>
            <div class="login100-form-title" style="background-image: url(../../pages/loginPage/images/bg-01.jpg);">
					<span class="login100-form-title-1">
						Log In
					</span>
            </div>

            <form class="login100-form validate-form" method="post">
                <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                    <span class="label-input100">Username</span>
                    <input type="text" name="username" placeholder="Enter username">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                    <span class="label-input100">Password</span>
                    <input class="input100" type="text" name="password" placeholder="Enter password">
                    <span class="focus-input100"></span>
                </div>

                <div class="container-login100-form-btn">
                    <button class="login100-form-btn">
                        Login
                    </button>
                    <form action="/login" method="post">
                        <p><input type="checkbox" value="keepMeLoggedIn">Keep me logged in</p>
                    </form>
                    <p><br/><br/><br/>You don't have personal account, do you?
                        <a href="${pageContext.request.contextPath}/signup">Sign up</a>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/loginPage/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/loginPage/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/loginPage/vendor/bootstrap/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/pages/loginPage/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/loginPage/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/loginPage/vendor/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/loginPage/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/loginPage/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/loginPage/js/main.js"></script>
</body>
</html>
