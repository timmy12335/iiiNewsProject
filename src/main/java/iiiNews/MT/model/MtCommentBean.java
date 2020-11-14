package iiiNews.MT.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "MtArticleComment")
public class MtCommentBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer commentPkey;
	private String comMemberId;		//會員編號
	private String commentId;	//留言ID
	@Column(columnDefinition = "datetime2(7)")	//修改型態，預設為datetime2(7)
	private Timestamp uploadTime;	//上傳時間
	
	private String comment;
	
	@ManyToOne
	@JoinColumn(name = "article_FK")
	private MtAddBean mtAddBean;
	//雙向多對一  多方內有個儲存一方物件參考的實例變數
	//外鍵在多方 定義說明外鍵的名字是什麼是誰
	
	



	public MtCommentBean(){
	}


	public Integer getCommentPkey() {
		return commentPkey;
	}


	public void setCommentPkey(Integer commentPkey) {
		this.commentPkey = commentPkey;
	}


	public String getComMemberId() {
		return comMemberId;
	}


	public void setComMemberId(String comMemberId) {
		this.comMemberId = comMemberId;
	}


	public String getCommentId() {
		return commentId;
	}


	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}


	public Timestamp getUploadTime() {
		return uploadTime;
	}


	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public MtAddBean getMtAddBean() {
		return mtAddBean;
	}


	public void setMtAddBean(MtAddBean mtAddBean) {
		this.mtAddBean = mtAddBean;
	}

}
