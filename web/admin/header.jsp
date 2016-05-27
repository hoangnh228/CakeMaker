<%@taglib prefix="s" uri="/struts-tags" %>
<header class="main-header">
    <!-- Logo -->
    <a href="<s:url value="/admin" />" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>C</b>M</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Cake</b>Maker</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-gears"></i> &nbsp
                        <span class="hidden-xs">Hi, Alexander Pierce</span>
                    </a>
                    <ul class="dropdown-menu" style="width: 170px;">
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="<s:url value="/admin/profile" />" class="btn btn-default btn-flat">Profile</a>
                            </div>
                            <div class="pull-right">
                                <a href="<s:url value="/admin/logout" />" class="btn btn-default btn-flat">Sign out</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>