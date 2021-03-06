<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.gqw.util.PublicParameters"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <base href="<%=basePath%>">
  <meta name="viewport" content="width=device-width" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>商品详情</title>
  <link href="style/css/list.css" rel="stylesheet" type="text/css">
  <link href="style/css/cart.css" rel="stylesheet" type="text/css">
  <link href="style/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="style/css/pipei.css" rel="stylesheet" type="text/css">
  <script src="style/js/jquery-1.7.1.min.js"></script>
  <script src="style/js/jquery.unobtrusive-ajax.min.js"></script>
  <script>
  
    //提交后返回结果
    function AfterAdd(result) {
        if (result == "ok") {
            alert("提交成功！");
            window.location.href="/mall/RegOrder";
        }
        else {
            alert(result);
        }
    }
    function editProduct(id,d){
        var v=document.getElementById("bs");
        var l=document.getElementById("leave").value;
        if(v.value=="" || isNaN(v.value)){
            v.value=1;
        }
        var vv=v.value*1;
        if(d=="+"){
            if(vv<l*1) vv=vv+1;
        }else{
            if(vv>1) vv=vv-1;
        }
        v.value=vv;
        return false;
    }

    function buyProduct(id,i){
        var v=document.getElementById("bs");
        if(v.value=="" || isNaN(v.value)){
            alert("请输入大于0的购买数量！");
            v.focus();
            return false;
        }
        if(v.value*1<1 || parseInt(v.value*1)!=v.value*1){
            alert("请输入大于0的整数！");
            v.focus();
            return false;
        }
        if(v.value*1>197025952){
            alert("购买数量不能大于当前的库存量！");
        v.focus();
        return false;
    }
    lookInfo();
    }

    function chkForm(theform){
        if(theform.num.value=="" || isNaN(theform.num.value)){
            alert("商品购买数量有误");
            return false;
        }
        if(theform.num.value*1>197025952){
            alert("当前商品库存不足");
        return false;
    }
    if(theform.nickName.value==""){
        alert("请填写收货人姓名");
        theform.nickName.focus();
        return false;
    }
    if(theform.address.value==""){
        alert("请填写收货地址");
        theform.address.focus();
        return false;
    }
    if(theform.tels.value==""){
        alert("请填写收货人联系电话");
        theform.tels.focus();
        return false;
    }
    return confirm("确定要提交当前订单吗？\n提示：提交后将直接从您的账户中扣除金额，是否继续？");
    }

    function lookInfo(){
        document.getElementById("num").value=document.getElementById("bs").value;
        document.getElementById("ps1").value=document.getElementById("bs").value;
        document.getElementById("myMoney").innerHTML="&nbsp;"+(document.getElementById("bs").value*100.00).toFixed(2);
        document.getElementById("js_look").style.display="block";
    }

    function closeInfo(){
        document.getElementById("js_look").style.display="none";
    }
    
</script>
</head>
<body>
  <!--最外层-->
  <div class="biglayer">
    <!--标题-->
    <div class="the_title">
      <p><span>商品列表</span></p>
    </div>
    <!--当前位置-->
    <ul class="location">
      <li><a href="#">Home</a></li>
      <li><a href="#">商品详情</a></li>
    </ul>
  <!--内容-->
  <div class="data_box "> 
    <div class="goods_details_box">
      <div class="img_box"><img src="style/images/04cb3efd-a99c-408d-8ef0-e7b71b1808d5.jpg"></div>
      <div class="introduce">
        <ul>
         
            <li><h4>${commodity.name}</h4></li>
            <li>价格：<span>${commodity.integral}</span></li>
            <li>商品库存： <span>${commodity.numbers}</span>件</li>
            <li>上架时间：${commodity.shelftime}</li>
            <li> 购买数量：
               <input type="text" name="bs" id="bs" value="1" OnKeyUp="this.value=this.value.replace(/\D/g,'')" onpaste="this.value=this.value.replace(/\D/g,'')" onblur="if(this.value=='' || isNaN(this.value)){this.value=1}else{if(this.value*1>197025952){this.value='197025952'}}" class="shuliang">
            </li>
            <li><input type="hidden" id="leave" name="leave" value="197025952" />
                 <a href="javascript:;" class="btn_buy"  onclick="buyProduct(3,0);" >立即购买</a>
            </li>
         
        </ul>
      </div>
      <div class="clear"></div>
      <!--商品描述-->
      <div class="history">
        <h2>商品描述</h2>
      </div>
      <div class="details-box">
        <p><span style="font-family:SimHei;line-height:1.5;font-size:14px;">〖产品名称〗 ${commodity.name} &nbsp;</span></p>
        <p><span style="font-family:SimHei;font-size:14px;">〖产品类型〗${commodity.type}</span></p>
        <p><span style="line-height:1.5;font-family:SimHei;font-size:14px;">〖规 &nbsp; &nbsp;格〗 ${commodity.guige}</span></p>
        <p><span style="line-height:1.5;font-family:SimHei;"><span style="font-size:14px;">〖净&nbsp;含&nbsp;量〗 ${commodity.jinghanliang}</span><br/></span></p>
        <p><span style="font-family:SimHei;font-size:14px;">〖产品标准〗 ${commodity.biaozhun}</span></p>
        <p><span style="font-family:SimHei;font-size:14px;">〖许可证号〗 ${commodity.xukezheng}</span></p>
        <p><span style="font-family:SimHei;font-size:14px;">〖贮藏条件〗 ${commodity.chucangtiaojian}</span></p>
        <p><span style="font-family:SimHei;font-size:14px;">〖保 质 期〗 ${commodity.baozhiqi}</span></p>
        <p><span style="font-family:SimHei;font-size:14px;">〖食用方法〗${commodity.shiyongfangfa}</span></p>
        <p><span style="font-family:SimHei;font-size:14px;">〖注意事项〗 ${commodity.zhiyishixiang}</span></p>
        <p><br/></p>
      </div>
      <!--商品描述end--> 
    </div>
  </div>
</div>

<!--#include file="incBottom.asp"-->
<div id="js_look" style="z-index: 100000; position: absolute; top: 200px; left: 0px; width: 100%; font-weight: bold; font-size: 16px; text-align: center; filter: alpha(opacity=98); color: #666666; display: none;">
<form action="insertOrder" data-ajax="true" data-ajax-method="Post" data-ajax-success="AfterAdd" id="frmSet" method="post">       
 <input type="hidden" name="loginid" value="${loginid}">
 <table width="524" border="1" align="center" cellpadding="4" cellspacing="1" bgcolor="#aa0000" style="background-color: #20afd5; margin: auto; filter: alpha(opacity=100);">
   <tr><td height="30" colspan="2" align="center" valign="top" bgcolor="#C9DBE0" style="color: #FFFFFF;">
          <div style="float: left; width: 55%; text-align: right;">提交订单</div>
          <div style="float: right"><img src="shangpinxiangqing/images/close.gif" width="14" height="15" title="关闭" style="cursor: pointer" onclick="" /></div>
       </td>
   </tr>
   <tr><td width="110" align="right" bgcolor="#FFFFFF">商品名称：</td>
       <td align="left" bgcolor="#FFFFFF" style="font-size: 12px; font-weight: normal;">&nbsp;${commodity.name}<input type="hidden" name="commodityName" value="${commodity.name}" /></td>
   </tr>
   <tr rowspan="2">
       <td align="right" bgcolor="#FFFFFF" >商品价格：</td>
       <td align="left" bgcolor="#FFFFFF" style="font-size: 12px; font-weight: normal;"><span style="color:#f00">${commodity.integral}</span><input type="hidden" name="commodityPrice" value="${commodity.integral}" /></td> 
   </tr>
   <tr><td align="right" bgcolor="#FFFFFF">购买数量：</td>
       <td align="left" bgcolor="#FFFFFF" ><input name="ps1" id="ps1" size="25" maxlength="80" style="width:130px;margin-left:4px;" /></td>
   </tr>
   <tr><td align="right" bgcolor="#FFFFFF">收货人：</td>
       <td align="left" bgcolor="#FFFFFF"><input name="nickName"  id="nickName" size="25" maxlength="18" style="width:130px;margin-left:4px;" value="<%=PublicParameters.truename %>" /></td>
   </tr>
   <tr><td align="right" bgcolor="#FFFFFF">收货地址：</td>
       <td align="left" bgcolor="#FFFFFF"><input name="address" value="<%=PublicParameters.adress %>" id="address" size="25" maxlength="80" style="width:130px;margin-left:4px;" /></td>
   </tr>
   <tr><td align="right" bgcolor="#FFFFFF">联系电话：</td>
       <td align="left" bgcolor="#FFFFFF"><input name="tels" id="tels" size="25" style="width:130px;margin-left:4px;" value="<%=PublicParameters.phonenumber %>" /></td>
   </tr>
   <tr><td align="right" bgcolor="#FFFFFF">备注：</td>
       <td align="left" bgcolor="#FFFFFF"><textarea name="about" cols="25" id="about" style="width: 400px; height: 100px; margin-left: 4px;"></textarea></td>
   </tr>
   <tr style="display:none">
       <td align="right" bgcolor="#FFFFFF">商品总金额：</td>
       <td align="left" bgcolor="#FFFFFF" style="font-size: 12px; font-weight: normal;">&nbsp;<span id="myMoney">0.00</span><span style="color: #f00"></span></td>
   </tr>
 </table>
 <table width="524" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#aa0000" style="background-color: #aa0000; margin: auto; filter: alpha(opacity=100);">
   <tr><td height="30" align="center" bgcolor="#FFFFFF">
          <input type="hidden" name="num" id="num" value="0" />
          <input type="hidden" name="id" value="3" />
          <input name="" type="submit" class="searchbtn" value="提交订单" onclick="closeInfo()"/>
          <input name="" type="button" class="searchbtn" value="取 消" onclick="closeInfo()" />
       </td>
   </tr>
 </table>
</form>
</div>
</body>
</html>
