<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2021/3/6
  Time: 13:54
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
<div>
    <a href="tables/all/list">全部</a>
    <a href="tables/hall/list">大厅</a>
    <a href="tables/box/list">包厢</a>
</div>
<div>
    <a href="tables/hall/preAdd">新增餐台</a>
    <table>
        <tr>
            <td>编号</td>
            <td>餐台名</td>
            <td>餐台状态</td>
            <td>所在区域</td>
            <td>座位数</td>
            <td>最低消费</td>
            <td>操作</td>
        </tr>
        <c:forEach var="tables" items="${listHall}">
            <tr>
                <td>${tables.tableId}</td>
                <td>${tables.tablesName}</td>
                <td>${tables.stateName}</td>
                <td>${tables.placeName}</td>
                <td>${tables.seatNum}</td>
                <td>${tables.minFee}</td>
                <td>
                    <a href="tables/hall/preUpdate/${tables.tableId}">编辑餐台</a>
                    <a href="tables/hall/delete/${tables.tableId}">删除餐台</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
