package iiiNews.NP.model;

import java.io.Serializable;
import java.sql.Blob;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Image")
public class ImageBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer newsProduct_pk;
	private String pic_One;
	private String pic_Two;
	private String pic_Three;
	private Blob img_I;
	private Blob img_II;
	private Blob img_III;
	
	@OneToOne(mappedBy = "imagebean") 
	private NewsBean newsBean;
	
	
	public ImageBean() {
		}
	
	@Override
	public String toString() {
		return "ImageBean [newsProduct_pk=" + newsProduct_pk + ", pic_One=" + pic_One + ", pic_Two=" + pic_Two
				+ ", pic_Three=" + pic_Three + ", img_I=" + img_I + ", img_II=" + img_II + ", img_III=" + img_III
				+ ", newsBean=" + newsBean + "]";
	}

	public ImageBean(Integer newsProduct_pk, String pic_One, String pic_Two, String pic_Three, Blob img_I, Blob img_II,
			Blob img_III, NewsBean newsBean) {
		super();
		this.newsProduct_pk = newsProduct_pk;
		this.pic_One = pic_One;
		this.pic_Two = pic_Two;
		this.pic_Three = pic_Three;
		this.img_I = img_I;
		this.img_II = img_II;
		this.img_III = img_III;
		this.newsBean = newsBean;
	}

	
	public String getPic_One() {
		return pic_One;
	}
	public void setPic_One(String pic_One) {
		this.pic_One = pic_One;
	}
	public String getPic_Two() {
		return pic_Two;
	}
	public void setPic_Two(String pic_Two) {
		this.pic_Two = pic_Two;
	}
	public String getPic_Three() {
		return pic_Three;
	}
	public void setPic_Three(String pic_Three) {
		this.pic_Three = pic_Three;
	}
	public Blob getImg_I() {
		return img_I;
	}
	public void setImg_I(Blob img_I) {
		this.img_I = img_I;
	}
	public Blob getImg_II() {
		return img_II;
	}
	public void setImg_II(Blob img_II) {
		this.img_II = img_II;
	}
	public Blob getImg_III() {
		return img_III;
	}
	public void setImg_III(Blob img_III) {
		this.img_III = img_III;
	}
	

}
