package CR.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CR_Board")
public class CRBoardBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer boardpk;
	
	private String bdTitle;
	private String bdCatagory;
	private String bdAuthor;
	private Date publishDate;
	private Date reviseDate;
	private Integer relyamt;
	private Integer watchamt;
	private Date lastwatchDate;
	
	
	
	
	
	public Integer getBoardpk() {
		return boardpk;
	}
	public void setBoardpk(Integer boardpk) {
		this.boardpk = boardpk;
	}
	public String getBdTitle() {
		return bdTitle;
	}
	public void setBdTitle(String bdTitle) {
		this.bdTitle = bdTitle;
	}
	public String getBdCatagory() {
		return bdCatagory;
	}
	public void setBdCatagory(String bdCatagory) {
		this.bdCatagory = bdCatagory;
	}
	public String getBdAuthor() {
		return bdAuthor;
	}
	public void setBdAuthor(String bdAuthor) {
		this.bdAuthor = bdAuthor;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public Date getReviseDate() {
		return reviseDate;
	}
	public void setReviseDate(Date reviseDate) {
		this.reviseDate = reviseDate;
	}
	public Integer getRelyamt() {
		return relyamt;
	}
	public void setRelyamt(Integer relyamt) {
		this.relyamt = relyamt;
	}
	public Integer getWatchamt() {
		return watchamt;
	}
	public void setWatchamt(Integer watchamt) {
		this.watchamt = watchamt;
	}
	public Date getLastwatchDate() {
		return lastwatchDate;
	}
	public void setLastwatchDate(Date lastwatchDate) {
		this.lastwatchDate = lastwatchDate;
	}
	
	
	
	
	

}
