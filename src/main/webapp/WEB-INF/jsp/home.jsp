<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/8/3
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
</head>
<body>
<h1>欢迎${userinfo.username}</h1>
<br/><br/>
<h3>所有用户</h3>
<br/>
<table id="usertable">
    <thead>
    <tr>
        <th></th>
        <th>用户名</th>
        <th>密码</th>
        <th>密保问题</th>
        <th>答案</th>
        <th>邮箱</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${alluserinfo}" var="p">
        <tr>
        <td><input type="hidden" value="${p.id}"></td>
        <td>${p.username}</td>
        <td>${p.password}</td>
        <td>${p.question}</td>
        <td>${p.answer}</td>
        <td>${p.email}</td>
            <td><a href="/edit?id=${p.id}">修改</a>&nbsp<a href="/delete?id=${p.id}">删除</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
