<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>奖金明细</title>
		<link href="style/css/StyleSheet.css" rel="stylesheet" />
		<script src="style/js/jquery-1.7.1.min.js">
</script>
		<script src="style/js/jquery.unobtrusive-ajax.min.js">
</script>
		<script src="style/js/WdatePicker.js">
</script>
		<script type="text/javascript"
			src="/WebResource.axd?d=zUbwwxDCFW_twXMWlBWEw_vFaAIwvjB5e6wm8DhkgaObx-3UjgzYFml8itzV0ktMRuAYCsQDijpkFOwMAFdfCQ2&t=635304888701212866">
</script>
	</head>
	<body>
		<!--最外层-->
		<div class="biglayer">


			<!--标题-->
			<div class="the_title">
				<p>
					奖金明细
					<span></span>
				</p>
			</div>

			<!--当前位置-->
			<ul class="location">
				<li>
					<a href="#">财务管理</a>
				</li>
				<li>
					<a href="#">奖金明细</a>
				</li>
			</ul>


			<!--资料box-->
			<div class="data_box">


				<div class="listing_title">
					<p>
						奖金明细
					</p>
				</div>


				<div class="listing_box">
					<form action="/Bonus/BonusInfo" data-ajax="true"
						data-ajax-method="Post" data-ajax-mode="replace"
						data-ajax-update="#ListContent" id="searchForm" method="post">
						<ul class="search">
							<li>
								<div class="group" style="display: none">
									<label class="label">
										订单编号
									</label>
									<input name="UserID" type="text" id="UserID" class="input" />
								</div>
								<div class="group">
									<label class="label">
										日期
									</label>
									<input name="dstar" type="text" id="dstar"
										onfocus="WdatePicker()" value="2018-01-24" class="input" />
								</div>
								<div class="group">
									<label class="label">
										至
									</label>
									<input name="dstop" type="text" id="dstop"
										onfocus="WdatePicker()" value="" class="input" />
								</div>
								<div class="group">
									<label class="label">
										奖励类型：
									</label>
									<select name="cat" class="selectbox">
										<option value="">
											默认
										</option>
										<option value="1">
											分红奖
										</option>
										<option value="2">
											直推奖
										</option>
										<option value="3">
											见点奖
										</option>
										<option value="4">
											服务津贴
										</option>
										<option value="5">
											管理奖
										</option>
										<option value="6">
											全国董事
										</option>

									</select>
								</div>
								<div class="group">
									<label class="label">
										排序
									</label>
									<select name="sc" class="selectbox">
										<option value="">
											默认
										</option>
										<option value="1">
											高到低
										</option>
										<option value="2">
											低到高
										</option>

									</select>
								</div>
								<div class="group">
									<input type="submit" name="btnLevelUp" value=" 搜 索 "
										id="btnLevelUp" class="searchbtn" />
								</div>
							</li>
						</ul>
					</form>
					<div id="ListContent" class="listing">

						<table class="ts" cellspacing="0" border="0" id="GridView1"
							style="border-collapse: collapse;">
							<tr>
								<th scope="col">
									时间
								</th>
								<th scope="col">
									订单编号
								</th>
								<th scope="col">
									分红奖
								</th>
								<th scope="col">
									直推奖
								</th>
								<th scope="col">
									见点奖
								</th>
								<th scope="col">
									服务津贴
								</th>
								<th scope="col">
									管理奖
								</th>
								<th scope="col">
									全国董事
								</th>
								<th scope="col">
									管理费
								</th>
								<th scope="col">
									小计
								</th>

								<th scope="col">
									操作
								</th>
							</tr>
								<c:forEach var="jiangjinmingxi" items="${jiangjinmingxis}">
							<tr>
								<td><fmt:formatDate value="${jiangjinmingxi.time}" pattern="yyyy-MM-dd"/></td>
								<td>${name}</td>
								<td>${jiangjinmingxi.fenhong}</td>
								<td>${jiangjinmingxi.zhituijiang}</td>
								<td>${jiangjinmingxi.jiandianjiang}</td>
								<td>${jiangjinmingxi.fuwujintie}</td>
								<td>${jiangjinmingxi.guanlijiang}</td>
								<td>${jiangjinmingxi.quanguodongshi}</td>
								<td>${jiangjinmingxi.guanlifei}</td>
								<td>${jiangjinmingxi.xiaoji}</td>
								<td>查看明细</td>
							</tr>
								</c:forEach>
							<tr>
								<td>
									2018-02-03
								</td>
								<td>
									txp88888
								</td>
								<td>
									12.39
								</td>
								<td>
									0.00
								</td>
								<td>
									0.00
								</td>
								<td>
									0.00
								</td>
								<td>
									0.00
								</td>
								<td>
									0.00
								</td>

								<td>
									0.74
								</td>
								<td>
									11.65
								</td>


								<td>
									<a
										href="/Bonus/BonusInfo_u?achiveTime=2018/2/3 0:00:00&uid=113898">查看明细</a>
								</td>
							</tr>
							

						</table>
						<div class="nextpage cBlack">
							<ul style="">
								<li class="pageleft">
									共 11 条, 1 / 2 页
								</li>
								<li class="pageright">
									<!-- AspNetPager V6.0.0 for VS2005  Copyright:2003-2006 Webdiyer (www.webdiyer.com) -->


									<!--MvcPager v2.0 for ASP.NET MVC 3.0+ © 2009-2013 Webdiyer (http://www.webdiyer.com)-->
									<div data-ajax="true" data-ajax-dataformid="#searchForm"
										data-ajax-method="Post" data-ajax-update="#ListContent"
										data-invalidpageerrmsg="页索引无效" data-maxpages="2"
										data-mvcpager="true" data-outrangeerrmsg="页索引超出范围"
										data-pageparameter="page"
										data-urlformat="/Bonus/BonusInfo?page=__page__">
										<a disabled="disabled">首页</a>&nbsp;&nbsp;
										<a disabled="disabled">上一页</a>&nbsp;&nbsp;1&nbsp;&nbsp;
										<a data-pageindex="2" href="/Bonus/BonusInfo?page=2">2</a>&nbsp;&nbsp;
										<a data-pageindex="2" href="/Bonus/BonusInfo?page=2">下一页</a>&nbsp;&nbsp;
										<a data-pageindex="2" href="/Bonus/BonusInfo?page=2">尾页</a>&nbsp;&nbsp;
										<input type="text" value="1" data-pageindexbox="true" />
										<input type="button" data-submitbutton="true" value="跳转" />
									</div>
									<!--MvcPager v2.0 for ASP.NET MVC 3.0+ © 2009-2013 Webdiyer (http://www.webdiyer.com)-->


									<!-- AspNetPager V6.0.0 for VS2005 End -->


								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</body>
</html>

