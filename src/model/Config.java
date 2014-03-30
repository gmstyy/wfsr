package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "SYSTEM_CONFIG")
@SequenceGenerator(name = "SEQ_SYSTEM_CONFIG")
public class Config implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String ID = "id";
	public static final String KEY = "key";
	public static final String VALUE = "value";
	@Id
	@Column(name = "ID", columnDefinition = "NUMBER|ID|", length = 11, nullable = false)
	private Integer id;
	@Column(name = "KEY", columnDefinition = "NVARCHAR2|类别|", length = 3, nullable = true)
	private String key;
	@Column(name = "VALUE", columnDefinition = "NVARCHAR2|参数值|", length = 50, nullable = true)
	private String value;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}