<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/8/7
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>全部商品</title>
</head>
<body>
<a href="add">添加商品</a>
<br><br>
<table>
    <thead>
    <th>商品ID</th>
    <th>类别ID</th>
    <th>商品名称</th>
    <th>商品副标题</th>
    <th>产品主图</th>
    <%--<th>图片</th>--%>
    <th>商品详情</th>
    <th>价格</th>
    <th>库存数量</th>
    <th>商品状态</th>
    <th>创建时间</th>
    <th>更新时间</th>
    </thead>
    <c:forEach items="${productlist}" var="product">
        <tr>
            <th>${product.id}</th>
            <th>${product.categoryId}</th>
            <th>${product.name}</th>
            <th>${product.subtitle}</th>
            <th><img src="/image/${product.mainImage}" width="200px"/></th>
            <%--<th>${product.subImages}</th>--%>
            <th>${product.detail}</th>
            <th>${product.price}</th>
            <th>${product.stock}</th>
            <th>${product.status}</th>
            <th>${product.createTime}</th>
            <th>${product.updateTime}</th>
            <th>
                <a href="update/${product.id}">修改</a>
                <a href="delete/${product.id}">删除</a>
            </th>
        </tr>
    </c:forEach>
</table>
<br>

</body>
</html>
