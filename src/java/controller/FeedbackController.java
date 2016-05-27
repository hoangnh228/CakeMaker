package controller;


import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;
import util.DatabaseUtil;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author cam
 */
public class FeedbackController {
    
    public boolean sendFeedback(Feedback f) {
        boolean result = false;
        String sql = "insert into feedback values(?, ?, ?, ?)";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setString(1, f.getName());
            ps.setString(2, f.getPhone());
            ps.setString(3, f.getEmail());
            ps.setString(4, f.getContent());
            int executeUpdate = ps.executeUpdate();
            result = executeUpdate > 0;
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }
    
}
