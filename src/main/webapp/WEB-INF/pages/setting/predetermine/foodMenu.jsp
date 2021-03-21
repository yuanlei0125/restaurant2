<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="assets/css/app.css">

    <script src="assets/js/jquery.min.js"></script>
    <style type="text/css">
        .sidebar-nav li:hover {
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
            height: 60px;
            background: #FAFAFA;
            border-left: 2px solid #cccccc;
            padding-top: 10px;
            padding-left: 20px;
            padding-bottom: 10px;
        }
        .selectHead div{
            display: inline-block;

        }
        #headLeft{
            width: 40px;
            height: 40px;
            background:#FF6077;
            border: 2px solid #FF2E4D;
            box-shadow:inset 0px 0px 2px 2px #FFAEB8;
            line-height: 40px;
            vertical-align: middle;
            border-radius: 5px;
            cursor: pointer;
        }
        #headLeft:hover{
            box-shadow: 0px 0px 0px 4px #FFC9D1;
        }
        #headLeft:active{
            box-shadow: none;
        }
        .arrow{
            position: absolute;
            background:#FFEDEF;
            width:30px;
            height: 4px;
            margin-top: 17px;
            margin-left: 5px;
            border-radius: 2px;
        }
        #arrow_top{
            transform: rotate(-35deg);
            margin-top: 12px;
            margin-left: 1px;
            width: 20px;
        }
        #arrow_bot{
            transform: rotate(35deg);
            margin-top: 22px;
            margin-left: 1px;
            width: 20px;
        }
        #headRight{
            line-height: 40px;
            border-left: 1px solid #888888;
            height: 40px;
            width: 400px;
            vertical-align: middle;
            padding-left: 80px;
            margin-left: 20px;
        }
        .mainBody{
            background: #fcfcfc;
            width: 95%;
            height: 700px;
            margin-top: -10px;
            margin-left: 20px;
        }
        #tables{
            width: 100%;
        }
        #tableInfo{
            height: 30px;
            line-height: 30px;
            vertical-align: middle;
            padding-left: 3px;
            padding-right: 3px;
            display: inline-block;
            font-size: 18px;
            width: 120px;
            color: #666666;
            border-radius: 3px;
        }
        #ordered {
           padding-bottom: 2px;
            padding-left: 6px;
            padding-right: 6px;
            display: inline-block;
            background-color: #FF2249;
            font-size: 18px;
            color: #FFE3E8;
            border: 2px solid #FF0C37;
            border-radius: 4px;
            margin-right: 20px;
            box-shadow: 0px 0px 1px 1px #BBBBBB;
            user-select: none;
            -webkit-user-select: none;
        }
        #sum{
            box-shadow: 0px 0px 1px 1px #cccccc;
            padding-left: 6px;
            padding-right: 6px;
           background-color: #FFFFFF;
            font-size: 18px;
            color: #FF2249;
            border: 2px solid #FFFFFF;
            border-radius: 4px;
            user-select: none;
            -webkit-user-select: none;
        }
        #sum:hover,#ordered:hover{
            box-shadow: 0px 0px 3px 3px #cccccc;
        }
        #sum:active,#ordered:active{
            box-shadow: none;
        }
        #foodType{
            margin-top: 10px;
            width: 100px;
            height:400px;
            position: absolute;
            background-color: #FFFFFF;
            padding-top: 20px;
            box-shadow: 0px 0px 1px 1px #cccccc;
            display: inline-block;
        }
        .typeList{
           border-bottom: 1px solid #EFEFEF;
            height: 30px;
            user-select: none;
            -webkit-user-select: none;
            color: #777777;
            text-align: center;
        }
        .typeList:hover{
            box-shadow: 0px 0px 1px 1px #cccccc;
            background-color: #FFF8F8;
            color: #FF6077;
            cursor: pointer;
        }
        .typeList:active{
            box-shadow: none;
        }
        .thisPart{
            border-right: 1px solid #FF2E4D;
            background-color: #FFF8F8;
            color: #FF6077;
        }
        #foods{
            display: inline-block;
            width:1000px ;
            margin-top: 10px;
            padding-top: 20px;
            height: 620px;
            background-color: #F4F4F4;
            margin-left: 110px;
            padding-left: 30px;
        }
        #order_food_info{
            width: 240px;
            height: 100px;
            background-color: #FFB9BF;
            color: #FFFFFF;
        }
        .orderNum{
            text-align: center;
        }
        .orderNum span{
            display: inline-block;
        }
        #food_item_count{ margin-left: 5px;margin-right: 5px;}
        .priceNum{
            color: #FF0018;font-weight: bold;font-size: 20px;
        }
        #order_food_list span{
            display: inline-block;
            height: 100%;
            overflow: hidden;
        }
       #order_food_list{
            margin-top: 20px;
            background-color: #FFFFFF;
        }
        .foodName{
            width: 120px;
        }
        .foodCount{
            width: 30px;
            color: #FF4859;
        }
        .a_food_item{
            width: 100%;
            border-bottom: 1px solid #EFEFEF;
            height: 30px;
            user-select: none;
            -webkit-user-select: none;
            color: #777777;
            text-align: left;
        }
        .single_total{
            color:#FF4859;
            font-weight: bold;
            font-size: 18px;
        }
        .a_food_of_menu{
            width: 90px;
            height: 90px;
            background-color: #FFFFFF;
            display: inline-block;
            margin-left: 10px;
            font-size: 15px;
            margin-top: 10px;
            border-radius: 5px;
            box-shadow: 0px 0px 1px 1px #FF4859;
            user-select: none;
            -webkit-user-select: none;
            cursor: pointer;
        }
        .a_food_of_menu:hover{
            box-shadow: 0px 0px 2px 2px #FF4859;
        }
        .a_food_of_menu:active{
            box-shadow: none;
        }
        .food_name{
            display: block;
            margin-top: 5px;
            margin-left: 5px;
            width: 90%;
            height: 48px;
            overflow: hidden;
        }
        .food_price{
            display: block;
            text-indent: 5px;
            width: 80%;
            height: 30px;
            color: #D60036;
            border-radius: 3px;
            background-color: #FFDCDF;
            margin-left: 10%;
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
<%--<div id = "overLay">--%>
    <%--<div id="create_order"><div id="tit"> 开台<span></span><div id="close" title="关闭">×</div></div>--%>
        <%--<div id="form_container">--%>
            <%--<form action="" method="post" id="tb_form">--%>
                <%--<input type="hidden" name="tableId">--%>
                <%--<span>就餐人数:</span><input name="numOfCustomer" placeholder="可使用默认"><br>--%>
                <%--<span>最低消费:</span><input name="minFee" placeholder="不输入则使用默认值"><br>--%>
                <%--<span>服务员:</span><select name="waiter" id="user_list">--%>
                    <%--<option value="0">选择服务员</option>--%>
                <%--</select><br>--%>
                <%--<span>开台备注:</span><textarea name="remark" placeholder="备注限制50字" maxlength="50"></textarea><br>--%>
                <%--<input type="submit" value="开台" id="order_tb" class="sub">--%>
                <%--<input type="submit" value="开台并点菜" id="order_tbAndFood" class="sub">--%>
            <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<div class="am-g tpl-g">
    <!-- 头部 -->
    <header>
        <!-- logo -->
        <div class="am-fl tpl-header-logo">
            <a href="javascript:;"><img src="assets/img/logo.png" alt=""></a>
        </div>

    </header>
    <!-- 侧边导航栏 -->
    <div class="left-sidebar" style=" background-color: #FDFDFD;">
        <div id="order_food_info">
            <div class="orderNum" orderId="${tableOrderInfo.orderId}">单号：${tableOrderInfo.orderNum}</div>
            <div class="orderNum">
                <span>已点<span id="food_item_count" class="priceNum">0</span>项</span>
            </div>
            <div class="orderNum">
                <span>共计：<span class="priceNum">￥</span><span id="totalPrice" class="priceNum">0</span></span>
            </div>
        </div>
        <div id="editOrder"></div>
        <ul id="order_food_list">

        </ul>
    </div>
    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">
        <div class="mainBody">
            <div class="selectHead">
                <div id="headLeft"><div class="arrow" id="arrow_top"></div><div class="arrow"></div><div class="arrow" id="arrow_bot"></div></div>
                <div id="headRight">
                    <%--<span id="tableInfo">${tableOrderInfo.tableName}</span>--%>
                    <%--<button id="ordered" tableId="${tableOrderInfo.tableId}">下单</button>--%>
                    <button id="sum">下单</button>
                </div>
            </div>
            <div id="tables">
                <div id="foodType">
                    <ul>
                        <li class="typeList thisPart">全部类型</li>
                        <c:forEach items="${types}" var="type">
                            <li class="typeList" typeId="${type.typeId}">${type.typeName}</li>
                        </c:forEach>
                    </ul>
                </div>
                <!--食品-->

                <form action="add.jsp" method="post">
                <div id="foods">
                <c:forEach var="food" items="${foods}">
                    <div class="a_food_of_menu" title="${food.foodName}" foodPrice="${food.foodPrice}" foodId="${food.foodId}">
                        <span class="food_name">${food.foodName}</span>
                        <span class="food_price">${food.foodPrice}</span>
                    </div>
                </c:forEach>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script src="assets/js/jquery.cookie.js"></script>
<script>
    //点餐清单
    var orderList = [];
    //页面上的清单
    var orderListOnPage = $("#order_food_list");
    var total = $("#totalPrice");
    var foodCount =$("#food_item_count");

    $(".a_food_of_menu").each(function () {
        $(this).click(function () {
            var foodId = $(this).attr("foodId");
            var foodName = $(this).attr("title");
            var foodPrice = $(this).attr("foodPrice");
           //查找项存在的索引
            var index = findIn(foodId);
            if(index<0){
                //添加一条
                orderList.push({foodId:foodId,foodPrice:foodPrice,foodCount:1});
                var li = createElement({tagName:"li",class:"a_food_item"});
                var span_left = createElement({tagName:"span",class:"foodName",text:foodName});
                var span_center = createElement({tagName:"span",class:"foodCount",text:1});
                var span_right = createElement({tagName:"span",class:"single_total"});
                var span_in_R_L = createElement({tagName:"span",text:"￥"});
                var span_in_R_R = createElement({tagName:"span",text:foodPrice});
                span_right.append(span_in_R_L);
                span_right.append(span_in_R_R);
                li.append(span_left);
                li.append(span_center);
                li.append(span_right);
                orderListOnPage.append(li);
                //修改总数量
                foodCount.text(orderList.length);
            }else{
                //修改数量
                orderList[index]['foodCount']+=1;
                var counts = $(".foodCount");
                var count = parseInt(counts[index].innerHTML) +1 ;
                counts[index].innerHTML = count;
                var item_total =  $(counts[index]).next()[0].lastElementChild;
                item_total.innerHTML = orderList[index]['foodPrice'] *count;
            }
            total.text(sum());
        });
    });
    //创建Jquery对象
    function createElement(msg) {
        var ele = document.createElement(msg['tagName']);
        if(msg['text']!=undefined){
            $(ele).text(msg['text']);
        }
        if(msg['class']!=undefined){
            $(ele).attr("class",msg['class']);
        }
        return $(ele);
    }
    //查询某项是否存在清单中
    function findIn(foodId) {
        //存在地方的索引
        var index = -1;
        for(var i = 0 ; i<orderList.length;i++){
            if(orderList[i]['foodId'] == foodId){
                index = i;
                break;
            }
        }
        return index;
    }
    //统计总价
    function sum() {
        var total = 0;
        for(i in orderList){
            var  aFood = orderList[i];
           var price =  parseInt(aFood['foodPrice']);
           var count = parseInt(aFood['foodCount']);
           total += price* count;
        }
        return total;
    }
    $("#ordered").click(function () {
        var tableId = $(this).attr("tableId");
        if(orderList.length<1){
            alert("请先点菜！");
        }else{
            var orderFood = [];
            $(orderList).each(function () {
                orderFood.push({tableId:tableId,foodId:$(this).attr('foodId'),foodCount:$(this).attr('foodCount')})
            });
            $.ajax({
                    type: "post",
                    url: "orderFood",
                    data: JSON.stringify(orderFood),
                    async: true,
                    dataType:"json",
                    success: function (data) {

                    }
                }
            );
        }
    });
</script>
</html>