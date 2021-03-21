<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2021/3/3
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <base href="<%=request.getContextPath()%>/"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>快餐管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="assets/css/app.css">
    <script src="assets/js/jquery.min.js"></script>
    <style type="text/css">
        .sidebar-nav li:hover ,#thisPart{
            border-right: 2px solid #FF4336;
            border-left: 2px solid #FF4336;
            background: #FFEEDC !important;
        }
        a{
            display: inline-block;
            color: #5c5c5c;
            width: 100%;
            height: 100%;
        }
        #tips{width: 500px;text-align: center;font-size: 30px;
            position: fixed;border-radius: 10px;
            margin-left: 450px;margin-top: 200px;z-index: 1500;
            background-color:rgba(0,0,0,0.4);display: none;
            color: #ffffff;}
        #navigationBar{width: 160px;position: absolute;height: 570px;background: #FFFFFF;}
        #foodType{
            width: 100px;
            height: 570px;
            background-color: #fafafa;
            position: absolute;
            margin-left:1240px;margin-top: 63px;
            border-left:2px solid #cccccc;border-right:2px solid #cccccc;
        }
        .sel{background-color: #7FFF00 !important; }
        #snackList{
            width: 720px;height: 570px;position: absolute;margin-left:500px;margin-top: 63px;
            background: #FFFFFF;
        }
        .foodSnack{width: 100px;height:80px;background:#f8e5ba;
            color: red;border:1px solid #00c848;
            float: left;margin-left: 16px;border-radius: 5px;margin-top: 10px;cursor: pointer;}
        .foodSnack:hover{background:#7FFF00; }
        .foodSnack span{margin-left: 5px;}
        #snackNum{width: 300px;position: absolute;margin-left: 180px;
            height:570px;margin-top: 63px;background: #fafafa;
            border-left:2px solid #cccccc;border-right:2px solid #cccccc;}
        #page{width: 100%;}
        #titleList{width:1160px;height: 60px;margin-left: 180px;position: absolute;
        border-bottom: 2px solid #cccccc;background: #fefefe;}
        #titleList1{width: 100%;height: 30px;margin-top: 15px;}
        #titleList1 select{width:100px;height: 30px;cursor: pointer;border:none;border-radius: 5px;
        box-shadow: 0px 0px 1px 1px #999999;margin-left: 180px;background:#BFFFD6;}
        #titleList1 div{width:100px;height: 30px;cursor: pointer;border:none;border-radius: 5px;
            box-shadow: 0px 0px 1px 1px #999999;margin-left: 40px;background:#BFFFD6;position: absolute;
        text-align: center;line-height: 30px;vertical-align: middle;}
        #titleList1 select:hover{background: #7FFF00;border: none;}
        #titleList1 button{width:100px;height: 30px;border:none;border-radius: 5px;
            box-shadow: 0px 0px 1px 1px #999999;margin-left:40px;background: #BFFFD6;}
        #titleList1 button:hover{background: #7FFF00;}
        #order{width: 100%;height: 70px;background:#BFFFD6;border-bottom: 1px solid #ffffff; }
        #order input{background: rgba(0,0,0,0);height: 35px;vertical-align: middle;border: none;font-size: 17px;}

        #number{margin-right: 4px;color: red;font-size: 20px;margin-left: 4px;}
        #snackPrice{margin-left: 40px;color: red;font-size: 20px;}
        .sp{margin-left: 10px;}
        #spans{color: red;font-size: 20px;}
        .orderFood{width: 100%;height: 30px;background: #f8e5ba;border-bottom: 1px solid #BABABA;cursor: pointer;}
        .orderFood span{display: inline-block;font-family: '楷体';}
        .caiName{margin-left: 10px;width:140px;}
      .lastSpan{color: red;font-size: 20px;}
        .count{font-size: 20px;color: red;}
        .fen{font-size: 20px;width: 10px !important;}
        .yuan{font-size: 20px;color: red;margin-left: 30px;font-family: '微软雅黑' !important;}
        .wei{font-size: 20px;color: red;}
        .foodNameSpan{height:50px;display: block;font-family: KaiTi;color: #aa3333}
       .foodTypeName{text-align: center; margin-top: 20px;display:block;cursor: pointer;}
        #update1{width: 100%;height: 100%;position: fixed;background: rgba(0,0,0,0.6);z-index: 1500;display: none;}
        #update2{width: 400px;height: 240px;position: fixed; z-index: 1500;background: #ffffff;margin-top: 100px;margin-left: 500px;}
        #update2 div{width: 100%;background:#e7eaf1;height: 25px;}
        #my_close{float: right; cursor: pointer;line-height: 20px;}
        #my_close:hover{background: #ea1328;}
        #my_close1{float: right; cursor: pointer;}
        #my_close1:hover{background: #ea1328;}
        #my_close2{margin-top: 10px;margin-left: 100px;width: 200px;background: #7FFF00;height: 40px;font-size: 25px;}
        #my_close2:hover{background: #ea1328;}
        #submit{margin-top: 50px;margin-left: 100px;width: 200px;background: #7FFF00;height: 40px;font-size: 25px;}
        #inputType{margin-top: 50px;margin-left: 100px;width: 200px;height: 40px;border:1px solid #2600ff; }
        #memberDiv{width: 400px;height: 240px;position: fixed; z-index: 1500;background:#BFFFD6;margin-top: 100px;margin-left: 500px;
        display: none;}
        #memberTel{margin-top: 50px;margin-left: 100px;width: 200px;height: 40px;border:1px solid #2600ff;}
        #submit1{margin-top: 50px;margin-left: 100px;width: 200px;background: #7FFF00;height: 40px;font-size: 25px;}
        #memberDiv div{width: 100%;background:#e7eaf1;height: 25px;}
        #content{width: 400px;height: 240px;position: fixed; z-index: 1500;background:#BFFFD6;margin-top: 100px;margin-left: 500px;
            display: none;}
        #content div{width: 100%;background:#e7eaf1;height: 25px;text-align: center;}

      .memberSpan{margin-left:10px;line-height: 50px;}
      #sum1{width: 100%;height: 100%;position: fixed;background: rgba(0,0,0,0.6);z-index: 1500;display: none;}
        #sum{width: 400px;height: 450px;position: fixed; z-index: 1500;background:#BFFFD6;margin-top: 100px;margin-left: 500px;}
        #sum div{width: 100%;background:#e7eaf1;height: 25px;}
        #submit2{margin-top: 20px;margin-left: 100px;width: 200px;background: #7FFF00 !important;height: 40px;
            font-size: 25px;vertical-align: middle !important;line-height: 40px !important;}
        #my_close3{float: right; cursor: pointer;}
        #my_close3:hover{background: #ea1328;}
        #sum i{margin-left: 10px;}
        #sum input{background: none;height: 40px;width: 200px;border:none;line-height: 60px;vertical-align: -1px;}
        #sum textarea{background: none;width: 240px;height: 100px;resize: none;border: none;}
    </style>

</head>
<body>
<script src="assets/js/theme.js"></script>
<div id="page">
    <div id="titleList">
      <div id="titleList1">
            <div>
           牌号:<span id="orderNo">${snackNum.numName}</span>
            </div>
          <select id="people">
              <option>选择人数</option><option>1</option>
              <option>2</option><option>3</option><option>4</option><option>5</option>
              <option>6</option><option>7</option><option>8</option><option>9</option>
          </select>

          <button id="edit" fName="" fPrice="">编辑</button>
          <button id="delete" fName="">删除</button>
          <button id="clear">清空</button>
          <button id="member">会员</button>
          <button id="sumOrder">结账</button>
      </div>
    </div>
<div id="navigationBar">
        <ul class="sidebar-nav">

            <li class="sidebar-nav-heading">
                <a href="first" class="active">
                    <i class="am-icon-home sidebar-nav-link-logo"></i> 堂食
                </a>
            </li>
            <li class="sidebar-nav-heading">
                <a href="predetermine/currentDate">
                    <i class="am-icon-table sidebar-nav-link-logo"></i> 预定
                </a>
            </li>
            <li class="sidebar-nav-heading" id="thisPart">
                <a href="snack/list">
                    <i class="am-icon-table sidebar-nav-link-logo"></i> 快餐
                </a>
            </li>

            <li class="sidebar-nav-heading">
                <a href="setting/settinghome"> <span class="sidebar-nav-heading-info am-icon-cog"> 设置</span></a>
            </li>

            <li class="sidebar-nav-link">
                <a href="sign-up.html">
                    <i class="am-icon-clone sidebar-nav-link-logo"></i> 注册
                    <span class="am-badge am-badge-secondary sidebar-nav-link-logo-ico am-round am-fr am-margin-right-sm">6</span>
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="login.html">
                    <i class="am-icon-key sidebar-nav-link-logo"></i> 登录
                </a>
            </li>


        </ul>
</div>
    <div id="tips"></div>
    <div id="update1"> <div id="update2">
        <div><span>数量修改</span><span id="my_close">关闭</span></div>
         <input type="text"  placeholder="请输入数量"id="inputType"><br>
        <button id="submit">确定</button>
    </div></div>
     <div id="memberDiv">
        <div><span>会员查询</span><span id="my_close1">关闭</span></div>

        <input type="text"  placeholder="请输手机号" id="memberTel"><br>
            <button id="submit1">确定</button>
    </div>
    <div id="content">
        <div>会员信息</div>
        <i class="memberSpan">姓名：</i><span id="memberName"></span><br>
        <i class="memberSpan">会员：</i><span id="level"></span><br>
        <i class="memberSpan">余额：</i><span id="balance"></span>元<br>
                        <button id="my_close2">确定</button>
    </div>
    <div id="sum1">
    <div id="sum">
        <div><span>结账</span><span id="my_close3">关闭</span></div>
        <form action="order/update" method="post">
            <i>单号：</i><input type="text" name="orderNum" readonly="readonly" value="${order.orderNum}"><br>
            <i>人数：</i><input type="text" name="peopleNum" readonly="readonly"><br>
            <i>总价：</i><input type="text" name="yuanjia" readonly="readonly"><br>
            <i>实收：</i><input type="text" name="price" readonly="readonly"><br>
            <i>收银：</i><input type="text" name="orderCashier" readonly="readonly"><br>
            <i>会员：</i><input type="text" name="memberLevel" readonly="readonly"><br>
            <i>内容：</i><textarea readonly="readonly" name="content"></textarea><br>
                <input type="hidden" name="orderId" value="${order.orderId}">
                <input type="hidden" name="id">
            <input type="hidden" name="orderId" value="${order.orderType}">
            <input type="submit"  value="结账" id="submit2">

        </form>
    </div>
    </div>
    <div id="snackNum">
        <div id="order">

        <span style="line-height: 32px;display:inline-block;vertical-align: middle; "class="sp">单号:</span>
                <input type="text" value="${order.orderNum}" readonly="readonly"><br>
                <span class="sp">已点<span id="number"></span>项，总计<span id="snackPrice"></span><span id="spans">.00</span></span>

        </div>

    </div>
    <div id="snackList">
    <c:forEach items="${foodList}" var="food">
    <div class="foodSnack" foodName="${food.foodName}" foodPrice="${food.foodPrice}">
        <span class="foodNameSpan"> ${food.foodName}</span>

        <span>￥${food.foodPrice}.00</span>
    </div>
    </c:forEach>

    </div>
    <div id="foodType">

        <span class="foodTypeName"foodTypeId=0 style="margin-top: 50px">全部菜品</span>
        <c:forEach var="foodType" items="${foodTypeList}">
            <span class="foodTypeName" foodTypeId="${foodType.typeId}">
                ${foodType.typeName}</span>
        </c:forEach>
    </div>

</div>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/amazeui.datatables.min.js"></script>
<script src="assets/js/jquery.cookie.js"></script>
<script type="text/javascript">
    var foodMap ={};
    var snackNum = $("#snackNum");
    var tips=document.getElementById('tips');
/*********订单数据*********/
//关闭按钮
var close = document.getElementById('my_close');
    close.onclick=function(){
        document.getElementById('update1').style.display="none";
    }
var close1 = document.getElementById('my_close1');
    close1.onclick=function(){
        document.getElementById('memberDiv').style.display="none";
    }
var close2 = document.getElementById('my_close2');
    close2.onclick=function(){
        document.getElementById('content').style.display="none";
    }
var close3 = document.getElementById('my_close3');
    close3.onclick=function(){
        document.getElementById('sum1').style.display="none";
    }
$("#edit").click(function () {
if($(this)[0].getAttribute("fName")==""){
    tips.style.display="block";
    tips.innerHTML="请选择操作对象!!!";
    setTimeout("tips.style.display='none'",2000);
}else {
    document.getElementById('update1').style.display="block";
}
});
/*******************结账**********************/
$.cookie("userName","${user.userName}");
$("[name='orderCashier']").val($.cookie("userName"));
$("#sumOrder").click(function () {
    document.getElementById('sum1').style.display="block";
    if($("#people").val()=="选择人数"){
        $("[name='peopleNum']").val(1);
    }else {
        $("[name='peopleNum']").val($("#people").val());
    }

    $("[name='yuanjia']").val($("#snackPrice").text());

    if(vip["level"]==undefined){
        $("[name='memberLevel']").val("不是会员");

        $("[name='price']").val($("#snackPrice").text());
    }else {
        $("[name='memberLevel']").val(vip["level"]);
       var k=vip["discount"];
       var memberId=vip["memberId"];
       var snackPrice=($("#snackPrice").text()*(k*100))/100;
        $("[name='price']").val(snackPrice);
        $("[name='id']").val(memberId);
    }
    var str="";
    var strs="";
    $(".orderFood").each(function () {
    str=$(this)[0].children[0].innerHTML+$(this)[0].children[1].innerHTML+$(this)[0].children[2].innerHTML;
    strs+=str+",";

});
    var lengths=strs.length;
    $("[name='content']").text(strs.substring(0,lengths-1));
});
/******************会员模块***********************/
$("#member").click(function () {
    document.getElementById('memberDiv').style.display="block";
    $("#memberTel").val("");
    $("#memberName").text("");
    $("#level").text("");
    $("#balance").text("");
});
    var vip={};
    $("#submit1").click(function () {
    var tel=$("#memberTel").val();
    document.getElementById('memberDiv').style.display="none";

    $.get("member/find",{tel:tel},function (data) {
        if(data==""){
            tips.style.display="block";
            tips.innerHTML="会员号码不存在!!!";
            setTimeout("tips.style.display='none'",2000);
        }else {
            $("#memberName").text(data.memberName);
            $("#level").text(data.level.levelName);
            $("#balance").text((data.balance)/100);
            document.getElementById('content').style.display="block";
            setTimeout("document.getElementById('content').style.display='none'",6000);
             vip["level"] =data.level.levelName;
             vip["discount"]=data.level.discount;
             vip["memberId"]=data.memberId;
        }

    });

});
 /**********更新数量******************************/
 $("#submit").click(function () {
        var  orderNum=$("#inputType").val();
        if(orderNum==""){
            orderNum=0;
        }
        var fPrice=parseInt($("#edit")[0].getAttribute("fPrice"));
        $(".orderFood").each(function () {
            if($(this)[0].children[0].innerHTML==$("#edit")[0].getAttribute("fName")){
               var a=$(this);
                a[0].children[1].innerHTML="";
                a[0].children[1].innerHTML=orderNum;
              var d=parseInt(a[0].children[4].innerHTML);
                  a[0].children[4].innerHTML="";
                var  totalPrice=fPrice*parseInt(orderNum);
                a[0].children[4].innerHTML=totalPrice;
                var totalNum=parseInt($("#snackPrice")[0].innerHTML)+totalPrice-parseInt(d);
                $("#snackPrice")[0].innerHTML="";
                $("#snackPrice")[0].innerHTML=totalNum;
                $("#inputType").val("");
            }
        });
        document.getElementById('update1').style.display="none";

    });
 /************删除***************/
 $("#delete").click(function () {
     if($(this)[0].getAttribute("fName")==""){
         tips.style.display="block";
         tips.innerHTML="请选择操作对象!!!";
         setTimeout("tips.style.display='none'",2000);
     } else {
         $(".orderFood").each(function () {
             if($(this)[0].children[0].innerHTML==$("#delete")[0].getAttribute("fName")){
                 var e=$(this)[0].children[4].innerHTML;

                 $(this).remove();
                 foodMap[$("#delete")[0].getAttribute("fName")]=undefined;
                 $("#delete")[0].setAttribute("fName","");
                 $("#edit")[0].setAttribute("fName","");
                 var totalNum=parseInt($("#snackPrice")[0].innerHTML)-parseInt(e);
                 $("#snackPrice")[0].innerHTML="";
                 $("#snackPrice")[0].innerHTML=totalNum;
                 var num=$(".orderFood").length;
                 $("#number")[0].innerHTML="";
                 $("#number")[0].innerHTML=num;
             }
         });
     }
 });
 /***************清空模块********/
$("#clear").click(function () {

    $(".orderFood").each(function () {
        foodMap[$(this)[0].children[0].innerHTML]=undefined;
        $(this).remove();
    });
    $("#snackPrice")[0].innerHTML="";
    $("#number")[0].innerHTML="";
});
/*********按类型划分**********/
 $(".foodTypeName").each(function () {
    $(this).click(function () {
        $(".foodTypeName").removeClass("sel");
        $(this).addClass("sel");
        var foodTypeId=$(this).attr("foodTypeId");
        $.get("snack/typeList",{id:foodTypeId},function (data) {
            var bigDiv=$("#snackList");
            bigDiv[0].innerHTML="";
          if(data.length>0){
              for(var i=0;i<data.length;i++){
                  var div=creEle({tagName:"div",class:"foodSnack",foodName:data[i]['foodName'],foodPrice:data[i]['foodPrice']});
                  var span1=creEle({tagName:"span",class:"foodNameSpan",text:data[i]['foodName']});
                  var span2=creEle({tagName:"span",text:"￥"+data[i]['foodPrice']+".00"});
                  div.appendChild(span1);
                  div.appendChild(span2);
                  bigDiv.append(div);
              }
          }
            $(".foodSnack").each(function(){
                $(this).click(function () {
                    var foodName= $(this)[0].foodName;
                    var foodPrice=$(this)[0].foodPrice;
                    if(foodMap[foodName]==undefined) {
                        var div = creEle({tagName: "div", class: "orderFood"});
                        var span = creEle({tagName: "span", text: foodName,class:"caiName"});
                        var span1 = creEle({tagName: "span", text: foodPrice, class: "lastSpan"});
                        var span2 = creEle({tagName: "span", text: 1, class: "count"});
                        var span3= creEle({tagName: "span", text: "份",class:"fen"});
                        var span4= creEle({tagName: "span", text: "￥",class: "yuan"});
                        var span5= creEle({tagName: "span", text: ".00",class: "wei"});
                        div.appendChild(span);
                        div.appendChild(span2);
                        div.appendChild(span3);
                        div.appendChild(span4);
                        div.appendChild(span1);
                        div.appendChild(span5);
                        snackNum.append(div);
                        foodMap[foodName]=1;
                    }else{
                        $(".orderFood").each(function () {
                            var count=parseInt($(this)[0].children[1].innerHTML);
                            var price=parseInt($(this)[0].children[4].innerHTML);
                            if($(this)[0].children[0].innerHTML==foodName){
                                $(this)[0].children[1].innerHTML="";
                                $(this)[0].children[4].innerHTML="";
                                $(this)[0].children[1].innerHTML= count +1;
                                $(this)[0].children[4].innerHTML=price+parseInt(foodPrice);
                            }
                        });
                    }
 /*****给生成的div添加点击事件********************/
                    $(".orderFood").each(function () {
                        $(this).click(function () {
                            $(".orderFood").removeClass("sel");
                            var a= $(this);
                            a.addClass("sel");
                            var b = a[0].children[1].innerHTML;
                            var c = a[0].children[4].innerHTML;
                            var fPrice=parseInt(c)/parseInt(b);
                            $("#edit")[0].setAttribute("fName",$(this)[0].children[0].innerHTML);
                            $("#delete")[0].setAttribute("fName",$(this)[0].children[0].innerHTML);
                            $("#edit")[0].setAttribute("fPrice",fPrice);
                        });
                    });
 /***************************************/
                    var num=$(".orderFood").length;
                    $("#number")[0].innerHTML="";
                    $("#number")[0].innerHTML=num;
                    var total=0;
                    $(".orderFood").each(function () {
                        var price=parseInt($(this)[0].children[4].innerHTML);
                        total+=price;
                    });
                    $("#snackPrice")[0].innerHTML="";
                    $("#snackPrice")[0].innerHTML=total;
                });
            });
        });
    });
});
/*******点单********/
$(".foodSnack").each(function(){
        $(this).click(function () {
            var foodName= $(this)[0].getAttribute("foodName");
            var foodPrice=$(this)[0].getAttribute("foodPrice");
            if(foodMap[foodName]==undefined) {
                var div = creEle({tagName: "div", class: "orderFood"});
                var span = creEle({tagName: "span", text: foodName,class:"caiName"});
                var span1 = creEle({tagName: "span", text: foodPrice, class: "lastSpan"});
                var span2 = creEle({tagName: "span", text: 1, class: "count"});
                var span3= creEle({tagName: "span", text: "份",class:"fen"});
                var span4= creEle({tagName: "span", text: "￥",class: "yuan"});
                var span5= creEle({tagName: "span", text: ".00",class: "wei"});
                div.appendChild(span);
                div.appendChild(span2);
                div.appendChild(span3);
                div.appendChild(span4);
                div.appendChild(span1);
                div.appendChild(span5);
                snackNum.append(div);
                foodMap[foodName]=1;
            }else{
               $(".orderFood").each(function () {
                   var count=parseInt($(this)[0].children[1].innerHTML);
                   var price=parseInt($(this)[0].children[4].innerHTML);
                  if($(this)[0].children[0].innerHTML==foodName){
                      $(this)[0].children[1].innerHTML="";
                      $(this)[0].children[4].innerHTML="";
                      $(this)[0].children[1].innerHTML= count +1;
                      $(this)[0].children[4].innerHTML=price+parseInt(foodPrice);
                  }
               });
            }
            /*****给生成的div添加点击事件********************/
            $(".orderFood").each(function () {

                $(this).click(function () {
                    $(".orderFood").removeClass("sel");
                    var a= $(this);
                    a.addClass("sel");
                    var b = a[0].children[1].innerHTML;
                    var c = a[0].children[4].innerHTML;
                    var fPrice=parseInt(c)/parseInt(b);

                    $("#edit")[0].setAttribute("fName",$(this)[0].children[0].innerHTML);
                    $("#delete")[0].setAttribute("fName",$(this)[0].children[0].innerHTML);
                     $("#edit")[0].setAttribute("fPrice",fPrice);

                });
            });
            /***************************************/
            var num=$(".orderFood").length;
            $("#number")[0].innerHTML="";
            $("#number")[0].innerHTML=num;
            var total=0;
            $(".orderFood").each(function () {
                var price=parseInt($(this)[0].children[4].innerHTML);
                total+=price;
            });
            $("#snackPrice")[0].innerHTML="";
            $("#snackPrice")[0].innerHTML=total;
        });
    });
/******** 创建元素**********/
function creEle(elemsg){
        var ele;
         ele =  document.createElement(elemsg['tagName']);
        if(elemsg['text']!=undefined){
            ele.innerHTML = elemsg['text'];
        }
        if(elemsg['class']!=undefined){
            ele.className=elemsg['class'];
        }if(elemsg['foodName']!=undefined){
            ele.foodName=elemsg['foodName'];
        }if(elemsg['foodPrice']!=undefined){
            ele.foodPrice=elemsg['foodPrice'];
        }
        return ele;
    }
</script>
</body>
</html>

