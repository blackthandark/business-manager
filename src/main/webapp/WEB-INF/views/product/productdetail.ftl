
<html>
    <#include "common/header.ftl">
<body>
<div id="wrapper" class="toggled">

<#--边栏sidebar-->
    <#include "common/nav.ftl">
    <h1>商品搜索</h1>

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <form role="form" method="get" action="" id="searchform">
                        <div class="form-group">
                            <input name="searchText" type="text" class="form-control" value="${searchText}"/>
                        </div>
                        <br>
                        <#if type="product">
                            <input type="radio" name="type" value="product" checked="checked">商品名
                        <#else>
                            <input type="radio" name="type" value="product">商品名
                        </#if>
                        <#if type="category">
                            <input type="radio" name="type" value="category" checked="checked">类别
                        <#else>
                            <input type="radio" name="type" value="category">类别
                        </#if>
                        <button type="submit" class="btn btn-default">搜索</button>
                    </form>

                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>商品ID</th>
                            <th>类别</th>
                            <th>商品名称</th>
                            <th>商品副标题</th>
                            <th>产品主图</th>
                            <th>价格</th>
                            <th>库存数量</th>
                            <th>商品状态</th>
                            <th>创建时间</th>
                            <th>更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list productlist.list as product>
                        <tr>
                            <th>${product.id}</th>
                            <th>${product.category}</th>
                            <th>${product.name}</th>
                            <th>${product.subtitle}</th>
                            <th><img src="http://img.cdn.imbession.top/${product.mainImage}" width="200px"/></th>
                            <#--<th><img src="127.0.0.1/${product.mainImage}" width="200px"/></th>-->
                            <th>${product.price}</th>
                            <th>${product.stock}</th>
                            <th><#if product.status == 2>
                                    <a href="/user/product/status/${product.id}/1">上架</a>
                            <#else>
                                    <a href="/user/product/status/${product.id}/2">下架</a>
                            </#if>
                            </th>
                            <th>${product.createTime}</th>
                            <th>${product.updateTime}</th>
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
                    <#if productlist.pageNum lte 1>
                        <li class="disabled"><a href="#">上一页</a></li>
                    <#else>
                        <li><a href="/user/product/search?pageNum=${productlist.pageNum - 1}&pageSize=${productlist.pageSize}">上一页</a></li>
                    </#if>

                    <#list 1..productlist.pages as index>
                        <#if productlist.pageNum == index>
                            <li class="disabled"><a href="#">${index}</a></li>
                        <#else>
                            <li><a href="/user/product/search?pageNum=${index}&pageSize=${productlist.pageSize}">${index}</a></li>
                        </#if>
                    </#list>

                    <#if productlist.pageNum gte productlist.pages>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                        <li><a href="/user/product/search?pageNum=${productlist.pageNum + 1}&pageSize=${productlist.pageSize}">下一页</a></li>
                    </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    function myonclick() {
        var form=document.getElementsById('searchform');
        form.submit();
    }
</script>