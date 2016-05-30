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
import model.Discount;
import util.DatabaseUtil;

/**
 *
 * @author Orange
 */
public class DiscountController {
    
    public List getAll() {
        List list = new ArrayList<>();
        String sql = "select * from discounts";

        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Discount d = new Discount();
                d.setId(rs.getInt("id"));
                d.setTitle(rs.getString("title"));
                d.setContent(rs.getString("content"));
                d.setPercent(rs.getInt("percents"));
                d.setStart_date(rs.getString("start_date"));
                d.setEnd_date(rs.getString("end_date"));
                list.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DiscountController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    public Discount getById(int id) {
        Discount discount = null;
        String sql = "select * from discounts where id = ?";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                discount = new Discount();
                discount.setId(rs.getInt("id"));
                discount.setTitle(rs.getString("title"));
                discount.setContent(rs.getString("content"));
                discount.setPercent(rs.getInt("percents"));
                discount.setStart_date(rs.getString("start_date"));
                discount.setEnd_date(rs.getString("end_date"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DiscountController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return discount;
    }
    
    public boolean insert(Discount d) {
        boolean result = false;
        String sql = "insert into discounts values(?, ?, ?, ?, ?)";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setString(1, d.getTitle());
            ps.setString(2, d.getContent());
            ps.setInt(3, d.getPercent());
            ps.setString(4, d.getStart_date());
            ps.setString(5, d.getEnd_date());
            int executeUpdate = ps.executeUpdate();
            result = executeUpdate > 0;
        } catch (SQLException ex) {
            Logger.getLogger(DiscountController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }
    
    public int update(Discount d) {
        int records = 0;
        String sql = "update discounts set title = ?, content = ?, percents = ?, start_date = ?, end_date = ? where id = ?";
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setString(1, d.getTitle());
            ps.setString(2, d.getContent());
            ps.setInt(3, d.getPercent());
            ps.setString(4, d.getStart_date());
            ps.setString(5, d.getEnd_date());
            ps.setInt(6, d.getId());
            records = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DiscountController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return records;
    }
    
    public int delete(int id) {
        int deleted = 0;
        String sql = "delete from discounts where id = ?";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            deleted = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DiscountController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return deleted;
    }
    
}
