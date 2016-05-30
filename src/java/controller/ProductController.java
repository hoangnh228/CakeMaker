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
import model.Product;
import model.Store;
import util.DatabaseUtil;

/**
 *
 * @author Orange
 */
public class ProductController {
    
    public List getAll() {
        List list = new ArrayList<>();
        String sql = "select products.*, categories.title as category, discounts.title as discount from products "
                + " inner join categories on categories.id = products.category_id "
                + " inner join discounts on discounts.id = products.discount_id";

        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getFloat("price"));
                p.setImage(rs.getString("image"));
                p.setShort_description(rs.getString("short_description"));
                p.setFull_description(rs.getString("full_description"));
                p.setCreate_date(rs.getDate("create_date"));
                p.setView_count(rs.getInt("view_count"));
                p.setStatus(rs.getBoolean("status"));
                p.setCategory(rs.getString("category"));
                p.setDiscount(rs.getString("discount"));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StoreController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
//    public Store getById(int id) {
//        Store store = null;
//        String sql = "select * from stores where id = ?";
//        
//        try {
//            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                store = new Store();
//                store.setId(rs.getInt("id"));
//                store.setAddress(rs.getString("address"));
//                store.setPhone(rs.getString("phone"));
//                store.setDescription(rs.getString("description"));
//                store.setLatitude(rs.getFloat("latitude"));
//                store.setLongitude(rs.getFloat("longitude"));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(StoreController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        return store;
//    }
//    
//    public boolean insert(Store s) {
//        boolean result = false;
//        String sql = "insert into stores values(?, ?, ?, ?, ?)";
//        
//        try {
//            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
//            ps.setString(1, s.getAddress());
//            ps.setString(2, s.getPhone());
//            ps.setString(3, s.getDescription());
//            ps.setFloat(4, s.getLatitude());
//            ps.setFloat(5, s.getLongitude());
//            int executeUpdate = ps.executeUpdate();
//            result = executeUpdate > 0;
//        } catch (SQLException ex) {
//            Logger.getLogger(StoreController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        return result;
//    }
//    
//    public int update(Store s) {
//        int records = 0;
//        String sql = "update stores set address = ?, phone = ?, description = ?, latitude = ?, longitude = ? where id = ?";
//        try {
//            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
//            ps.setString(1, s.getAddress());
//            ps.setString(2, s.getPhone());
//            ps.setString(3, s.getDescription());
//            ps.setFloat(4, s.getLatitude());
//            ps.setFloat(5, s.getLongitude());
//            ps.setInt(6, s.getId());
//            records = ps.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(StoreController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return records;
//    }
    
    public int delete(int id) {
        int deleted = 0;
        String sql = "delete from products where id = ?";
        
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
