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
	Integer Uniformnumbers;    //統一編號
	Date founddate;    //創立日期
	Integer cpmbpoints; // 會員點數
	
	public CpMemberBean(Integer pkey, String cpmemberId, String password2, String okpassword2, String cpemail, String cptel, String cpaddress,
			String cpname, Integer Uniformnumbers, Date founddate, Integer cpmbpoints) {
		
		super();
		this.pkey = pkey;
		this.cpmemberId = cpmemberId;
		this.cpname = cpname;
		this.password2 = password2;
		this.okpassword2 = okpassword2;
		this.cpemail = cpemail;
		this.cptel = cptel;
		this.cpaddress = cpaddress;
		this.Uniformnumbers = Uniformnumbers;
		this.founddate = founddate;
		this.cpmbpoints = cpmbpoints;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CpMemberBean [pkey=");
		builder.append(pkey);
		builder.append(", cpmemberId=");
		builder.append(cpmemberId);
		builder.append(", cpname=");
		builder.append(cpname);
		builder.append(", password2=");
		builder.append(password2);
		builder.append(", okpassword2=");
		builder.append(okpassword2);
		builder.append(", cpaddress=");
		builder.append(cpaddress);
		builder.append(", cpemail=");
		builder.append(cpemail);
		builder.append(", cptel=");
		builder.append(cptel);
		builder.append(", Uniformnumbers=");
		builder.append(Uniformnumbers);
		builder.append(", founddate=");
		builder.append(founddate);
		builder.append(", cpmbpoints=");
		builder.append(cpmbpoints);

		builder.append("]");
		return builder.toString();
	}

	public CpMemberBean() {
	}
	
	public Integer getPkey() {
		return pkey;
	}
	public void setPkey(Integer pkey) {
		this.pkey = pkey;
	}
	public String getCpmemberId() {
		return cpmemberId;
	}
	public void setCpmemberId(String cpmemberId) {
		this.cpmemberId = cpmemberId;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public String getOkpassword2() {
		return okpassword2;
	}
	public void setOkpassword2(String okpassword2) {
		this.okpassword2 = okpassword2;
	}
	public String getCpemail() {
		return cpemail;
	}
	public void setCpemail(String cpemail) {
		this.cpemail = cpemail;
	}
	public String getCptel() {
		return cptel;
	}
	public void setCptel(String cptel) {
		this.cptel = cptel;
	}
	public String getCpaddress() {
		return cpaddress;
	}
	public void setCpaddress(String cpaddress) {
		this.cpaddress = cpaddress;
	}
	public String getCpname() {
		return cpname;
	}
	public void setCpname(String cpname) {
		this.cpname = cpname;
	}
	public Integer getUniformnumbers() {
		return Uniformnumbers;
	}
	public void setUniformnumbers(Integer uniformnumbers) {
		Uniformnumbers = uniformnumbers;
	}
	public Date getFounddate() {
		return founddate;
	}
	public void setFounddate(Date founddate) {
		this.founddate = founddate;
	}
	public Integer getCpmbpoints() {
		return cpmbpoints;
	}
	public void setCpmbpoints(Integer cpmbpoints) {
		this.cpmbpoints = cpmbpoints;
	}


}