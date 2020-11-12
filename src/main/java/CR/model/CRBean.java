package CR.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import iiiNews.MB.model.CpMemberBean;
import iiiNews.MB.model.MBBean;



@Entity
@Table(name="CR_CustomerReport")
public class CRBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer pk;
	
	private String crClass;
	private String crTitle;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String crContent;
	private Timestamp crApplyDate;
	private String memberId;
	@Transient
	private Integer companyId;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String crReContent;
	private Timestamp crReDate;
	private String crReplier;
	private String state;
	private String crReScore;
	private String attachmentName;
	
	public String getAttachmentName() {
		return attachmentName;
	}

	public void setAttachmentName(String attachmentName) {
		this.attachmentName = attachmentName;
	}

	@JsonIgnore
	private Blob attachment;
	@Transient
	private MultipartFile image;
	
	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Blob getAttachment() {
		return attachment;
	}

	public void setAttachment(Blob attachment) {
		this.attachment = attachment;
	}

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="memberBean_fpkey")
	private MBBean mbBean;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="cpBean_fpkey")
	private CpMemberBean cpBean;
	
	
	public CpMemberBean getCpBean() {
		return cpBean;
	}

	public void setCpBean(CpMemberBean cpBean) {
		this.cpBean = cpBean;
	}

	public void setMbBean(MBBean mbBean) {
		this.mbBean = mbBean;
	}
	public MBBean getMbBean() {
		return mbBean;
	}

	public CRBean() {
	}
	


	@Override
	public String toString() {
		return "CRBean [pk=" + pk + ", crClass=" + crClass + ", crTitle=" + crTitle + ", crContent=" + crContent
				+ ", crApplyDate=" + crApplyDate + ", memberId=" + memberId + ", crReContent=" + crReContent
				+ ", crReDate=" + crReDate + ", crReplier=" + crReplier + ", crReScore=" + crReScore + ", memberBean="
				+ mbBean + ", cpBean=" + cpBean + "]";
	}

	public CRBean(Integer pk, String crClass, String crTitle, String crContent, Timestamp crApplyDate, String memberId,
			String crReContent, Timestamp crReDate, String crReplier, String crReScore, MBBean mbBean,
			CpMemberBean cpBean) {
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
		this.mbBean = mbBean;
		this.cpBean = cpBean;
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



}
