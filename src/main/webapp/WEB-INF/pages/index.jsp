<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎登录</title>
    <base href="<%=request.getContextPath()%>/"/>
    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;
            font-family: '微软雅黑';
        }
        body{
            /*background-image: url("images/lg_bk1.jpg");*/
            background: -webkit-linear-gradient(top,#FAFAFA,#c7c7c7);
            scroll-behavior: none;
        }
        #contain{
            width: 100%;
            height: 120%;
            background: rgba(255,255,255,0.2);
        }
        #left{
            width:50%;
            height: 100%;
            display: inline-block;
        }
        #right{
            width: 400px;
            /*margin-left: 60%;*/
            display: inline-block;
            position: absolute;
            background-color: #FAFAFA;
            margin-top: 200px;
            height: 300px;
            border-radius: 6px;
        }
        #title{
            margin: 300px 200px;
            color: #FF4336;
            text-shadow:1px 1px rgba(0,181,197,0.2);
            letter-spacing: 5px;
            font-weight: normal;
            font-size: 30px;
            background: rgba(255,255,255,0.2);
            border-radius: 10px;
        }
        #form-out{
            width: 60%;
            margin: 50px auto;
        }
        .inp{
            display: inline-block;
            width: 90%;
            height: 35px;
            margin-bottom: 10px;
            line-height: 25px;
            border-radius: 5px;
            font-size: 18px;
            border: none;
            background: #FFFFFF;
            box-shadow: 0px 0px 1px 2px #cccccc;
            color: #444444;
        }
        #form-tit{
            display: block;
            width: 100%;
            text-align: center;
            line-height: 40px;
            vertical-align: middle;
            margin-top: 20px;
            font-size: 20px;
            color: #FFFFFF;
        }
        #padTitle{
            background: #FF8F78;
            height: 40px;
        }
        .but{
            display: inline-block;
            margin-top: 30px;
            border-radius: 10%;
            border: 1px solid #BC0007;
            width: 80px;
            height: 30px;
            color: #BC0007;
            background: #FFFFFF;
            margin-right: 10px;
        }
        #sub{
            border: 2px solid #FF334C;
            background: #FF4E4C;
            color: #FFFFFF;
        }
        #showPWD{
            color: #888888;
            width: 80%
        }
        #msg{
            position: absolute;
            color: #FF0000;
            margin-left: 100px;
        }
    </style>
</head>
<body>
<div id="contain">
    <div id="left">
        <div id="title">棉花糖餐饮管理系统</div>
    </div>
    <div id="right">
        <div id="padTitle"><span id="form-tit">棉花糖餐饮管理系统</span></div>
        <span id="msg">${msg}</span>
        <div id="form-out">

            <form method="post" action="login">
                <select class="inp" name="userName">
                    <c:forEach var="user" items="${names}">
                        <option value="${user}">${user}</option>
                    </c:forEach>
                </select>
                <input type="password" name="userPwd" class="inp" placeholder="请输入密码" id="pwd">
                <div id="showPWD"> <input type="checkbox" > 显示密码</div>
                <input type="submit" id="sub" class="but" value="登录"> <input type="reset" class="but" value="重置" >
            </form>
        </div>
    </div>
</div>
<div class="eye"></div>
</body>
<script type="text/javascript">
    var checkbox= document.getElementById('showPWD').firstElementChild;
    checkbox.onclick=function() {
        var  pwd =document.getElementById('pwd');
        if(checkbox.checked){
            pwd.removeAttribute("type")
        }else{
            pwd.setAttribute("type","password")
        }
    }
</script>
</html>