<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: liwenxuan
  Date: 2019/8/6
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>修改类别</h1>
<form action="" method="post">
    <input type="hidden" name="id" value="${category.id}"><br/>
    名称<input type="text" name="name" value="${category.name}"><br/>
    父类别<select name="parentId" >
    <option value="${category.parentId}" selected:disabled style="display: none">${parentcategory.name}</option>
            <c:forEach items="${categorylist}" var="categorylist">
                <option value="${categorylist.id}">${categorylist.name}</option>
            </c:forEach>
          </select><br/>
    类别状态<input type="text" name="status" value="${category.status}"><br/>
    <input type="submit" value="修改"><br/>
</form>
</body>
</html>
