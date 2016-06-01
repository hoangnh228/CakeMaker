<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en">
    <s:include value="header.jsp">
        <s:param name="titlePage">Cake Maker - Login page</s:param>
    </s:include>
    <body id="contactusBody" onload=" if (document.contact_us){ if (document.contact_us.contactname) {document.contact_us.contactname.focus()} };">
        <div class="extra">
            <div class="main-width">
                <s:include value="toppage.jsp" />
                <table border="0" cellspacing="0" cellpadding="0" width="100%" id="contentMainWrapper">
                    <tr>
                        <td id="column-center" valign="top">
                            <div class="column-center-padding">
                                <div class="centerColumn" id="contactUsDefault">
                                    <h1 id="loginDefaultHeading">Welcome, Please Sign In</h1>
                                    <s:if test="hasActionErrors()">
                                        <h2><s:actionerror /></h2>
                                    </s:if>
                                    <s:if test="hasActionMessages()">
                                        <h2><s:actionmessage/></h2>
                                    </s:if>
                                    <div class="tie">
                                        <div class="tie-indent">
                                            <!--BOF normal login-->
                                            <form name="login" action="<s:url action="go-login" />" method="post">
                                                <fieldset class="first">
                                                    <legend>Returning Customers: Please Log In</legend>
                                                    <label class="inputLabel" for="username">Username:</label>
                                                    <input type="text" name="user.username" size = "41" maxlength= "96" id="username" /><br class="clearBoth" />
                                                    <label class="inputLabel" for="password">Password:</label>
                                                    <input type="password" name="user.password" size = "41" maxlength = "40" id="password" /><br class="clearBoth" />
                                                </fieldset>
                                                <div class="buttonRow back"><input class="cssButton button_login" onmouseover="this.className='cssButtonHover button_login button_loginHover'" onmouseout="this.className='cssButton button_login'" type="submit" value="Sign In" style="width: 80px;" /></div>
                                                <div class="buttonRow back">&nbsp; &nbsp; &nbsp;<a  class="forgot_pass" href="#">Forgot your password?</a></div>
                                            </form>
                                            <br class="clearBoth" />
                                        </div>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </td>
                        <s:include value="sidebar.jsp" />
                    </tr>
                </table>
                <s:include value="footer.jsp" />
            </div>
        </div>
    </body>
</html>