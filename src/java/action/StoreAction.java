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
import controller.StoreController;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Store;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author cam
 */
public class StoreAction extends ActionSupport implements ServletRequestAware {
    
    private Store store;
    private final StoreController controller;
    private int id;
    private List<Store> list = new ArrayList<>();
    private HttpServletRequest request;
    
    public String getAll() {
        list = controller.getAll();
        ServletActionContext.getRequest().getSession().setAttribute("list", list);
        return SUCCESS;
    }
    
    public String create() throws Exception {
        boolean insert = controller.insert(this.getStore());
        list = controller.getAll();
        ServletActionContext.getRequest().getSession().setAttribute("list", list);
        if(insert == true) {
            this.addActionMessage("Create store success!");
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return INPUT;
        }
    }
    
    public String getById() {
        int cid = Integer.parseInt(request.getParameter("id"));
        Store detail = controller.getById(id);
        ServletActionContext.getRequest().getSession().setAttribute("store", detail);
        return SUCCESS;
    }
    
    public String update() {
        int update = controller.update(this.getStore());
        list = controller.getAll();
        ServletActionContext.getRequest().getSession().setAttribute("list", list);
        if(update != 0) {
            this.addActionMessage("Update store success!");
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return INPUT;
        }
    }
    
    public String delete() {
        int cid = Integer.parseInt(request.getParameter("id"));
        int delete = controller.delete(cid);
        list = controller.getAll();
        ServletActionContext.getRequest().getSession().setAttribute("list", list);
        if(delete != 0) {
            this.addActionMessage("Delete store success!");
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return ERROR;
        }
    }
    
    public StoreAction() {
        controller = new StoreController();
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Store> getList() {
        return list;
    }

    public void setList(List<Store> list) {
        this.list = list;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }

}
