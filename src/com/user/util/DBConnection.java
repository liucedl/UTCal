/**
 * 
 */
/**
 * 数据库连接和关闭
 * @author yuzhouyang
 *
 */
package com.user.util;
import java.io.IOException;  
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;
import java.util.Properties;  

public final class DBConnection {  
    private static String DRIVER;  
    private static String URL;  
    private static String USER;  
    private static String PWD;  
    private static Properties pr = new Properties();  
      
    static{  
        try {  
            pr.load(DBConnection.class.getClassLoader().getResourceAsStream("db.properties"));  
            DRIVER = pr.getProperty("driver");  
            URL = pr.getProperty("url");  
            USER = pr.getProperty("user");  
            PWD = pr.getProperty("pass");  
            
        } catch (IOException e) {  
            System.out.println("加载资源文件错误");  
            e.printStackTrace();  
        }  
    }  
    //1.注册驱动  
    static{  
        try {  
            /*System.out.println(DRIVER);
            System.out.println(USER);
            System.out.println(URL);
            System.out.println(PWD);*/
            Class.forName(DRIVER);  
        } catch (ClassNotFoundException e) {  
            System.out.println("注册驱动失败！");  
            e.printStackTrace();  
        }  
    }  
      
    //2.获得连接  
    public static Connection getConn(){  
        Connection conn = null;  
        try {  
            conn = DriverManager.getConnection(URL, USER, PWD);  
        } catch (SQLException e) {  
            // TODO Auto-generated catch block  
            System.out.println("数据库连接失败");  
            e.printStackTrace();  
        }         
        return conn;  
    }  
      
    //3.关闭连接  
    public static void closeConn(Connection conn){  
        if(conn!=null){  
            try {  
                conn.close();  
            } catch (SQLException e) {  
                System.out.println("关闭连接失败");  
                e.printStackTrace();  
            }  
        }  
    }  
      
    //4.关闭执行对象  
    public static void closeStatement(Statement stmt){  
        if(stmt!=null){  
            try {  
                stmt.close();  
            } catch (SQLException e) {  
                // TODO Auto-generated catch block  
                e.printStackTrace();  
            }  
        }  
    }  
      
    //5.关闭结果集  
    public static void closeResult(ResultSet rs){  
        if(rs!=null){  
            try {  
                rs.close();  
            } catch (SQLException e) {  
                // TODO Auto-generated catch block  
                e.printStackTrace();  
            }  
        }  
    }  
}  