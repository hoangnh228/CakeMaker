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
                        Product
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
                        <!-- Left col -->
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">All product</h3>
                                    <s:a cssStyle="width: 100px; display: inline-block; float: right;" cssClass="btn btn-block btn-primary" action="add-product">Add new</s:a>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th width="20">ID</th>
                                                <th>Title</th>
                                                <th width="200">Category</th>
                                                <th width="100">Price</th>
                                                <th width="250">Image</th>
                                                <th width="100">Status</th>
                                                <th width="100">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <s:iterator value="list" >
                                                <tr>
                                                    <td><s:property value="id"/></td>
                                                    <td><s:property value="title"/></td>
                                                    <td><s:property value="category"/></td>
                                                    <td>$<s:property value="price"/></td>
                                                    <td><img style="max-height: 100px" src="<s:url value="../public/upload/product/"/><s:property value="image"/>" /></td>
                                                    <td>
                                                        <s:if test="%{status}">
                                                            publish
                                                        </s:if>
                                                        <s:else>
                                                            unpublish
                                                        </s:else>
                                                    </td>
                                                    <td>
                                                        <s:url id="editProduct" action="edit-product">
                                                            <s:param name="id" value="%{id}"></s:param>
                                                        </s:url>
                                                        <s:a href="%{editProduct}">Edit</s:a>
                                                        -
                                                        <s:url id="deleteProduct" action="delete-product">
                                                            <s:param name="id" value="%{id}"></s:param>
                                                        </s:url>
                                                        <s:a onclick="return confirm('Are you sure delete this?');" href="%{deleteProduct}">Delete</s:a>
                                                    </td>
                                                </tr>
                                            </s:iterator>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Title</th>
                                                <th>Category</th>
                                                <th>Price</th>
                                                <th>Image</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
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

