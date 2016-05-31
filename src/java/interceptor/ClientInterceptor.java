/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.Interceptor;
import controller.BannerController;
import controller.CategoryController;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Orange
 */
public class ClientInterceptor extends AbstractInterceptor {
    
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        Map<String, Object> session = actionInvocation.getInvocationContext().getSession();
        CategoryController cate = new CategoryController();
        BannerController banner = new BannerController();
        List slider = banner.getAll();
        List menu = cate.getAll();
        session.put("menu", menu);
        session.put("slider", slider);
        return actionInvocation.invoke();
    }
    
}
