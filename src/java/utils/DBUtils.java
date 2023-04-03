/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author toan0
 */
public class DBUtils {
    public static Connection makeConnection() throws ClassNotFoundException, SQLException{
       
        //1. LOAD DRIVER
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. CREATE CONNECTION STRING
        String url = "jdbc:sqlserver://localhost:1433;databaseName=Wish";
        //3. OPEN CONNECTION
        Connection conn = DriverManager.getConnection(url,"sa","123456");        
        return conn;
    }
}
