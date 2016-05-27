/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import controller.FeedbackController;
import com.opensymphony.xwork2.ActionSupport;
import model.Feedback;

/**
 *
 * @author cam
 */
public class FeedbackAction extends ActionSupport {
    
    private Feedback feedback;
    private FeedbackController controller;
    private int id;
    
    public String sendFeedback() throws Exception {
        boolean insert = controller.sendFeedback(this.getFeedback());
        System.out.println(insert);
        if(insert == true) {
            addActionMessage("Send feedback success, thank you!");
            return SUCCESS;
        } else {
            addActionError("Have some error, please try again!");
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
    
}
