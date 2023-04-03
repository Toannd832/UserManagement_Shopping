/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author toan0
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement pst = null; //Ném câu lệnh SQL về SQL Server
    ResultSet rs = null; //Nhận kq trả về

    //Load tất cả sản phẩm ra trang
    public List<product> getAllProduct() throws SQLException {
        List<product> list = new ArrayList<>();
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT * From [dbo].[product]";
                pst = conn.prepareStatement(sql);

                rs = pst.executeQuery();
            }
            while (rs.next()) {
                list.add(new product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    //LẤY RA SẢN PHẨM MỚI NHẤT => Viết Query với id product là cao nhất
    public product getNewProduct() throws SQLException {

        try {
            conn = utils.DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT top 1 * From [dbo].[product]\n"
                        + "ORDER BY id desc";
                pst = conn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    return new product(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getDouble(4),
                            rs.getString(5),
                            rs.getString(6));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return null;
    }

    //Load tất cả sản phẩm có CateID tương ứng ra trang
    public List<product> getAllProductByCateID(int cateID) throws SQLException {
        List<product> list = new ArrayList<>();
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT * From [dbo].[product] WHERE cateID=?";
                pst = conn.prepareStatement(sql);
                pst.setInt(1, cateID);
                rs = pst.executeQuery();
            }
            while (rs.next()) {
                list.add(new product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    //Load  sản phẩm có ID tương ứng 
    public product getProductByID(int pID) throws SQLException {

        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT * From [dbo].[product] WHERE id=?";
                pst = conn.prepareStatement(sql);
                pst.setInt(1, pID);
                rs = pst.executeQuery();
            }
            while (rs.next()) {
                return new product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public List<product> getAllProductByName(String searchValue) throws SQLException {
        List<product> list = new ArrayList<>();
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT * From [dbo].[product] WHERE name LIKE ?";
                pst = conn.prepareStatement(sql);
                pst.setString(1, "%" + searchValue + "%");
                rs = pst.executeQuery();
            }
            while (rs.next()) {
                list.add(new product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
//    public static void main(String[] args) {
//        ProductDAO dao = new ProductDAO();
//        List<product> list = dao.getAllProduct();
//        for (product o : list) {
//            System.out.println(o.toString());
//        }
//    }

   
}
