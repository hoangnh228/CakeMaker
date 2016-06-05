<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        Order detail
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
                        <div class="col-md-6 col-md-push-3">
                            <!-- Horizontal Form -->
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Order detail</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <table class="table table-bordered">
                                    <tr>
                                        <td width="100">Name</td>
                                        <td>${order.name}</td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td>${order.email}</td>
                                    </tr>
                                    <tr>
                                        <td>Address</td>
                                        <td>${order.address}</td>
                                    </tr>
                                    <tr>
                                        <td>Phone</td>
                                        <td>${order.phone}</td>
                                    </tr>
                                    <tr>
                                        <td>Order date</td>
                                        <td>${order.create_date}</td>
                                    </tr>
                                    <tr>
                                        <td>Status</td>
                                        <td>
                                            <s:set var="stt">${order.status}</s:set>
                                            <s:if test="{#status}">
                                                Delived
                                            </s:if>
                                            <s:else>
                                                Not process
                                            </s:else>
                                        </td>
                                    </tr>
                                </table>
                                <div class="box-header with-border">
                                    <h3 class="box-title">Products</h3>
                                </div>
                                <table class="table table-bordered">
                                    <tr>
                                        <td>Name</td>
                                        <td width="200">Price</td>
                                        <td width="100">Quantity</td>
                                        <td width="100">Subtotal</td>
                                    </tr>
                                    <c:set var="s" value="0"></c:set>
                                    <c:forEach var="it" items="${sessionScope.od}">
                                        <c:set var="s" value="${s + it.product.price * it.quantity}"></c:set>
                                        <tr>
                                            <td>${it.product.title}</td>
                                            <td>$<fmt:formatNumber value="${it.product.price}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                            <td>${it.quantity}</td>
                                            <td>$<fmt:formatNumber value="${it.product.price * it.quantity}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td colspan="3">Total:</td>
                                        <td>$<fmt:formatNumber value="${s}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                    </tr>
                                </table>
                                <s:set var="stt">${order.status}</s:set>
                                <s:if test="{#status}">
                                    <h4 style="text-align: center">This order delived!</h4>
                                </s:if>
                                <s:else>
                                    <a href="<s:url action="confirm-order?id=" />${order.id}" class="btn btn-block btn-primary">Confirm this order delived</a>
                                </s:else>
                                <s:url id="deleteOrder" action="delete-order">
                                    <s:param name="id" value="%{id}"></s:param>
                                </s:url>
                                <s:a cssClass="btn btn-block btn-danger" onclick="return confirm('Are you sure delete this?');" href="%{deleteOrder}">Delete this order</s:a>
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

