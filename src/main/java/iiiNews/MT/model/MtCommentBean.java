package iiiNews.MT.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import franktest.model.MemberBean;

@Entity
@Table(name="MtComment")
public class MtCommentBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Comment_Id")
	private Integer CommentId;
	
	@Column(name = "Comment_Box")
	private String CommentBox;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "members_Comment",		//會員欄位，待修改*****
		joinColumns = {
				@JoinColumn(name = "FK_Comment_Id", referencedColumnName = "Comment_Id")	//留言欄位
		},
		inverseJoinColumns = {
				@JoinColumn(name = "FK_AUTHOR_Id", referencedColumnName = "seqNo")	//會員欄位，待修改*****
		}
	)
	private Set<MemberBean> members = new HashSet<MemberBean>(0);	//會員名稱，待修改*****

	public MtCommentBean() {
	}

	public Integer getCommentId() {
		return CommentId;
	}

	public void setCommentId(Integer commentId) {
		CommentId = commentId;
	}

	public String getCommentBox() {
		return CommentBox;
	}

	public void setCommentBox(String commentBox) {
		CommentBox = commentBox;
	}

	public Set<MemberBean> getMembers() {
		return members;
	}

	public void setMembers(Set<MemberBean> members) {
		this.members = members;
	}

}
