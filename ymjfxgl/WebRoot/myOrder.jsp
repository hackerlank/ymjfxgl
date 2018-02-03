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
    <title>我的订单</title>
    <link href="style/css/StyleSheet.css" rel="stylesheet" />
    <script src="style/js/jquery-1.7.1.min.js"></script>
    <script src="style/js/jquery.unobtrusive-ajax.min.js"></script>
    <script src="style/js/WdatePicker.js"></script>

<script type="text/javascript" src="/WebResource.axd?d=zUbwwxDCFW_twXMWlBWEw_vFaAIwvjB5e6wm8DhkgaObx-3UjgzYFml8itzV0ktMRuAYCsQDijpkFOwMAFdfCQ2&t=635304888701212866"></script>

</head>
<body>
    <!--最外层-->
    <div class="biglayer">
        

  <!--标题-->
  <div class="the_title">
    <p>我的订单<span></span></p>
  </div>
  
  <!--当前位置-->
  <ul class="location">
    <li><a href="#">订购商城</a></li>
    <li><a href="#">我的订单</a></li>
  </ul>



        <!--资料box-->
        <div class="data_box">
            

<div class="listing_title">
    <p>我的订单</p>
</div>


            <div class="listing_box">
<form action="/Mall/RegOrder" data-ajax="true" data-ajax-method="Post" data-ajax-mode="replace" data-ajax-update="#ListContent" id="searchForm" method="post">                        <label style="margin-left:10px;">购物积分余额：12.00</label>  
                    <ul class="search">   
                        <li>
                            <div class="group">
                                <label class="label">订单编号：</label> 
                                <input name="sOrderID" id="sOrderID" type="text" class="input" size="10"  />
                                <label class="label">订单状态：</label> 
                                <select name="sFlag" id="sFlag" class="selectbox">
                                    <option value="">所有状态</option>
                                    <option value="0">未发货</option>
                                    <option value="1">已发货</option>
                                    <option value="2">已收货</option>
                                </select>
                                <label class="label">订单日期：</label> 
                                <input id="startDate" name="startDate" type="text" class="input"  onclick="WdatePicker()" size="10" value="" readonly="ture" />
                                <label class="label">至</label> 
                            </div>
                            <div class="group">  
                                <input id="overDate" name="overDate" type="text" class="input" onclick="WdatePicker()" size="10" value="" readonly="ture" />
                                <input name="" type="submit" class="searchbtn" value="搜 索" />

                            </div>
                        </li>
                    </ul>  
</form>                <div id="ListContent" class="listing">
                    
<script src="style/js/layer.js"></script>

<script>
    function setGet(id) {
        if (confirm("确定要对当前订单进行收货确认吗？")) {
            $.post("/Mall/setGet", { id: id }, function (data) {
                alert(data);
                window.location.reload();
            });

        }
    }

    function postForm() {
        var id = $("#id").val();
        var exName = $("#exName").val();
        var exOrderID = $("#exOrderID").val();
        var exLink = $("#exLink").val();
        if (exName == "") {
            alert("请填写物流公司名称，如自提请填写自提！");
            //theform.exName.focus();
            return false;
        }
        if (exOrderID == "") {
            alert("请填写物流单号，如没有请填写无！");
            //theform.exOrderID.focus();
            return false;
        }
        if (document.getElementById("action").value == "setSend") {
            if (confirm("确定要进行发货确认吗？")) {
                $.post("/Mall/setSend", { id: id, exName: exName, exOrderID: exOrderID, exLink: exLink }, function (data) {
                    if (data == "ok") {
                        alert("设置成功！")
                        window.location.reload();
                    }
                    else {
                        alert(data);
                    }
                });

            }
        } else {
            if (confirm("确定要保存当前物流信息吗？")) {
                $.post("/Mall/editEX", { id: id, exName: exName, exOrderID: exOrderID, exLink: exLink }, function (data) {
                    if (data == "ok") {
                        alert("设置成功！")
                        window.location.reload();
                    }
                    else {
                        alert(data);
                    }
                });
            }
        }
    }

    function lookPost(id, i) {
        if (i == 0) {

            //document.getElementById("order_id").value = id;

            //var orderid = document.getElementById("o1_" + id).value;
            //document.getElementById("order_1").innerHTML = orderid;

            //var NickName = document.getElementById("o2_" + id).value;
            //$("#NickName").val(NickName)
            ////
            //alert(NickName)
            //document.getElementById("NickName").value = NickName;

            //var Address = document.getElementById("o3_" + id).value
            //document.getElementById("Address").value = Address;

            //var Tels = document.getElementById("o4_" + id).value
            //document.getElementById("Tels").value = Tels;

            //document.getElementById("order_5").innerHTML = document.getElementById("o5_" + id).value;
            //var isSend = document.getElementById("o6_" + id).value;
            //var isGet = document.getElementById("o7_" + id).value;

            //if (isSend == 0 && isGet == 0) {
            //    $("#caozuo").show();
            //}
            //else {
            //    $("#caozuo").hide();
            //}
            //var htmlinfo = document.getElementById("orderInfo").style.display = "block";
            var htmlinfo = document.getElementById("orderInfo_" + id).innerHTML;
            getinfo('收货人信息', htmlinfo)
        }
        else {
            //$("#id").val(id);
            ////document.post_Form.id.value = id;
            //document.getElementById("orderID_Msg").innerHTML = document.getElementById("orderID_" + id).value;
            //if (i == 1) {
            //    document.getElementById("action").value = "setSend";
            //    document.getElementById("submit").value = "确认发货";
            //} else {
            //    document.getElementById("action").value = "editEX";
            //    document.getElementById("submit").value = "保存信息";
            //    document.getElementById("exName").value = document.getElementById("e1_" + id).value;
            //    document.getElementById("exOrderID").value = document.getElementById("e2_" + id).value;
            //    document.getElementById("exLink").value = document.getElementById("e3_" + id).value;
            //}
            //var htmlinfo = document.getElementById("post_Form").style.display = "block";
            var htmlinfo = document.getElementById("setSend_" + id).innerHTML;
            getinfo('发货物流信息填写', htmlinfo)
        }
        //<end if%>
        //document.getElementById("js_Post").style.display = "block";
        //document.getElementById("js_Post").style.width = document.body.scrollWidth;
        //document.getElementById("js_Post").style.height = document.body.scrollHeight * 50 / 100;
        return false;
    }

    function closePost() {
        document.getElementById("js_Post").style.display = "none";
        document.getElementById("orderInfo").style.display = "none";
        document.getElementById("post_Form").style.display = "none";
        return false;
    }
    function EditOrder() {
        //string NickName, Address, Tels;
        var NickName = $("#order_2").val();
        var Address = $("#order_3").val();
        var Tels = $("#order_4").val();
        var id = $("#order_id").val();
        if (confirm("确定提交？")) {
            $.post("/Mall/EditOrder", { NickName: NickName, Address: Address, Tels: Tels, id: id }, function (data) {
                if (data == "ok") {
                    alert("操作成功")
                    window.location.reload();
                }
                else {
                    alert(data);
                }
            });

        }

    }
    //提交后返回结果
    function AfterAdd(result) {
        if (result == "ok") {
            alert("操作成功！");
            window.location.reload();
        }
        else {
            alert(result);
        }
    }
    function delOrder(id) {

        if (confirm("确定取消？")) {
            $.post("/Mall/delOrder", { id: id }, function (data) {
                if (data == "ok") {
                    alert("操作成功")
                    window.location.reload();
                }
                else {
                    alert(data);
                }
            });

        }

    }

    function getinfo(te, htmlinfo) {
        layer.open({
            type: 1 //Page层类型
            , area: ['600px', '300px']
  , title: te
  , shade: 0.6 //遮罩透明度
  , maxmin: true //允许全屏最小化
  , anim: 1 //0-6的动画形式，-1不开启
  , content: htmlinfo
        });
    }
</script>

<table class="ts">
    <tr>
        <th>订单编号</th>
        <th>商品名称</th>
        <th>购买数量</th>
        <th>购买金额</th>
        <th>订单时间</th>
        <th>收货人</th>
        <th style="width:25%" >收货地址</th>
        <th>电话</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
        <tr>
            <input type="hidden" id="orderID_176797" value="2017112802405589271" />
            <td align="center">2017112802<br />
                405589271</td>
            <td align="center">金花茶牡蛎颗粒片（32克/瓶）</td>
            <td align="center">2</td>
            <td align="center">596.00</td>
            <td align="center">2017-11-28</td>
            <td align="center">唐新平</td>
            <td align="center">自提</td>
            <td align="center">18377061863</td>
            <td align="center" style="line-height: 16px;">

                    <span>已发货</span> <br />
                    <span class="cDRed">2017-11-28</span><br />
                
            </td>
            <td align="left" style="line-height: 16px; padding: 4px;">
                <div style="display: none">

                    <div id="orderInfo_176797">
<form action="/Mall/EditOrder" data-ajax="true" data-ajax-method="Post" data-ajax-success="AfterAdd" id="frmSet" method="post">                            <table width="560" border="0" align="center" cellpadding="4" cellspacing="1" style="background-color: #888888; margin: auto; filter: alpha(opacity=100);">
                                
                                <tr>
                                    <td width="30%" align="right" valign="top" bgcolor="#FFFFFF" style="padding-top: 6px;">订单编号：</td>
                                    <td bgcolor="#FFFFFF" valign="top" style="text-align: left; font-weight: normal; font-size: 12px; padding: 4px 4px 0px 0px; line-height: 20px;" class="cDRed">
                                        <div id="order_1" style="margin: 4px; overflow: scroll; overflow-x: hidden; overflow-y: auto;">2017112802405589271</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" nowrap="nowrap" bgcolor="#FFFFFF" style="padding-top: 6px;">收货人姓名：</td>
                                    <td bgcolor="#FFFFFF" valign="top" style="text-align: left">
                                        <div style="margin: 4px; overflow: scroll; overflow-x: hidden; overflow-y: auto;">
                                            <input id="NickName" name="NickName" value="唐新平" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" nowrap="nowrap" bgcolor="#FFFFFF" style="padding-top: 6px;">收货地址：</td>
                                    <td bgcolor="#FFFFFF" valign="top" style="text-align: left">
                                        <div style="margin: 4px; overflow: scroll; overflow-x: hidden; overflow-y: auto;">
                                            <input id="Address" name="Address" value="自提" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" nowrap="nowrap" bgcolor="#FFFFFF" style="padding-top: 6px;">联系电话：</td>
                                    <td bgcolor="#FFFFFF" valign="top" style="text-align: left">
                                        <div style="margin: 4px; overflow: scroll; overflow-x: hidden; overflow-y: auto;">
                                            <input name="Tels" id="Tels" value="18377061863" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" nowrap="nowrap" bgcolor="#FFFFFF" style="padding-top: 6px;">备注信息：</td>
                                    <td bgcolor="#FFFFFF" valign="top" style="text-align: left">
                                        <div id="order_5" style="margin: 4px; overflow: scroll; overflow-x: hidden; overflow-y: auto;">370983198809161379周刚刚帮带</div>
                                    </td>
                                </tr>
                                <tr id="caozuo" style="display:none" >
                                    <td align="right" valign="top" bgcolor="#FFFFFF" style="padding-top: 6px;">操作：</td>
                                    <td bgcolor="#FFFFFF" valign="top" style="text-align: left">
                                        <input type="hidden" id="order_id" name="id"  value="176797" />
                                        <input class="btn" type="submit" value="提交" />
                                    </td>
                                </tr>
                            </table>
</form>                    </div>
                </div>
                
                <a href="javascript:void(0)" style="color:red"  onclick="return lookPost(176797,0)"  >[修改收货人]</a>
                <br />
                    <span>物流公司：1</span>  
                    <br /> <span>物流单号：已自提</span> 
                    <br />
                    <span>查询地址：</span>
                                    <a href="javascript:;" style="color:red" onclick="setGet(176797)" >[确认收货]</a>
            </td>
            
        </tr>
        <tr>
            <input type="hidden" id="orderID_176788" value="2017112802401299990" />
            <td align="center">2017112802<br />
                401299990</td>
            <td align="center">海参牡蛎颗粒片（32克/瓶）</td>
            <td align="center">4</td>
            <td align="center">1192.00</td>
            <td align="center">2017-11-28</td>
            <td align="center">唐新平</td>
            <td align="center">自提</td>
            <td align="center">18377061863</td>
            <td align="center" style="line-height: 16px;">

                    <span>已发货</span> <br />
                    <span class="cDRed">2017-11-28</span><br />
                
            </td>
            <td align="left" style="line-height: 16px; padding: 4px;">
                <div style="display: none">

                    <div id="orderInfo_176788">
<form action="/Mall/EditOrder" data-ajax="true" data-ajax-method="Post" data-ajax-success="AfterAdd" id="frmSet" method="post">                            <table width="560" border="0" align="center" cellpadding="4" cellspacing="1" style="background-color: #888888; margin: auto; filter: alpha(opacity=100);">
                                
                                <tr>
                                    <td width="30%" align="right" valign="top" bgcolor="#FFFFFF" style="padding-top: 6px;">订单编号：</td>
                                    <td bgcolor="#FFFFFF" valign="top" style="text-align: left; font-weight: normal; font-size: 12px; padding: 4px 4px 0px 0px; line-height: 20px;" class="cDRed">
                                        <div id="order_1" style="margin: 4px; overflow: scroll; overflow-x: hidden; overflow-y: auto;">2017112802401299990</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" nowrap="nowrap" bgcolor="#FFFFFF" style="padding-top: 6px;">收货人姓名：</td>
                                    <td bgcolor="#FFFFFF" valign="top" style="text-align: left">
                                        <div style="margin: 4px; overflow: scroll; overflow-x: hidden; overflow-y: auto;">
                                            <input id="NickName" name="NickName" value="唐新平" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" nowrap="nowrap" bgcolor="#FFFFFF" style="padding-top: 6px;">收货地址：</td>
                                    <td bgcolor="#FFFFFF" valign="top" style="text-align: left">
                                        <div style="margin: 4px; overflow: scroll; overflow-x: hidden; overflow-y: auto;">
                                            <input id="Address" name="Address" value="自提" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" nowrap="nowrap" bgcolor="#FFFFFF" style="padding-top: 6px;">联系电话：</td>
                                    <td bgcolor="#FFFFFF" valign="top" style="text-align: left">
                                        <div style="margin: 4px; overflow: scroll; overflow-x: hidden; overflow-y: auto;">
                                            <input name="Tels" id="Tels" value="18377061863" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" nowrap="nowrap" bgcolor="#FFFFFF" style="padding-top: 6px;">备注信息：</td>
                                    <td bgcolor="#FFFFFF" valign="top" style="text-align: left">
                                        <div id="order_5" style="margin: 4px; overflow: scroll; overflow-x: hidden; overflow-y: auto;">370983198809161379周刚刚帮带</div>
                                    </td>
                                </tr>
                                <tr id="caozuo" style="display:none" >
                                    <td align="right" valign="top" bgcolor="#FFFFFF" style="padding-top: 6px;">操作：</td>
                                    <td bgcolor="#FFFFFF" valign="top" style="text-align: left">
                                        <input type="hidden" id="order_id" name="id"  value="176788" />
                                        <input class="btn" type="submit" value="提交" />
                                    </td>
                                </tr>
                            </table>
</form>                    </div>
                </div>
                
                <a href="javascript:void(0)" style="color:red"  onclick="return lookPost(176788,0)"  >[修改收货人]</a>
                <br />
                    <span>物流公司：1</span>  
                    <br /> <span>物流单号：已自提</span> 
                    <br />
                    <span>查询地址：</span>
                                    <a href="javascript:;" style="color:red" onclick="setGet(176788)" >[确认收货]</a>
            </td>
            
        </tr>
</table>
<!--end box-->
<div class="nextpage cBlack">
    <ul>
        <li class="pageleft">共 1 页 2 条记录，当前为第 1 页</li>
        <li class="pageright">

            <!-- AspNetPager V6.0.0 for VS2005  Copyright:2003-2006 Webdiyer (www.webdiyer.com) -->
            <div class="ap">
                
<!--MvcPager v2.0 for ASP.NET MVC 3.0+ © 2009-2013 Webdiyer (http://www.webdiyer.com)-->

            </div>
            <!-- AspNetPager V6.0.0 for VS2005 End -->
        </li>
    </ul>
</div>

<!--#include file="incBottom.asp"-->
<div id="js_Post" style="z-index: 100000; position: absolute; top: 45%; left: 0px; width: 100%; font-weight: bold; font-size: 16px; text-align: center; filter: alpha(opacity=98); color: #666666; display: none;">
    <div style="height: 50px">&nbsp;</div>

</div>


                </div>
            </div>
        </div>
    </div>
</body>
</html>
