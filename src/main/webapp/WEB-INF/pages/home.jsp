<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <base href="<%=request.getContextPath()%>/">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>首页-餐台监管</title>
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
        .defSel{
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
            user-select: none;
            -webkit-user-select: none;
        }
        .selected{
            border: 2px solid #FF2812;
            background: #FF6656;
            color: #FFFFFF;
        }
        .selectHead span:hover{
            border: 1px solid #FF7775;
            background: #FF9998;
            color: #FFFFFF;
            box-shadow: 0px 0px 2px 2px #FF7775;
        }
        #tables{
            width: 100%;
        }
        .aTable{
            margin-left: 10px;
            margin-top: 10px;
            display: inline-block;
            padding: 3px;
            user-select: none;
            -webkit-user-select: none;
            border-radius: 4px;
        }
        .aTable span{
            color: #009B38;
            background: #67FFAA;
            padding: 10px;
            box-shadow: inset 0px 0px 3px 3px #BFFFD6;
            display: block;
            border: 1px solid #00C848;
            border-radius: 4px;
            cursor:pointer;
        }
        .state2{
            background: #FF632E !important;
            color: #8E2400 !important;
            box-shadow: inset 0px 0px 3px 3px #FFEDE7 !important;
            border: 1px solid #FF4809 !important;
        }
        .state3{
         background: #FFD05E !important;
         color: #795600 !important;
         box-shadow: inset 0px 0px 3px 3px #FFF4D7 !important;
         border: 1px solid #FFB500 !important;
        }
        #menuOfTable{
            width: 370px;
            margin-top: 20%;
            border: 1px solid rgb(255,44,40);
            position: fixed;
            border-radius: 5px;
            height: 60px;
            background-color: rgba(0,0,0,0.6);
            box-shadow: 1px 0px 2px 2px #cccccc;
            display: none;
        }
        .but{
            margin-top: 10px;
            display: inline-block;
            height: 40px;
            background-color:#a7bdcd ;
            margin-left: 10px;
            border-radius: 5px;
            user-select: none;
            padding: 5px;
            -webkit-user-select: none;
        }
        #use{
            border: 1px solid #00B4E5;
            color: #005A5F;
            background-color: #53DBFF;
            box-shadow: inset 0px 0px 2px 2px #D2F5FF;
        }
        #order{
            border: 1px solid #F2DF00;
            color: #645C00;
            background-color: #FFF255;
            box-shadow: inset 0px 0px 2px 2px #FFFBC9;
        }
        #prePay{
            border: 1px solid #5100C6;
            color: #2F0071;
            background-color: #9A53FF;
            box-shadow: inset 0px 0px 2px 2px #DEC7FF;
        }
        #clear{
            border: 1px solid #DA0E00;
            color: #9C0B00;
            background-color: #FF877F;
            box-shadow: inset 0px 0px 2px 2px #FFDEDC;
        }
        #pay{
            border: 1px solid #42C600;
            color: #216400;
            background-color: #97FF63;
            box-shadow: inset 0px 0px 2px 2px #E0FFD0;
        }
        #more{
            border: 1px solid #FF086E;
            color: #A20042;
            background-color:  #FF6EAA;
            box-shadow: inset 0px 0px 2px 2px #FFF0F6;
        }
        .disable{
            border:none !important;
            background-color: #cccccc !important;
            box-shadow: none !important;
        }
        .checked{
            background: rgba(96,98,255,0.6);
            border: 1px solid rgba(96,98,255,1);
            box-shadow: 0px 0px 2px 3px #8081FF;
        }
        #create_order{
            border-radius: 6px 6px 0px 0px;
           margin: 100px auto;
            width: 400px;
            height: 350px;
            background-color: #FCFCFC;
            color: #777777;
            /*display: none;*/
        }
        #close{
            color: #ffffff;
            display:inline-block;
            float: right;
            width: 25px;
            height: 25px;
            margin: 5px;
            font-size: 25px;
            line-height:18px;
            vertical-align: middle;
            border-radius: 3px;
            border:1px solid #FF1100;
            text-align: center;
            background-color:rgba(255,17,0,0.7);
            box-shadow: inset 0px 0px 2px 1px #FF7977;
            user-select: none;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            cursor: pointer;
        }
        #overLay{
            z-index: 1500;
            background-color: rgba(0,0,0,0.3);
            position: fixed;
            width: 100%;
            height: 100%;
            display: none;
        }
        #tit{
            width: 100%;
            background-color: #FF8684;
            height: 40px;
            border-radius: 6px 6px 0px 0px;
            color: #ffffff;
            letter-spacing: 2px;
            font-size: 20px;
            padding-left: 100px;
        }
        #form_container{
            width: 70%;
            margin: 20px auto;
            background-color: #FFFAFA;
            height: 80%;
        }
        #form_container span{
            display: inline-block;
            width: 100px;
        }
        #form_container input,select{
            display: inline-block;
            width: 160px;
            height: 30px;
            margin-top: 10px;
            border-radius: 3px;
            border: none;
            box-shadow: 0px 0px 2px 1px #cfcfcf;
        }
        textarea{
            resize: none;
            margin-top: 10px;
            margin-bottom: 20px;
            width: 160px;
            border-radius: 3px;
            border: none;
            box-shadow: 0px 0px 2px 1px #cfcfcf;
        }
        .sub{
            display: inline-block;
            margin-top: 30px;
            border-radius: 5px!important;
            border: 1px solid #BC0007!important;
            width: 100px !important;
            height: 30px;
            color: #BC0007;
            background: #FFFFFF;
            margin-right: 10px;
            box-shadow: none !important;
        }
        #order_tb,#order_tbAndFood:hover{
            border: 2px solid #FF1815 !important;
            background: #FF4E4C;
            color: #FFFFFF;
        }
    </style>

</head>

<body data-type="index" class="theme-white">
<!--弹窗-->
<div id = "overLay">
    <div id="create_order"><div id="tit"> 开台<span></span><div id="close" title="关闭">×</div></div>
        <div id="form_container">
            <form action="" method="post" id="tb_form">
                <input type="hidden" name="tableId">
                <span>就餐人数:</span><input name="numOfCustomer" placeholder="可使用默认"><br>
                <span>最低消费:</span><input name="minFee" placeholder="不输入则使用默认值"><br>
                <span>服务员:</span><select name="waiter" id="user_list">
                    <option value="0">选择服务员</option>
                </select><br>
                <span>开台备注:</span><textarea name="remark" placeholder="备注限制50字" maxlength="50"></textarea><br>
                <input type="submit" value="开台" id="order_tb" class="sub">
                <input type="submit" value="开台并点菜" id="order_tbAndFood" class="sub">
            </form>
        </div>
    </div>
</div>
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
                        <a href="javascript:;">欢迎你, <span>${user.userName}</span> </a>
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
            <li class="sidebar-nav-heading" id="thisPart">
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
        <div class="mainBody">
            <div class="selectHead">
                <div id="placeSel">
                    <span class="defSel selected" title="0">全部</span>
                <c:forEach var="place" items="${listPlace}">
                    <span class="defSel" title="${place.placeId}">${place.placeName}</span>
                </c:forEach>
                </div>
                <div id="stateSel">
                    <span class="defSel selected" title="0">全部</span>
                    <c:forEach var="state" items="${listState}">
                    <span class="defSel" title="${state.stateId}">${state.stateName}</span>
                    </c:forEach>
                </div>
            </div>
            <div id="menuOfTable">
                <button class="but" id="use">开台</button>
                <button class="but" id="order">点单</button>
                <button class="but" id="prePay">预结</button>
                <button class="but" id ="pay">结账</button>
                <button class="but" id="clear"><i class="am-icon-trash"></i>清台</button>
                <button class="but" id="more">更多</button>
            </div>
            <div id="tables">
                    <c:forEach var="table" items="${listTables}">
                        <div class="aTable" tableId="${table.tableId}">
                        <span class="state${table.stateId}">${table.tablesName}</span>
                        <input type="hidden" value="${table.tableId}">
                        <input type="hidden" value="${table.stateId}">
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

<script src="assets/js/amazeui.min.js"></script>
</div>
</body>
<script src="assets/js/jquery.cookie.js"></script>
<script>
    /****************查询餐台**********/
    var tableId;//选中的桌子
    //获得所有的选择按钮
    var menu = $("#menuOfTable");
    $(".defSel").each(function () {
        //设置点击事件
            $(this).click(function () {
                //隐藏菜单
                menu.hide(0);
                //移除同级选中样式
                $(this).parent().find(".selected").removeClass("selected");
                //给自己设选中样式
                $(this).addClass("selected");
                //把所有被选中的按钮获得
                var terms = $(".selected");
                //更新并展示
                updateTablesOfThisPart(terms[0].title,terms[1].title)
            });
    }
    );
    //展示查询结果
    function showTables(data) {
        //修改结果区域内容
        var res= document.getElementById("tables");
        res.innerHTML="";
        //查询结果转成展示结果
        if(data.length>=1) {
            for(var i =0;i<data.length;i++){
                //创建元素
                var div = createElement({
                    tagName:"div",
                    class:"aTable",
                    min_fee:data[i]['minFee'],
                    seat_num:data[i]['seatNum']});
                var span = createElement({
                    tagName:"span",
                    text:data[i]['tablesName'],
                    class:"state"+data[i]['stateId']});
                var hidden1 = createElement({
                    tagName:"input",
                    value:data[i]['tableId'],
                    type:"hidden"});
                var hidden2 = createElement({
                    tagName:"input",
                    value:data[i]['stateId'],
                    type:"hidden"});
                div.appendChild(span);
                div.appendChild(hidden1);
                div.appendChild(hidden2);
                res.appendChild(div);
                }
            }
    }
    //更新当前区域的桌子
    function updateTablesOfThisPart(placeId,stateId) {
        $.get("findTables",
            {place:placeId,state:stateId},
            function (data) {
                showTables(data)
                //为他们设置点击事件
                setTablesClick();
                //把选中的桌子清除
                tableId=undefined;
            }
        )
    }
///根据传来JSON对象创建元素
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
       if(elementMsg['min_fee']!=undefined){
           element.min_fee=elementMsg['min_fee'];
       }
       if(elementMsg['seat_num']!=undefined){
           element.seat_num=elementMsg['seat_num'];
       }
       return element;
   }
/*********************菜单功能**************************/
    //每个按钮被禁用情况的数组
    var tableName;
    var disIndexs =[true,true,true,true,true,true];
    setTablesClick();
    function setTablesClick() {
        $(".aTable").each(function () {
            var thisTable = $(this);
            thisTable.click(function () {
                //选中当前
                checkedThis(thisTable);
                tableId=thisTable.find("input")[0].value;
                tableName = thisTable.find("span").text();
                //显示菜单
                menu.show();
                //根据桌子的状态对某些按钮进行禁用
                switch (thisTable.find("input")[1].value){
                    case "1":    //-- 开台--点单--预结--结账--清台--更多
                        disIndexs=[false,true,true,true,true,false];
                        break;
                    case "2":
                        disIndexs=judgeOrdered(tableId) ? [true,false,false,false,true,false]:[true,false,true,true,false,false];
                        break;
                    case "3":
                        disIndexs=[true,false,true,true,false,false];
                        break;
                    case "4":
                        disIndexs=[true,false,false,false,false,false];
                }
                disableButs(disIndexs);
            });
        });
    }
    //判断是否点餐
    function judgeOrdered(tableId) {
        var ordered = true;
        $.ajax({
            type:"get",
            url:"tables/OrderState",
            data:{tableId:tableId},
            //取消异步
            async:false,
            success:function(data){
                if(data=="0"){
                    ordered =false;
                }
            }
        });
        return ordered;
    }
    //设置禁用和禁用样式
    function disableButs(disIndexs) {
     var buts = document.getElementsByClassName("but");
     for(var i = 0 ; i<buts.length;i++){
         var dis = disIndexs[i];
         buts[i].disabled=dis;
         if(dis){
            buts[i].classList.add("disable");
         }else{
             buts[i].classList.remove("disable");
         }
     }
    }
    //设置选中样式
    function checkedThis(thisEle) {
        $(".checked").removeClass("checked");
        thisEle.addClass("checked");
    }
/************************开台**********************/
    $("#use").click(function () {
        //如果选中了菜品
        if(tableId !=undefined){
            $("#overLay").show();
            $("#tit span").text(tableId+"__"+tableName);
            $("[name='tableId']").val(tableId);
            //从cookie中取出waiter的Json数组
            var selectbox = $("#user_list");
            //当没有给下拉菜单加上选项时，将数据加进去
            if(selectbox.find("option").length<=1){
                appendOption(selectbox);
            }
    }else{
            alert("请先选中一个桌子，再继续操作!");
        }
    });
    //关闭弹窗
    $("#close").click(function () {
        $("#overLay").hide(0);
    });
    //给下拉菜单中加入
    function appendOption(selectbox) {
        //取出cookie中的waiter
        var waiter = $.cookie("waiter");
        //如果取不到就去后台查
        if(waiter==undefined) {
            $.ajax({
                    type: "get",
                    url: "user/findWaiter",
                    data: {},
                    //需要取消异步，才能在使用waiter前取到值
                    async: false,
                    success: function (data) {
                        waiter = data;
                        //存入cookie,需要先转字符串，直接存JSON直接读会得到空的对象
                        $.cookie("waiter", JSON.stringify(waiter));
                    }
                }
            );
        }else{
            //将字符串转回JSON
            waiter=JSON.parse(waiter);
        }
        //再次重置，确保不会连续增加重复元素
        selectbox[0].innerHTML='<option value="0">选择服务员</option>';
        //加入选项
        for (var i =0 ; i<waiter.length; i++){
            selectbox.append(createElement({
                tagName:"option",
                text:waiter[i]["userName"],
                value:waiter[i]["userId"]
            }));
        }
    }
    var tb_form =$("#tb_form")[0];
    $("#order_tb").click(function () {
        tb_form.action = "order/table";
    });
    $("#order_tbAndFood").click(function () {
        tb_form.action = "order/tableAndFood"
    });
    $("#clear").click(function () {
        if(tableId !=undefined){
            $.post("table/clear",
            {tableId:tableId},
            function (data) {
                if(data != 1){
                    alert("执行清台失败！可能已被清台");
                }else{
                    alert("清台成功！");
                }
                var selSpan = $(".selected");
                //清台之后更新页面展示
                updateTablesOfThisPart(selSpan[0].title,selSpan[1].title);
                menu.hide(0);
            }
            );
        }else{
            alert("请选择一个桌子进行操作！");
        }
    });
      $("#order").click(function () {
          if(tableId!=undefined){
              location.href ="foodMenu?tableId="+tableId;
          }else{
              alert("请选择一个桌子进行操作！");
          }
      });
</script>
</html>