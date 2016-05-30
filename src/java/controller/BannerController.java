/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Banner;
import util.DatabaseUtil;

/**
 *
 * @author Orange
 */
public class BannerController {
    
    public List getAll() {
        List list = new ArrayList<>();
        String sql = "select * from banner";

        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Banner b = new Banner();
                b.setId(rs.getInt("id"));
                b.setUrl(rs.getString("url"));
                list.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BannerController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    public boolean insert(Banner b) {
        boolean result = false;
        String sql = "insert into banner values(?)";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setString(1, b.getUrl());
            int executeUpdate = ps.executeUpdate();
            result = executeUpdate > 0;
        } catch (SQLException ex) {
            Logger.getLogger(BannerController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }
    
    public int delete(int id) {
        int deleted = 0;
        String sql = "delete from banner where id = ?";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            deleted = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BannerController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return deleted;
    }
}
