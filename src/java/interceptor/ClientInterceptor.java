/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import controller.BannerController;
import controller.CategoryController;
import controller.ProductController;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Cart;

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
        ProductController pro = new ProductController();
        List slider = banner.getAll();
        List menu = cate.getAll();
        List product = pro.getProductClient(5);
        session.put("menu", menu);
        session.put("slider", slider);
        session.put("pro", product);
        
        List<Cart> cart;
        
        if(!session.containsKey("cart")) {
            cart = new ArrayList<>();
            session.put("cart", cart);
            session.put("cart_total", cart.size());
        }
        
        return actionInvocation.invoke();
    }
    
}
