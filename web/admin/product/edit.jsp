<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <s:include value="../head.jsp">
        <s:param name="titlePage">Product manager</s:param>
    </s:include>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <!-- header -->
            <s:include value="../header.jsp" />
            <!-- header -->
            
            <!-- Left side column. contains the logo and sidebar -->
            <s:include value="../navigation.jsp" />
            <!-- /Left side column. contains the logo and sidebar -->

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Edit Product
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Product</li>
                    </ol>
                    <s:if test="hasActionErrors()">
                        <h4><s:actionerror /></h4>
                    </s:if>
                    <s:if test="hasActionMessages()">
                        <h4><s:actionmessage/></h4>
                    </s:if>
                </section>

                <!-- Main content -->
                <section class="content">
                    <!-- Main row -->
                    <div class="row">
                        <div class="col-md-8 col-md-push-2">
                            <!-- Horizontal Form -->
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Product Form</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <form class="form-horizontal" action="<s:url action="update-product" />" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="product.id" value="${product.id}" />
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="title" class="col-sm-3 control-label">Title</label>
                                            <div class="col-sm-9">
                                                <input type="text" required name="product.title" class="form-control" value="${product.title}" required id="title" placeholder="Title">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="category" class="col-sm-3 control-label">Category</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="product.category_id">
                                                    <s:iterator value="cList" >
                                                        <s:if test="%{product.category_id == id}">
                                                            <option selected="" value="<s:property value="id"/>"><s:property value="title"/></option>
                                                        </s:if>
                                                        <s:else>
                                                            <option value="<s:property value="id"/>"><s:property value="title"/></option>
                                                        </s:else>
                                                    </s:iterator>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="title" class="col-sm-3 control-label">Discount</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="product.discount_id">
                                                    <s:iterator value="dList">
                                                        <s:if test="%{product.discount_id == id}">
                                                            <option selected="" value="<s:property value="id"/>"><s:property value="title"/></option>
                                                        </s:if>
                                                        <s:else>
                                                            <option value="<s:property value="id"/>"><s:property value="title"/></option>
                                                        </s:else>
                                                    </s:iterator>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="price" class="col-sm-3 control-label">Price</label>
                                            <div class="col-sm-9">
                                                <input type="text" required name="product.price" value="${product.price}" required class="form-control" id="price" placeholder="Price">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="upload" class="col-sm-3 control-label">Image</label>
                                            <div class="col-sm-9">
                                                <input type="file" class="form-control" name="upload" id="upload" />
                                                <img style="max-height: 150px; margin-top: 10px;" src="<s:url value="../public/upload/product/"/>${product.image}" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="short_des" class="col-sm-3 control-label">Short description</label>
                                            <div class="col-sm-9">
                                                <input type="text" required name="product.short_description" value="${product.short_description}" required class="form-control" id="short_des" placeholder="Short description">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="full_des" class="col-sm-3 control-label">Full description</label>
                                            <div class="col-sm-9">
                                                <textarea name="product.full_description" class="textarea" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">${product.full_description}</textarea>
                                                <script>
                                                    $(function () {
                                                        $(".textarea").wysihtml5();
                                                    });
                                                </script>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="status" class="col-sm-3 control-label">Status</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="product.status" id="status">
                                                    <s:if test="%{product.status == 1}">
                                                        <option value="1" selected="">publish</option>
                                                        <option value="0">unpublish</option>
                                                    </s:if>
                                                    <s:else>
                                                        <option value="1">publish</option>
                                                        <option value="0" selected="">unpublish</option>
                                                    </s:else>
                                                </select>
                                            </div>
                                        </div>
                                    <!-- /.box-body -->
                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-info pull-right">Submit</button>
                                    </div>
                                    <!-- /.box-footer -->
                                </form>
                            </div>
                            <!-- /.box -->
                        </div>
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <!-- footer -->
            <s:include value="../footer.jsp" />
            <!-- /footer -->
        </div>
        <!-- ./wrapper -->
    </body>
</html>

