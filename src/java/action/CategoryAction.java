/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import controller.CategoryController;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Category;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author Orange
 */
public class CategoryAction extends ActionSupport implements ServletRequestAware {
    
    private Category category;
    private final CategoryController controller;
    private int id;
    private List<Category> list = new ArrayList<>();
    private HttpServletRequest request;
    
    public String getAll() {
        list = controller.getAll();
        ServletActionContext.getRequest().getSession().setAttribute("list", list);
        return SUCCESS;
    }
    
    public String create() throws Exception {
        boolean insert = controller.insert(this.getCategory());
        if(insert == true) {
            this.addActionMessage("Create category success!");
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return ERROR;
        }
    }
    
    public String getById() {
        int cid = Integer.parseInt(request.getParameter("id"));
        Category detail = controller.getById(id);
        ServletActionContext.getRequest().getSession().setAttribute("category", detail);
        return SUCCESS;
    }
    
    public String update() {
        int update = controller.update(this.getCategory());
        if(update != 0) {
            this.addActionMessage("Update category success!");
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return INPUT;
        }
    }
    
    public String delete() {
        int cid = Integer.parseInt(request.getParameter("id"));
        int delete = controller.delete(cid);
        if(delete != 0) {
            this.addActionMessage("Delete category success!");
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return ERROR;
        }
    }
    
    public CategoryAction() {
        controller = new CategoryController();
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Category> getList() {
        return list;
    }

    public void setList(List<Category> list) {
        this.list = list;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }

}
