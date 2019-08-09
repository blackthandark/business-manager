
<html>
<#include "common/header.ftl">
<body>



<div id="wrapper" class="toggled">

<#--边栏sidebar-->
<#include "common/nav.ftl">
    <h1>修改类别</h1>
<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <form role="form" method="post" action="">
                        <input type="hidden" name="id" value="${category.id}" class="form-control">
                        <div class="form-group">
                            <label>名称</label>
                            <input name="name" type="text" value="${category.name}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>父类别</label>
                            <select name="parentId" class="form-control">
                                <option value="${category.parentId}" selected:disabled style="display: none">${parentcategory.name}</option>
                                <#list categorylist as categorylist>
                                    <option value="${categorylist.id}">${categorylist.name}</option>
                                </#list>
                                <option value="0">无</option>
                            </select><br/>
                        </div>
                        <div class="form-group">
                            <label>类别状态</label>
                            <input name="status" type="text" value="${category.status}" class="form-control"/>
                        </div>
                        <button type="submit" class="btn btn-default">保存</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
