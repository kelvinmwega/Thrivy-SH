<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="fixed">
<head>

    <!-- Basic -->
    <meta charset="UTF-8">

    <title>Home | Strathmore IoT</title>
    <meta name="keywords" content="Strathmore IoT" />
    <meta name="description" content="Strathmore IoT Lab Dashboard">
    <meta name="author" content="Kev Mwega">

    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />

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
<section class="body">

    <!-- start: header -->
    <header class="header">
        <div class="logo-container">
            <a href="../" class="logo">
                <img src="${pageContext.servletContext.contextPath}/resources/assets/images/logo.png" height="35" alt="Porto Admin" />
            </a>
            <div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
                <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
            </div>
        </div>

        <!-- start: search & user box -->
        <div class="header-right">


            <ul class="notifications">


                <li>
                    <a href="#" class="dropdown-toggle notification-icon" data-toggle="dropdown">
                        <i class="fa fa-bell"></i>
                        <span class="badge">1</span>
                    </a>

                    <div class="dropdown-menu notification-menu">
                        <div class="notification-title">
                            <span class="pull-right label label-default">1</span>
                            Alerts
                        </div>

                        <div class="content">
                            <ul>
                                <li>
                                    <a href="#" class="clearfix">
                                        <div class="image">
                                            <i class="fa fa-signal bg-success"></i>
                                        </div>
                                        <span class="title">Dummy Alert!!</span>
                                        <span class="message">1/1/2019</span>
                                    </a>
                                </li>
                            </ul>

                            <hr />

                            <div class="text-right">
                                <a href="#" class="view-more">View All</a>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>

            <span class="separator"></span>

            <div id="userbox" class="userbox">
                <a href="#" data-toggle="dropdown">
                    <figure class="profile-picture">
                        <img src="${pageContext.servletContext.contextPath}/resources/assets/images/!logged-user.jpg" alt="Joseph Doe" class="img-circle" data-lock-picture="${pageContext.servletContext.contextPath}/resources/assets/images/!logged-user.jpg" />
                    </figure>
                    <div class="profile-info" data-lock-name="admin" data-lock-email="admin">
                        <span class="name">admin</span>
                        <span class="role">administrator</span>
                    </div>

                    <i class="fa custom-caret"></i>
                </a>

                <div class="dropdown-menu">
                    <ul class="list-unstyled">
                        <li class="divider"></li>
                        <%--<li>--%>
                            <%--<a role="menuitem" tabindex="-1" href="pages-user-profile.html"><i class="fa fa-user"></i> My Profile</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a role="menuitem" tabindex="-1" href="#" data-lock-screen="true"><i class="fa fa-lock"></i> Lock Screen</a>--%>
                        <%--</li>--%>
                        <li>

                            <c:url value="/logout" var="logoutUrl" />
                            <form id="logout" action="${logoutUrl}" method="post" >
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </form>
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                                <a role="menuitem" tabindex="-1" href="javascript:document.getElementById('logout').submit()"><i class="fa fa-power-off"></i> Logout</a>
                            </c:if>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- end: search & user box -->
    </header>
    <!-- end: header -->

    <div class="inner-wrapper">
        <!-- start: sidebar -->
        <aside id="sidebar-left" class="sidebar-left">

            <div class="sidebar-header">
                <div class="sidebar-title">
                    Navigation
                </div>
                <div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
                    <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
                </div>
            </div>

            <div class="nano">
                <div class="nano-content">
                    <nav id="menu" class="nav-main" role="navigation">
                        <ul class="nav nav-main">
                            <li>
                                <a href="">
                                    <i class="fa fa-home" aria-hidden="true"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>

            </div>

        </aside>
        <!-- end: sidebar -->

        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Home</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Home</span></li>
                        <li><span>Dashboard</span></li>
                    </ol>

                    <%--<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>--%>
                </div>
            </header>

            <!-- start: page -->
            <!-- end: page -->
        </section>
    </div>

    <%--<aside id="sidebar-right" class="sidebar-right">--%>
        <%--<div class="nano">--%>
            <%--<div class="nano-content">--%>
                <%--<a href="#" class="mobile-close visible-xs">--%>
                    <%--Collapse <i class="fa fa-chevron-right"></i>--%>
                <%--</a>--%>

                <%--<div class="sidebar-right-wrapper">--%>

                    <%--<div class="sidebar-widget widget-calendar">--%>
                        <%--<h6>Upcoming Tasks</h6>--%>
                        <%--<div data-plugin-datepicker data-plugin-skin="dark" ></div>--%>

                        <%--<ul>--%>
                            <%--<li>--%>
                                <%--<time datetime="2014-04-19T00:00+00:00">04/19/2014</time>--%>
                                <%--<span>Company Meeting</span>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--<div class="sidebar-widget widget-friends">--%>
                        <%--<h6>Friends</h6>--%>
                        <%--<ul>--%>
                            <%--<li class="status-online">--%>
                                <%--<figure class="profile-picture">--%>
                                    <%--<img src="${pageContext.servletContext.contextPath}/resources/assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">--%>
                                <%--</figure>--%>
                                <%--<div class="profile-info">--%>
                                    <%--<span class="name">Joseph Doe Junior</span>--%>
                                    <%--<span class="title">Hey, how are you?</span>--%>
                                <%--</div>--%>
                            <%--</li>--%>
                            <%--<li class="status-online">--%>
                                <%--<figure class="profile-picture">--%>
                                    <%--<img src="${pageContext.servletContext.contextPath}/resources/assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">--%>
                                <%--</figure>--%>
                                <%--<div class="profile-info">--%>
                                    <%--<span class="name">Joseph Doe Junior</span>--%>
                                    <%--<span class="title">Hey, how are you?</span>--%>
                                <%--</div>--%>
                            <%--</li>--%>
                            <%--<li class="status-offline">--%>
                                <%--<figure class="profile-picture">--%>
                                    <%--<img src="${pageContext.servletContext.contextPath}/resources/assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">--%>
                                <%--</figure>--%>
                                <%--<div class="profile-info">--%>
                                    <%--<span class="name">Joseph Doe Junior</span>--%>
                                    <%--<span class="title">Hey, how are you?</span>--%>
                                <%--</div>--%>
                            <%--</li>--%>
                            <%--<li class="status-offline">--%>
                                <%--<figure class="profile-picture">--%>
                                    <%--<img src="${pageContext.servletContext.contextPath}/resources/assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">--%>
                                <%--</figure>--%>
                                <%--<div class="profile-info">--%>
                                    <%--<span class="name">Joseph Doe Junior</span>--%>
                                    <%--<span class="title">Hey, how are you?</span>--%>
                                <%--</div>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</aside>--%>
</section>

<script type="text/javascript">
    $(function() {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    });
</script>

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

</body>
</html>