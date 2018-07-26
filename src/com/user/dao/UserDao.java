/**
 * 
 */
/**
 * @author yuzhouyang
 *
 */
    package com.user.dao;  
      
    import com.user.bean.User;  
      
    public interface UserDao {  
        //用户登陆   
        public User userLogin(String id,String password);  
        //用户注册    
        public User userFind(String id);  
        public int Register(User user);
        //用户更新
        public int updateById(User user);  
        //用户查询
        public User getUserById(String id); 
        
        
    }  