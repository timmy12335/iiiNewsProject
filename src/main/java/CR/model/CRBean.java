package CR.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import franktest.model.MemberBean;

@Entity
@Table(name="CR_CustomerReport")
public class CRBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer pk;
	
	private String crClass;
	private String crTitle;
	private String crContent;
	private Timestamp crApplyDate;
	@Transient
	private String memberId;
	private String crReContent;
	private Timestamp crReDate;
	private String crReplier;
	private String crReScore;
	@ManyToOne
	@JoinColumn(name="memberId")
	private MemberBean memberBean;

	public CRBean() {
	}
	
	@Override
	public String toString() {
		return "CRBean [pk=" + pk + ", crClass=" + crClass + ", crTitle=" + crTitle + ", crContent=" + crContent
				+ ", crApplyDate=" + crApplyDate + ", memberId=" + memberId + ", crReContent=" + crReContent
				+ ", crReDate=" + crReDate + ", crReplier=" + crReplier + ", crReScore=" + crReScore + ", memberBean="
				+ memberBean + "]";
	}

	public CRBean(Integer pk, String crClass, String crTitle, String crContent, Timestamp crApplyDate, String memberId,
			String crReContent, Timestamp crReDate, String crReplier, String crReScore) {
		super();
		this.pk = pk;
		this.crClass = crClass;
		this.crTitle = crTitle;
		this.crContent = crContent;
		this.crApplyDate = crApplyDate;
		this.memberId = memberId;
		this.crReContent = crReContent;
		this.crReDate = crReDate;
		this.crReplier = crReplier;
		this.crReScore = crReScore;
	}

	public Integer getPk() {
		return pk;
	}

	public void setPk(Integer pk) {
		this.pk = pk;
	}

	public String getCrClass() {
		return crClass;
	}

	public void setCrClass(String crClass) {
		this.crClass = crClass;
	}

	public String getCrTitle() {
		return crTitle;
	}

	public void setCrTitle(String crTitle) {
		this.crTitle = crTitle;
	}

	public String getCrContent() {
		return crContent;
	}

	public void setCrContent(String crContent) {
		this.crContent = crContent;
	}

	public Timestamp getCrApplyDate() {
		return crApplyDate;
	}

	public void setCrApplyDate(Timestamp crApplyDate) {
		this.crApplyDate = crApplyDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getCrReContent() {
		return crReContent;
	}

	public void setCrReContent(String crReContent) {
		this.crReContent = crReContent;
	}

	public Timestamp getCrReDate() {
		return crReDate;
	}

	public void setCrReDate(Timestamp crReDate) {
		this.crReDate = crReDate;
	}

	public String getCrReplier() {
		return crReplier;
	}

	public void setCrReplier(String crReplier) {
		this.crReplier = crReplier;
	}

	public String getCrReScore() {
		return crReScore;
	}

	public void setCrReScore(String crReScore) {
		this.crReScore = crReScore;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

}
