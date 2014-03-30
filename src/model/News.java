package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "APPROVE")
@SequenceGenerator(name = "SEQ_APPROVE")
public class News implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String ID = "id";
	public static final String MENU_ID = "relationId";
	public static final String TYPE = "workflowId";
	public static final String TITLE = "currentNodeId";
	public static final String CONTENT = "remark";
	public static final String DATE = "categoryCode";
	public static final String SORT_NO = "businessCode";

	@Id
	@Column(name = "ID", columnDefinition = "NUMBER|ID|", length = 11, nullable = false)
	private Integer id;

	@Column(name = "MENU_ID", columnDefinition = "NUMBER|机构ID|", length = 11, nullable = true)
	private Integer menuId;

	@Column(name = "TYPE", columnDefinition = "NUMBER|业务ID|", length = 11, nullable = true)
	private Integer type;

	@Column(name = "TITLE", columnDefinition = "NVARCHAR2|流程ID|", length = 11, nullable = true)
	private Integer title;
	
	@Column(name = "CONTENT", columnDefinition = "NVARCHAR2|标题|", length = 60, nullable = true)
	private String content;
	
	@Column(name = "DATE", columnDefinition = "NVARCHAR2|流程名称|", length = 60, nullable = true)
	private String date;

	@Column(name = "SORT_NO", columnDefinition = "NUMBER|当前节点ID|", length = 11, nullable = true)
	private Integer sortNo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getTitle() {
		return title;
	}

	public void setTitle(Integer title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Integer getSortNo() {
		return sortNo;
	}

	public void setSortNo(Integer sortNo) {
		this.sortNo = sortNo;
	}

	
}