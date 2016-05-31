/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import controller.DiscountController;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Discount;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author cam
 */
public class DiscountAction extends ActionSupport implements ServletRequestAware {
    
    private Discount discount;
    private final DiscountController controller;
    private int id;
    private List<Discount> list = new ArrayList<>();
    private HttpServletRequest request;
    
    public String getAll() {
        list = controller.getAll();
        ServletActionContext.getRequest().getSession().setAttribute("list", list);
        return SUCCESS;
    }
    
    public String create() throws Exception {
        boolean insert = controller.insert(this.getDiscount());
        
        if(insert == true) {
            list = controller.getAll();
            ServletActionContext.getRequest().getSession().setAttribute("list", list);
            this.addActionMessage("Create discount success!");
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return INPUT;
        }
    }
    
    public String getById() {
        int cid = Integer.parseInt(request.getParameter("id"));
        Discount detail = controller.getById(id);
        ServletActionContext.getRequest().getSession().setAttribute("discount", detail);
        return SUCCESS;
    }
    
    public String update() {
        int update = controller.update(this.getDiscount());
        
        if(update != 0) {
            list = controller.getAll();
            ServletActionContext.getRequest().getSession().setAttribute("list", list);
            this.addActionMessage("Update discount success!");
            return SUCCESS;
        } else {
            Discount detail = controller.getById(this.discount.getId());
            ServletActionContext.getRequest().getSession().setAttribute("discount", detail);
            this.addActionError("Have some error, please try again!");
            return INPUT;
        }
    }
    
    public String delete() {
        int cid = Integer.parseInt(request.getParameter("id"));
        boolean check = controller.checkHasProduct(cid);
        
        if(check == false) {
            int delete = controller.delete(cid);
            list = controller.getAll();
            ServletActionContext.getRequest().getSession().setAttribute("list", list);
            
            if(delete != 0) {
                this.addActionMessage("Delete category success!");
                return SUCCESS;
            } else {
                this.addActionError("Have some error, please try again!");
                return ERROR;
            }
        } else {
            list = controller.getAll();
            ServletActionContext.getRequest().getSession().setAttribute("list", list);
            this.addActionError("Have products in discount, please delete product first!");
            return ERROR;
        }
    }
    
    public DiscountAction() {
        controller = new DiscountController();
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Discount> getList() {
        return list;
    }

    public void setList(List<Discount> list) {
        this.list = list;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }

}