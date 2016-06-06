<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <s:include value="../head.jsp">
        <s:param name="titlePage">Order manager</s:param>
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
                        Order
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Order</li>
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
                                    <h3 class="box-title">All order</h3>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th width="20">ID</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Address</th>
                                                <th>Phone</th>
                                                <th>Order date</th>
                                                <th>Status</th>
                                                <th width="100">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <s:iterator value="list" >
                                                <tr>
                                                    <td><s:property value="id"/></td>
                                                    <td><s:property value="name"/></td>
                                                    <td><s:property value="email"/></td>
                                                    <td><s:property value="address"/></td>
                                                    <td><s:property value="phone"/></td>
                                                    <td><s:property value="create_date"/></td>
                                                    <td>
                                                        <s:if test="%{status}">
                                                            Delived
                                                        </s:if>
                                                        <s:else>
                                                            Not process
                                                        </s:else>
                                                    </td>
                                                    <td>
                                                        <s:url id="detail" action="order-detail">
                                                            <s:param name="id" value="%{id}"></s:param>
                                                        </s:url>
                                                        <s:a href="%{detail}">Detail</s:a>
                                                         <s:if test="%{!status}">
                                                            -
                                                            <s:url id="deleteOrder" action="delete-order">
                                                                <s:param name="id" value="%{id}"></s:param>
                                                            </s:url>
                                                            <s:a onclick="return confirm('Are you sure delete this?');" href="%{deleteOrder}">Delete</s:a>
                                                        </s:if>
                                                    </td>
                                                </tr>
                                            </s:iterator>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Address</th>
                                                <th>Phone</th>
                                                <th>Order date</th>
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

