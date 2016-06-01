<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <s:include value="head.jsp">
        <s:param name="titlePage">User profile</s:param>
    </s:include>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <!-- header -->
            <s:include value="header.jsp" />
            <!-- header -->
            
            <!-- Left side column. contains the logo and sidebar -->
            <s:include value="navigation.jsp" />
            <!-- /Left side column. contains the logo and sidebar -->

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Update profile
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
                                    <h3 class="box-title">Profile</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <form class="form-horizontal" action="<s:url action="go-profile" />" method="post" onsubmit="return checkPass();">
                                    <input type="hidden" name="user.id" value="${user.id}">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="address" class="col-sm-3 control-label">Password</label>
                                            <div class="col-sm-9">
                                                <input type="password" required id="password" name="user.password" value="${user.address}" class="form-control" placeholder="Password">
                                            </div>
                                        </div>
                                            <div class="form-group">
                                            <label for="address" class="col-sm-3 control-label">Re-Password</label>
                                            <div class="col-sm-9">
                                                <input type="password" required class="form-control" id="password1" placeholder="Confirm Password">
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
                                    <!-- /.box-body -->
                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-info pull-right">Submit</button>
                                    </div>
                                    <!-- /.box-footer -->
                                </form>
                                <script>
                                    function checkPass() {
                                        var pass = $('#password').val();
                                        var pass1 = $('#password1').val();
                                        if(pass1 == pass) {
                                            return true;
                                        }
                                        alert("password not equal!");
                                        return false;
                                    }
                                </script>
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
            <s:include value="footer.jsp" />
            <!-- /footer -->
        </div>
        <!-- ./wrapper -->
    </body>
</html>