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
import model.Store;
import util.DatabaseUtil;

/**
 *
 * @author Orange
 */
public class StoreController {
    
    public List getAll() {
        List list = new ArrayList<>();
        String sql = "select * from stores";

        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Store s = new Store();
                s.setId(rs.getInt("id"));
                s.setAddress(rs.getString("address"));
                s.setPhone(rs.getString("phone"));
                s.setDescription(rs.getString("description"));
                s.setLatitude(rs.getFloat("latitude"));
                s.setLongitude(rs.getFloat("longitude"));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StoreController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    public Store getById(int id) {
        Store store = null;
        String sql = "select * from stores where id = ?";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                store = new Store();
                store.setId(rs.getInt("id"));
                store.setAddress(rs.getString("address"));
                store.setPhone(rs.getString("phone"));
                store.setDescription(rs.getString("description"));
                store.setLatitude(rs.getFloat("latitude"));
                store.setLongitude(rs.getFloat("longitude"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StoreController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return store;
    }
    
    public boolean insert(Store s) {
        boolean result = false;
        String sql = "insert into stores values(?, ?, ?, ?, ?)";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setString(1, s.getAddress());
            ps.setString(2, s.getPhone());
            ps.setString(3, s.getDescription());
            ps.setFloat(4, s.getLatitude());
            ps.setFloat(5, s.getLongitude());
            int executeUpdate = ps.executeUpdate();
            result = executeUpdate > 0;
        } catch (SQLException ex) {
            Logger.getLogger(StoreController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }
    
    public int update(Store s) {
        int records = 0;
        String sql = "update stores set address = ?, phone = ?, description = ?, latitude = ?, longitude = ? where id = ?";
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setString(1, s.getAddress());
            ps.setString(2, s.getPhone());
            ps.setString(3, s.getDescription());
            ps.setFloat(4, s.getLatitude());
            ps.setFloat(5, s.getLongitude());
            ps.setInt(6, s.getId());
            records = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StoreController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return records;
    }
    
    public int delete(int id) {
        int deleted = 0;
        String sql = "delete from stores where id = ?";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            deleted = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StoreController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return deleted;
    }
    
}
