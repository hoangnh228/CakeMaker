<%@taglib prefix="s" uri="/struts-tags" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                    <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li>
                <a href="<s:url value="/admin" />">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="<s:url value="/admin/product" />">
                    <i class="fa fa-th"></i>
                    <span>Product</span>
                </a>
            </li>
            <li>
                <a href="<s:url value="/admin/category" />">
                    <i class="fa fa-files-o"></i>
                    <span>Category</span>
                </a>
            </li>
            <li>
                <a href="<s:url value="/admin/order" />">
                    <i class="fa fa-cart-plus"></i>
                    <span>Order</span>
                </a>
            </li>
            <li>
                <a href="<s:url value="/admin/store" />">
                    <i class="fa fa-folder"></i>
                    <span>Store</span>
                </a>
            </li>
            <li>
                <a href="<s:url value="/admin/discount" />">
                    <i class="fa fa-edit"></i>
                    <span>Discount</span>
                </a>
            </li>
            <li>
                <a href="<s:url value="/admin/banner" />">
                    <i class="fa fa-laptop"></i>
                    <span>Banner</span>
                </a>
            </li>
            <li>
                <a href="<s:url value="/admin/feedback" />">
                    <i class="fa fa-envelope"></i>
                    <span>Feedback</span>
                </a>
            </li>
            <li>
                <a href="<s:url value="/admin/user" />">
                    <i class="fa fa-user"></i>
                    <span>User</span>
                </a>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>