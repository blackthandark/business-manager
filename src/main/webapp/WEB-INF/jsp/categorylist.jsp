<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: liwenxuan
  Date: 2019/8/6
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>类别管理</title>
</head>
<body>
<a href="add">添加类别</a>
<br><br>
<table>
    <thead>
        <th>类别ID</th>
        <th>类别名称</th>
        <th>所属父类</th>
        <th>类别状态</th>
        <th>创建时间</th>
        <th>修改时间</th>
    </thead>
    <c:forEach items="${categorylist}" var="category">
        <tr>
            <th>${category.id}</th>
            <th>${category.name}</th>
            <th>${category.parentId}</th>
            <th>${category.status}</th>
            <th>${category.createTime}</th>
            <th>${category.updateTime}</th>
            <th>
                <a href="update/${category.id}">修改</a>
                <a href="delete/${category.id}">删除</a>
            </th>
        </tr>
    </c:forEach>
</table>
<br>

</body>
</html>
