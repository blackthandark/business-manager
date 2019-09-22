<html>
<#include "common/header.ftl">

<body >
<div id="wrapper" class="toggled">

<#--边栏sidebar-->
    <#include "common/nav.ftl">
    <h1>订单详情</h1>


    <#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-4 column">

                </div>

            <#--订单详情表数据-->
                <div class="col-md-12 column">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>订单号</th>
                            <th>订单总金额</th>
                            <th>订单状态</th>
                            <th>支付时间</th>
                            <th>发货时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${orderdetail.orderNo}</td>
                            <td>${orderdetail.payment}</td>
                            <td>${orderdetail.statusDesc}</td>
                            <td>${orderdetail.paymentTime}</td>
                            <td>${orderdetail.sendTime}</td>
                        </tr>
                        </tbody>
                    </table>
                    <br><br>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>商品id</th>
                            <th>商品名称</th>
                            <th>价格</th>
                            <th>数量</th>
                            <th>总额</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list orderdetail.orderItemVoList as order>
                        <tr>
                            <td>${order.productId}</td>
                            <td>${order.productName}</td>
                            <td>${order.currentUnitPrice}</td>
                            <td>${order.quantity}</td>
                            <td>${order.totalPrice}</td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

            <#--操作-->
                <div class="col-md-12 column">
                <#if orderdetail.statusDesc == "已付款">
                    <a href="/user/order/send?orderNo=${orderdetail.orderNo}" type="button" class="btn btn-default btn-danger">发货</a>
                    <#--<a href="/sell/seller/order/finish?orderId=${orderDTO.orderId}" type="button" class="btn btn-default btn-primary">完结订单</a>
                    <a href="/sell/seller/order/cancel?orderId=${orderDTO.orderId}" type="button" class="btn btn-default btn-danger">取消订单</a>-->
                </#if>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>