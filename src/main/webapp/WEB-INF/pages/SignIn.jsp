<%--
  Created by IntelliJ IDEA.
  User: AnastasiiaK
  Date: 29/03/2018
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="sideBar.jsp" %>

<html>
<head>
    <title>Sign-In</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/pages/signIn/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/pages/signIn/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/pages/signIn/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/pages/signIn/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/pages/signIn/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/pages/signIn/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/pages/signIn/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/pages/signIn/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/pages/signIn/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/pages/signIn/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/signIn/css/util.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/signIn/css/main.css">
    <!--===============================================================================================-->
</head>

<body style="background-color: #999999;">
<div class="limiter">
    <div class="container-login100">
        <div class="login100-more" style="background-image: url('../../pages/signIn/images/bg-01.jpg');"></div>

        <div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">
            <p align="right"><a href="${pageContext.request.contextPath}/Central">back Home -></a></p>


            <form class="login100-form validate-form" method="post">
					<span class="login100-form-title p-b-59">
						Registration
					</span>

                <c:if test="${faultMessage != null}"><p>${faultMessage}</p></c:if>
                <div class="wrap-input100 validate-input" data-validate="FirstName is required">
                    <span class="label-input100">First Name</span>
                    <input class="input100" type="text" name="firstName" placeholder="FirstName..."
                           <c:if test="${faultMessage != null}">value="${firstName}" </c:if> />
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="LastName is required">
                    <span class="label-input100">Last Name:</span>
                    <input class="input100" type="text" name="lastName" placeholder="LastName..."
                           <c:if test="${faultMessage != null}">value="${lastName}" </c:if> />
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="UserName is required">
                    <span class="label-input100">User Name:</span>
                    <input class="input100" type="text" name="userName" placeholder="Username..." id="username"
                           <c:if test="${faultMessage != null}">value="${userName}" </c:if> />
                    <span class="focus-input100" id="messageAlreadyTakenUsername"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                    <span class="label-input100">Email</span>
                    <input class="input100" type="text" name="email" placeholder="Email addess..."
                           <c:if test="${faultMessage != null}">value="${email}" </c:if> />
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Street is required">
                    <span class="label-input100">Street</span>
                    <input class="input100" type="text" name="street" placeholder="Street..."
                           <c:if test="${faultMessage != null}">value="${street}" </c:if> />
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="House nr is required">
                    <span class="label-input100">House Nr</span>
                    <input class="input100" type="text" name="houseNr" placeholder="House number..."
                           <c:if test="${faultMessage != null}">value="${number}" </c:if> />
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="City is required">
                    <span class="label-input100">City</span>
                    <input class="input100" type="text" name="city" placeholder="City..."
                           <c:if test="${faultMessage != null}">value="${city}" </c:if> />
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="ZIP code is required">
                    <span class="label-input100">ZIP code</span>
                    <input class="input100" type="text" name="zipcode" placeholder="ZIP code..."
                           <c:if test="${faultMessage != null}">value="${zipcode}" </c:if> />
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Password is required">
                    <span class="label-input100">Password</span>
                    <input class="input100" type="text" name="pass" placeholder="*************">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Repeat Password is required">
                    <span class="label-input100">Repeat Password</span>
                    <input class="input100" type="text" name="repeat-pass" placeholder="*************">
                    <span class="focus-input100"></span>
                </div>


                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn">
                            <a href="${pageContext.request.contextPath}/SignInServlet">Sign Up</a>
                        </button>
                    </div>

                </div>
            </form>

            <p><br/><br/>* Are you already sign up?</p>
            <form class="login100-form validate-form" method="post" action>
                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn">
                            <a href="${pageContext.request.contextPath}/login">Log me in</a>
                        </button>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/signIn/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/signIn/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/signIn/vendor/bootstrap/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/pages/signIn/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/signIn/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/signIn/vendor/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/signIn/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/signIn/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/pages/signIn/js/main.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#username').blur(function () {
            var user_name = $('#username').val();
            $.ajax({
                type: 'POST',
                data: {user_name: user_name},
                url: 'AjaxController',
                success : function (result) {
                    $('#messageAlreadyTakenUsername').html(result);
                }
            });
        });
    });
</script>

</body>
</html>
