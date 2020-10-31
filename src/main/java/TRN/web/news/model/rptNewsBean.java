package TRN.web.news.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "rptNews")
public class rptNewsBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reportId;
	private String reptitle;
	private String media;
	private Timestamp reptfondtime;
	private Timestamp reptime;
	private String ocplace;
	private Clob repdescript;
	private String website;
	private Integer clicnum;
	private Blob repcoverimage;
	private String repfilename;
	private String reptype;
	private Integer repstatus;

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "trackId")
	private  trkNewsBean trkNewsBean;
		
	

	public rptNewsBean() {
		
	}
	
	public rptNewsBean(Integer reportId, 
			           String reptitle, 
			           String media, 
			           Timestamp reptfondtime, 
			           Timestamp reptime,
		               String ocplace, 
		               Clob repdescript, 
		               String website, 
		               Integer clicnum, 
		               Blob repcoverimage, 
		               String repfilename,
		               String reptype, 
		               Integer repstatus) {
	super();
	this.reportId = reportId;
	this.reptitle = reptitle;
	this.media = media;
	this.reptfondtime = reptfondtime;
	this.reptime = reptime;
	this.ocplace = ocplace;
	this.repdescript = repdescript;
	this.website = website;
	this.clicnum = clicnum;
	this.repcoverimage = repcoverimage;
	this.repfilename = repfilename;
	this.reptype = reptype;
	this.repstatus = repstatus;
}

	public Integer getReportId() {
		return reportId;
	}

	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}

	public String getReptitle() {
		return reptitle;
	}

	public void setReptitle(String reptitle) {
		this.reptitle = reptitle;
	}

	public String getMedia() {
		return media;
	}

	public void setMedia(String media) {
		this.media = media;
	}

	public Timestamp getReptfondtime() {
		return reptfondtime;
	}

	public void setReptfondtime(Timestamp reptfondtime) {
		this.reptfondtime = reptfondtime;
	}

	public Timestamp getReptime() {
		return reptime;
	}

	public void setReptime(Timestamp reptime) {
		this.reptime = reptime;
	}

	public String getOcplace() {
		return ocplace;
	}

	public void setOcplace(String ocplace) {
		this.ocplace = ocplace;
	}

	public Clob getRepdescript() {
		return repdescript;
	}

	public void setRepdescript(Clob repdescript) {
		this.repdescript = repdescript;
	}

	public String  getwebsite() {
		return website;
	}

	public void setwebsite(String website) {
		this.website = website;
	}

	public Integer getClicnum() {
		return clicnum;
	}

	public void setClicnum(Integer clicnum) {
		this.clicnum = clicnum;
	}

	public Blob getRepcoverimage() {
		return repcoverimage;
	}

	public void setRepcoverimage(Blob repcoverimage) {
		this.repcoverimage = repcoverimage;
	}

	public String getRepfilename() {
		return repfilename;
	}

	public void setRepfilename(String repfilename) {
		this.repfilename = repfilename;
	}

	public String getReptype() {
		return reptype;
	}

	public void setReptype(String reptype) {
		this.reptype = reptype;
	}

	public Integer getRepstatus() {
		return repstatus;
	}

	public void setRepstatus(Integer repstatus) {
		this.repstatus = repstatus;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public trkNewsBean getTrkNewsBean() {
		return trkNewsBean;
	}

	public void setTrkNewsBean(trkNewsBean trkNewsBean) {
		this.trkNewsBean = trkNewsBean;
	}

//	public rptNewsBean(Integer trackId, 
//			           String title, 
//			           String founder, 
//			           Timestamp fondtime, 
//			           Timestamp octime,
//			           String ocplace, 
//			           Clob descript, 
//			           Integer trcnum, 
//			           Integer clicnum, 
//			           Blob coverimage, 
//			           String filename,
//			           String type, 
//			           int status) {
//		super();
//		this.trackId = trackId;
//		this.title = title;
//		this.founder = founder;
//		this.fondtime = fondtime;
//		this.octime = octime;
//		this.ocplace = ocplace;
//		this.descript = descript;
//		this.trcnum = trcnum;
//		this.clicnum = clicnum;
//		this.coverimage = coverimage;
//		this.filename = filename;
//		this.type = type;
//		this.status = 1;
//	}
//	public rptNewsBean(Integer trackId, 
//			           String title, 
//			           String founder, 
//			           Timestamp fondtime, 
//			           Timestamp octime,
//			           String ocplace, 
//			           Clob descript, 
//			           Integer trcnum, 
//			           Integer clicnum, 
//			           Blob coverimage, 
//			           String filename,
//			           String type, 
//			           Integer status) {
//		super();
//		this.trackId = trackId;
//		this.title = title;
//		this.founder = founder;
//		this.fondtime = fondtime;
//		this.octime = octime;
//		this.ocplace = ocplace;
//		this.descript = descript;
//		this.trcnum = trcnum;
//		this.clicnum = clicnum;
//		this.coverimage = coverimage;
//		this.filename = filename;
//		this.type = type;
//		this.status = 1;
//	}
	
	
	
	

//	public ReportsBean getReportsBean() {
//		return reportsBean;
//	}
//
//	public void setReportsBean(ReportsBean reportsBean) {
//		this.reportsBean = reportsBean;
//	}

}