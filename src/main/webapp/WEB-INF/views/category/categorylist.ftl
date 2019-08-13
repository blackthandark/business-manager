
<html>
<#include  "common/header.ftl">
<body>

<div id="wrapper" class="toggled">

<#--边栏sidebar-->
    <#include "common/nav.ftl">

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>类别ID</th>
                            <th>类别名称</th>
                            <th>所属父类</th>
                            <th>类别状态</th>
                            <th>创建时间</th>
                            <th>修改时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list categoryInfoPage.pageList as category>
                        <tr>
                            <th>${category.id}</th>
                            <th>${category.name}</th>
                            <th>${category.parentId}</th>
                            <th>${category.status}</th>
                            <th>${category.createTime?string('yyyy-MM-dd HH:mm:ss')}</th>
                            <th>${category.updateTime?string('yyyy-MM-dd HH:mm:ss')}</th>
                            <th>
                                <a href="/user/category/update/${category.id}">修改</a>
                                <a href="/user/category/delete/${category.id}">删除</a>
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
                        <li><a href="/user/category/find/${currentPage - 1}">上一页</a></li>
                    </#if>

                    <#list 1..categoryInfoPage.getTotalPages() as index>
                        <#if currentPage == index>
                            <li class="disabled"><a href="#">${index}</a></li>
                        <#else>
                            <li><a href="/user/category/find/${index}">${index}</a></li>
                        </#if>
                    </#list>
                    <#if currentPage gte categoryInfoPage.getTotalPages()>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                        <li><a href="/user/category/find/${currentPage + 1}">下一页</a></li>
                    </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>


</body>
</html>
