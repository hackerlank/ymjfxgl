<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.gqw.dao.commodity.CommodityMapper"%>
<%@page import="com.gqw.controller.commodity.CommodityController"%>
<%@page import="com.gqw.service.CommoditiesServiceImpl"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.gqw.util.SpringInit"%>
<%@page import="com.gqw.bean.Pager"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width" />
    <title>无标题文档</title>
    <link href="style/css/list.css" rel="stylesheet" type="text/css">
    <link href="style/css/cart.css" rel="stylesheet" type="
    text/css">
    <link href="style/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="style/js/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="style/js/jquery.event.drag-1.5.min.js"></script>
    <script type="text/javascript" src="style/js/jquery.touchSlider.js"></script>
    <script type="text/javascript">
    	function selChange(){
    		alert($("#proName").text());
    		var selOption=$("#citySel option:selected").text();
    	}
    </script>
</head>
  <body>
   
    <!--最外层-->
    <div class="biglayer">
        <!--标题-->
        <div class="the_title">
            <p>商品列表</span></p>
        </div>

        <!--当前位置-->
        <ul class="location">
            <li><a href="javascript:void(0)">Home</a></li>
            <li><a href="javascript:void(0)">商品列表</a></li>
        </ul>
        <!--banner图-->
        <div class="main_visual">
            <div class="flicking_con">
                <a href="javascript:;"></a>
            </div>
            <div class="main_image">
                <ul><li><span class="img_1">
                        <img src="style/images/26c6bfbd-0168-492b-a95b-feda6ae9f39d.jpg" alt="头页" ></span></li>                   
                </ul>
                <a href="javascript:;" id="btn_prev"></a><a href="javascript:;" id="btn_next"></a>
            </div>
        </div>
        <!--内容-->
        <div class="data_box ">
            <div class="shop_bg">
                <form action="conditioncommodityPageQuery">
               		<input type="hidden" name="start" value="1">
               		<input type="hidden" name="pageSize" value="9">
                    <ul class="search">
                        <li>
                            <div class="group">
                                <label class="label">商品名称</label>
                                <input type="text" name="proName" id="proName" value="${proName}"  class="input">
                            </div>
                            <div class="group">
                                <label class="label">商品种类</label>
                                <select class="selectbox" onchange="selChange();" id="citySel" name="ProCategory" >
                                    <option  value="">全部</option>
                                        <option value="类型1"   >类型1</option>
                                        <option value="类型2"   >类型2</option>
                                        <option value="类型3"   >类型3</option>
                                </select>
                            </div>
                            <div class="group">
                                <button type="submit" class="searchbtn" value="搜 索"><span class="glyphicon glyphicon-search">搜 索</span> </button>
                            </div>
                        </li>
                    </ul>
                    
                </form>
                <ul class="shop">
                        <c:forEach var="commodity" items="${commoditys}">
 								  	<li>					  	
                        					<div class="item">
                        						<a href="oneCommodity?commodityId=${commodity.id}">
					                                    <img src="style/images/${commodity.images}" class="shop_img"></a>
					                                <p class="price">${commodity.integral} </p>
					                                <p class="name">${commodity.name}</p>
					                                <p class="buy"><a href="oneCommodity?commodityId=${commodity.id}">立即购买</a> </p>
                       					 	</div>
                     				   </li>
  						 </c:forEach>
                </ul>
                <!--分页-->
                <div class="pagetBox">
                    <div class="nextpage cBlack">
                        <ul>
                            <li class="pageleft">
                              <c:if test="${pager.pageIndex>1}">
	                            <a href="conditioncommodityPageQuery?start=1&pageSize=9&proName=${proName}&ProCategory=${ProCategory}">首页</a>
							    <a href="conditioncommodityPageQuery?start=${pager.prev}&pageSize=9&proName=${proName}&ProCategory=${ProCategory}">上一页</a>
							  </c:if>
							  <c:if test="${pager.pageIndex<pager.totalPage}">
							    <a href="conditioncommodityPageQuery?start=${pager.next}&pageSize=9&proName=${proName}&ProCategory=${ProCategory}">下一页</a>
							    <a href="conditioncommodityPageQuery?start=${pager.totalPage}&pageSize=9&proName=${proName}&ProCategory=${ProCategory}">尾页</a>
							  </c:if>
   							</li>
                            <li class="pageright">
                                <div class="ap">

                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--分页end-->
            </div>
        </div>
    </div>
    <!--商品列表end-->
   
  </body>
</html>
