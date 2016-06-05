/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import controller.OrderController;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.CartItem;
import model.Order;
import model.OrderDetail;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author Orange
 */
public class OrderAction extends ActionSupport implements ServletRequestAware {
    
    private Order order;
    private final OrderController controller;
    private int id;
    private List<Order> list = new ArrayList<>();
    private HttpServletRequest request;
    
    public String checkout() {
        Map<String, Object> session = ActionContext.getContext().getSession();
        int uid = (int) session.get("userId");
        this.order.setUser_id(uid);
        int insert = controller.insert(this.getOrder());
        System.out.println(insert);
        if(insert > 0) {
            List<CartItem> cart = (List<CartItem>) session.get("cart");
            
            for (CartItem c : cart) {
                OrderDetail d = new OrderDetail();
                d.setOrder_id(insert);
                d.setProduct_id(c.getProduct().getId());
                d.setPrice(c.getProduct().getPrice());
                d.setQuantity(c.getQuantity());
                controller.insertDetail(d);
            }
            
            session.remove("cart");
            this.addActionMessage("Checkout success, we will contact you soon, thank you!");
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return INPUT;
        }
    }
    
    public OrderAction() {
        this.controller = new OrderController();
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Order> getList() {
        return list;
    }

    public void setList(List<Order> list) {
        this.list = list;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }
    
}
