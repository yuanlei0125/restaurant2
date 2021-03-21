<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2021/3/6
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <base href="<%=request.getContextPath()%>/"/>
    <script src="assets/js/jquery.min.js"></script>
</head>
<body>
        <form action="password/update" method="post">
            <input type="text" placeholder="请输入原来密码" id="old"/><span id="oldMsg"></span><br/>
            <input type="text" name="newpassword" id="new" placeholder="请输入新密码"/><span id="newMsg"></span><br/>
            <input type="text" name="againpassword" id="again" placeholder="请再次输入新密码"/><span id="againMsg"></span><br/>
            <input type="submit">
        </form>
</body>
<script>
    $(":submit")[0].disabled=true;
    var firstTrue = false;
    var second=false;
    var third=false;
    $("#old").blur(function () {
        var pwd=$(this).val();
        $.get(
            "password/confirm",{"password":pwd},function (data) {
                if(data==1){
                    $("#oldMsg").text("输入正确").css("color","#00ff55");
                    firstTrue=true;
                }else{
                    $("#oldMsg").text("密码不正确").css("color","#ff0000");
                    firstTrue=false;
                }
            }
        )
        sub();
    });
    $("#new").blur(function(){
        var pwd=$("#old").val();
        var newpassword=$(this).val();
        if(pwd==newpassword){
            $("#newMsg").text("新密码不能和原密码相同").css("color","#ff0000");
            second=false;
        }else{
            $("#newMsg").text("√").css("color","#00ff55");
            second=true;
        }
        if(newpassword==""){
            $("#newMsg").text("新密码不能为空").css("color","#ff0000");
            second=false;
        }
        if($(":submit")[0].disabled){

            confirm();
        }
        sub();
    })
    $("#again").mouseleave(function () {
       confirm();
    });
    $(":submit").click(function(){
        confirm();
    });
    function confirm() {
            var newpassword=$("#new").val();
            var againpassword=$("#again").val();
            var pwd=$("#old").val();
            if(newpassword==againpassword){
                $("#againMsg").text("√").css("color","#00ff55");
                third=true;
            }else {
                $("#againMsg").text("密码不一致请重新输入").css("color","#ff0000");
                third=false;
            }
            sub();
    }
    function sub() {
        if(firstTrue&&second&&third){
            $(":submit")[0].disabled=false;
        }else{
            $(":submit")[0].disabled=true;
        }
    }
</script>
</html>
