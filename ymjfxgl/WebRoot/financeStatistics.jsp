<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
 <meta name="viewport" content="width=device-width" />
    <title>财务统计</title>
    <link href="style/css/StyleSheet.css" rel="stylesheet" />
    <script src="style/js/WdatePicker.js"></script>
    <script src="style/js/jquery-1.7.1.min.js"></script>
    <script src="style/js/jquery.unobtrusive-ajax.min.js"></script>
<script type="text/javascript" src="/WebResource.axd?d=zUbwwxDCFW_twXMWlBWEw_vFaAIwvjB5e6wm8DhkgaObx-3UjgzYFml8itzV0ktMRuAYCsQDijpkFOwMAFdfCQ2&t=635304888701212866"></script>


</head>
<body>

    <!--最外层-->
    <div class="biglayer">
        

  <!--标题-->
  <div class="the_title">
    <p>财务统计<span></span></p>
  </div>
  
  <!--当前位置-->
  <ul class="location">
    <li><a href="#">财务管理</a></li>
    <li><a href="#">财务统计</a></li>
  </ul>



        <!--资料box-->
        <div class="data_box">
            

<div class="listing_title">
    <p>财务统计</p>
</div>


<form action="/Bonus/CashInfo" data-ajax="true" data-ajax-method="Get" data-ajax-mode="replace" data-ajax-update="#ListContent" id="searchForm" method="post">                <ul class="search">
                    <li>
                        <div class="group" style="display:none " >
                            <label class="label">
                                订单编号：</label>
                            <input name="UserID" id="UserID" type="text" value="" size="12" class="input" />


                        </div>
                        <div class="group">
                            <label class="label">财务类型：</label>
                            <select name="sFlag" id="sFlag"  class="selectbox" >
                                <option value="">所有类型</option>
                                <option value="Opmem">开通订单</option>
                                <option value="getAt4">赠送购物积分</option>
                                <option value="AoR">账户充值</option>
                                <option value="take">账户提现</option>
                                <option value="mIn">账户转换</option>
                                <option value="tEr">账户转入</option>
                                <option value="tOu">账户转出</option>
                                <option value="shop">购物</option>
                                
                                <option value="catAll">所有奖励</option>
                                    <option value="cat1">分红奖</option>
                                    <option value="cat2">直推奖</option>
                                    <option value="cat3">见点奖</option>
                                    <option value="cat4">服务津贴</option>
                                    <option value="cat5">管理奖</option>
                                    <option value="cat6">全国董事</option>


                            </select>
                        </div>
                        <div class="group">
                            <label class="label">结算日期：</label><input id="startDate" name="startDate" type="text" onclick="WdatePicker()" class="input" value="2018-02-03" readonly="ture" />
                        </div>
                        <div class="group">
                            <label class="label">至</label>
                            <input id="overDate" name="overDate" type="text" onclick="WdatePicker()" class="input" value="" readonly="ture" />
                        </div>
                        <div class="group">
                            <input name="" type="submit" class="searchbtn" value="搜 索" />
                        </div>
                    </li>
                </ul>
</form>            <div id="ListContent" class="listing">
                <table cellspacing="0" border="0" id="GridView1" style="border-collapse: collapse;" class="ts">
    <tr>
        <th width="6%" nowrap="nowrap">订单编号</th>
        <th width="6%" nowrap="nowrap">类型</th>
        <th width="6%" nowrap="nowrap">增加金额</th>
        <th width="6%" nowrap="nowrap">扣除金额</th>
        <th width="6%" nowrap="nowrap">电子币</th>
        <th width="6%" nowrap="nowrap">奖金币</th>
        <th width="6%" nowrap="nowrap">种子币</th>
        <th width="6%" nowrap="nowrap">购物积分</th>
   
        <th width="6%" nowrap="nowrap">时间</th>
        <th nowrap="nowrap">说明</th>
    </tr>
    <c:forEach var="caiwutongji" items="${caiwutongjis}">
    	<tr>
    		<td>${user.username}</td>
    		<td>${caiwutongji.type}</td>
    		<td>${caiwutongji.zengjiajine}</td>
    		<td>${caiwutongji.kouchujine}</td>
    		<td>${account.dianzibi}</td>
    		<td>${account.jiangjinbi}</td>
    		<td>${account.zhongzibi}</td>
    		<td>${account.shopjifen}</td>
    		<td><fmt:formatDate value="${caiwutongji.time}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
    		<td>${caiwutongji.shuoming}</td>
    	</tr>
    </c:forEach>
        <tr>
            <td align="center" nowrap="nowrap">txp88888</td>
            <td align="center" nowrap="nowrap">分红奖 </td>
            <td align="center" nowrap="nowrap">12.39</td>
            <td align="center" nowrap="nowrap">0.74</td>
            <td align="center" nowrap="nowrap">0.00</td>
            <td align="center" nowrap="nowrap">97.28</td>
            <td align="center" nowrap="nowrap">598.16</td>
            <td align="center" nowrap="nowrap">12.00</td>
            <td align="center" nowrap="nowrap">2018/2/3 1:10:00</td>
            <td align="center" style="text-align: left; line-height: 14px;">获得公司所发分红奖:12.39，扣管理费+0.74<br /><span class="cDRed">注:6.99进奖金币 ;4.66进种子币;</span></td>
        </tr>


</table>
<div class="nextpage cBlack">
    <ul style="">
        <li class="pageleft">共 1 条, 1 / 1 页</li>
        <li class="pageright">
            <!-- AspNetPager V6.0.0 for VS2005  Copyright:2003-2006 Webdiyer (www.webdiyer.com) -->
           
                
<!--MvcPager v2.0 for ASP.NET MVC 3.0+ © 2009-2013 Webdiyer (http://www.webdiyer.com)-->
<div data-ajax="true" data-ajax-dataformid="#searchForm" data-ajax-method="Post" data-ajax-update="#ListContent" data-invalidpageerrmsg="页索引无效" data-maxpages="1" data-mvcpager="true" data-outrangeerrmsg="页索引超出范围" data-pageparameter="page" data-urlformat="/Bonus/CashInfo?page=__page__"><a disabled="disabled">首页</a>&nbsp;&nbsp;<a disabled="disabled">上一页</a>&nbsp;&nbsp;1&nbsp;&nbsp;<a disabled="disabled">下一页</a>&nbsp;&nbsp;<a disabled="disabled">尾页</a>&nbsp;&nbsp;<input type="text" value="1" data-pageindexbox="true"/><input type="button" data-submitbutton="true" value="跳转"/></div>
<!--MvcPager v2.0 for ASP.NET MVC 3.0+ © 2009-2013 Webdiyer (http://www.webdiyer.com)-->

              
            <!-- AspNetPager V6.0.0 for VS2005 End -->


        </li>
    </ul>
</div> 

            </div>
        </div>
    </div>

</body>
</html>
