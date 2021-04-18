package org.soft.erp.domain.yxry;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**   
 * @Description: 机构  s_organ
 * @author    :中庸陈
 * @version V1.0   
 */
public class Group  implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	private Integer uid;
	private Integer gid;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}
