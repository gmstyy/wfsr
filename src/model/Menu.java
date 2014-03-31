package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "MENU")
@SequenceGenerator(name = "SEQ_SYSTEM_CONFIG")
public class Menu implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String ID = "id";
	public static final String PARENT_ID = "parentId";
	public static final String NAME = "name";
	public static final String MENU_LEVEL = "menuLevel";
	public static final String URL = "url";
	public static final String SORT_NO = "sortNo";
	public static final String IMAGE_PATH = "imagePath";
	@Id
	@Column(name = "ID", columnDefinition = "NUMBER|ID|", length = 11, nullable = false)
	private Integer id;
	@Column(name = "PARENT_ID", columnDefinition = "NVARCHAR2|类别|", length = 3, nullable = true)
	private String parentId;
	@Column(name = "MENU_LEVEL", columnDefinition = "NVARCHAR2|参数值|", length = 50, nullable = true)
	private String menuLevel;
	@Column(name = "NAME", columnDefinition = "NVARCHAR2|参数值|", length = 50, nullable = true)
	private String name;
	@Column(name = "URL", columnDefinition = "NVARCHAR2|参数值|", length = 50, nullable = true)
	private String url;
	@Column(name = "SORT_NO", columnDefinition = "NVARCHAR2|参数值|", length = 50, nullable = true)
	private String sortNo;
	@Column(name = "IMAGE_PATH", columnDefinition = "NVARCHAR2|参数值|", length = 50, nullable = true)
	private String imagePath;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getMenuLevel() {
		return menuLevel;
	}
	public void setMenuLevel(String menuLevel) {
		this.menuLevel = menuLevel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getSortNo() {
		return sortNo;
	}
	public void setSortNo(String sortNo) {
		this.sortNo = sortNo;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	

}