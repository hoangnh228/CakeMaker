/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.Map;

/**
 *
 * @author cam
 */
public class UserHaveToLoginInterceptor extends AbstractInterceptor {
    
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        Map<String, Object> session = actionInvocation.getInvocationContext().getSession();
        
        if(!session.containsKey("userId")) {
            return Action.LOGIN;
        }
        
        return actionInvocation.invoke();
    }
    
}
