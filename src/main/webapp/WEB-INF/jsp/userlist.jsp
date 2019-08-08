<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/8/7
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户列表</title>
</head>
<body>
<table>
    <thead>
    <th>用户ID</th>
    <th>用户名</th>
    <th>邮箱</th>
    <th>手机</th>
    <th>问题</th>
    <th>答案</th>
    <th>权限</th>
    <th>创建时间</th>
    <th>修改时间</th>
    </thead>
    <c:forEach items="${userlist}" var="userlist">
        <tr>
            <th>${userlist.id}</th>
            <th>${userlist.username}</th>
            <th>${userlist.email}</th>
            <th>${userlist.phone}</th>
            <th>${userlist.question}</th>
            <th>${userlist.answer}</th>
            <th>${userlist.role}</th>
            <th>${userlist.createTime}</th>
            <th>${userlist.updateTime}</th>
        </tr>
    </c:forEach>
</table>
</body>
</html>
