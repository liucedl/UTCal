    package com.user.dao;  
      
    import java.sql.Connection;  
    import java.sql.PreparedStatement;  
    import java.sql.ResultSet;  
    import java.sql.SQLException;  
      
    import com.user.bean.User;  
    import com.user.util.DBConnection;  
      
    public class UserDaoImpl implements UserDao {  
    	
        Connection conn = null;  
        PreparedStatement pstmt = null;  
        ResultSet rs = null;  
        User user = null;  
        @Override  
        public User userLogin(String id,String password) {  

            //获得链接  
            conn = DBConnection.getConn();  
            //准备  
            String sql_userCheck="select user_id,user_password,user_authority from user where user_id=? and user_password=?";  
            try {  
                pstmt = conn.prepareStatement(sql_userCheck);  
                pstmt.setString(1, id);  
                pstmt.setString(2, password);  
             //   pstmt.setString(3, authority);  
                rs = pstmt.executeQuery();  
                if(rs.next()){  
                    user = new User();  
                    user.setId(rs.getString("user_id"));  
                    user.setPassword(rs.getString("user_password"));  
              //      user.setAuthority(rs.getString("authority"));  
                    System.out.println(user.getId());  
                    System.out.println(user.getPassword());  
              //      System.out.println(user.getAuthority());  
                }  
            } catch (Exception e) {  
                System.out.println("登陆错误！");  
                e.printStackTrace();  
            } finally{  
                DBConnection.closeConn(conn);  
                DBConnection.closeStatement(pstmt);  
                DBConnection.closeResult(rs);  
            }  
            return user;  
        }  
        public User userFind(String id) {  

            //获得链接  
            conn = DBConnection.getConn();  
            //准备  
            String sql_userCheck="select user_id from user where user_id=?";  
            try {  
                pstmt = conn.prepareStatement(sql_userCheck);  
                pstmt.setString(1, id); 
             //   pstmt.setString(3, authority);  
                rs = pstmt.executeQuery();  
                if(rs.next()){  
                    user = new User();  
                    user.setId(rs.getString("user_id"));  
                }  
            } catch (Exception e) {  
                System.out.println("注册错误！");  
                e.printStackTrace();  
            } finally{  
                DBConnection.closeConn(conn);  
                DBConnection.closeStatement(pstmt);  
                DBConnection.closeResult(rs);  
            }  
            return user;  
        }  
        @Override  
        public int Register(User user) {  
            int i=-1;  
            try{  
                //获得链接  
                conn = DBConnection.getConn();  
             //   String sql_userCheck1="select user_id,user_password,user_authority from user where user_id=?";  
               // pstmt = conn.prepareStatement(sql_userCheck1); 
               // pstmt.setString(1, user.getId()); 
               // rs = pstmt.executeQuery();  
               // if(rs.next()){  
               //     user = new User();  
                //    user.setId(rs.getString("user_id"));  
                //    user.setPassword(rs.getString("user_password"));  
              //      user.setAuthority(rs.getString("authority"));  
               //     System.out.println(user.getId());  
               //     System.out.println(user.getPassword());  
              //      System.out.println(user.getAuthority());  
              //  }  
                //准备  
                String sql_userCheck="INSERT INTO user (user.user_id,user.user_password,user.user_name,user.user_sex,user.user_dept,user.user_project,user.user_manager_id,user.user_authority) VALUES(?,?,null,null,null,null,null,?)";  
                pstmt = conn.prepareStatement(sql_userCheck);  
                pstmt.setString(1, user.getId());  
                pstmt.setString(2, user.getPassword());  
                pstmt.setString(3, "1");  
                i = pstmt.executeUpdate();  
            }catch(SQLException e){  
                System.out.println("注册错误");  
                e.printStackTrace();  
            }finally{  
                DBConnection.closeConn(conn);  
                DBConnection.closeStatement(pstmt);  
            }  
            return i;  
        }  
        
    	public User getUserById(String id) {
    		//查询SQL
    		String sql = " select * from user where user_id =?";
    		System.out.println(sql); 
    		try{
    			//获得数据库连接
    			conn = DBConnection.getConn();   			
    			//编译执行sql文
    			pstmt = conn.prepareStatement(sql);
        		pstmt.setString(1, id); 
    			//获查询结果集
    			rs = pstmt.executeQuery();
    			if(rs.next()){
    				//实例化用户信息
    				user = new User();  				
    				//添加用户信息
    				user.setId(rs.getString("user_id"));
    				user.setUserName(rs.getString("user_name"));
    				user.setPassword(rs.getString("user_password"));
    				user.setSex(rs.getString("user_sex"));
    				user.setDept(rs.getString("user_dept"));
    				user.setProject(rs.getString("user_project"));
    				user.setManager_id(rs.getString("user_manager_id"));	
    			 	System.out.println("===============================yzy");
    	        	System.out.println(user.getName());
    	        	System.out.println(user.getId());
    	        	System.out.println("password" + user.getPassword());
    			}
    		}catch(Exception ex)
    		{
    			//打印异常堆栈
    			ex.printStackTrace();
    		}finally{
    			//关闭所有连接
                DBConnection.closeConn(conn);  
                DBConnection.closeStatement(pstmt);  
                DBConnection.closeResult(rs);  
    		}
    		
    		return user;
    	}
    	//修改用户信息
    	@Override
    	public int updateById(User user) {
    		int result;	
    		//修改sql文：根据用户id去查询用户信息
    		String sql = " update user set user.user_password=?,user.user_name=?,user.user_sex=?,user.user_dept=?,user.user_project=?,user.user_manager_id=? where user.user_id =?";
    		try
    		{
    			//获得数据库连接
    			conn = DBConnection.getConn(); 
    			//编译执行sql文
    			pstmt = conn.prepareStatement(sql);
    			//预编译处理
    			pstmt.setString(1, user.getPassword());
    			pstmt.setString(2, user.getName());
    			if (user.getSex().equals("男")) {
    			 pstmt.setString(3, "1");
    			}else if (user.getSex().equals("女")){
    		     pstmt.setString(3, "0");	
    			}else if(user.getSex().equals("")||user.getSex()==null){
    			 pstmt.setString(3, user.getSex());
    			}
    			pstmt.setString(4, user.getDept());
    			pstmt.setString(5, user.getProject());
    			pstmt.setString(6, user.getManagerid());
    		//	pstmt.setString(7, user.getAuthority());
    			pstmt.setString(7, user.getId());
    		 	System.out.println("===============================updateById");
	        	System.out.println("password" + user.getPassword());
	        	System.out.println("Name"+user.getName());
	        	System.out.println("Sex"+user.getSex());
	        	System.out.println("Dept"+user.getDept());
	        	System.out.println("Project"+user.getProject());
	        	System.out.println("Managerid"+user.getManagerid());
	        	System.out.println("id" + user.getId());

    			//执行修改
    			result = pstmt.executeUpdate();
    			if(result != 0)
    			{
    				System.out.println("你修改了一条记录！");
    			}
    		}
    		catch(Exception ex)
    		{
    			//打印异常堆栈
    			ex.printStackTrace();
    		}
    		finally{
    			//关闭所有连接
                DBConnection.closeConn(conn);  
                DBConnection.closeStatement(pstmt);  
                DBConnection.closeResult(rs);  
    		}
    		
    		return 0;
    	}     
    }  