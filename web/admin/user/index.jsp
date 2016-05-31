<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <s:include value="../head.jsp">
        <s:param name="titlePage">User manager</s:param>
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
                        User
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">User</li>
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
                                    <h3 class="box-title">All user</h3>
                                    <s:a cssStyle="width: 100px; display: inline-block; float: right;" cssClass="btn btn-block btn-primary" action="add-user">Add new</s:a>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th width="20">ID</th>
                                                <th>Username</th>
                                                <th>Permission</th>
                                                <th>Phone</th>
                                                <th>Email</th>
                                                <th>Status</th>
                                                <th width="100">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <s:iterator value="list" >
                                                <tr>
                                                    <td><s:property value="id"/></td>
                                                    <td><s:property value="username"/></td>
                                                    <td>
                                                        <s:set var="per"><s:property value="permission"/></s:set>
                                                        <s:if test="#per == 0">
                                                            user
                                                        </s:if>
                                                        <s:else>
                                                            admin
                                                        </s:else>
                                                    </td>
                                                    <td><s:property value="phone"/></td>
                                                    <td><s:property value="email"/></td>
                                                    <td>
                                                        <s:if test="%{!status}">
                                                            locked
                                                        </s:if>
                                                    </td>
                                                    <td>
                                                        <s:url id="editUser" action="edit-user">
                                                            <s:param name="id" value="%{id}"></s:param>
                                                        </s:url>
                                                        <s:a href="%{editUser}">Edit</s:a>
                                                        -
                                                        <s:url id="deleteUser" action="delete-user">
                                                            <s:param name="id" value="%{id}"></s:param>
                                                        </s:url>
                                                        <s:a onclick="return confirm('Are you sure delete this?');" href="%{deleteUser}">Delete</s:a>
                                                    </td>
                                                </tr>
                                            </s:iterator>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Username</th>
                                                <th>Permission</th>
                                                <th>Phone</th>
                                                <th>Email</th>
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

