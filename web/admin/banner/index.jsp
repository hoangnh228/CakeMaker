<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <s:include value="../head.jsp">
        <s:param name="titlePage">Category manager</s:param>
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
                        Banner
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Banner</li>
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
                                    <h3 class="box-title">All banner</h3>
                                    <div style="margin-top: 15px;">
                                        <s:form action="upload-banner" method="post" enctype="multipart/form-data">
                                            <input type="file" name="upload" />
                                            <input type="submit" value="Upload" class="btn btn-block btn-primary" style="width: 100px; display: inline-block; float: left; margin-top: 10px;" />
                                        </s:form>
                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th width="20">ID</th>
                                                <th width="250">Url</th>
                                                <th>Preview</th>
                                                <th width="100">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <s:iterator value="list" >
                                                <tr>
                                                    <td><s:property value="id"/></td>
                                                    <td><s:property value="url"/></td>
                                                    <td>
                                                        <img src="<s:property value="url"/>" />
                                                    </td>
                                                    <td>
                                                        <s:url id="deleteBanner" action="delete-banner">
                                                            <s:param name="id" value="%{id}"></s:param>
                                                        </s:url>
                                                        <s:a onclick="return confirm('Are you sure delete this?');" href="%{deleteBanner}">Delete</s:a>
                                                    </td>
                                                </tr>
                                            </s:iterator>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Url</th>
                                                <th>Preview</th>
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

