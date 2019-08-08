<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/8/7
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品</title>
</head>
<body>
<form action="" method="post" enctype="multipart/form-data">
    类别<select name="categoryId" >
    <c:forEach items="${categorylist}" var="categorylist">
        <option value="${categorylist.id}">${categorylist.name}</option>
    </c:forEach>
    </select><br/>
    商品名称<input type="text" name="name"><br>
    商品副标题<input type="text" name="subtitle"><br>
    图片<input type="file" name="images" multiple="multiple"><br>
    商品详情<input type="text" name="detail"><br>
    价格<input type="text" name="price"><br>
    库存数量<input type="text" name="stock"><br>
    商品状态<input type="text" name="status"><br>
    <input type="submit" value="提交">
</form>
</body>
</html>
