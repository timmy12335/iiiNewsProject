package iiiNews.MB.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "MB")
public class MBBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MBNo")
	Integer pkey;
	String memberId;
	String name;
	String password;

	@Transient
	String okpassword; // 確認密碼
	String email;
	String phone;
	String identityId;
	Date birthday;
	Integer mbpoints;

	public void setPkey(Integer pkey) {
		this.pkey = pkey;
	}

	public MBBean(Integer pkey, String memberId, String name, String password, String okpassword, String email,
			String phone, String identityId, Date birthday, Integer mbpoints) {

		super();
		this.pkey = pkey;
		this.memberId = memberId;
		this.name = name;
		this.password = password;
		this.okpassword = okpassword;
		this.email = email;
		this.phone = phone;
		this.identityId = identityId;
		this.birthday = birthday;
		this.mbpoints = mbpoints;
	}

	public MBBean() {
	}

	public Integer getPkey() {
		return pkey;
	}

	public void setPkey(int pKey) {
		System.out.println("pKey=>" + pKey);
		this.pkey = pKey;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String mail) {
		email = mail;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getOkPassword() {
		return okpassword;
	}

	public void setOkPassword(String okpassword) {
		this.okpassword = okpassword;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getIdentityId() {
		return identityId;
	}

	public void setIdentityId(String identityId) {
		this.identityId = identityId;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Integer getMbpoints() {
		return mbpoints;
	}

	public void setMbpoints(Integer mbpoints) {
		this.mbpoints = mbpoints;
	}
}
