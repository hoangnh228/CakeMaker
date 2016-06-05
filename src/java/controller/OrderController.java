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
        String sql = "select * from orders";

        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setName(rs.getString("name"));
                o.setEmail(rs.getString("email"));
                o.setAddress(rs.getString("address"));
                o.setPhone(rs.getString("phone"));
                o.setStatus(rs.getInt("status"));
                o.setCreate_date(rs.getDate("create_date"));
                list.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    public List getAllDetail(int id) {
        List list = new ArrayList<>();
        String sql = "select * from order_detail where order_id = ?";

        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail o = new OrderDetail();
                o.setProduct_id(rs.getInt("product_id"));
                o.setPrice(rs.getFloat("price"));
                o.setQuantity(rs.getInt("quantity"));
                list.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    public Order getById(int id) {
        Order order = null;
        String sql = "select * from orders where id = ?";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                order = new Order();
                order.setId(rs.getInt("id"));
                order.setName(rs.getString("name"));
                order.setEmail(rs.getString("email"));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));
                order.setNote(rs.getString("note"));
                order.setStatus(rs.getInt("status"));
                order.setCreate_date(rs.getDate("create_date"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return order;
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
    
    public int update(int id) {
        int records = 0;
        String sql = "update orders set status = 1 where id = ?";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            records = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return records;
    }
    
    public int delete(int id) {
        int deleted = 0;
        String sql = "delete from order_detail where order_id = ?";
        String sql1 = "delete from orders where id = ?";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            PreparedStatement ps1 = DatabaseUtil.getCon().prepareStatement(sql1);
            ps1.setInt(1, id);
            deleted = ps1.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return deleted;
    }
    
}
