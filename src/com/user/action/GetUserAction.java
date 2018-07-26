/**
 * 
 */
/**
 * @author yuzhouyang
 *
 */
package com.user.action; 
import com.opensymphony.xwork2.ActionContext;  
import com.opensymphony.xwork2.ActionSupport;  
import com.user.bean.User;  
import com.user.dao.UserDao;  
import com.user.dao.UserDaoImpl;  
public class GetUserAction extends ActionSupport{  
    private static final long serialVersionUID = 1L; 
    private User user;  
    private UserDao userDao = new UserDaoImpl(); 
    public User getUser() {  
        return user;  
    }  
    public void setUser(User user) {  
        this.user = user;  
    }  
    //信息查询 
	//private List<User> userList;
	public String getUserById() {
		String id = (String)ActionContext.getContext().getSession().get("userid");
		User checkUser = userDao.getUserById(id);
		if(null == checkUser){  
            return ERROR;  
        }else{ 
        	System.out.println("===============================cu");
        	System.out.println("name" + checkUser.getName());
        	System.out.println("sex" + checkUser.getSex());
        	System.out.println("password" + checkUser.getPassword());
        	System.out.println("dept" + checkUser.getDept());
        	System.out.println("project" + checkUser.getProject());
        	System.out.println("password" + checkUser.getPassword());
        ActionContext.getContext().put("names", checkUser.getName());
        ActionContext.getContext().put("sex", checkUser.getSex());
        ActionContext.getContext().put("password", checkUser.getPassword());
        ActionContext.getContext().put("dept", checkUser.getDept());
        ActionContext.getContext().put("project", checkUser.getProject());
        ActionContext.getContext().put("managerId", checkUser.getManagerid());
//      ServletActionContext.getRequest().setAttribute("userid", "ssssss");
      return SUCCESS; 
        }
	}
	   //更新 
    public String updateById(){  
        UserDaoImpl dao = new UserDaoImpl(); 
        int i = dao.updateById(user);  
        if(i!=-1){  
            return SUCCESS;  
        }else{  
            return ERROR;  
        }  
    }  
	
}  