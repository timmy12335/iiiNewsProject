package CR.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="CR_employee")
public class CRemployee implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer empPk;
	private String empId;
	private String empName;
	private String empemail;

	private Date applyDate;
	private Integer replyamt;
	private Integer untreatamt;
	private Integer isstay;
	public Integer getIsstay() {
		return isstay;
	}
	public void setIsstay(Integer isstay) {
		this.isstay = isstay;
	}
	@OneToMany(cascade=CascadeType.ALL, mappedBy="cremployee")
	private Set<CRBean> crBean;
	
	public Integer getEmpPk() {
		return empPk;
	}
	public void setEmpPk(Integer empPk) {
		this.empPk = empPk;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	public Integer getReplyamt() {
		return replyamt;
	}
	public void setReplyamt(Integer replyamt) {
		this.replyamt = replyamt;
	}
	public Integer getUntreatamt() {
		return untreatamt;
	}
	public void setUntreatamt(Integer untreatamt) {
		this.untreatamt = untreatamt;
	}
	public Set<CRBean> getCrBean() {
		return crBean;
	}
	public void setCrBean(Set<CRBean> crBean) {
		this.crBean = crBean;
	}
	public String getEmpemail() {
		return empemail;
	}
	public void setEmpemail(String empemail) {
		this.empemail = empemail;
	}
	
}
