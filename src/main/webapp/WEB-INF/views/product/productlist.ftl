
<html>
    <#include "common/header.ftl">
<body>
<div id="wrapper" class="toggled">

<#--边栏sidebar-->
    <#include "common/nav.ftl">
    <h1>商品列表</h1>

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>商品ID</th>
                            <th>类别ID</th>
                            <th>商品名称</th>
                            <th>商品副标题</th>
                            <th>产品主图</th>
                            <th>商品详情</th>
                            <th>价格</th>
                            <th>库存数量</th>
                            <th>商品状态</th>
                            <th>创建时间</th>
                            <th>更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list productlist as product>
                        <tr>
                            <th>${product.id}</th>
                            <th>${product.categoryId}</th>
                            <th>${product.name}</th>
                            <th>${product.subtitle}</th>
                            <th><img src="/image/${product.mainImage}" width="200px"/></th>
                            <th>${product.detail}</th>
                            <th>${product.price}</th>
                            <th>${product.stock}</th>
                            <th>${product.status}</th>
                            <th>${product.createTime?string('yyyy-MM-dd HH:mm:ss')}</th>
                            <th>${product.updateTime?string('yyyy-MM-dd HH:mm:ss')}</th>
                            <th>
                                <a href="update/${product.id}">修改</a>
                                <a href="delete/${product.id}">删除</a>
                            </th>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
