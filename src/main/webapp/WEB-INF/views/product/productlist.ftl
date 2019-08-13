
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

                        <#list productInfoPage.pageList as product>
                        <tr>
                            <th>${product.id}</th>
                            <th>${product.categoryId}</th>
                            <th>${product.name}</th>
                            <th>${product.subtitle}</th>
                            <th><img src="/image/${product.mainImage}" width="200px"/></th>
                            <th>${product.detail}</th>
                            <th>${product.price}</th>
                            <th>${product.stock}</th>
                            <#if product.status == 2>
                                    <a href="/user/product/status/${product.id}/1">上架</a>
                            <#else>
                                    <a href="/user/product/status/${product.id}/2">下架</a>
                            </#if>
                            <th>${product.createTime?string('yyyy-MM-dd HH:mm:ss')}</th>
                            <th>${product.updateTime?string('yyyy-MM-dd HH:mm:ss')}</th>
                            <th>
                                <a href="/user/product/update/${product.id}">修改</a>
                                <a href="/user/product/delete/${product.id}">删除</a>
                            </th>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            <#--分页-->
                <div class="col-md-12 column">
                    <ul class="pagination pull-right">
                    <#if currentPage lte 1>
                        <li class="disabled"><a href="#">上一页</a></li>
                    <#else>
                        <li><a href="/user/product/find/${currentPage - 1}">上一页</a></li>
                    </#if>

                    <#list 1..productInfoPage.getTotalPages() as index>
                        <#if currentPage == index>
                            <li class="disabled"><a href="#">${index}</a></li>
                        <#else>
                            <li><a href="/user/product/find/${index}">${index}</a></li>
                        </#if>
                    </#list>

                    <#if currentPage gte productInfoPage.getTotalPages()>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                        <li><a href="/user/product/find/${currentPage + 1}">下一页</a></li>
                    </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
