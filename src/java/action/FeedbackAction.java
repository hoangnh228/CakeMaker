/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import controller.FeedbackController;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Feedback;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author cam
 */
public class FeedbackAction extends ActionSupport implements ServletRequestAware {
    
    private Feedback feedback;
    private final FeedbackController controller;
    private int id;
    private List<Feedback> list = new ArrayList<>();
    private HttpServletRequest request;
    
    public String sendFeedback() throws Exception {
        boolean insert = controller.sendFeedback(this.getFeedback());
        if(insert == true) {
            this.addActionMessage("Send feedback success, thank you!");
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
    
    public String delete() {
        int fid = Integer.parseInt(request.getParameter("id"));
        int delete = controller.delete(fid);
        if(delete != 0) {
            this.addActionMessage("Delete feedback success!");
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return ERROR;
        }
    }
    
    public FeedbackAction() {
        controller = new FeedbackController();
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Feedback> getList() {
        return list;
    }

    public void setList(List<Feedback> list) {
        this.list = list;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }

}
