<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/8/3
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
</head>
<body>
<form action="/updateinfo">
    <input type="hidden" name="id" value="${edituserinfo.id}">
    用户名：&nbsp<input type="text" name="username" placeholder="${userinfo.username}" value="${userinfo.username}"><br>
    密码：&nbsp&nbsp<input type="text" name="password" placeholder="${userinfo.password}" value="${userinfo.password}"><br>
    密保问题:<input type="text" name="question" placeholder="${userinfo.question}" value="${userinfo.question}"><br>
    答案:&nbsp&nbsp<input type="text" name="answer" placeholder="${userinfo.answer}" value="${userinfo.answer}"><br>
    邮箱:&nbsp&nbsp<input type="text" name="email" placeholder="${userinfo.email}" value="${userinfo.email}"><br>
    <input type="submit" value="保存">
</form>
</body>
</html>
