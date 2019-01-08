<%--
  Created by IntelliJ IDEA.
  User: kevmw
  Date: 19/10/2018
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--<c:url value="/logout" var="logoutUrl" />--%>
<%--<form id="logout" action="${logoutUrl}" method="post" >--%>
<%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
<%--</form>--%>
<%--<c:if test="${pageContext.request.userPrincipal.name != null}">--%>
<%--<a href="javascript:document.getElementById('logout').submit()">Logout</a>--%>
<%--</c:if>--%>

<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Smart Utility</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.servletContext.contextPath}/resources/img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/owl.theme.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/owl.transitions.css">
    <!-- meanmenu CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/meanmenu/meanmenu.min.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/normalize.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- jvectormap CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/jvectormap/jquery-jvectormap-2.0.3.css">
    <!-- notika icon CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/notika-custom-icon.css">
    <!-- wave CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/wave/waves.min.css">
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

<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<!-- Start Header Top Area -->
<div class="header-top-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <div class="logo-area">
                    <a href="#"><img src="${pageContext.servletContext.contextPath}/resources/img/logo/logo.png" alt="" /></a>
                </div>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <div class="header-top-menu">
                    <ul class="nav navbar-nav notika-top-nav">
                        <li class="nav-item dropdown">
                            <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-search"></i></span></a>
                            <div role="menu" class="dropdown-menu search-dd animated flipInX">
                                <div class="search-input">
                                    <i class="notika-icon notika-left-arrow"></i>
                                    <input type="text" />
                                </div>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-mail"></i></span></a>
                            <div role="menu" class="dropdown-menu message-dd animated zoomIn">
                                <div class="hd-mg-tt">
                                    <h2>Messages</h2>
                                </div>
                                <div class="hd-message-info">

                                </div>
                                <div class="hd-mg-va">
                                    <a href="#">View All</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item nc-al"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-alarm"></i></span><div class="spinner4 spinner-4"></div><div class="ntd-ctn"><span>0</span></div></a>
                            <div role="menu" class="dropdown-menu message-dd notification-dd animated zoomIn">
                                <div class="hd-mg-tt">
                                    <h2>Notification</h2>
                                </div>
                                <div class="hd-message-info">

                                </div>
                                <div class="hd-mg-va">
                                    <a href="#">View All</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-menus"></i></span><div class="spinner4 spinner-4"></div><div class="ntd-ctn"><span>0</span></div></a>
                            <div role="menu" class="dropdown-menu message-dd task-dd animated zoomIn">
                                <div class="hd-mg-tt">
                                    <h2>Tasks</h2>
                                </div>
                                <div class="hd-message-info hd-task-info">
                                    <div class="skill">

                                    </div>
                                </div>
                                <div class="hd-mg-va">
                                    <a href="#">View All</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-chat"></i></span></a>
                            <div role="menu" class="dropdown-menu message-dd chat-dd animated zoomIn">
                                <div class="hd-mg-tt">
                                    <h2>Chat</h2>
                                </div>
                                <div class="search-people">
                                    <i class="notika-icon notika-left-arrow"></i>
                                    <input type="text" placeholder="Search People" />
                                </div>
                                <div class="hd-message-info">

                                </div>
                                <div class="hd-mg-va">
                                    <a href="#">View All</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <c:url value="/logout" var="logoutUrl" />
                            <form id="logout" action="${logoutUrl}" method="post" >
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </form>
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                                <a href="javascript:document.getElementById('logout').submit()">Logout</a>
                            </c:if>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Header Top Area -->
<!-- Mobile Menu start -->
<div class="mobile-menu-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="mobile-menu">
                    <nav id="dropdown">
                        <ul class="mobile-menu-nav">
                            <li><a data-toggle="collapse" data-target="#Charts" href="#">Home</a>
                                <ul class="collapse dropdown-header-top">
                                    <li><a href="${pageContext.servletContext.contextPath}/homepage">Dashboard</a></li>
                                    <li><a href="${pageContext.servletContext.contextPath}/analytics">Analytics</a></li>
                                </ul>
                            </li>


                            <li><a data-toggle="collapse" data-target="#demolibra" href="#">Users</a>
                                <ul id="demolibra" class="collapse dropdown-header-top">
                                    <li><a href="${pageContext.servletContext.contextPath}/zones">Zones</a></li>
                                    <li><a href="${pageContext.servletContext.contextPath}/clients">Clients</a></li>
                                    <li><a href="${pageContext.servletContext.contextPath}/meterdata">Meter Data</a></li>
                                    <li><a href="${pageContext.servletContext.contextPath}/locations">Locations</a></li>
                                </ul>
                            </li>
                            <li><a data-toggle="collapse" data-target="#demodepart" href="#">Billing</a>
                                <ul id="demodepart" class="collapse dropdown-header-top">
                                    <li><a href="${pageContext.servletContext.contextPath}/revenue">Revenue</a></li>
                                    <li><a href="${pageContext.servletContext.contextPath}/mpesa">MPESA Payments</a></li>
                                </ul>
                            </li>
                            <li><a data-toggle="collapse" data-target="#demo" href="#">Company</a>
                                <ul id="demo" class="collapse dropdown-header-top">
                                    <li><a href="${pageContext.servletContext.contextPath}/settings">Settings</a></li>
                                    <li><a href="${pageContext.servletContext.contextPath}/profile">Profile</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Mobile Menu end -->
<!-- Main Menu area start-->
<div class="main-menu-area mg-tb-40">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
                    <li ><a data-toggle="tab" href="#Home"><i class="notika-icon notika-house"></i> Home</a>
                    </li>
                    <li><a data-toggle="tab" href="#users"><i class="notika-icon notika-support"></i> Users</a>
                    </li>
                    <li class="active"><a data-toggle="tab" href="#billing"><i class="notika-icon notika-finance"></i> Billing</a>
                    </li>
                    <li><a data-toggle="tab" href="#company"><i class="notika-icon notika-settings"></i> Company</a>
                    </li>
                </ul>
                <div class="tab-content custom-menu-content">
                    <div id="Home" class="tab-pane  notika-tab-menu-bg animated flipInX">
                        <ul class="notika-main-menu-dropdown">
                            <li><a href="${pageContext.servletContext.contextPath}/homepage">Dashboard</a>
                            </li>
                            <li><a href="${pageContext.servletContext.contextPath}/analytics">Analytics</a>
                            </li>
                        </ul>
                    </div>
                    <div id="users" class="tab-pane notika-tab-menu-bg animated flipInX">
                        <ul class="notika-main-menu-dropdown">
                            <li><a href="${pageContext.servletContext.contextPath}/zones">Zones</a>
                            </li>
                            <li><a href="${pageContext.servletContext.contextPath}/clients">Clients</a>
                            </li>
                            <li><a href="${pageContext.servletContext.contextPath}/meterdata">Meter Data</a>
                            </li>
                            <li><a href="${pageContext.servletContext.contextPath}/locations">Client Locations</a>
                            </li>
                        </ul>
                    </div>
                    <div id="billing" class="tab-pane in active notika-tab-menu-bg animated flipInX">
                        <ul class="notika-main-menu-dropdown">
                            <li><a href="${pageContext.servletContext.contextPath}/revenue">Revenue</a>
                            </li>
                            <li><a href="${pageContext.servletContext.contextPath}/mpesa">M-Pesa Payments</a>
                            </li>
                        </ul>
                    </div>
                    <div id="company" class="tab-pane notika-tab-menu-bg animated flipInX">
                        <ul class="notika-main-menu-dropdown">
                            <li><a href="${pageContext.servletContext.contextPath}/settings">Settings</a>
                            </li>
                            <li><a href="${pageContext.servletContext.contextPath}/profile">Profile</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Main Menu area End-->
<!-- Start Status area -->

<!-- End Status area-->
<!-- Start Sale Statistic area-->

<!-- End Sale Statistic area-->
<!-- Start Email Statistic area-->

<!-- End Email Statistic area-->
<!-- Start Realtime sts area-->

<!-- End Realtime sts area-->
<!-- Start Footer area-->
<div class="footer-copyright-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="footer-copy-right">
                    <p>Copyright © 2018
                        . <a href="">Vunyx Systems</a>.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Footer area-->
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
<!-- jvectormap JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/jvectormap/jvectormap-active.js"></script>
<!-- sparkline JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/sparkline/jquery.sparkline.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/sparkline/sparkline-active.js"></script>
<!-- sparkline JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/flot/jquery.flot.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/flot/jquery.flot.resize.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/flot/curvedLines.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/flot/flot-active.js"></script>
<!-- knob JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/knob/jquery.knob.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/knob/jquery.appear.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/knob/knob-active.js"></script>
<!--  wave JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/wave/waves.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/wave/wave-active.js"></script>
<!--  todo JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/todo/jquery.todo.js"></script>
<!-- plugins JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/plugins.js"></script>
<!--  Chat JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/chat/moment.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/chat/jquery.chat.js"></script>
<!-- main JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/base.js"></script>
<!-- tawk chat JS
    ============================================ -->
<%--<script src="${pageContext.servletContext.contextPath}/resources/js/tawk-chat.js"></script>--%>
</body>

</html>

