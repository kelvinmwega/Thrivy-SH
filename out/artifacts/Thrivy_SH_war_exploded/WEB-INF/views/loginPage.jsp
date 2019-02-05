<%--
  Created by IntelliJ IDEA.
  User: kevmw
  Date: 19/10/2018
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login | K.W.S</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.servletContext.contextPath}/resources/img/logo/symphony_logo.png">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css">
    <!-- font awesome CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/owl.theme.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/owl.transitions.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/normalize.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- wave CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/wave/waves.min.css">
    <!-- Notika icon CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/notika-custom-icon.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/main.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body onload='document.loginForm.username.focus();'>
<%--<h3>JournalDEV Tutorials</h3>--%>

<%--<form name='login' action="<c:url value='/loginPage' />" method='POST'>--%>
    <%--<table>--%>
        <%--<tr>--%>
            <%--<td>UserName:</td>--%>
            <%--<td><input type='text' name='username' value=''></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>Password:</td>--%>
            <%--<td><input type='password' name='password' /></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td colspan='2'><input name="submit" type="submit" value="submit" /></td>--%>
        <%--</tr>--%>
    <%--</table>--%>
    <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
<%--</form>--%>

<div class="login-content">
    <!-- Login -->
    <div class="nk-block toggled" id="l-login">
        <div class="col-md-12">
            <div>
                <img src="${pageContext.servletContext.contextPath}/resources/img/logo/symphony_logo.png" alt="Smiley face" />
            </div>
        </div>
        <div class="nk-form">
            <form name='login' action="<c:url value='${pageContext.servletContext.contextPath}/loginPage' />" method='POST'>
                <div class="input-group">
                    <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-support"></i></span>
                    <div class="nk-int-st">
                        <input type="text" class="form-control" placeholder="Username" name='username'>
                    </div>
                </div>
                <div class="input-group mg-t-15">
                    <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-edit"></i></span>
                    <div class="nk-int-st">
                        <input type="password" class="form-control" placeholder="Password"  name='password'>
                    </div>
                </div>
                <%--<button class="btn btn-primary notika-btn-primary" name="submit" type="submit" value="submit">Log in</button>--%>
                <%--<div class="fm-checkbox">--%>
                    <%--<label><input type="checkbox" class="i-checks"> <i></i> Keep me signed in</label>--%>
                <%--</div>--%>
                <button  name="submit" type="submit"  class="btn btn-login btn-success btn-float">
                    <i class="notika-icon notika-right-arrow right-arrow-ant"></i>
                </button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </div>

        <c:if test="${not empty error}"><div>${error}</div></c:if>
        <c:if test="${not empty message}"><div>${message}</div></c:if>

        <%--<div class="nk-navigation nk-lg-ic">--%>
            <%--<a href="#l-register" data-ma-action="nk-login-switch" data-ma-block="#l-register"><i class="notika-icon notika-plus-symbol"></i> <span>Register</span></a>--%>
            <%--<a href="#" data-ma-action="nk-login-switch" data-ma-block="#l-forget-password"><i>?</i> <span>Forgot Password</span></a>--%>
        <%--</div>--%>
    </div>

    <!-- Register -->
    <div class="nk-block" id="l-register">
        <div class="nk-form">
            <div class="input-group">
                <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-support"></i></span>
                <div class="nk-int-st">
                    <input type="text" class="form-control" placeholder="Username">
                </div>
            </div>

            <div class="input-group mg-t-15">
                <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-mail"></i></span>
                <div class="nk-int-st">
                    <input type="text" class="form-control" placeholder="Email Address">
                </div>
            </div>

            <div class="input-group mg-t-15">
                <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-edit"></i></span>
                <div class="nk-int-st">
                    <input type="password" class="form-control" placeholder="Password">
                </div>
            </div>

            <a href="#l-login" data-ma-action="nk-login-switch" data-ma-block="#l-login" class="btn btn-login btn-success btn-float"><i class="notika-icon notika-right-arrow"></i></a>
        </div>

        <div class="nk-navigation rg-ic-stl">
            <a href="#" data-ma-action="nk-login-switch" data-ma-block="#l-login"><i class="notika-icon notika-right-arrow"></i> <span>Sign in</span></a>
            <a href="" data-ma-action="nk-login-switch" data-ma-block="#l-forget-password"><i>?</i> <span>Forgot Password</span></a>
        </div>
    </div>

    <!-- Forgot Password -->
    <div class="nk-block" id="l-forget-password">
        <div class="nk-form">
            <p class="text-left">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu risus. Curabitur commodo lorem fringilla enim feugiat commodo sed ac lacus.</p>

            <div class="input-group">
                <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-mail"></i></span>
                <div class="nk-int-st">
                    <input type="text" class="form-control" placeholder="Email Address">
                </div>
            </div>

            <a href="#l-login" data-ma-action="nk-login-switch" data-ma-block="#l-login" class="btn btn-login btn-success btn-float"><i class="notika-icon notika-right-arrow"></i></a>
        </div>

        <div class="nk-navigation nk-lg-ic rg-ic-stl">
            <a href="" data-ma-action="nk-login-switch" data-ma-block="#l-login"><i class="notika-icon notika-right-arrow"></i> <span>Sign in</span></a>
            <a href="" data-ma-action="nk-login-switch" data-ma-block="#l-register"><i class="notika-icon notika-plus-symbol"></i> <span>Register</span></a>
        </div>
    </div>
</div>
<!-- Login Register area End-->
<!-- jquery
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/vendor/jquery-1.12.4.min.js"></script>
<!-- bootstrap JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- wow JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/wow.min.js"></script>
<!-- price-slider JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/jquery-price-slider.js"></script>
<!-- owl.carousel JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/owl.carousel.min.js"></script>
<!-- scrollUp JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.scrollUp.min.js"></script>
<!-- meanmenu JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/meanmenu/jquery.meanmenu.js"></script>
<!-- counterup JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/counterup/jquery.counterup.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/counterup/waypoints.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/counterup/counterup-active.js"></script>
<!-- mCustomScrollbar JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- sparkline JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/sparkline/jquery.sparkline.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/sparkline/sparkline-active.js"></script>
<!-- flot JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/flot/jquery.flot.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/flot/jquery.flot.resize.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/flot/flot-active.js"></script>
<!-- knob JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/knob/jquery.knob.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/knob/jquery.appear.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/knob/knob-active.js"></script>
<!--  Chat JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/chat/jquery.chat.js"></script>
<!--  wave JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/wave/waves.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/wave/wave-active.js"></script>
<!-- icheck JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/icheck/icheck.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/icheck/icheck-active.js"></script>
<!--  todo JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/todo/jquery.todo.js"></script>
<!-- Login JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/login/login-action.js"></script>
<!-- plugins JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/plugins.js"></script>
<!-- main JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/main.js"></script>
</body>
</html>

