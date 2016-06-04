/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import controller.ProductController;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.CartItem;
import model.Product;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author Orange
 */
public class CartAction extends ActionSupport implements ServletRequestAware{
    
    private final ProductController controller;
    private HttpServletRequest request;
    
    public String addCart() {
        Map<String, Object> session = ActionContext.getContext().getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        Product p = controller.getById(id);
        List<CartItem> cart = null;
        
        if(session.get("cart") == null) {
            cart = new ArrayList<>();
            cart.add(new CartItem(p, 1));
        } else {
            cart = (List<CartItem>) session.get("cart");
            int index = this.isExist(id);
            
            if(index == -1) {
                cart.add(new CartItem(p, 1));
            } else {
                int quantity = cart.get(index).getQuantity() + 1;
                cart.get(index).setQuantity(quantity);
            }
        }
        
        session.put("cart", cart);
        return SUCCESS;
    }
    
    public String deleteCart() {
        Map<String, Object> session = ActionContext.getContext().getSession();
        List<CartItem> cart = (List<CartItem>) session.get("cart");
        int id = Integer.parseInt(request.getParameter("id"));
        int index = this.isExist(id);
        cart.remove(index);
        session.put("cart", cart);
        
        return SUCCESS;
    }
    
    public int isExist(int id) {
        Map<String, Object> session = ActionContext.getContext().getSession();
        List<CartItem> cart = (List<CartItem>) session.get("cart");
        
        for (int i = 0; i < cart.size(); i++) {
            if(cart.get(i).getProduct().getId() == id) {
                return i;
            }
        }
        
        return -1;
    }

    public CartAction() {
        this.controller = new ProductController();
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }
    
}
