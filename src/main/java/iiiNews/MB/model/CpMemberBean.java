package iiiNews.MB.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "CpMember")
public class CpMemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CpMemberNo")
	Integer pkey;
	String cpmemberId;
	String password2;

	@Transient
	String okpassword2; // 確認密碼(公司)
	String cpemail;
	String cptel;
	String cpaddress;
	String cpname;
	Integer cpmbpoints; // 會員點數

	public void setPkey(Integer pkey) {
		this.pkey = pkey;
	}

	public CpMemberBean(Integer pkey, String cpmemberId, String cpname, String password2, String okpassword2,
			String cpemail, String cptel, String cpaddress, Integer cpmbpoints) {

		super();
		this.pkey = pkey;
		this.cpmemberId = cpmemberId;
		this.password2 = password2;
		this.okpassword2 = okpassword2;
		this.cpemail = cpemail;
		this.cptel = cptel;
		this.cpaddress = cpaddress;
		this.cpname = cpname;
		this.cpmbpoints = cpmbpoints;
	}

	public CpMemberBean() {
	}

	public Integer getPkey() {
		return pkey;
	}

	public void setPkey(int pKey) {
		System.out.println("pKey=>" + pKey);
		this.pkey = pKey;
	}

	public String getCpEmail() {
		return cpemail;
	}

	public void setCpEmail(String cpemail) {
		this.cpemail = cpemail;
	}

	public String getCpName() {
		return cpname;
	}

	public void setCpName(String cpname) {
		this.cpname = cpname;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getOkPassword2() {
		return okpassword2;
	}

	public void setOKPassword2(String okpassword2) {
		this.okpassword2 = okpassword2;
	}

	public String getCpTel() {
		return cptel;
	}

	public void setCpTel(String cptel) {
		this.cptel = cptel;
	}

	public String getCpMemberId() {
		return cpmemberId;
	}

	public void setCpMemberId(String cpmemberId) {
		this.cpmemberId = cpmemberId;
	}

	public Integer getCpMbpoints() {
		return cpmbpoints;
	}

	public void setCpMbpoints(Integer cpmbpoints) {
		this.cpmbpoints = cpmbpoints;
	}
}