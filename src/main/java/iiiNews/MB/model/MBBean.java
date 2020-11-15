package iiiNews.MB.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

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
	String identityId;   //身分證
	Date birthday;
	Integer mbpoints;   //會員點數
	String sex;
//	Blob mbImage;
//	Timestamp uploadTime2;
	MultipartFile[] memberImage;
	
	@Transient
	private MultipartFile[] productImage;
	
	public void setPkey(Integer pkey) {
		this.pkey = pkey;
	}

	public MBBean(Integer pkey, String memberId, String name, String password, String okpassword, String email, String sex,
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
//		this.uploadTime2 = uploadTime2;
		this.sex = sex;
//		this.fileName = fileName;
//		this.memberImage = memberImage;
//		this.memberMultipartFile = memberMultipartFile;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberBean [pkey=");
		builder.append(pkey);
		builder.append(", memberId=");
		builder.append(memberId);
		builder.append(", name=");
		builder.append(name);
		builder.append(", password=");
		builder.append(password);
		builder.append(", okpassword=");
		builder.append(okpassword);
		builder.append(", identityId=");
		builder.append(identityId);
		builder.append(", email=");
		builder.append(email);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", mbpoints=");
		builder.append(mbpoints);
		builder.append(", birthday=");
		builder.append(birthday);

		builder.append("]");
		return builder.toString();
	}

	public MBBean() {
		super();
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

	public void setEmail(String email) {
		this.email = email;
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
	
//	public Blob getMbImage() {
//		return mbImage;
//	}
//
//	public void setMbImage(Blob mbImage) {
//		this.mbImage = mbImage;
//	}

//	public MultipartFile[] getMemberImage() {
//		return memberImage;
//	}
//
//	public void setMemberImage(MultipartFile[] memberImage) {
//		this.memberImage = memberImage;
//	}
//	
//	public Timestamp getUploadTime2() {
//		return uploadTime2;
//	}
//	public void setUploadTime2(Timestamp uploadTime2) {
//		this.uploadTime2 = uploadTime2;
//	}
	
	public String getSex() {
	      return sex;
	  }

	  public void setSex(String sex) {
	      this.sex = sex;
	  }
}
