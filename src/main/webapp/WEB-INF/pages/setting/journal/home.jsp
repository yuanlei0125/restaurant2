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
    <title>首页-餐台监管</title>
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
        .selectHead{
            margin-top: 20px;
            border-bottom: 1px solid #cccccc;
            width: 100%;
            height: 90px;
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
            border: 1px solid #FF4E4C;
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
        #tables{
            width: 100%;
        }
        .aTable{
            margin-left: 15px;
            display: inline-block;
            background: #CFCFCF;
            border-radius: 4px;

        }
    </style>

</head>

<body data-type="index" class="theme-white">

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
                        <a href="exit">
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
                <li class="sidebar-nav-heading" >
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


    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">

    </div>

<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/amazeui.datatables.min.js"></script>
<script src="assets/js/dataTables.responsive.min.js"></script>
<script src="assets/js/app.js"></script>
</div>
</body>

</html>