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
import model.Category;
import model.Order;
import model.OrderDetail;
import util.DatabaseUtil;

/**
 *
 * @author Orange
 */
public class OrderController {
    
    public List getAll() {
        List list = new ArrayList<>();
        String sql = "select * from categories";

        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setTitle(rs.getString("title"));
                c.setDescription(rs.getString("description"));
                list.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    public Category getById(int id) {
        Category category = null;
        String sql = "select * from categories where id = ?";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                category = new Category();
                category.setId(rs.getInt("id"));
                category.setTitle(rs.getString("title"));
                category.setDescription(rs.getString("description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return category;
    }
    
    public int insert(Order o) {
        
        int insert = 0;
        String sql = "insert into orders values(?, ?, ?, ?, ?, ?, 0, GETDATE())";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql, new String[] { "id" });
            ps.setInt(1, o.getUser_id());
            ps.setString(2, o.getName());
            ps.setString(3, o.getEmail());
            ps.setString(4, o.getAddress());
            ps.setString(5, o.getPhone());
            ps.setString(6, o.getNote());
            
            if(ps.executeUpdate() > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                
                if (null != generatedKeys && generatedKeys.next()) {
                    insert = generatedKeys.getInt(1);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return insert;
    }
    
    public boolean insertDetail(OrderDetail d) {
        boolean result = false;
        String sql = "insert into order_detail values(?, ?, ?, ?)";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, d.getOrder_id());
            ps.setInt(2, d.getProduct_id());
            ps.setFloat(3, d.getPrice());
            ps.setInt(4, d.getQuantity());
            int executeUpdate = ps.executeUpdate();
            result = executeUpdate > 0;
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }
    
    public int update(Category c) {
        int records = 0;
        String sql = "update categories set title = ?, description = ? where id = ?";
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setString(1, c.getTitle());
            ps.setString(2, c.getDescription());
            ps.setInt(3, c.getId());
            records = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return records;
    }
    
    public int delete(int id) {
        int deleted = 0;
        String sql = "delete from categories where id = ?";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            deleted = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return deleted;
    }
    
}
