
<html>
<#include "common/header.ftl">

<body>

<h1>添加类别</h1>

<div id="wrapper" class="toggled">

<#--边栏sidebar-->
<#include "common/nav.ftl">

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <form role="form" method="post" action="">
                        <div class="form-group">
                            <label>类别名称</label>
                            <input name="name" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>父类别</label>
                            <select name="parentId" class="form-control">
                                <option value="0">无</option>
                            <#list categorylist as categorylist>
                                <option value="${categorylist.id}">${categorylist.name}</option>
                            </#list>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>类别状态</label>
                            <input name="status" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>排序编号</label>
                            <input name="sortOrder" type="text" class="form-control" />
                        </div>
                        <button type="submit" class="btn btn-default">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
