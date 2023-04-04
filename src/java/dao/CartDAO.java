/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author toan0
 */
public class CartDAO {

    Connection conn = null;
    PreparedStatement pst = null; //Ném câu lệnh SQL về SQL Server
    ResultSet rs = null; //Nhận kq trả về

    public boolean insertProductToCart(String userID, int productID, int amount) throws SQLException, ClassNotFoundException {
        boolean flag = false;
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO [dbo].[Cart] ([userID],[ProductID],[Amount]) VALUES (?,?,?)";
                pst = conn.prepareStatement(sql);
                pst.setString(1, userID);
                pst.setInt(2, productID);
                pst.setInt(3, amount);
                int result = pst.executeUpdate();
                if (result > 0) {
                    flag = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return flag;
    }
}
