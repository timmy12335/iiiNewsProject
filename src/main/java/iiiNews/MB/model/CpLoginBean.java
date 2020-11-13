package iiiNews.MB.model;

public class CpLoginBean {

	String userId;
	String password;
	String invalidCredentials;
	boolean rememberMe;

	public CpLoginBean() {
		super();
	}

	public CpLoginBean(String userId, String password, boolean rememberMe) {
		super();
		this.userId = userId;
		this.password = password;
		this.rememberMe = rememberMe;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}

	public String getInvalidCredentials() {
		return invalidCredentials;
	}

	public void setInvalidCredentials(String invalidCredentials) {
		this.invalidCredentials = invalidCredentials;
	}
}
