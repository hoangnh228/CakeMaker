<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en">
    <s:include value="header.jsp">
        <s:param name="titlePage">Cake Maker - Contact Us</s:param>
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
                                    <h1 id="gvFaqDefaultHeading">Contact Us</h1>
                                    <s:if test="hasActionErrors()">
                                        <h2><s:actionerror /></h2>
                                    </s:if>
                                    <s:if test="hasActionMessages()">
                                        <h2><s:actionmessage/></h2>
                                    </s:if>
                                    <div class="tie text2">
                                        <div class="tie-indent">
                                            <form name="feedback" action="<s:url action="send-feedback" />" method="post">
                                                <address>Customer Service: +1 800 559 6580<br>9870 St Vincent Place,<br>Glasgow, DC 45 Fr 45.<br></address>
                                                <div id="contactUsNoticeContent" class="content">
                                                    <p><strong>Welcome to Cake Maker ...</strong></p>
                                                    <p>This section of text is from the Define Pages Editor located under Tools in the Admin.</p>
                                                    <p>To remove this section of the text, delete it from the Define Pages Editor.</p>
                                                </div>
                                                <fieldset id="contactUsForm">
                                                    <legend>Send Us Feedback</legend>
                                                    <div class="alert alignright" style="margin-right: 80px;">* Required information</div>
                                                    <label class="inputLabel" for="name">Name:<span class="alert">*</span></label>
                                                    <input required type="text" name="feedback.name"  size="40" id="name" /><br class="clearBoth" />
                                                    <label class="inputLabel" for="phone">Phone:<span class="alert">*</span></label>
                                                    <input required type="text" name="feedback.phone"  size="40" id="phone" /><br class="clearBoth" />
                                                    <label class="inputLabel" for="email">Email Address:<span class="alert">*</span></label>
                                                    <input required type="text" name="feedback.email"  size="40" id="email" /><br class="clearBoth" />
                                                    <label  class="inputLabel" for="enquiry">Message:<span class="alert">*</span></label>
                                                    <textarea required name="feedback.content" cols="20" rows="7" id="enquiry"></textarea>
                                                </fieldset>
                                                <div class="buttonRow forward"><input class="cssButton button_send" onmouseover="this.className='cssButtonHover button_send button_sendHover'" onmouseout="this.className='cssButton button_send'" type="submit" value="Send Now" style="width: 80px;" /></div>
                                            </form>
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