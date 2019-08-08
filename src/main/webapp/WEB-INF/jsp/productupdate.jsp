<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/8/7
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改商品</title>
</head>
<body>
<form action="" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${product.id}"><br/>
    类别<select name="categoryId">
    <option value="${category.id}" selected:disabled style="display: none">${category.name}</option>
    <c:forEach items="${categorylist}" var="categorylist">
        <option value="${categorylist.id}">${categorylist.name}</option>
    </c:forEach>
    </select><br/>
    商品名称<input type="text" name="name"value="${product.name}"><br>
    商品副标题<input type="text" name="subtitle"value="${product.subtitle}"><br>
    图片<input type="file" name="images" multiple="multiple"><br>
    商品详情<input type="text" name="detail"value="${product.detail}"><br>
    价格<input type="text" name="price"value="${product.price}"><br>
    库存数量<input type="text" name="stock"value="${product.stock}"><br>
    商品状态<input type="text" name="status"value="${product.status}"><br>
    <input type="submit" value="提交">
</form>
</body>
</html>
