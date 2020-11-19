package TRN.web.news.model;

import java.io.Serializable;
import java.sql.Blob;

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

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "ImagesTrk")
public class ImageBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer imageId;
	private Blob coverimage;
	private String filename;
	private Timestamp ifondtime;
	private String title;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "trkNews_trackId")
	trkNewsBean trkNewsBean;
	@Transient
	MultipartFile itrktImage;	
	

	public ImageBean() {
		
	}



	public Integer getImageId() {
		return imageId;
	}



	public void setImageId(Integer imageId) {
		this.imageId = imageId;
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



	public Timestamp getIfondtime() {
		return ifondtime;
	}



	public void setIfondtime(Timestamp ifondtime) {
		this.ifondtime = ifondtime;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public trkNewsBean getTrkNewsBean() {
		return trkNewsBean;
	}



	public void setTrkNewsBean(trkNewsBean trkNewsBean) {
		this.trkNewsBean = trkNewsBean;
	}



	public MultipartFile getItrktImage() {
		return itrktImage;
	}



	public void setItrktImage(MultipartFile itrktImage) {
		this.itrktImage = itrktImage;
	}



	@Override
	public String toString() {
		return "ImageBean [imageId=" + imageId + ", coverimage=" + coverimage + ", filename=" + filename
				+ ", ifondtime=" + ifondtime + ", title=" + title + ", trkNewsBean=" + trkNewsBean + ", itrktImage="
				+ itrktImage + "]";
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