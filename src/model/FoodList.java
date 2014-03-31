package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "FOOD_LIST")
@SequenceGenerator(name = "SEQ_SYSTEM_CONFIG")
public class FoodList implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String ID = "id";
	public static final String NAME = "name";
	public static final String PATH = "path";
	public static final String MENU_ID = "menuId";
	public static final String DETAIL_PATH = "detailPath";
	public static final String KEY = "key";
	public static final String REMARK = "remark";
	@Id
	@Column(name = "ID", columnDefinition = "NUMBER|ID|", length = 11, nullable = false)
	private Integer id;
	@Column(name = "NAME", columnDefinition = "NVARCHAR2|类别|", length = 3, nullable = true)
	private String name;
	@Column(name = "PATH", columnDefinition = "NVARCHAR2|参数值|", length = 50, nullable = true)
	private String path;
	@Column(name = "MENU_ID", columnDefinition = "NVARCHAR2|参数值|", length = 50, nullable = true)
	private String menuId;
	@Column(name = "DETAIL_PATH", columnDefinition = "NVARCHAR2|参数值|", length = 50, nullable = true)
	private String detailPath;
	@Column(name = "REMARK", columnDefinition = "NVARCHAR2|参数值|", length = 50, nullable = true)
	private String remark;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getDetailPath() {
		return detailPath;
	}
	public void setDetailPath(String detailPath) {
		this.detailPath = detailPath;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}


}