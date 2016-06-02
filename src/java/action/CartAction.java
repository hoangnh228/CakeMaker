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
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Product;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author cam
 */
public class CartAction extends ActionSupport implements ServletRequestAware {
    
    private HttpServletRequest request;
    public List<Cart> cart;
    public ProductController controller;
    
    public String addCard() {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        cart = (List<Cart>) session.getAttribute("cart");

        Product p = controller.getById(id);
        Cart c = new Cart();
        c.setId(id);
        c.setQuantity(1);
        c.setPrice(p.getPrice());
        c.setTitle(p.getTitle());
        c.setImage(p.getImage());
        cart.add(c);
        session.setAttribute("cart", cart);
        session.setAttribute("cart_total", cart.size());
        return SUCCESS;
    }
    
    public String cart() {
        Map session = ActionContext.getContext().getSession();
        cart = (List<Cart>) session.get("cart");
        
        if(cart.size() > 0) {
            System.out.println(cart.size());
            System.out.println(cart.get(0).getTitle());
        }
        
        request.getSession().setAttribute("list", cart);
        return SUCCESS;
    }

    public CartAction() {
        controller = new ProductController();
//        cart = (List<Cart>) session.get("cart");
    }
    
    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }
    
}
