<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2021/3/3
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=request.getContextPath()%>/"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>首页-餐台监管</title>
    <base>
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
            height: 100%;
            width: 880px;
            float: left;
        }
        .aTable{
            width: 100px;
            height:100px;
            margin-left: 15px;
            margin-bottom: 10px;
            display: inline-block;
            background: #CFCFCF;
            border-radius: 4px;
        }
        #order{
            width: 300px;
            height: 900px;
            background: #f5f5f5;
            float: right;
            margin-top: -30px;
        }
        .check{
            border: none;
            color: #00FF00;
            position: absolute;
            width: 10%;
            height: 10%;
            z-index: 100;
            background-color: rgba(255,255,255,0.1);
            opacity: 0;

        }
        .checked{
            border: 3px dashed #1aed09;/**#28AEDF*/
            box-shadow: 0px 0px 10px 6px #888888;
        }
        .red{
            border: 3px dashed #1aed09;/**#28AEDF*/
            box-shadow: 0px 0px 10px 6px red;
        }
        .tip{
            width: 130px;height: 100%;float: left;border: solid gainsboro 1px;text-align: center;
        }
        .pre{
            display: none;
        }
        .pre1{
            width: 100px;text-align: center;background: orange;position: absolute;
        }
        .reds{
            background: red;
        }
        #tips{width: 100%;height: 30px;background: white;float: left;border-bottom: solid white 1px;}
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
                        <a href="javascript:;">
                            <span class="am-icon-sign-out"></span> 退出
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </header>

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
                <li class="sidebar-nav-heading" id="thisPart">
                    <a href="predetermine/currentDate">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 预定
                    </a>
                </li>
                <li class="sidebar-nav-heading">
                    <a href="snack/list">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 快餐
                    </a>
                </li>


                <li class="sidebar-nav-heading">
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

<form method="post" action="predetermine/add" id="form">

    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">
        <!-- 标题栏 -->
        <div style="width: 100%;height: 30px;background: whitesmoke;float: left;border-bottom: solid white 1px;">
            <div class="tip" style="background: greenyellow">新增预定</div>
            <div class="tip"><a href="predetermine/list">预定列表</a></div>
        </div>
        <div id="tips">
            <%--<div class="tip">日期：</div>--%>
            <div class="tip date reds" >
                今天：<fmt:formatDate value="<%=new Date() %>" pattern="MM月dd日" />
                <input type="hidden" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>" >
            </div>
            <div class="tip date" >
                <fmt:formatDate value="<%= new Date(new Date().getTime() + 24*60*60*1000)%>" pattern="MM月dd日" />
                <input type="hidden" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date(new Date().getTime() + 24*60*60*1000))%>" >
            </div>
            <div class="tip date">
                <fmt:formatDate  value="<%=new Date(new Date().getTime() + 24*60*60*1000*2)%>" pattern="MM月dd日" />
                <input type="hidden" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date(new Date().getTime() + 24*60*60*1000*2))%>" >
            </div>
            <div class="tip date" >
                <input type="date" placeholder="其它">
            </div>
        </div>

        <div id="tables">
            <c:forEach var="table" items="${tables}">
                <div class="aTable"><input type="checkbox"  class="check" name="table_id" value="${table.tableId}">
                    <span>${table.tablesName}</span><br>
                            <div class="pre${table.ordering}"><span>已预订</span></div>
                        </div>
            </c:forEach>

        </div>
        <div id="order">
            <input type="hidden" name="preState" value="1">
            <table width="100%" style="height: 400px;margin-left: 5px;">
                <tr>
                    <td>预定编号</td>
                    <td><input type="text" name="preNum" readonly="readonly" value="${orderNum}" style="border: none;"></td>
                </tr>
                <tr>
                    <td>顾客姓名</td>
                    <td><input type="text" name="custome"></td>
                </tr>
                <tr>
                    <td>联系电话</td>
                    <td><input type="text" name="customeTel"></td>
                </tr>
                <tr>
                    <td>预定人数</td>
                    <td><input type="text" name="customeNum"></td>
                </tr>
                <tr>
                    <td>预定时间</td>
                    <td><input type="date" name="preOrderTime"></td>
                </tr>
                <tr>
                    <td>预定保留时间</td>
                    <td>
                        <select name="keeptime">
                            <c:forEach items="${list}" var="time">
                            <option value="${time.keeptimeId}">${time.keepTime}</option>
                            </c:forEach>
                        </select>
                </tr>
                <tr>
                <td>押金</td>
                <td><input type="text" name="deposit"></td>
                </tr>
                <tr>
                <td>菜品</td>
                <td><input type="submit" value="添加" id="addFood"></td>
            </tr>
                <tr>
                    <td rowspan="2">
                        <input type="submit" value="确认预定" >
                    </td>
                </tr>

            </table>
        </div>
    </div>
</form>
<script type="text/javascript">
    $(function() {
        $("#addFood").click(function () {
            $('form').attr('action','predetermine/foodlist');
        });

        //选中日期
        $('#tips div').click(function () {
            //先删除所有div的reds类
            $('#tips div').removeClass('reds');
            //给当前被点击的span加上red类
            $(this).addClass('reds');
        });

        $('.date').each(function () {
            $(this).click(function () {
                var date = $(this).find("input").val();
//                alert(date);
                $.post('predetermine/preAdd',{date:date},function (data) {
//                    alert(JSON.stringify(data));
                    showData(data);
                });
        });
        });
    });
//添加Json数据
  function showData(data){
     var result = $("#tables")[0];
     result.innerHTML="";
        for (var i=0 ;i<data.length;i++){
            var div = createElement({
                tagName:"div",
                class:"aTable"
            });
            var input = createElement({
                tagName:"input",
                class:"check",
                type:"checkbox",
                name:"table_id",
                value:data[i]['tableId']
            });
            var span = createElement({
                tagName:"span",
                text:data[i]['tablesName']
            });
            var div2 = createElement({
                tagName:"div",
                class:"pre"+(data[i]['ordering']==null ? "":1)
            });
            var span2 = createElement({
                tagName:"span",
                text:"已预订"
            });
            var br = createElement({
               tagName:"br"
            });
            div.appendChild(input);
            div.appendChild(span);
            div.appendChild(br);
            div2.appendChild(span2);
            div.appendChild(div2);
            result.appendChild(div);
        }
        setclick();
    }
//创建Json元素
    function  createElement(elementMsg) {
        var element;
        if(elementMsg['tagName']!=undefined){
            element = document.createElement(elementMsg['tagName']);
        }else{
            return false;
        }
        if(elementMsg['class']!=undefined){
            element.className=elementMsg['class'];
        }
        if(elementMsg['text']!=undefined){
            element.innerHTML=elementMsg['text'];
        }
        if(elementMsg['value']!=undefined){
            element.value=elementMsg['value'];
        }
        if(elementMsg['type']!=undefined){
            element.type=elementMsg['type'];
        }
        if(elementMsg['name']!=undefined){
            element.name=elementMsg['name'];
        }
        return element;
    }
    //获得所有复选框
    setclick();
    function setclick() {
        var checks = document.getElementsByClassName('check');
        for(var i =0; i<checks.length;i++) {
            checks[i].onclick = function () {
                //判断是选中操作还是取消选中操作
                if (this.checked) {
                    this.parentNode.classList.add('checked');
                } else {
                    this.parentNode.classList.remove('checked');
                }
            }
        }
    }


</script>
<script src="assets/js/amazeui.min.js"></script>
</div>
</body>

</html>