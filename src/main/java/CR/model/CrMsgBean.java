package CR.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import iiiNews.MB.model.CpMemberBean;
import iiiNews.MB.model.MBBean;


@Entity
@Table(name="CR_msg")
public class CrMsgBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer pk;
	
	private String receivemsg;
	@Transient
	private String receiver;
	private Timestamp receiveTime;
	private String msg;
	@Transient
	private String sender;
	private Timestamp sendTime;
	@Transient
	private Integer memberId;
	@Transient
	private Integer companyId;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="member_Id")
	private MBBean mbBean;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="company_Id")
	private CpMemberBean cpBean;
	







	public CrMsgBean(Integer pk, String receivemsg, String receiver, Timestamp receiveTime, String msg,
			String sender, Timestamp sendTime, Integer memberId, Integer companyId, MBBean mbBean,
			CpMemberBean cpBean) {
		super();
		this.pk = pk;
		this.receivemsg = receivemsg;
		this.receiver = receiver;
		this.receiveTime = receiveTime;
		this.msg = msg;
		this.sender = sender;
		this.sendTime = sendTime;
		this.memberId = memberId;
		this.companyId = companyId;
		this.mbBean = mbBean;
		this.cpBean = cpBean;
	}







	public Integer getPk() {
		return pk;
	}







	public void setPk(Integer pk) {
		this.pk = pk;
	}







	public String getReceivemsg() {
		return receivemsg;
	}







	public void setReceivemsg(String receivemsg) {
		this.receivemsg = receivemsg;
	}







	public String getReceiver() {
		return receiver;
	}







	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}







	public Timestamp getReceiveTime() {
		return receiveTime;
	}







	public void setReceiveTime(Timestamp receiveTime) {
		this.receiveTime = receiveTime;
	}







	public String getMsg() {
		return msg;
	}







	public void setMsg(String msg) {
		this.msg = msg;
	}







	public String getSender() {
		return sender;
	}







	public void setSender(String sender) {
		this.sender = sender;
	}







	public Timestamp getSendTime() {
		return sendTime;
	}







	public void setSendTime(Timestamp sendTime) {
		this.sendTime = sendTime;
	}







	public Integer getMemberId() {
		return memberId;
	}







	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}







	public Integer getCompanyId() {
		return companyId;
	}







	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}







	public MBBean getMbBean() {
		return mbBean;
	}







	public void setMbBean(MBBean mbBean) {
		this.mbBean = mbBean;
	}







	public CpMemberBean getCpBean() {
		return cpBean;
	}







	public void setCpBean(CpMemberBean cpBean) {
		this.cpBean = cpBean;
	}







	public CrMsgBean() {
		
	}

}
