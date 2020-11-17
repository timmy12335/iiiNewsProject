package TRN.web.news.model;

import java.io.Serializable;
import java.sql.Blob;

import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "trkNews")
public class trkNewsBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer trackId;
	private String title;
	private String founder;
	private Timestamp fondtime;
	private Timestamp octime;
	private String ocplace;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String descript;
	private Integer trcnum;
	private Integer clicnum;
	@JsonIgnore
	private Blob coverimage;
	private String filename;
	private String type;
	private Integer status;
	private String extra;
	private String tag;
	
	@JsonIgnore
	@Transient
	private MultipartFile newsImage; 
	
	
	@Transient
//	private Integer reportId;
	
//	private rptNewsBean rptNewsBean;

	@OneToMany(mappedBy="trkNewsBean")
	private Set<rptNewsBean> rpts = new LinkedHashSet<>();
		
	public trkNewsBean() {
		
	}
	
	public trkNewsBean(Integer trackId, 
			           String title, 
			           String founder, 
			           Timestamp fondtime, 
			           Timestamp octime,
			           String ocplace, 
			           String descript, 
			           Integer trcnum, 
			           Integer clicnum, 
			           Blob coverimage, 
			           String filename,
			           String type, 
			           int status,
			           String extra,
			           String tag
			           ) {
		super();
		this.trackId = trackId;
		this.title = title;
		this.founder = founder;
		this.fondtime = fondtime;
		this.octime = octime;
		this.ocplace = ocplace;
		this.descript = descript;
		this.trcnum = trcnum;
		this.clicnum = clicnum;
		this.coverimage = coverimage;
		this.filename = filename;
		this.type = type;
		this.status = 1;
		this.extra = extra;
		this.tag = tag;
//		this.rptNewsBean = rptNewsBean;
	}
	public trkNewsBean(Integer trackId, 
			           String title, 
			           String founder, 
			           Timestamp fondtime, 
			           Timestamp octime,
			           String ocplace, 
			           String descript, 
			           Integer trcnum, 
			           Integer clicnum, 
			           Blob coverimage, 
			           String filename,
			           String type, 
			           Integer status) {
		super();
		this.trackId = trackId;
		this.title = title;
		this.founder = founder;
		this.fondtime = fondtime;
		this.octime = octime;
		this.ocplace = ocplace;
		this.descript = descript;
		this.trcnum = trcnum;
		this.clicnum = clicnum;
		this.coverimage = coverimage;
		this.filename = filename;
		this.type = type;
		this.status = 1;
	}
	

	
	public String getExtra() {
		return extra;
	}

	public void setExtra(String extra) {
		this.extra = extra;
	}

	public MultipartFile getNewsImage() {
		return newsImage;
	}

	public void setNewsImage(MultipartFile newsImage) {
		this.newsImage = newsImage;
	}

	public Integer getTrackId() {
		return trackId;
	}

	public void setTrackId(Integer trackId) {
		this.trackId = trackId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFounder() {
		return founder;
	}

	public void setFounder(String founder) {
		this.founder = founder;
	}

	public Timestamp getFondtime() {
		return fondtime;
	}

	public void setFondtime(Timestamp fondtime) {
		this.fondtime = fondtime;
	}

	public Timestamp getOctime() {
		return octime;
	}

	public void setOctime(Timestamp octime) {
		this.octime = octime;
	}

	public String getOcplace() {
		return ocplace;
	}

	public void setOcplace(String ocplace) {
		this.ocplace = ocplace;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public Integer getTrcnum() {
		return trcnum;
	}

	public void setTrcnum(Integer trcnum) {
		this.trcnum = trcnum;
	}

	public Integer getClicnum() {
		return clicnum;
	}

	public void setClicnum(Integer clicnum) {
		this.clicnum = clicnum;
	}

	public Blob getCoverimage() {
		return coverimage;
	}

	public void setCoverimage(Blob coverimage) {
		this.coverimage = coverimage;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

//	public Set<rptNewsBean> getRpts() {
//		return rpts;
//	}
//
//	public void setRpts(Set<rptNewsBean> rpts) {
//		this.rpts = rpts;
//	}

//	public rptNewsBean getRptNewsBean() {
//		return rptNewsBean;
//	}
//
//	public void setRptNewsBean(rptNewsBean rptNewsBean) {
//		this.rptNewsBean = rptNewsBean;
//	}
//	public Integer getReportId() {
//	return reportId;
//}
//
//public void setReportId(Integer reportId) {
//	this.reportId = reportId;
//}
	



}