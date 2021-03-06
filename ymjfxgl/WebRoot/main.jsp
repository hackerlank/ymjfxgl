
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>分销管理系统升级版</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <!-- begin 整体样式-->
    <link href="style/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="style/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css">
    <!--响应式导航-->
    <link href="style/css/style-responsive.css" rel="stylesheet" type="text/css">
    <!--响应式导航-->
    <link href="style/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="style/css/public.css" rel="stylesheet">
    <link href="style/css/nav.css" rel="stylesheet" type="text/css">
    <!-- end 整体样式 -->
    <script type="text/javascript">
	    function ClosePage() {
	        if (window.confirm('确定要退出系统吗？退出将返回登录界面。')) {
	            $.post("/Home/SysOut", {}, function (data) {
	                if (data == "ok") {
	                    window.location.href = "/";
	                }
	            });
	        }
	    }
	    
	     function iFrameHeight() {
               var ifm = document.getElementById("iframemain");
               var subWeb = document.frames ? document.frames["iframemain"].document : ifm.contentDocument;
               if (ifm != null && subWeb != null) {
                   ifm.height = subWeb.body.scrollHeight;
                   if (ifm.height < 950) {
                      ifm.height = 950;
                   }
               }
         }
         
    </script>
</head>
<!-- begin body -->
<body class="page-header-fixed " style="min-height: 565px;">
 <!-- ***begin header -->
 <div class="header navbar navbar-inverse navbar-fixed-top">
    <!-- begin 顶部导航栏 -->
    <div class="navbar-inner">
       <div class="container-fluid">
          <!-- begin LOGO -->
          <a class="brand" href="" target="iframemain">
             <img src="style/images/logo.png" alt="logo">
          </a>
          <!-- end LOGO -->
          <!-- begin 响应菜单显示开关-->
          <a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
              <img src="style/images/menu-toggler.png" alt="">
          </a>
          <!-- end 响应菜单显示开关 -->
          <!-- begin 顶部导航菜单 -->
          <ul class="nav pull-right">
             <!-- begin 用户登录下拉 -->
             <li class="dropdown user" style="margin-top: 4px;"><a href="http://www.ymjfxgl.com/Default/Index#" target="iframemain" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-user"></i><span class="username">txp88888</span> <i class="icon-angle-down"></i></a>
                <ul class="dropdown-menu">
                  <li><a href="" target="iframemain"><i class="icon-pencil"></i>我的账户</a></li>
                  <li><a href="" target="iframemain"><i class="icon-pencil"></i>基本信息</a></li>
                  <li><a href="" target="iframemain"><i class="icon-lock"></i>更換密碼</a></li>
                  <li><a href="" target="iframemain"><i class="icon-envelope"></i>留言消息</a></li>
                  <li class="divider"></li>
                  <li><a href="javascript:;" onclick="ClosePage()"><i class="icon-remove"></i>安全退出</a></li>
                </ul>
              </li>
           </ul>
           <!-- end 顶部导航菜单 -->
       </div>
    </div>
    <!-- end 顶部导航栏-->
 </div>
 <!-- ***end header -->
 <!-- ***begin 内容 -->
 <div class="page-container">
    <!-- begin 侧边栏 -->
    <div class="page-sidebar nav-collapse collapse">
        <!-- begin 侧边栏菜单 -->
        <ul class="page-sidebar-menu">
           <li>
              <!-- begin 侧边栏显示开关按钮-->
              <div class="sidebar-toggler hidden-phone"></div>
              <!--  begin 侧边栏显示开关按钮 -->
           </li>
           <li>
              <!-- begin 响应快速搜索表单 -->
              <div style="height: 15px;"></div>
              <form class="sidebar-search" style="display: none;">
                 <div class="input-box">
                    <a href="javascript:;" class="remove"></a>
                    <input type="text" placeholder="Search...">
                    <input type="button" class="submit" value=" ">
                 </div>
              </form>
              <!-- end 响应快速搜索表单 -->
            </li>
            <li class="active"><a href="myHomePage.jsp" target="iframemain"><i class="icon-home"></i><span class="title">系统首页 <span class="label-en">Home</span></span> <span class="selected"></span></a></li>
            <li class=""><a href="javascript:;"><i class="icon-shopping-cart"></i><span class="title">订购商城 <span class="label-en">shopping</span></span> <span class="arrow"></span></a>
               <ul class="sub-menu">
                 <li><a href="conditioncommodityPageQuery?start=1&pageSize=9" target="iframemain">商品列表 <span class="label-en"></span></a></li>
                 <li><a href="conditionOrderPageQuery?start=1&pageSize=9&loginid=${user.id}" target="iframemain">我的订单 <span class="label-en"></span></a></li>
               </ul>
            </li>
            <li class=""><a href="javascript:;"><i class="icon-user"></i><span class="title">业务管理 <span class="label-en">business</span></span> <span class="arrow"></span></a>
               <ul class="sub-menu">
                  <li><a href="registeredOrder.jsp" target="iframemain">注册订单 <span class="label-en"></span></a></li>
                  <li><a href="secondPassword.jsp?jspName=reinvestmentAndBonusList" target="iframemain">复投与分红列表 <span class="label-en"></span></a></li>
                  <li><a href="applicationReportingCenter.jsp" target="iframemain">申请报单中心 <span class="label-en"></span></a></li>
			   </ul>
            </li>
            <li class=""><a href="javascript:;"><i class="icon-user"></i><span class="title">激活管理 <span class="label-en">activation</span></span> <span class="arrow"></span></a>
               <ul class="sub-menu">
                  <li><a href="activeOrder" target="iframemain">已激活订单 <span class="label-en"></span></a></li>
                  <li><a href="unactivatedOrder" target="iframemain">未激活订单 <span class="label-en"></span></a></li>
	           </ul>
            </li>
            <li class=""><a href="javascript:;"><i class="icon-tags"></i><span class="title">财务管理 <span class="label-en">Finance</span></span> <span class="arrow"></span></a>
               <ul class="sub-menu">
                  <li><a href="bonusDetails?start=1&pageSize=9" target="iframemain">奖金明细 <span class="label-en"></span></a></li>
                  <li><a href="secondPassword.jsp?jspName=financeStatistics" target="iframemain">财务统计 <span class="label-en"></span></a></li>
                  <li><a href="secondPassword.jsp?jspName=accountWithdrawal" target="iframemain">账户提现 <span class="label-en"></span></a></li>
                  <li><a href="secondPassword.jsp?jspName=accountTransfer" target="iframemain">账户转账 <span class="label-en"></span></a></li>
                  <li><a href="accountConversion.jsp" target="iframemain">账户转换 <span class="label-en"></span></a></li>
                  <li><a href="accountsCharge.jsp" target="iframemain">账户充值 <span class="label-en"></span></a></li>
			   </ul>
            </li>
            <li class=""><a href="javascript:;"><i class="icon-user"></i><span class="title">个人信息 <span class="label-en">system</span></span> <span class="arrow"></span></a>
               <ul class="sub-menu">
				  <li><a href="emailList?start=1&pageSize=9" target="iframemain">邮件管理 <span class="label-en"></span></a></li>
                  <li><a href="secondPassword.jsp?jspName=myAccounts" target="iframemain">我的账户 <span class="label-en"></span></a></li>
                  <li><a href="personalData" target="iframemain">个人资料 <span class="label-en"></span></a></li>
                  <li><a href="thirdPassword.jsp?jspName=changePassword" target="iframemain">修改密码 <span class="label-en"></span></a></li>
			   </ul>
            </li>
            <li class=""><a href="javascript:;" onclick="ClosePage()"><i class="icon-lock"></i><span class="title">安全退出 <span class="label-en">Logout</span></span> <span class=""></span></a></li>
         </ul>
         <!--  end 侧边栏菜单-->
    </div>
    <!-- end 侧边栏 -->
    
    <!-- begin 页 -->
    <div class="page-content" style="-webkit-overflow-scrolling: touch; overflow: auto;">
       <!-- 页面内容--><!-- ***嵌入的页面*** -->
       <iframe src="" marginheight="0" marginwidth="0" frameborder="0" scrolling="auto" width="100%" height="950" allowtransparency="true" id="iframemain" name="iframemain" onload="iFrameHeight();" style="overflow: hidden;"></iframe>
      
    </div>
    <!-- end  页面内容-->
 </div>
 <!-- end 页 -->
  <!-- end 内容 -->
  <!-- begin 页脚 -->
  <div class="footer">
     <div class="footer-inner">2015 © MMoBar.com </div>
     <div class="footer-tools"><span class="go-top"><i class="icon-angle-up"></i></span></div>
  </div>
  <!-- end 页脚 -->





    <!-- begin 核心插件 -->
    <script src="style/js/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="style/js/bootstrap.min.js" type="text/javascript"></script>
    <!--处理兼容问题-->
    <!--[if lt IE 9]>
        <script src="js/excanvas.min.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    <!--处理兼容问题end-->

    <!-- begin 二级导航 -->
    <script src="style/js/app.js" type="text/javascript"></script>
    <script>
        jQuery(document).ready(function () {
            App.init();
        });
    </script>
    <!-- end 二级导航 -->
    <!--<script>
       $(function(){
           $(".page-sidebar-menu li").click(function(){
		      $(this).addClass('active').siblings().removeClass('active');
	       });
	   });
    </script>-->
    <script>
        //获取屏幕高度
        function jqUpdateSize() {
            var height = (($(window).height()));
            $('body').css({
                "min-height": height + "px"

            })
        }
        $(document).ready(jqUpdateSize);
    </script>

</body>

</html>
