/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import controller.OrderController;
import controller.ProductController;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.CartItem;
import model.Order;
import model.OrderDetail;
import model.Product;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author Orange
 */
public class OrderAction extends ActionSupport implements ServletRequestAware {
    
    private Order order;
    private final OrderController controller;
    private final ProductController pController;
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
    
    public String getAll() {
        list = controller.getAll();
        ServletActionContext.getRequest().getSession().setAttribute("list", list);
        return SUCCESS;
    }
    
    public String getById() {
        int cid = Integer.parseInt(request.getParameter("id"));
        Order detail = controller.getById(cid);
        List<OrderDetail> listDetail = controller.getAllDetail(cid);
        List<CartItem> cart = new ArrayList<>();
        Map<String, Object> session = ActionContext.getContext().getSession();
        
        for (OrderDetail d : listDetail) {
            Product p = pController.getById(d.getProduct_id());
            cart.add(new CartItem(p, d.getQuantity()));
        }
        
        session.put("od", cart);
        ServletActionContext.getRequest().getSession().setAttribute("order", detail);
        return SUCCESS;
    }
    
    public String confirm() {
        int cid = Integer.parseInt(request.getParameter("id"));
        controller.update(cid);
        this.addActionMessage("Confirm order success!");
        Order detail = controller.getById(cid);
        List<OrderDetail> listDetail = controller.getAllDetail(cid);
        List<CartItem> cart = new ArrayList<>();
        Map<String, Object> session = ActionContext.getContext().getSession();
        
        for (OrderDetail d : listDetail) {
            Product p = pController.getById(d.getProduct_id());
            cart.add(new CartItem(p, d.getQuantity()));
        }
        
        session.put("od", cart);
        ServletActionContext.getRequest().getSession().setAttribute("order", detail);
        return SUCCESS;
    }
    
    public String delete() {
        int fid = Integer.parseInt(request.getParameter("id"));
        int delete = controller.delete(fid);
        list = controller.getAll();
        ServletActionContext.getRequest().getSession().setAttribute("list", list);
        
        if(delete != 0) {
            this.addActionMessage("Delete order success!");
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return ERROR;
        }
    }
    
    public OrderAction() {
        this.controller = new OrderController();
        this.pController = new ProductController();
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
