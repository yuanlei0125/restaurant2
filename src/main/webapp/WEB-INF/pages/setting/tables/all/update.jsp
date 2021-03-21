<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2021/3/6
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath()%>/"/>
</head>
<body>
<form method="post" action="tables/all/update">
    <input type="hidden" name="tableId" value="${tables.tableId}"/>
    餐台名： <input type="text" name="tablesName" value="${tables.tablesName}"/><br/>
    餐台状态：<select name="stateId">
    <c:forEach var="tables" items="${listState}">
        <option value="${tables.stateId}">${tables.stateName}</option>
    </c:forEach>
</select><br/>
    所在区域：<select name="placeId" >
    <c:forEach var="tables" items="${listPlace}">
        <option value="${tables.placeId}">${tables.placeName}</option>
    </c:forEach>
</select> <br/>
    座位数：<input name="seatNum"  value="${tables.seatNum}"/><br/>
    最低消费：<input name="minFee" value="${tables.minFee}"/><br/>
    <input type="submit" value="提交">
</form>
</body>
</html>
