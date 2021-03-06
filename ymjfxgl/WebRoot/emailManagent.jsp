<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.gqw.util.PublicParameters"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<meta name="viewport" content="width=device-width" />
		<title>邮件管理</title>
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
		<script src="style/js/kindeditor.js">
</script>
		<script src="style/js/zh_CN.js">
</script>
		<script src="style/js/prettify.js">
</script>
		<link href="style/js/default.css" rel="stylesheet" />
		<script src="style/jskindeditor-min.js">
</script>

	</head>
	<body>
		<script>
KindEditor.ready(function(K) {
	var editor = K.editor( {
		uploadJson : '/Msg/UpMainPic/?ASPSESSID=' + "whm35v2unigkasf2gbprksxf",
		allowFileManager : true
	});
	K('#btnPhotoID').click(function() {
		editor.loadPlugin('image', function() {
			editor.plugin.imageDialog( {
				showRemote : false,
				clickFn : function(url, title, width, height, border, align) {
					//K('#upmsg').attr("src", url);
				$("#upmsg").text("上传成功")
				K('#annex').val(url);
				editor.hideDialog();
			}
			});
		});
	});
});

//提交后返回结果
function AfterAdd(result) {
	if (result == "ok") {
		alert("发送成功！");
		window.location.reload();
	} else {
		
		window.location.reload();
	}
}
function MsgDel(Obj) {
	if (confirm("是否删除信息？")) {
		var Eid = $(Obj).attr("Eid");
		$.post("/Msg/DeleteMsg", {
			id : Eid
		}, function(data) {
			if (data == "ok") {
				window.location.reload();
			} else {
				alert(data);
			}
		})
	}

}
</script>
		<!--最外层-->
		<div class="biglayer">


			<!--标题-->
			<div class="the_title">
				<p>
					邮件管理
					<span></span>
				</p>
			</div>

			<!--当前位置-->
			<ul class="location">
				<li>
					<a href="#">个人信息</a>
				</li>
				<li>
					<a href="#">邮件管理</a>
				</li>
			</ul>


			<!--资料box-->
			<div class="data_box">



				<div class="listing_title">
					<p>
						邮件管理
					</p>
				</div>


				<div class="listing_box">
					<form action="MsgSend" data-ajax="true"
						data-ajax-method="Post" data-ajax-success="AfterAdd" id="frmSet"
						method="post">
						<ul class="search">
							<li>
								<div class="group" style="clear: both;">
									<label class="label">
										留言对象：
									</label>
									<input name="userID" id="userID" value="" class="input"
										type="text">
									<input name="acp" id="acp1" value="1"
										onclick="$('#userID').val('公司');" type="radio">
									<label for="acp1">
										公司
									</label>
									<input name="acp" id="acp2" value="2" checked="checked"
										onclick="$('#userID').val('');" type="radio" />
									<label for="acp2">
										其它订单
									</label>
								</div>
								<div class="group" style="clear: both;">
									<label class="label">
										留言标题：
									</label>
									<input name="title" value="" class="input" type="text">

								</div>
								<div class="group" style="clear: both;">
									<label class="label">
										留言内容：
									</label>
									<textarea name="content" rows="6" style="width: 500px;"
										class="input"></textarea>
								</div>
								<div class="group" style="clear: both;">
									<input class="searchbtn" value="提 交" type="Submit">
									<input name="Reset" class="searchbtn" value="重 填" type="reset">
								</div>
							</li>
						</ul>
					</form>
					<form action="/Msg/MsgList" data-ajax="true" data-ajax-method="Get"
						data-ajax-mode="replace" data-ajax-update="#ListContent"
						id="searchForm" method="post">
						<ul class="search">
							<li>
								<div class="group">
									<label class="label">
										状态
									</label>
									<select name="isRed" id="isRed" class="selectbox">
										<option value="">
											全部
										</option>
										<option value="0">
											未读
										</option>
										<option value="1">
											已读
										</option>
									</select>
								</div>
								<div class="group">
									<label class="label">
										发送日期
									</label>
									<input name="startDate" type="text" maxlength="20"
										id="startDate" onclick="WdatePicker()" class="input" />
								</div>
								<div class="group">
									<label class="label">
										至
									</label>
									<input name="overDate" type="text" id="overDate"
										onclick="WdatePicker()" class="input" />
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
									发送者
								</th>
								<th scope="col">
									标题
								</th>
								<th scope="col">
									内容
								</th>
								<th scope="col">
									接收者
								</th>
								<th scope="col">
									是否已读
								</th>
								<th scope="col">
									发送时间
								</th>
								<th scope="col">
									操作
								</th>
							</tr>
								<c:forEach var="email" items="${emails}">
							<tr>
									
									<th>${email.fasongzhe}</th>
									<th>${email.title}</th>
									<th>${email.text}</th>
									<th>${email.addressee}</th>
									<th>${email.status}</th>
									<th>${email.time}</th>
									<th>操作</th>
							</tr>
								</c:forEach>

						</table>
						<div class="nextpage cBlack">
							<ul style="">
								<li class="pageleft">
									共 0 条, 1 / 0 页
								</li>
								<li class="pageright">
									<!-- AspNetPager V6.0.0 for VS2005  Copyright:2003-2006 Webdiyer (www.webdiyer.com) -->


									<!--MvcPager v2.0 for ASP.NET MVC 3.0+ © 2009-2013 Webdiyer (http://www.webdiyer.com)-->
									<div data-ajax="true" data-ajax-dataformid="#searchForm"
										data-ajax-method="Post" data-ajax-update="#ListContent"
										data-invalidpageerrmsg="页索引无效" data-maxpages="0"
										data-mvcpager="true" data-outrangeerrmsg="页索引超出范围"
										data-pageparameter="page"
										data-urlformat="/Msg/MsgList?page=__page__">
										<a disabled="disabled">首页</a>&nbsp;&nbsp;
										<a disabled="disabled">上一页</a>&nbsp;&nbsp;
										<a disabled="disabled">下一页</a>&nbsp;&nbsp;
										<a disabled="disabled">尾页</a>&nbsp;&nbsp;
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
