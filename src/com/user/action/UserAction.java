/**
 * 
 */
/**
 * @author yuzhouyang
 *
 */
package com.user.action; 
import java.util.List;

import com.opensymphony.xwork2.ActionContext;  
import com.opensymphony.xwork2.ActionSupport;  
import com.user.bean.User;  
import com.user.dao.UserDao;  
import com.user.dao.UserDaoImpl;  
public class UserAction extends ActionSupport{  
    private static final long serialVersionUID = 1L;  
    private User user;  
    private String message;
    private UserDao userDao = new UserDaoImpl();  
    public User getUser() {  
        return user;  
    }  
    public void setUser(User user) {  
        this.user = user;  
    }  
    //message
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	} 
    //注册  
    public String regist(){  
        UserDaoImpl dao = new UserDaoImpl();  
        int i = dao.Register(user);  
        if(i!=-1){
        		ActionContext.getContext().put("message","注册成功！");
            return SUCCESS;  
        }else{  
            return ERROR;  
        }  
    }  
    //登陆验证  
    public String login(){  
        User checkUser = userDao.userLogin(user.getId(),user.getPassword());  
        if(null == checkUser){  
       		ActionContext.getContext().put("message","用户信息不存在，请确认账户是否正确");
            return ERROR;  
        }else{  
            ActionContext.getContext().put("tip", getText("success"));  
            //ActionContext.getContext().put("userid", user.getId());  
            //ActionContext.getContext().put("username", user.getName()); 
            //ActionContext.getContext().getSession().put("userid",user.getId());
            ActionContext.getContext().getSession().put("userid", user.getId());
            return SUCCESS;  
        }  
    }  
    
    //信息查询 
	private List<User> userList;
	public User getUserById() {
		User checkUser = userDao.userLogin(user.getId(),user.getPassword()); 
		return checkUser;
	}
    //重写validate方法，完成输入效验  
    /* (non-Javadoc) 
     * @see com.opensymphony.xwork2.ActionSupport#validate() 
     */  
    @Override  
    public void validate() {  
        //如果用户名为空或为空字符串，则添加错误信息  
        if(user.getId() == null||user.getId().trim().equals("")){  
            //添加表单效验错误信息  
            addFieldError("id", "输入的用户名不能为空");  
        }  
        //如果密码为空或为空字符串，则添加错误信息  
        if(user.getPassword()==null ||user.getPassword().trim().equals("")){  
            addFieldError("password", "输入的密码不能为空");  
        }  
    }  
}  