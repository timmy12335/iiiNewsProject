package franktest.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Memberooo")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="seqNo")
	Integer pkey;
	String memberId;
	String name;
	
	public MemberBean() {
	}
	
	public MemberBean(Integer pkey, String memberId, String name) {
		this.pkey = pkey;
		this.memberId = memberId;
		this.name = name;
	}


	public Integer getPkey() {
		return pkey;
	}
	
	public void setPkey(int pkey) {
		this.pkey = pkey;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

}
