<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2021/3/5
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath()%>/"/>
    <style>
        ul li{
            display: inline-block;
        }
    </style>
</head>
<body>
        <a href="user/preAdd">添加</a>
    <table width="100%" >
        <tr><td>编号</td>
            <td>职位</td>
            <td>用户</td>
            <td>密码</td>
            <td>是否管理员</td>
            <td>操作</td>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr><td>${user.userId}</td>
                <td>${user.roleName}</td>
                <td>${user.userName}</td>
                <td>${user.userPwd}</td>
                <td>${user.userAuth}</td>
                <td>
                    <a href="user/preUpdate/${user.userId}">修改</a>
                    <a href="user/delete/${user.userId}">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>


</body>
</html>
