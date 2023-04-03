/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.ProductDAO;
import dto.product;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author toan0
 */
public class TestProductDAO {
    @Test //Pass this test for getAllProduct
    public void TestgetAllProduct() throws SQLException {
        List<product>list = new ArrayList<>();
        
        ProductDAO dao = new ProductDAO();
        list = dao.getAllProduct();
        for (product o : list) {
            //do something
        }
        int actual = list.size();
        int expected = 18;
        assertEquals(expected, actual);
    }
    public void TestgetAllProduct_EachProduct() throws SQLException {
        List<product>list = new ArrayList<>();
        
        ProductDAO dao = new ProductDAO();
        list = dao.getAllProduct();
        for (product o : list) {
            System.out.println(o.toString());
        }
       
    }
}
