<nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
    <ul class="nav sidebar-nav">
        <li class="sidebar-brand">
            <a href="#">
                卖家管理系统
            </a>
        </li>
        <li>
            <a href="/user/order/list"><i class="fa fa-fw fa-list-alt"></i> 订单</a>
        </li>
        <li class="dropdown open">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-fw fa-plus"></i> 商品 <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header">操作</li>
                <li><a href="/user/product/search">列表</a></li>
                <li><a href="/user/product/add">新增</a></li>
                <#--<li><a href="/businessmanager/user/product/search">列表</a></li>
                <li><a href="/businessmanager/user/product/add">新增</a></li>-->
            </ul>
        </li>
        <li class="dropdown open">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-fw fa-plus"></i> 类目 <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header">操作</li>
                <li><a href="/user/category/find/1">列表</a></li>
                <li><a href="/user/category/add">新增</a></li>
                <#--<li><a href="/businessmanager/user/category/find/1">列表</a></li>
                <li><a href="/businessmanager/user/category/add">新增</a></li>-->
            </ul>
        </li>

        <li>
            <a href="/user/logout"><i class="fa fa-fw fa-list-alt"></i> 登出</a>
                <#--<a href="/businessmanager/user/logout"><i class="fa fa-fw fa-list-alt"></i> 登出</a>-->
        </li>
    </ul>
</nav>