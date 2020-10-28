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
@Table(name = "departmts")
public class departmtsBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer statementId;
	private String statitle;
	private String department;
	private Timestamp stafondtime;
	private Timestamp statime;
	private String ocplace;
	private Clob stadescript;
	private String website;
	private Integer clicnum;
	private Blob stacoverimage;
	private String stafilename;
	private String statype;
	private Integer stastatus;

//	@OneToMany(cascade = CascadeType.ALL)
//	@JoinColumn(name = "reportsBean")
//	private ReportsBean reportsBean;
		
	public departmtsBean() {
		
	}

public departmtsBean(Integer statementId, String statitle, String department, Timestamp stafondtime, Timestamp statime,
		String ocplace, Clob stadescript, String website, Integer clicnum, Blob stacoverimage, String stafilename,
		String statype, Integer stastatus) {
	super();
	this.statementId = statementId;
	this.statitle = statitle;
	this.department = department;
	this.stafondtime = stafondtime;
	this.statime = statime;
	this.ocplace = ocplace;
	this.stadescript = stadescript;
	this.website = website;
	this.clicnum = clicnum;
	this.stacoverimage = stacoverimage;
	this.stafilename = stafilename;
	this.statype = statype;
	this.stastatus = stastatus;
}

public Integer getStatementId() {
	return statementId;
}

public void setStatementId(Integer statementId) {
	this.statementId = statementId;
}

public String getStatitle() {
	return statitle;
}

public void setStatitle(String statitle) {
	this.statitle = statitle;
}

public String getDepartment() {
	return department;
}

public void setDepartment(String department) {
	this.department = department;
}

public Timestamp getStafondtime() {
	return stafondtime;
}

public void setStafondtime(Timestamp stafondtime) {
	this.stafondtime = stafondtime;
}

public Timestamp getStatime() {
	return statime;
}

public void setStatime(Timestamp statime) {
	this.statime = statime;
}

public String getOcplace() {
	return ocplace;
}

public void setOcplace(String ocplace) {
	this.ocplace = ocplace;
}

public Clob getStadescript() {
	return stadescript;
}

public void setStadescript(Clob stadescript) {
	this.stadescript = stadescript;
}

public String getWebsite() {
	return website;
}

public void setWebsite(String website) {
	this.website = website;
}

public Integer getClicnum() {
	return clicnum;
}

public void setClicnum(Integer clicnum) {
	this.clicnum = clicnum;
}

public Blob getStacoverimage() {
	return stacoverimage;
}

public void setStacoverimage(Blob stacoverimage) {
	this.stacoverimage = stacoverimage;
}

public String getStafilename() {
	return stafilename;
}

public void setStafilename(String stafilename) {
	this.stafilename = stafilename;
}

public String getStatype() {
	return statype;
}

public void setStatype(String statype) {
	this.statype = statype;
}

public Integer getStastatus() {
	return stastatus;
}

public void setStastatus(Integer stastatus) {
	this.stastatus = stastatus;
}
	
//	public departmtsBean(Integer reportId, 
//			           String reptitle, 
//			           String media, 
//			           Timestamp reptfondtime, 
//			           Timestamp reptime,
//		               String ocplace, 
//		               Clob repdescript, 
//		               Integer trcnum, 
//		               Integer clicnum, 
//		               Blob repcoverimage, 
//		               String repfilename,
//		               String reptype, 
//		               Integer repstatus) {
//	super();
//	this.reportId = reportId;
//	this.reptitle = reptitle;
//	this.media = media;
//	this.reptfondtime = reptfondtime;
//	this.reptime = reptime;
//	this.ocplace = ocplace;
//	this.repdescript = repdescript;
//	this.trcnum = trcnum;
//	this.clicnum = clicnum;
//	this.repcoverimage = repcoverimage;
//	this.repfilename = repfilename;
//	this.reptype = reptype;
//	this.repstatus = repstatus;
//}

	

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