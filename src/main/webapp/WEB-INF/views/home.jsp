<%--
  Created by IntelliJ IDEA.
  User: ibm
  Date: 26/02/19
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <meta name="keywords" content="HTML5 Admin Template" />
    <meta name="description" content="Porto Admin - Responsive HTML5 Template">
    <meta name="author" content="okler.net">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <!-- Web Fonts  -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/vendor/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/vendor/magnific-popup/magnific-popup.css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

    <!-- Theme CSS -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/stylesheets/theme.css" />

    <!-- Skin CSS -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/stylesheets/skins/default.css" />

    <!-- Theme Custom CSS -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/stylesheets/theme-custom.css">

    <!-- Head Libs -->
    <script src="${pageContext.servletContext.contextPath}/resources/assets/vendor/modernizr/modernizr.js"></script>

</head>
<body>
<!-- start: page -->
<section class="body-sign">
    <div class="center-sign">
        <a href="/" class="logo pull-left">
            <img src="${pageContext.servletContext.contextPath}/resources/assets/images/logo.png" height="54" alt="Porto Admin" />
        </a>

        <div class="panel panel-sign">
            <div class="panel-title-sign mt-xl text-right">
                <h2 class="title text-uppercase text-bold m-none"><i class="fa fa-user mr-xs"></i> Sign In</h2>
            </div>
            <div class="panel-body">
                <form action="index.html" method="post">
                    <div class="form-group mb-lg">
                        <label>Username</label>
                        <div class="input-group input-group-icon">
                            <input name="username" type="text" class="form-control input-lg" />
                            <span class="input-group-addon">
										<span class="icon icon-lg">
											<i class="fa fa-user"></i>
										</span>
									</span>
                        </div>
                    </div>

                    <div class="form-group mb-lg">
                        <div class="clearfix">
                            <label class="pull-left">Password</label>
                            <%--<a href="pages-recover-password.html" class="pull-right">Lost Password?</a>--%>
                        </div>
                        <div class="input-group input-group-icon">
                            <input name="password" type="password"  class="form-control input-lg" />
                            <span class="input-group-addon">
										<span class="icon icon-lg">
											<i class="fa fa-lock"></i>
										</span>
									</span>
                        </div>
                    </div>

                    <div class="row">
                        <%--<div class="col-sm-8">--%>
                            <%--<div class="checkbox-custom checkbox-default">--%>
                                <%--<input id="RememberMe" name="rememberme" type="checkbox"/>--%>
                                <%--<label for="RememberMe">Remember Me</label>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <div class="col-sm-4 text-right">
                            <%--<button type="submit" class="btn btn-primary hidden-xs">Sign In</button>--%>
                            <button type="submit" class="btn btn-primary btn-block btn-lg visible-xs mt-lg">Sign In</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </div>
                    </div>

                    <span class="mt-lg mb-lg line-thru text-center text-uppercase">
								<span>or</span>
							</span>

                    <%--<div class="mb-xs text-center">--%>
                        <%--<a class="btn btn-facebook mb-md ml-xs mr-xs">Connect with <i class="fa fa-facebook"></i></a>--%>
                        <%--<a class="btn btn-twitter mb-md ml-xs mr-xs">Connect with <i class="fa fa-twitter"></i></a>--%>
                    <%--</div>--%>

                    <%--<p class="text-center">Don't have an account yet? <a href="pages-signup.html">Sign Up!</a>--%>

                </form>
            </div>
            <c:if test="${not empty error}"><div>${error}</div></c:if>
            <c:if test="${not empty message}"><div>${message}</div></c:if>
        </div>

        <p class="text-center text-muted mt-md mb-md">&copy; Strathmore IoT Lab</p>
    </div>
</section>
<!-- end: page -->

<!-- Vendor -->
<script src="${pageContext.servletContext.contextPath}/resources/assets/vendor/jquery/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/vendor/nanoscroller/nanoscroller.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/vendor/magnific-popup/magnific-popup.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

<!-- Theme Base, Components and Settings -->
<script src="${pageContext.servletContext.contextPath}/resources/assets/javascripts/theme.js"></script>

<!-- Theme Custom -->
<script src="${pageContext.servletContext.contextPath}/resources/assets/javascripts/theme.custom.js"></script>

<!-- Theme Initialization Files -->
<script src="${pageContext.servletContext.contextPath}/resources/assets/javascripts/theme.init.js"></script>

</body><img src="http://www.ten28.com/fref.jpg">
</html>
