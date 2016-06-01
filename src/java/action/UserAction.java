/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import controller.UserController;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.User;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author cam
 */
public class UserAction extends ActionSupport implements ServletRequestAware {
    
    private User user;
    private final UserController controller;
    private int id;
    private List<User> list = new ArrayList<>();
    private HttpServletRequest request;
    
    public String userRegister() {
        boolean check = controller.checkUsernameExist(this.user.getUsername());
        
        if(check == false) {
            boolean insert = controller.userRegister(this.getUser());

            if(insert == true) {
                this.addActionMessage("Register success, now you can login as an user!");
                return SUCCESS;
            } else {
                this.addActionError("Have some error, please try again!");
                return INPUT;
            }
        } else {
            this.addActionError("Username exists, please use other username!");
            return INPUT;
        }
    }
    
    public String userProfile() {
        Map session = ActionContext.getContext().getSession();
        User detail = controller.getById((int) session.get("userId"));
        ServletActionContext.getRequest().getSession().setAttribute("user", detail);
        return SUCCESS;
    }
    
    public String adminProfile() {
        Map session = ActionContext.getContext().getSession();
        User detail = controller.getById((int) session.get("adminId"));
        ServletActionContext.getRequest().getSession().setAttribute("user", detail);
        return SUCCESS;
    }
    
    public String userUpdateProfile() {
        int update = controller.updateProfile(this.getUser());
        User detail = controller.getById(this.user.getId());
        ServletActionContext.getRequest().getSession().setAttribute("user", detail);
        
        if(update != 0) {
            this.addActionMessage("Update profile success!");
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return INPUT;
        }
    }
    
    public String userLogin() {
        User login = controller.userLogin(this.user.getUsername(), this.user.getPassword());
        
        if(login != null) {
            Map session = ActionContext.getContext().getSession();
            session.put("userId", login.getId());
            session.put("userName", login.getUsername());
        } else {
            this.addActionError("Have some error, please try again!");
            return INPUT;
        }
        
        return SUCCESS;
    }
    
    public String adminLogin() {
        User login = controller.adminLogin(this.user.getUsername(), this.user.getPassword());
        if(login != null) {
            Map session = ActionContext.getContext().getSession();
            session.put("adminId", login.getId());
            session.put("adminName", login.getUsername());
        } else {
            this.addActionError("Invalid username or password!");
            return INPUT;
        }
        
        return SUCCESS;
    }
    
    public String adminLogout() {
        Map session = ActionContext.getContext().getSession();
        session.remove("adminId");
        session.remove("adminName");
        return SUCCESS;
    }
    
    public String userLogout() {
        Map session = ActionContext.getContext().getSession();
        session.remove("userId");
        session.remove("userName");
        return SUCCESS;
    }
    
    public String getAll() {
        list = controller.getAll();
        ServletActionContext.getRequest().getSession().setAttribute("list", list);
        return SUCCESS;
    }
    
    public String create() throws Exception {
        boolean check = controller.checkUsernameExist(this.user.getUsername());
        
        if(check == false) {
            boolean insert = controller.insert(this.getUser());

            if(insert == true) {
                list = controller.getAll();
                ServletActionContext.getRequest().getSession().setAttribute("list", list);
                this.addActionMessage("Create user success!");
                return SUCCESS;
            } else {
                this.addActionError("Have some error, please try again!");
                return INPUT;
            }
        } else {
            this.addActionError("Username exists!");
            return INPUT;
        }
    }
    
    public String getById() {
        int cid = Integer.parseInt(request.getParameter("id"));
        User detail = controller.getById(id);
        ServletActionContext.getRequest().getSession().setAttribute("user", detail);
        return SUCCESS;
    }
    
    public String update() {
        int update = controller.update(this.getUser());
        
        if(update != 0) {
            list = controller.getAll();
            ServletActionContext.getRequest().getSession().setAttribute("list", list);
            this.addActionMessage("Update user success!");
            return SUCCESS;
        } else {
            User detail = controller.getById(this.user.getId());
            ServletActionContext.getRequest().getSession().setAttribute("user", detail);
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
            this.addActionMessage("Delete category success!");
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return ERROR;
        }
    }
    
    public UserAction() {
        controller = new UserController();
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<User> getList() {
        return list;
    }

    public void setList(List<User> list) {
        this.list = list;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }

}