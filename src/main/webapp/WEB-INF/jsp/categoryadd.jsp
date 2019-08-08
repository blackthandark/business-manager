<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/8/6
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加类别</title>
</head>
<body>
<form action="" method="post">
    类别名称<input type="text" name="name"><br>
    父类别<select name="parentId" >
    <c:forEach items="${categorylist}" var="categorylist">
        <option value="${categorylist.id}">${categorylist.name}</option>
    </c:forEach>
    </select><br/>
    类别状态<input type="text" name="status"><br>
    排序编号<input type="text" name="sortOrder"><br>
    <input type="submit" value="提交">

</form>
</body>
</html>
