<%--
  Created by IntelliJ IDEA.
  User: KelvinMwegaKiana
  Date: 17/01/2019
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>LR History | Thrivy Facilites</title>
    <meta name="Thrivy Facilites" content="Bringing Life to Your Home.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />
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
    <!-- meanmenu CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/meanmenu/meanmenu.min.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/normalize.css">
    <!-- wave CSS
        ============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/wave/waves.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/wave/button.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/scrollbar/jquery.mCustomScrollbar.min.css">
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.4/jquery.datetimepicker.css" rel="stylesheet">
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
                    <a href="#"><img src="${pageContext.servletContext.contextPath}/resources/img/logo/symphony_logo.png" alt="Smiley face" height="63" width="100" /></a>
                </div>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <div class="header-top-menu">
                    <ul class="nav navbar-nav notika-top-nav">
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
                                    <li><a href="">Dashboard</a></li>
                                </ul>
                            </li>
                            <li><a data-toggle="collapse" data-target="#demoevent" href="#">Information</a>
                                <ul id="demoevent" class="collapse dropdown-header-top">
                                    <li><a href="">History</a></li>
                                </ul>
                            </li>
                            <li><a data-toggle="collapse" data-target="#democrou" href="#">Settings</a>
                                <ul id="democrou" class="collapse dropdown-header-top">
                                    <li><a href="">Settings</a></li>
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
                    <li><a data-toggle="tab" href="#Home"><i class="notika-icon notika-house"></i> Home</a>
                    </li>
                    <li class="active"><a data-toggle="tab" href="#mailbox"><i class="notika-icon notika-bar-chart"></i> History</a>
                    </li>
                    <li><a data-toggle="tab" href="#Interface"><i class="notika-icon notika-alarm"></i> Events</a>
                    </li>
                </ul>
                <div class="tab-content custom-menu-content">
                    <div id="Home" class="tab-pane in notika-tab-menu-bg animated flipInX">
                        <ul class="notika-main-menu-dropdown">
                            <li><a href="${pageContext.servletContext.contextPath}/dashpage">Water Supply</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/livingpage">Living Room</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/master">Master Bedroom</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/kitchen">Kitchen</a></li>
                        </ul>
                    </div>
                    <div id="mailbox" class="tab-pane active notika-tab-menu-bg animated flipInX">
                        <ul class="notika-main-menu-dropdown">
                            <li><a href="${pageContext.servletContext.contextPath}/wl_hist">Water Supply</a></li>
                            <li><a href="">Living Room</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/mb_hist">Master Bedroom</a></li>
                            <li><a href="${pageContext.servletContext.contextPath}/kt_hist">Kitchen</a></li>
                        </ul>
                    </div>
                    <div id="Interface" class="tab-pane notika-tab-menu-bg animated flipInX">
                        <ul class="notika-main-menu-dropdown">
                            <li><a href="${pageContext.servletContext.contextPath}/events">Events</a></li>
                            <li><a href="">Alerts</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Main Menu area End-->
<%--Living Room Area--%>
<!-- Breadcomb area Start-->
<div class="breadcomb-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="breadcomb-list">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="breadcomb-wp">
                                <div class="breadcomb-icon">
                                    <i class="notika-icon notika-house"></i>
                                </div>
                                <div class="breadcomb-ctn">
                                    <h2>Living Room Historical Data</h2>
                                    <p>Living Room Door Status, Power Status and Environment Conditions  </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcomb area End-->

<div class="breadcomb-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30">
                    <div class="website-traffic-ctn">
                        <h2>Device Details</h2>
                        <p>Device ID : 865905021073824</p>
                        <p id="lastseen"></p>
                        <p id="devstatus"></p>
                        <p id="count"> </p>
                        <p id="memory"> </p>
                        <%--<p id="errors"></p>--%>
                    </div>
                    <%--<div class="sparkline-bar-stats2">1,4,8,3,5,6,4,8,3,3,9,5</div>--%>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30">
                    <div class="website-traffic-ctn">
                        <h2>Operational Data</h2>
                        <p id="lastsig"></p>
                        <p id="devbat"></p>
                        <p id="doorcnt"></p>
                        <p id="powercnt"></p>
                        <p id="evnttype"></p>
                    </div>
                    <%--<div class="sparkline-bar-stats2">1,4,8,3,5,6,4,8,3,3,9,5</div>--%>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30">
                    <div class="website-traffic-ctn">
                        <h2>Device Status</h2>
                        <p id="devtemp"></p>
                        <p id="devhum"></p>
                        <p id="doorstat"></p>
                        <p id="powerstat"></p>
                        <p id="lightstat"></p>
                    </div>
                    <%--<div class="sparkline-bar-stats2">1,4,8,3,5,6,4,8,3,3,9,5</div>--%>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30 dk-res-mg-t-30">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <%--<div class="nk-int-mk sl-dp-mn">--%>
                        <%--<h2>History</h2>--%>
                        <%--</div>--%>
                        <form>
                            <div class="col-md-12">Begin : <input type="text" class="form-control1 input-sm" id="datetimepicker_dark" required/></div>
                            <div class="col-md-12">End : <input type="text" class="form-control1 input-sm" id="datetimepicker_dark1" required/></div>
                            <div class="col-md-12 center-block"><button type="button" class="btn btn-primary" onclick="fetchHistoricalData()"> Get History </button></div>
                        </form>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Google Map area End-->
<div class="google-map-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="google-map-single">
                    <div class="line-chart-wp chart-display-nn">
                        <canvas height="100vh" width="180vw" id="tempChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="google-map-single sm-res-mg-t-30">
                    <div class="line-chart-wp sm-res-mg-t-30 chart-display-nn">
                        <canvas height="100vh" width="180vw" id="humChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="google-map-single mg-t-30">
                    <div class="line-chart-wp chart-display-nn">
                        <canvas height="100vh" width="180vw" id="lightChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="google-map-single mg-t-30">
                    <div class="line-chart-wp sm-res-mg-t-30 chart-display-nn">
                        <canvas height="100vh" width="180vw" id="batChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Google Map area End-->
<!-- Start Footer area-->
<div class="footer-copyright-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="footer-copy-right">
                    <p> © 2018 Powered By <a href="https://www.ibm.com/cloud/"> IBM Cloud </a>.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Footer area-->
<script>
    var ctx = "${pageContext.servletContext.contextPath}";
</script>
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
<!--  todo JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/todo/jquery.todo.js"></script>
<!--  wave JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/wave/waves.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/wave/wave-active.js"></script>
<!-- plugins JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/plugins.js"></script>
<!-- Google map JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/chat/moment.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/chat/jquery.chat.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.datetimepicker.full.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.js"></script>


<script type="text/javascript">
    $(function() {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    });
</script>

<!-- main JS
    ============================================ -->
<script src="${pageContext.servletContext.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/gauge/gauge.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/base.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/cogs/dash_ctrl.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/base.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/cogs/lr-history-ctrl.js"></script>
<!-- tawk chat JS
    ============================================ -->
<%--<script src="${pageContext.servletContext.contextPath}/resources/js/tawk-chat.js"></script>--%>

<script>
    $('#datetimepicker_dark').datetimepicker({theme:'dark'})

    window.setInterval(function(){
        // notificationInfo("index");
    }, 15000);
</script>
<script>
    $('#datetimepicker_dark1').datetimepicker({theme:'dark'})

    window.setInterval(function(){
        // notificationInfo("index");
    }, 15000);
</script>

<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function(event) {
//        selectDev("865905027563034");
        selectDev("865905021073824");
//         selectDev("865905021074731");
    });

    window.setInterval(function(){
//        selectDev("865905027563034");
        selectDev("865905021073824");
//         selectDev("865905021074731");
    }, 300000);
</script>
</body>

</html>