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
                p.setStatus(rs.getInt("status"));
                p.setCategory(rs.getString("category"));
                p.setDiscount(rs.getString("discount"));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StoreController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
    
    public Product getById(int id) {
        Product product = null;
        String sql = "select * from products where id = ?";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setCategory_id(rs.getInt("category_id"));
                product.setDiscount_id(rs.getInt("discount_id"));
                product.setTitle(rs.getString("title"));
                product.setPrice(rs.getFloat("price"));
                product.setImage(rs.getString("image"));
                product.setShort_description(rs.getString("short_description"));
                product.setFull_description(rs.getString("full_description"));
                product.setStatus(rs.getInt("status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StoreController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return product;
    }
    
    public boolean insert(Product p) {
        boolean result = false;
        String sql = "insert into products values(?, ?, ?, ?, ?, ?, ?, GETDATE(), ?, ?)";
        
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, p.getDiscount_id());
            ps.setInt(2, p.getCategory_id());
            ps.setString(3, p.getTitle());
            ps.setFloat(4, p.getPrice());
            ps.setString(5, p.getImage());
            ps.setString(6, p.getShort_description());
            ps.setString(7, p.getFull_description());
            ps.setInt(8, 0);
            ps.setInt(9, p.getStatus());
            int executeUpdate = ps.executeUpdate();
            result = executeUpdate > 0;
        } catch (SQLException ex) {
            Logger.getLogger(StoreController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }
    
    public int update(Product p) {
        int records = 0;
        String sql = "update products set discount_id = ?, category_id = ?, title = ?, price = ?, image = ?, short_description = ?, full_description = ?, status = ? where id = ?";
        try {
            PreparedStatement ps = DatabaseUtil.getCon().prepareStatement(sql);
            ps.setInt(1, p.getDiscount_id());
            ps.setInt(2, p.getCategory_id());
            ps.setString(3, p.getTitle());
            ps.setFloat(4, p.getPrice());
            ps.setString(5, p.getImage());
            ps.setString(6, p.getShort_description());
            ps.setString(7, p.getFull_description());
            ps.setInt(8, p.getStatus());
            ps.setInt(9, p.getId());
            records = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StoreController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return records;
    }
    
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
