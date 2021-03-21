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
    <title>添加菜品</title>
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
            margin-left:600px;margin-top: 60px;z-index:1500;display: none;
            background-color:rgba(0,0,0,0.4);
            color: #ffffff;}

    </style>

</head>
<body data-type="widgets">
<script src="assets/js/theme.js"></script>
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
                        <a href="javascript:;">欢迎你, <span>Amaze UI</span> </a>
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
            <li class="sidebar-nav-heading" id="thisPart">

                <a href="index.html" class="active">
                    <i class="am-icon-home sidebar-nav-link-logo"></i> 堂食
                </a>

            </li>
            <li class="sidebar-nav-heading">
                <a href="tables.html">
                    <i class="am-icon-table sidebar-nav-link-logo"></i> 预定
                </a>
            </li>
            <li class="sidebar-nav-heading">
                <a href="form.html">
                    <i class="am-icon-wpforms sidebar-nav-link-logo"></i> 订单

                </a>
            </li>
            <li class="sidebar-nav-heading">
                <a href="chart.html">
                    <i class="am-icon-bar-chart sidebar-nav-link-logo"></i> 营业报表

                </a>
            </li>

            <li class="sidebar-nav-heading">
                <a href=""> <span class="sidebar-nav-heading-info am-icon-cog"> 设置</span></a>
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
    <div id="tips"></div>
    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">


        <div class="row-content am-cf">


            <div class="row">

                <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title am-fl">添加菜品</div>

                        </div>
                        <div class="widget-body am-fr">

                            <form class="am-form tpl-form-line-form" action="food/add" method="post" enctype="multipart/form-data">
                                <div class="am-form-group">
                                    <label class="am-u-sm-3 am-form-label">菜品名称</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" class="tpl-form-input" name="foodName">
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
                                        <input type="text" class="tpl-form-input" value="${foodTypeName}">
                                        <input type="hidden" value="${foodTypeId}" name="foodType">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                <label class="am-u-sm-3 am-form-label">菜品状态</label>
                                <div class="am-u-sm-9">
                                    <select data-am-selected="{searchBox: 1}" name="foodState">
                                        <c:forEach var="foodState" items="${list}"><option value="${foodState.foodStateId}">${foodState.foodState}</option></c:forEach>
                                    </select>

                                </div>
                            </div>
                                <div class="am-form-group">
                                    <label class="am-u-sm-3 am-form-label">菜品口味</label>
                                    <div class="am-u-sm-9">
                                        <select data-am-selected="{searchBox: 1}" name="foodFlavor">
                                            <c:forEach var="foodFlavor" items="${list1}"><option value="${foodFlavor.flavorId}">${foodFlavor.flavorName}</option></c:forEach>
                                        </select>

                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label class="am-u-sm-3 am-form-label">菜品规格</label>
                                    <div class="am-u-sm-9">
                                        <select data-am-selected="{searchBox: 1}" name="foodSpec">
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

                                <div class="am-form-group">
                                    <label  class="am-u-sm-3 am-form-label">菜品图片</label>
                                    <div class="am-u-sm-9">
                                        <div class="am-form-group am-form-file">
                                            <div class="tpl-form-file-img">
                                                <img src=""width="180px" height="180px" id="img">
                                            </div>
                                            <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                                <i class="am-icon-cloud-upload"></i>添加菜品图片</button>
                                            <input type="file" name="file" id="file" onchange="show()">
                                        </div>

                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <input type="submit" value="提交" name="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/amazeui.datatables.min.js"></script>

<script type="text/javascript">
    /*****表单验证**************/
    var tips =document.getElementById('tips');
    $(function () {
    $("[name=foodName]:text").blur(function () {
        if($(this).val()==""){
            tips.style.display="block";
            tips.innerHTML="菜品名称不能为空!!!";
        }else{
            tips.innerHTML="";
            $.get("food/check",{foodName:$(this).val()},function (data) {

                switch (data){
                    case 1:
                        tips.style.display="block";
                        tips.innerHTML="菜品名称存在,请重输!!!";break;
                    case 2:
                        tips.style.display="block";
                        tips.innerHTML="菜品名称可用!!!";
                        setTimeout("tips.style.display='none'",2000);break;
                }
            });
        }

    });
    });
    /*******阻止提交*******/
    $(function() {
        $("[name=submit]:submit").click(
            function() {
                if (tips.innerHTML=="菜品名称存在,请重输!!!"
                    ||tips.innerHTML=="菜品名称不能为空!!!") {
                    return false;
                }
            });
    });
    /******图片预览*******/
    var file = document.getElementById('file');
    var img =document.getElementById('img');
    img.style.display="none";
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
</body>
</html>

