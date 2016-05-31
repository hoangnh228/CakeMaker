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
                        Add new Product
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
                                <form class="form-horizontal" action="<s:url action="insert-product" />" method="post" enctype="multipart/form-data">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="title" class="col-sm-3 control-label">Title</label>
                                            <div class="col-sm-9">
                                                <input type="text" required name="product.title" class="form-control" required id="title" placeholder="Title">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="category" class="col-sm-3 control-label">Category</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="product.category_id">
                                                    <s:iterator value="cList" >
                                                        <option value="<s:property value="id"/>"><s:property value="title"/></option>
                                                    </s:iterator>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="title" class="col-sm-3 control-label">Discount</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="product.discount_id">
                                                    <s:iterator value="dList" >
                                                        <option value="<s:property value="id"/>"><s:property value="title"/></option>
                                                    </s:iterator>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="price" class="col-sm-3 control-label">Price</label>
                                            <div class="col-sm-9">
                                                <input type="text" required name="product.price" required class="form-control" id="price" placeholder="Price">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="upload" class="col-sm-3 control-label">Image</label>
                                            <div class="col-sm-9">
                                                <input required="" type="file" class="form-control" name="upload" id="upload" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="short_des" class="col-sm-3 control-label">Short description</label>
                                            <div class="col-sm-9">
                                                <input type="text" required name="product.short_description" required class="form-control" id="short_des" placeholder="Short description">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="full_des" class="col-sm-3 control-label">Full description</label>
                                            <div class="col-sm-9">
                                                <textarea name="product.full_description" class="textarea" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
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
                                                    <option value="1">publish</option>
                                                    <option value="0">unpublish</option>
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

