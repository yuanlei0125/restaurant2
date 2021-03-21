<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
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
        .tips{width: 100%;height: 30px;background: whitesmoke;float: left;border-bottom: solid white 1px;}
        .bottom{
            width: 100px;height: 100%;
            background: greenyellow;
            float: right;margin-right: 10px;
            text-align: center;
            line-height: 30px;
            vertical-align:middle;
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

    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">
        <!-- 标题栏 -->
        <div class="tips">
            <div class="tip" ><a href="predetermine/currentDate">新增预定</a></div>
            <div class="tip" style="background: greenyellow">预定列表</div>
        </div>
        <div class="tips">
            <div class="tip">
                <select id="date" style="width: 100%;height: 100%;">
                    <% Calendar cal = Calendar.getInstance();%>
                    <% cal.add(Calendar.DATE, +1);%>
                    <option value="0" >预定时间</option>
                    <option  value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>">
                        今天&nbsp;<%=new SimpleDateFormat("MM-dd").format(new Date())%>
                    </option>
                    <option  value="<%=new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime())%>">
                        明天&nbsp;<%=new SimpleDateFormat("MM-dd").format(cal.getTime())%>
                    </option>
                    <% cal.add(Calendar.DATE, +1);%>
                    <option value="<%=new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime())%>">
                        后天&nbsp;<%=new SimpleDateFormat("MM-dd").format(cal.getTime())%>
                    </option>
                </select>
            </div>
            <div class="tip">
               <select id="state" style="width: 100%;height: 100%;">
                        <option value="0">预定状态</option>
                   <c:forEach var="state" items="${state}">
                        <option value="${state.id}">${state.name}</option>
                   </c:forEach>
               </select>
            </div>
            <div class="tip" style="width: 150px;">
                <select id="time" style="width: 100%;height: 100%;">
                    <option value="0">按预定时间顺序</option>
                    <option value="1">按创建时间倒序</option>
                </select>
            </div>
        </div>

        <table width="100%" class="table-condensed table-striped table-hover" >
            <tr>
                <th></th>
                <th>顾客姓名</th>
                <th>联系方式</th>
                <th>预定时间</th>
                <th>就餐人数</th>
                <th>预定状态</th>
                <th>押金</th>
                <th>预定桌位</th>
                <th>预定菜品</th>
                <th>备注</th>
            </tr>
            <c:forEach var="pre" items="${preOrders}">
                <tr>
                    <td><input type="radio" name="order" value="${pre.preOrderId}"></td>
                    <td>${pre.custome}</td>
                    <td>${pre.customeTel}</td>
                    <td>
                        <fmt:formatDate value="${pre.preOrderTime}" pattern=" yyyy-MM-dd HH:mm:ss" />
                    </td>
                    <td>${pre.customeNum}</td>
                    <td>
                        <c:forEach var="state" items="${state}">
                           <c:if test="${pre.preState==state.id}">
                                 ${state.name}
                           </c:if>
                        </c:forEach>
                    </td>
                    <td>${pre.deposit}</td>
                    <td>
                        <c:forEach var="table" items="${tables}">
                        <c:if test="${table.preOrderId==pre.preOrderId}">
                            <c:forEach var="t" items="${tablesList}">
                                <c:if test="${table.tableId==t.tableId}">
                                    ${t.tablesName}
                                </c:if>
                            </c:forEach>
                        </c:if>
                        </c:forEach>
                    </td>
                    <td>${pre.customeNum}</td>
                    <td>${pre.tabelName}</td>
                </tr>
            </c:forEach>
        </table>
        <div class="tips">
            <div class="bottom">
                取消预订
            </div>
            <div class="bottom">
                修改预订
            </div>
            <div class="bottom">
                顾客到店
            </div>

        </div>
</div>
</div>
</body>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="assets/js/amazeui.min.js"></script>
</html>
<script type="text/javascript">
    $(function () {
        $('#date').bind("change",function () {
            var date = $(this).val();
            var state = $('#state').val();
            var time = $('#time').val();
            alert(state);
            alert(time);
            alert(date);
            $.post('predetermine/byTime',{date:date,state:state,time:time},function (data) {
                alert(JSON.stringify(data));
            });
        });

        $('#state').bind("change",function () {
            var state = $(this).val();
            var time = $('#time').val();
            var date = $('#date').val();
                alert(state);
            $.post('predetermine/byTime',{time:time,state:state,date:date},function (data) {
                alert(JSON.stringify(data));
            });
        });

      $('#time').bind("change",function () {
          var time = $(this).val();
          var state = $('#state').val();
          var date = $('#date').val();
          alert(time);
          alert(state);
          alert(date);
          $.post('predetermine/byTime',{time:time,state:state,date:date},function (data) {
                    alert(JSON.stringify(data));
          });
      });
    });
</script>