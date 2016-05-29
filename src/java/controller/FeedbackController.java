package controller;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
    
    public List getAll() {
        List list = new ArrayList<Feedback>();
        String sql = "select * from feedback";

        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback();
                f.setId(rs.getInt("id"));
                f.setName(rs.getString("name"));
                f.setPhone(rs.getString("phone"));
                f.setEmail(rs.getString("email"));
                f.setContent(rs.getString("content"));
                list.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    public int delete(int id) {
        int deleted = 0;
        String sql = "delete from feedback where id = ?";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            deleted = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return deleted;
    }
    
}
