package org.soft.erp.domain.jggly;

import java.io.Serializable;
import java.util.Date;

/**   
 * @Description: 权限表 s_rbac_role
 * @author    :中庸陈
 * @version V1.0   
 */
public class Power implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String powerid;//角色ID
	private String powername;//角色名称
	private String nodeId;//所属模块
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPowerid() {
		return powerid;
	}
	public void setPowerid(String powerid) {
		this.powerid = powerid;
	}
	public String getPowername() {
		return powername;
	}
	public void setPowername(String powername) {
		this.powername = powername;
	}
	public String getNodeId() {
		return nodeId;
	}
	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}


	
}
