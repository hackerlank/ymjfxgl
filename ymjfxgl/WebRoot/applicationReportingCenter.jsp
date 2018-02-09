<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  <meta name="viewport" content="width=device-width" />
    <title>申请报单中心</title>
    <link href="style/css/StyleSheet.css" rel="stylesheet" />
    <link href="style/css/style.css" rel="stylesheet" />
    <script src="style/js/jquery-1.7.1.min.js"></script>
    <script src="style/js/jquery.unobtrusive-ajax.min.js"></script>
    <script>
        function CancelAgent(apply, id) {
            if (confirm('确定要撤消当前代理申请信息吗？')) {
                $.post("/Agent/CancelAgent", { id: id, apply: apply }, function (data) {
                    if (data == "ok") {
                        alert("撤销成功！");
                        window.location.reload();
                    }
                });
            }

        }
        function AfterAdd(result) {
        alert("提交成功");
            if (result == "ok") {
                alert("提交成功！");
                window.location.reload();
            }
            else {
                alert(result);
            }
        }
        GetCounty(1, '0')
        function GetCounty(Grade, countyCode) {
            if (countyCode == "") {
                return;
            }
            var selOne = "County" + Grade;
            $.post("/Home/GetAreas", { Grade: Grade, countyCode: countyCode }, function (data) {
                if (Grade == 2) {
                    $("#County3").empty();
                }
                $("#" + selOne).empty();
                $("#" + selOne).append("<option value='-1'>请选择</option>");
                $.each(data, function (k, n) {
                    $("#" + selOne).append("<option value='" + n.id + "'>" + n.name + "</option>");
                });
            });
        }
    </script>
</head>
<body>
    <!--最外层-->
    <div class="biglayer">
        

  <!--标题-->
  <div class="the_title">
    <p>申请报单中心<span></span></p>
  </div>
  
  <!--当前位置-->
  <ul class="location">
    <li><a href="#">业务管理</a></li>
    <li><a href="#">申请报单中心</a></li>
  </ul>



        <!--资料box-->
        <div class="data_box">
            

<div class="listing_title">
    <p>申请报单中心</p>
</div>


            
<form action="ApplyAgent" data-ajax="true" data-ajax-method="Post" data-ajax-success="AfterAdd" id="frmSet" method="post"> <div class="dataStyle ">
                    <ul class="index_control" style="display: block">
                        <li>
                            <label>报单中心编号：</label>
                            <input class="long" type="text" disabled  value="txp88888" >
                        </li>
                        <li>
                            <label>前状态：</label>

                            <span style="display: block">可申请报单中心</span>

                        </li>
                        <li>
                            <label>操作：</label>
                                <input name="" type="submit" class="searchbtn" value="提交申请">

                            <input name="id" type="hidden" value="apply">
                        </li>
                    </ul>


                </div>
</form>            
        </div>

    </div>
</body>
</html>
