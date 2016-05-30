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
import controller.ProductController;
import controller.StoreController;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Product;
import model.Store;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author cam
 */
public class ProductAction extends ActionSupport implements ServletRequestAware {
    
    private Product product;
    private final ProductController controller;
    private int id;
    private List<Product> list = new ArrayList<>();
    private HttpServletRequest request;
    
    public String getAll() {
        list = controller.getAll();
        ServletActionContext.getRequest().getSession().setAttribute("list", list);
        return SUCCESS;
    }
    
//    public String create() throws Exception {
//        boolean insert = controller.insert(this.getProduct());
//        if(insert == true) {
//            this.addActionMessage("Create product success!");
//            return SUCCESS;
//        } else {
//            this.addActionError("Have some error, please try again!");
//            return ERROR;
//        }
//    }
//    
//    public String getById() {
//        int cid = Integer.parseInt(request.getParameter("id"));
//        Product detail = controller.getById(id);
//        ServletActionContext.getRequest().getSession().setAttribute("product", detail);
//        return SUCCESS;
//    }
//    
//    public String update() {
//        int update = controller.update(this.getProduct());
//        if(update != 0) {
//            this.addActionMessage("Update product success!");
//            return SUCCESS;
//        } else {
//            this.addActionError("Have some error, please try again!");
//            return INPUT;
//        }
//    }
    
    public String delete() {
        int cid = Integer.parseInt(request.getParameter("id"));
        int delete = controller.delete(cid);
        if(delete != 0) {
            this.addActionMessage("Delete product success!");
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return ERROR;
        }
    }
    
    public ProductAction() {
        controller = new ProductController();
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Product> getList() {
        return list;
    }

    public void setList(List<Product> list) {
        this.list = list;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }

}
