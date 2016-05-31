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
                        Edit User
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
                        <div class="col-md-8 col-md-push-2">
                            <!-- Horizontal Form -->
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title">User Form</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <form class="form-horizontal" action="<s:url action="update-user" />" method="post">
                                    <input type="hidden" name="user.id" value="${user.id}">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="username" class="col-sm-3 control-label">Username</label>
                                            <div class="col-sm-9">
                                                <input type="text" readonly value="${user.username}" class="form-control" id="username">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="address" class="col-sm-3 control-label">Address</label>
                                            <div class="col-sm-9">
                                                <input type="text" required name="user.address" value="${user.address}" class="form-control" id="address" placeholder="Address">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="email" class="col-sm-3 control-label">Email</label>
                                            <div class="col-sm-9">
                                                <input type="text" required name="user.email" value="${user.email}" class="form-control" id="email" placeholder="Email">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone" class="col-sm-3 control-label">Phone</label>
                                            <div class="col-sm-9">
                                                <input type="text" required name="user.phone" value="${user.phone}" class="form-control" id="phone" placeholder="Phone">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="permission" class="col-sm-3 control-label">Permission</label>
                                            <div class="col-sm-9">
                                                <s:set var="per">${user.permission}</s:set>
                                                <select class="form-control" name="user.permission" id="permission">
                                                    <s:if test="#per == 1">
                                                        <option value="1" selected="">Admin</option>
                                                        <option value="0">User</option>
                                                    </s:if>
                                                    <s:else>
                                                        <option value="1">Admin</option>
                                                        <option value="0" selected="">User</option>
                                                    </s:else>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="status" class="col-sm-3 control-label">Status</label>
                                            <div class="col-sm-9">
                                                <s:set var="stt">${user.permission}</s:set>
                                                <select class="form-control" name="user.status" id="status">
                                                    <s:if test="#stt == 1">
                                                        <option value="1" selected="">Unlock</option>
                                                        <option value="0">Lock</option>
                                                    </s:if>
                                                    <s:else>
                                                        <option value="1">Unlock</option>
                                                        <option value="0" selected="">Lock</option>
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

