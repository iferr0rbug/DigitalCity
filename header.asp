<!DOCTYPE html>
<html>
    <head>
        <title>数码城 - 买数码到数码城</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
        <!-- jQuery (necessary JavaScript plugins) -->
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <!-- Custom Theme files -->
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <script type="application/x-javascript">addEventListener("load",
            function() {
                setTimeout(hideURLbar, 0);
            },
            false);
            function hideURLbar() {
                window.scrollTo(0, 1);
            }</script>
        <!-- start menu -->
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script src="js/simpleCart.min.js"></script>
        <script src="js/responsiveslides.min.js"></script>
        <script>$(function() {
                $("#slider").responsiveSlides({
                    auto: true,
                    nav: true,
                    speed: 500,
                    namespace: "callbacks",
                    pager: true,
                });
            });</script>
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">jQuery(document).ready(function($) {
                $(".scroll").click(function(event) {
                    event.preventDefault();
                    $('html,body').animate({
                        scrollTop: $(this.hash).offset().top
                    },
                    1200);
                });
            });</script>
        <script type="text/javascript">$(document).ready(function() {
                /*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
				*/
                $().UItoTop({
                    easingType: 'easeOutQuart'
                });
            });</script>
    </head>
    
    <body>
        <!-- header -->
        <div class="header_bg">
            <div class="container">
                <div class="header">
                    <div class="head-t">
                        <div class="logo">
                            <a href="index.asp">
                                <img src="images/logo.png" class="img-responsive" alt="" /></a>
                        </div>
                        <!-- start header_right -->
                        <div class="header_right">
                            <div class="rgt-bottom">
                            	<%
									if session("user")<>"" then
								%>
								<li>
                                    <a href="orderlist.asp"><%=session("user")%></a></li>
                                <li>
                                    <a href="exit.asp">退出登陆</a></li>
                                <%
									else
								%>
								<li>
                                    <a href="login.asp">登录</a></li>
                                <li>
                                    <a href="register.asp">注册</a></li>
								<%
									end if
								%>
                                <div class="clearfix"></div>
                            </div>
                            <div class="se-ca">
                                <div class="search">
                                    <form method="post" action="products.asp">
                                        <input type="text" name="prodName" value="" placeholder="搜索..." />
                                        <input type="submit" value="" /></form>
                                </div>
                                <div class="cart box_1">
                                    <a href="checkout.asp">
                                        <h3>共
                                            <span>￥
                                            	<%
													if session("all_price")="" then								
												%>0
												<%
													else
												%>
												<%=session("all_price")%>
												<%
													end if
												%></span>
                                            <img src="images/bag.png" alt="" /></h3>
                                    </a>
                                    <p>
                                        <a href="clearbag.asp">(清空购物车)</a></p>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <!-- start header menu -->
                    <div class="header-top">
                        <nav class="navbar navbar-default">
                            <div class="container-fluid">
                                <!-- Collect the nav links, forms, and other content for toggling -->
                                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                    <ul class="nav navbar-nav">
                                        <li>
                                            <a href="index.asp">首页</a></li>
                                        <li>
                                            <a href="products.asp">产品</a></li>
                                        <%
                                        	if session("user")<>"" then
                                        %>
                                        <li>
                                            <a href="orderlist.asp">订单查询</a></li>
                                        <% end if %>
                                        <%
                                        	if session("user_prop")="admin" then
                                        %>
                                        <li>
                                            <a href="orderall.asp">网站管理</a></li>
                                        <% end if %>
                                    </ul>
                                </div>
                                <!-- /.navbar-collapse --></div>
                            <!-- /.container-fluid --></nav>
                    </div>
                    <!-- start header menu --></div>
            </div>
        </div>
        <!-- start banner -->
        <!-- end banner -->