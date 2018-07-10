/**
 * 
 */
/**
 * @author yuzhouyang
 *
 */
package com.user.bean; 

public class User {  
	private String id;  
	private String password;  
	private String name;  
	private String sex;  
	private String dept;  
	private String project;  
	private String managerid;  
    private String authority;  

  
    /** 
     * @return the id 
     */  
    public String getId() {  
        return  id;  
    }  
    /** 
     * @param id the id to set 
     */  
    public void setId(String id) {  
        this.id = id; 
    }  
    
    /** 
     * @return the password 
     */  
    public String getPassword() {  
        return password;  
    }  
    /** 
     * @param password the password to set 
     */  
    public void setPassword(String password) {  
        this.password = password;  
    }
    
    /** 
     * @return the userName 
     */  
    public String getName() {  
        return name;  
    }  
    /** 
     * @param userName the userName to set 
     */  
    public void setUserName(String name) {  
        this.name = name;  
    } 
    
    /** 
     * @return the role 
     */  
    public String getAuthority() {  
        return  authority;  
    }  
    /** 
     * @param role the role to set 
     */  
    public void setAuthority(String authority) {  
        this.authority = authority; 
    }
    
    /** 
     * @return the sex
     */    
	public String getSex() {
		return sex;
	}
    /** 
     * @param sex the sex to set 
     */ 
	public void setSex(String sex) {
		this.sex = sex;
	}
	
    /** 
     * @return the dept
     */  
	public String getDept() {
		return dept;
	}
    /** 
     * @param dept the dept to set 
     */ 
	public void setDept(String dept) {
		this.dept = dept;
	}
	
    /** 
     * @return the project
     */  
	public String getProject() {
		return project;
	}
    /** 
     * @param project the project to set 
     */ 
	public void setProject(String project) {
		this.project = project;
	}
	
    /** 
     * @return the managerid
     */  
	public String getManagerid() {
		return managerid;
	}
    /** 
     * @param managerid the managerid to set 
     */ 
	public void setManager_id(String managerid) {
		this.managerid = managerid;
	} 
      
}  