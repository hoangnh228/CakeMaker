<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="header">
    <div class="logo">
        <a href="<s:url value="/" />"><img src="public/images/logo.jpg" alt="" width="241" height="104"/></a>
    </div>
    <div class="menu" style="width: 100%;">
        <div id="navEZPagesTop">
            <ul style="display: inline-block;">
                <li class="selected  first">
                    <a href="<s:url value="/" />">
                    <span class="corner"></span>
                    <span>
                        <span>Home</span>
                    </span>
                    </a>
                </li>
                <li class="">
                    <a href="<s:url action="product" />">
                    <span class="corner"></span>
                    <span>
                        <span>Products</span>
                    </span>
                    </a>
                </li>
                <li class="">
                    <a href="<s:url action="contact-us" />">
                    <span class="corner"></span>
                    <span>
                        <span>Contact Us</span>
                    </span>
                    </a>
                </li>
            </ul>
            <ul style="float: right;">
                <s:if test="#session.userId">
                    <li><a href="#">Welcome, <s:property value="#session.userName" /></a></li>
                    <li><a href="<s:url action="profile" />">Profile</a></li>
                    <li><a href="<s:url action="logout" />">Logout</a></li>
                </s:if>
                <s:else>
                    <li><a href="<s:url action="login" />">Login</a></li>
                    <li><a href="<s:url action="register" />">Register</a></li>
                </s:else>
            </ul>
        </div>
    </div>
    <div class="cart">
        <a class="st1" href="<s:url action="cart" />"><span>Shopping cart:</span></a><a class="on"><span class="count">${sessionScope.cart.size()}</span> items</a>
    </div>
    <div id="head-search">
        <form name="search" action="<s:url action="search" />" method="get">
            <div>
                <input type="text" name="keyword" size="18" class="input1" maxlength="100" style="width: -30px"/>
                <span class="input2">
                    <input class="cssButton search" onmouseover="this.className = 'cssButtonHover search searchHover'" onmouseout="this.className = 'cssButton search'" type="submit" value="Search" style="width: 80px;"/>
                </span>
            </div>
        </form>
    </div>
    <div class="hor-cat">
        <div id="dropMenuWrapper">
            <div id="dropMenu">
                <ul class="level1">
                    <c:forEach items="${menu}" var="item">
                        <li><a href="<s:url action="category?id=" />${item.id}">${item.title}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="clearBoth"></div>
    </div>
    <div id="bannerOne">
        <a href="#"><img src="public/images/banner1.jpg" alt="" width="241" height="104"/></a>
    </div>
</div>
<style>
    .slider {
        width: 1024px;
        height: 376px;
    }
    #slideshow { 
        position: relative; 
        width: 1024px; 
    }

    #slideshow > div { 
        position: absolute; 
        top: 0px; 
        left: 0px; 
        right: 0px; 
        bottom: 0px; 
    }
</style>
<div class="slider">
    <div class="slider-wrapper theme-default">
        <div id="slideshow">
            <c:forEach items="${sessionScope.slider}" var="item">
                <div><a href="#"><img src="public/upload/banner/${item.url}" alt="" width="1024" height="376"/></a></div>
            </c:forEach>
        </div>
    </div>
</div>