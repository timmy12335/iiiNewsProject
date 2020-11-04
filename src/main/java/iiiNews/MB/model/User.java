package iiiNews.MB.model;

import java.io.Serializable;
import java.sql.Blob;


public class User implements Serializable {

  private String loginName;
  private String password;
  private String username;
  private String repassword;
  private Blob sex;

  public User(){
      super();
  }


  public String getLoginName() {
      return loginName;
  }

  public void setLoginName(String loginName) {
      this.loginName = loginName;
  }

  public String getPassword() {
      return password;
  }

  public void setPassword(String password) {
      this.password = password;
  }

  public String getUsername() {
      return username;
  }

  public void setUsername(String username) {
      this.username = username;
  }
  
  public Blob getSex() {
      return sex;
  }

  public void setSex(Blob sex) {
      this.sex = sex;
  }
  
  public String getRePassword() {
      return repassword;
  }

  public void setRePassword(String repassword) {
      this.repassword = repassword;
  }
}