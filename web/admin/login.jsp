<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Cake Maker Admin panel | Login</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="../public/admin/css/bootstrap.min.css">
        <link rel="stylesheet" href="../public/admin/css/font-awesome.min.css">
        <link rel="stylesheet" href="../public/admin/css/ionicons.min.css">
        <link rel="stylesheet" href="../public/admin/css/AdminLTE.min.css">
        <link rel="stylesheet" href="../public/admin/js/plugins/iCheck/square/blue.css">
    </head>
    <body class="hold-transition login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href="../../index2.html"><b>Cake</b>Maker</a>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Sign in to start your session</p>
                <s:if test="hasActionErrors()">
                    <h5><s:actionerror /></h5>
                </s:if>
                <form name="login" action="go-login" method="post">
                    <div class="form-group has-feedback">
                        <input type="text" name="user.username" class="form-control" placeholder="Username">
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" name="user.password" class="form-control" placeholder="Password">
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-xs-8"></div>
                        <!-- /.col -->
                        <div class="col-xs-4">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>
                <!-- /.social-auth-links -->
                <a href="#">I forgot my password</a>
            </div>
            <!-- /.login-box-body -->
        </div>
    </body>
</html>