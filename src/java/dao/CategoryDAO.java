/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author toan0
 */
public class CategoryDAO {
    Connection conn = null;
    PreparedStatement pst = null; //Ném câu lệnh SQL về SQL Server
    ResultSet rs = null; //Nhận kq trả về

    //Load tất cả sản phẩm ra trang
    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                String sql = "SELECT * From [dbo].[Category]";
                pst = conn.prepareStatement(sql);
                
                rs = pst.executeQuery();
            }while(rs.next()){
                list.add(new Category(rs.getString(1), 
                        rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
