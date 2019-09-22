
<html>
    <#include "common/header.ftl">
<body>
<div id="wrapper" class="toggled">

<#--边栏sidebar-->
    <#include "common/nav.ftl">
    <h1>商品详情</h1>

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">

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
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>${productdetail.id}</th>
                            <th>${productdetail.category}</th>
                            <th>${productdetail.name}</th>
                            <th>${productdetail.subtitle}</th>
                            <th><img src="http://img.cdn.imbession.top/${productdetail.mainImage}" width="200px"/></th>
                        <#--<th><img src="127.0.0.1/${product.mainImage}" width="200px"/></th>-->
                            <th>${productdetail.price}</th>
                            <th>${productdetail.stock}</th>
                            <th>${productdetail.statusDesc}</th>
                            <th>${productdetail.createTime}</th>
                            <th>${productdetail.updateTime}</th>
                        </tr>
                        </tbody>
                    </table>
                    <br><br>
                    <p>产品副图</p>
                    <br>
                    <#list productdetail.subImgArr as subImg>
                        <img src="http://img.cdn.imbession.top/${subImg}" width="200px">
                    </#list>
                    <br><br>
                    <p>详情</p>
                    <br>
                    ${productdetail.detail}
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
