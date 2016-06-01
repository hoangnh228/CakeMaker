<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en">
    <s:include value="header.jsp">
        <s:param name="titlePage">Cake Maker - Register page</s:param>
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
                                    <h1 id="loginDefaultHeading">Welcome, Please Register An Account</h1>
                                    <s:if test="hasActionErrors()">
                                        <h2><s:actionerror /></h2>
                                    </s:if>
                                    <s:if test="hasActionMessages()">
                                        <h2><s:actionmessage/></h2>
                                    </s:if>
                                    <div class="tie">
                                        <div class="tie-indent">
                                            <form name="register" action="<s:url action="go-register" />" method="post">
                                                <fieldset class="second">
                                                    <legend>New? Please Provide Your Information</legend>
                                                    <div class="information">Create a customer profile with <strong>Bistro</strong> which allows you to shop faster, track the status of your current orders and review your previous orders.</div>
                                                    <div class="alert forward">* Required information</div>
                                                    <br class="clearBoth" />
                                                    <fieldset class="company">
                                                        <legend>Account Details</legend>
                                                        <label class="inputLabel" for="username">Username:<span class="alert">*</span></label>
                                                        <input required type="text" name="user.username" size="40" id="username" /><br class="clearBoth" />
                                                        <label class="inputLabel" for="password">Password:<span class="alert">*</span></label>
                                                        <input required type="password" name="user.password"  size="40" id="password" /><br class="clearBoth" />
                                                        <label class="inputLabel" for="address">Address:<span class="alert">*</span></label>
                                                        <input required type="text" name="user.address" size="40" id="address" /><br class="clearBoth" />
                                                        <label class="inputLabel" for="email">Email:<span class="alert">*</span></label>
                                                        <input required type="text" name="user.email" size="40" id="email" /><br class="clearBoth" />
                                                        <label class="inputLabel" for="phone">Phone:<span class="alert">*</span></label>
                                                        <input required type="text" name="user.phone" size="40" id="phone" /><br class="clearBoth" />
                                                    </fieldset>
                                                </fieldset>
                                                <div class="buttonRow"><input class="cssButton button_submit" onmouseover="this.className='cssButtonHover button_submit button_submitHover'" onmouseout="this.className='cssButton button_submit'" type="submit" value="Submit the Information" style="width: 143px;" /></div>
                                            </form>
                                            <!--EOF normal login-->
                                            <div class="clear"></div>
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