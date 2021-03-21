<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2021/3/5
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath()%>/"/>
</head>
<body>
    <%--@elvariable id="user" type=""--%>
    <form:form modelAttribute="user" method="post" action="user/add">
        <form:input type="hidden" path="userId"/><br/>
        职位：<form:input path="roleId" placeHolder=""/><br/>
        用户名：<form:input path="userName" placeHolder=""/><br/>
        密码：<form:input path="userPwd"/><br/>
        是否是管理员：<form:input path="userAuth" placeholder=""/><br/>
        <input type="submit">
    </form:form>
</body>
</html>
