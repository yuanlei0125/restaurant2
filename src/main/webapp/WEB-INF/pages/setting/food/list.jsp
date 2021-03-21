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
    <title>菜品管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />

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
        .selectHead{

            border-bottom: 1px solid #cccccc;
            width: 100%;
            height: 50px;
            background: #FAFAFA;
            border-left: 2px solid #cccccc;
            padding-top: 15px;
            padding-left: 20px;

        }
        .mainBody{

            background: #fcfcfc;
            width: 95%;
            height: 700px;
            margin-top: -10px;
            margin-left: 20px;
        }
        .selectHead span{
            font-size: 12px;
            background: #FFFFFF;
            border-radius: 3px;
            margin-left: 10px;
            display: inline-block;
            border: 1px solid #ff4e4c;
            color: #FF4E4C;
            margin-bottom: 10px;
            cursor: pointer;
            padding: 2px;
        }
        .selectHead span:hover,.selectHead span:first-child{
            border: 2px solid #E71C00;
            background: #FF4E4C;
            color: #FFFFFF;
        }

       #foodType{
           width: 18%;
           height:650px;
           background-color: #f5f5f5;
           position: absolute;
       }
        #total{
            width: 75%;height: 650px;position: absolute;margin-left: 220px;}
        #menu{width: 100%;height: 60px;background-color: #e8ebf2}
        #foodList{width: 100%;height: 590px;}
        .images{margin-top: -5px;width: 20px;height: 20px;}
        .sp{width:14%;margin-top: 15px;margin-left: 30px;
            display:inline-block;text-align: center;cursor: pointer;
            border: 1px solid #888888;background-color: #FFFFFF}

        table{width: 100%}
        table tr{
            border-bottom: 1px solid #cccccc;cursor: pointer;
        }
        table tr:hover{
            background: #ADFF2F;
        }
        table tr td{line-height: 40px;vertical-align: middle;text-align: center;}
        .sel{
            background-color: #FFFFFF;
        }
        .selected{
            background: #FFEEDC !important;
        }
        .foodStopState{
            background: #BABABA ;
        }
        .foodSoldOut{background: #ea1328 ;}
        #my_close{float: right; cursor: pointer;}
        #my_close:hover{background: #ea1328;}
        #my_close1{float: right; cursor: pointer;}
        #my_close1:hover{background: #ea1328;}
        #update1{width: 100%;height: 100%;position: fixed;background: rgba(0,0,0,0.6);z-index: 1500;display: none;}
        #update2{width: 60% ; height: 600px;background: #f0f0f0;
            margin-top: 20px;margin-left:400px;
        }
        #images{width: 240px;height: 200px;position: absolute;margin-left: 480px;margin-top: -280px;}
        #tips{width: 500px;text-align: center;font-size: 30px;
            position: fixed;border-radius: 10px;
            margin-left: 240px;margin-top: 200px;z-index: 1500;
        background-color:rgba(0,0,0,0.4);display: none;
        color: #ffffff;}
        #saveType1{width: 100%;height: 100%;position: fixed;background: rgba(0,0,0,0.6);z-index: 1500;display: none;}
        #saveType2{
            width: 400px;height: 240px;position: fixed;
            z-index: 1500;background: #ffffff;margin-top: 100px;margin-left: 500px;
        }
        #saveType2 div{width: 100%;background:#e7eaf1;}
        #inputType{margin-top: 50px;margin-left: 100px;width: 200px;height: 40px;border:1px solid #2600ff; }
        #submitType{margin-top: 50px;margin-left: 100px;width: 200px;background: #2600ff;height: 40px;font-size: 25px;}
    </style>

</head>

<body data-type="index" class="theme-white">

<div id="update1"><div id="update2"><span>菜品信息修改</span><button id="my_close">关闭</button>
    <div class="widget am-cf">

            <form class="tpl-form-line-form" action="food/update" method="post" enctype="multipart/form-data">
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">菜品名称</label>
                    <div class="am-u-sm-9">
                        <input type="text" class="tpl-form-input" name="foodName" value="">
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">菜品编号</label>
                    <div class="am-u-sm-9">
                        <input type="text" class="tpl-form-input" name="foodNum">
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">菜品价格</label>
                    <div class="am-u-sm-9">
                        <input type="text" class="tpl-form-input"name="foodPrice">
                    </div>
                </div>
                <div class="am-form-group">

                    <label class="am-u-sm-3 am-form-label">菜品分类</label>
                    <div class="am-u-sm-9">
                        <select name="foodType"style="width: 200px;height: 40px;border:1px solid #888888">
                            <c:forEach var="foodType" items="${foodTypeList}"><option value="${foodType.typeId}">${foodType.typeName}</option></c:forEach>
                        </select>

                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">菜品状态</label>
                    <div class="am-u-sm-9">
                        <select style="width: 200px;height: 40px;border:1px solid #888888" name="foodState">
                            <c:forEach var="foodState" items="${list}"><option  value="${foodState.foodStateId}">${foodState.foodState}</option></c:forEach>
                        </select>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">菜品口味</label>
                    <div class="am-u-sm-9">
                        <select style="width: 200px;height: 40px;border:1px solid #888888" name="foodFlavor">
                            <c:forEach var="foodFlavor" items="${list1}"><option  value="${foodFlavor.flavorId}">${foodFlavor.flavorName}</option></c:forEach>
                        </select>

                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">菜品规格</label>
                    <div class="am-u-sm-9">
                        <select style="width: 200px;height: 40px;border:1px solid #888888" name="foodSpec">
                            <c:forEach var="foodSpec" items="${list2}"><option value="${foodSpec.specId}">${foodSpec.specName}</option></c:forEach>
                        </select>

                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">菜品介绍</label>
                    <div class="am-u-sm-9">
                        <input type="text" class="tpl-form-input" name="foodDirection">
                    </div>
                </div>
                <div id="images">
                    <div class="am-form-group am-form-file">
                        <div class="tpl-form-file-img">
                            <img onerror="this.src='images/no_preview.png'" src="" width="160px" height="160px" id="img">
                        </div>
                        <button type="button" class="am-btn am-btn-danger am-btn-sm">
                            <i class="am-icon-cloud-upload"></i>修改菜品图片</button>
                        <input type="file" name="file" id="file" onchange="show()">
                    </div>
                </div>
                        <input type="hidden" name="foodImg">
                        <input type="hidden" name="foodId">
                <div class="am-form-group">
                    <div class="am-u-sm-9 am-u-sm-push-3">
                        <input type="submit" value="提交"class="am-btn am-btn-primary tpl-btn-bg-color-success">

                    </div>
                </div>
            </form>
        </div>
</div></div>

<div class="am-g tpl-g">
    <!-- 头部 -->
    <header>
        <!-- logo -->
        <div class="am-fl tpl-header-logo">
            <a href="javascript:;"><img src="assets/img/logo.png" alt=""></a>
        </div>
        <!-- 右侧内容 -->
        <div class="tpl-header-fluid">

            <div class="am-fr tpl-header-navbar">
                <ul>
                    <!-- 欢迎语 -->
                    <li class="am-text-sm tpl-header-navbar-welcome">
                        <a href="javascript:;">欢迎你, <span>${userName}</span> </a>
                    </li>

                    <!-- 退出 -->
                    <li class="am-text-sm">
                        <a href="javascript:;">
                            <span class="am-icon-sign-out"></span> 退出
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </header>
    <!-- 风格切换 -->
    <div class="tpl-skiner">
        <div class="tpl-skiner-toggle am-icon-cog">
        </div>
        <div class="tpl-skiner-content">
            <div class="tpl-skiner-content-title">
                选择主题
            </div>
            <div class="tpl-skiner-content-bar">
                <span class="skiner-color skiner-white" data-color="theme-white"></span>
                <span class="skiner-color skiner-black" data-color="theme-black"></span>
            </div>
        </div>
    </div>
    <!-- 侧边导航栏 -->
    <div class="left-sidebar">
        <!-- 菜单 -->
        <ul class="sidebar-nav">
            <%--<li class="sidebar-nav-heading">Components <span class="sidebar-nav-heading-info"> 附加组件</span></li>--%>
                <li class="sidebar-nav-heading" >
                    <a href="first" class="active">
                        <i class="am-icon-home sidebar-nav-link-logo"></i> 堂食
                    </a>
                </li>
                <li class="sidebar-nav-heading">
                    <a href="predetermine/currentDate">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 预定
                    </a>
                </li>
                <li class="sidebar-nav-heading">
                    <a href="snack/list">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 快餐
                    </a>
                </li>

                <li class="sidebar-nav-heading" id="thisPart">
                    <a href="setting/settinghome"> <span class="sidebar-nav-heading-info am-icon-cog"> 设置</span></a>
                </li>
            <li class="sidebar-nav-link">
                <a href="javascript:;" class="sidebar-nav-sub-title">
                    <i class="am-icon-table sidebar-nav-link-logo"></i> 数据列表
                    <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                </a>
                <ul class="sidebar-nav sidebar-nav-sub">
                    <li class="sidebar-nav-link">
                        <a href="table-list.html">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 文字列表
                        </a>
                    </li>

                    <li class="sidebar-nav-link">
                        <a href="table-list-img.html">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 图文列表
                        </a>
                    </li>
                </ul>
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
            <li class="sidebar-nav-link">
                <a href="404.html">
                    <i class="am-icon-tv sidebar-nav-link-logo"></i> 404错误
                </a>
            </li>

        </ul>
    </div>
    <div id="saveType1"> <div id="saveType2">
      <div><span>菜品类型添加</span><span id="my_close1">关闭</span></div>

        <form action="foodType/addType" method="post">
            <input type="text" name="typeName" placeholder="输入菜品类型"id="inputType"><br>

            <input type="submit" value="提交"id="submitType">

        </form>

    </div></div>
    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">
        <div id="tips"></div>
        <div class="mainBody">
            <div class="selectHead">

                <span> <a href="user/list">用户管理</a></span>
                <span> <a href="food/list">菜品管理</a></span>

            </div>
            <div id="foodType">
            <span style="width:50%;margin-top: 30px;margin-left: 50px; display:block;background-color: #FFFFFF;cursor: pointer;" id="showType">

                <img src="images/jiahao.jpg"class="images">新增分类</span>
            <span style="margin-top: 50px; display:block;text-align: center" class="foodTypeName"><a href="food/list/0">全部菜品</a></span>
                <c:forEach var="foodType" items="${foodTypeList}">
                    <span style="text-align: center; margin-top: 20px;display:block;"class="foodTypeName"><a href="food/list/${foodType.typeId}">${foodType.typeName}</a></span>
                </c:forEach>
            </div>
            <div id="total">
            <div id="menu">
                <span class="sp"><a href="food/preAdd/${typeId}"  id="addFood">
                <img src="images/jiahao.jpg"class="images">新增菜品</a></span>
                <span class="sp" id="show">
                    <img src="images/bianji.jpg"class="images">编辑菜品</span>
                <span class="sp" id="delete"><a id="deleteFood">
                    <img src="images/shanchu.jpg"class="images">删除菜品</a></span>
                <span class="sp" id="stop"><a id="stopFood">
                    <img src="images/tingyong.jpg"class="images">停用菜品</a></span>
            </div>
            <div id="foodList">

                    <table>
                        <tr><td>菜品序号</td><td>菜品编号</td><td>菜品名称</td><td>菜品分类</td><td>菜品售价</td><td>菜品图片</td><td>菜品状态</td></tr>
                        <c:forEach items="${foodList}" var="food">
                   <tr class="foodTable">
                        <td>${food.foodId}</td>
                        <td>${food.foodNum}</td>
                        <td title="${food.flavorName}">${food.foodName}</td>
                        <td>${food.typeName}</td>
                        <td title="${food.specName}">${food.foodPrice}元</td>
                        <td><img src="images/${food.foodImg}" width="40px" height="40px" onerror="this.src='images/no_preview.png'"></td>
                        <td>${food.stateName}</td>
                    </tr>
                </c:forEach></table>
            </div>
            </div>
        </div>
    </div>


</div>


</body>
<script>
    var foodId;
    var types = $(".foodTypeName");
    var tips =document.getElementById('tips');
//    给菜品类型列表添加选中样式
  types[${typeId}].setAttribute("class","sel");
  /** 添加菜品*****************/
$("#addFood").click(function () {
    if({typeId} ==0){
        tips.style.display="block";
        tips.innerHTML="请选择一个菜品进行添加!!!";
        setTimeout("tips.style.display='none'",2000);
        return false;
    }
});

  $(".foodTable").each(function () {
      $(this).click(function () {
       $(".foodTable").removeClass("selected");
         $(this).addClass("selected");
         foodId=$(this).children()[0].innerHTML;
          document.getElementById('deleteFood').href ="food/delete/"+foodId;
          document.getElementById('stopFood').href ="food/stop/"+foodId;
      });
  });

  /************删除菜品***************/
  document.getElementById('delete').onclick=function(){
      if(foodId==undefined){
          tips.style.display="block";
          tips.innerHTML="请选择一个菜品进行删除!!!";
          setTimeout("tips.style.display='none'",2000);
      }
  }
  /****停用菜品*****/
  document.getElementById('stop').onclick=function(){
      if(foodId==undefined){
          tips.style.display="block";
          tips.innerHTML="请先选择一个菜品停用!!!";
          setTimeout("tips.style.display='none'",2000);
      }
  }
$(".foodTable").each(function () {
    $(this).last("td");
    switch ($(this)[0].lastElementChild.innerHTML){
        case "停用":$(this).addClass("foodStopState");break;
        case "售完":$(this).addClass("foodSoldOut");break;
    }

});
/*****添加分类*****/
var close1 = document.getElementById('my_close1');
close1.onclick=function(){
    document.getElementById('saveType1').style.display="none";
}
document.getElementById('showType').onclick=function () {
    document.getElementById('saveType1').style.display="block";
}
/****** 更新菜品*****/
  var close = document.getElementById('my_close');
  close.onclick=function(){
      document.getElementById('update1').style.display="none";
  }
  document.getElementById('show').onclick=function () {
      if(foodId!=undefined){
          document.getElementById('update1').style.display="block";
          findFood();
      }else {
          tips.style.display="block";
          tips.innerHTML="请选择一个菜品进行编辑!!!";
          setTimeout("tips.style.display='none'",2000);
      }
  }
  function findFood() {
      $.get("food/findFood",{id:foodId},function(data) {
          $("[name='foodName']").val(data.foodName);
          $("[name='foodNum']").val(data.foodNum);
          $("[name='foodPrice']").val(data.foodPrice);
          $("[name='foodDirection']").val(data.foodDirection);
          $("[name='foodImg']").val(data.foodImg);
          $("[name='foodId']").val(data.foodId);
          $("[name='foodType']").children().each(function () {
              if( $(this).text()==data.typeName){
                  $(this)[0].setAttribute("selected","selected");
              }
          });
          $("[name='foodState']").children().each(function () {
              if( $(this).text()==data.stateName) {
                  $(this)[0].setAttribute("selected", "selected");
              }
              });
          $("[name='foodFlavor']").children().each(function () {
              if( $(this).text()==data.flavorName) {
                  $(this)[0].setAttribute("selected", "selected");
              }
          });
          $("[name='foodSpec']").children().each(function () {
              if( $(this).text()==data.specName) {
                  $(this)[0].setAttribute("selected", "selected");
              }
          });
          $("#img").attr("src",("images/"+data.foodImg));
      });

  }

/*************************图片预览****************************************/
    var file = document.getElementById('file');
    var img =document.getElementById('img');

    function show() {


        var objUrl = getObjectURL(file.files[0]) ;
        if (objUrl)
        {
            img.style.display="block";
            img.src=objUrl;

        }

    }
    //建立一個可存取到該file的url
    function getObjectURL(file)
    {
        var url = null ;

        if (window.webkitURL!=undefined) {

            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }

</script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/amazeui.datatables.min.js"></script>

</html>

