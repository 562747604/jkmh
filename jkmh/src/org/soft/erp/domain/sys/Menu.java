package org.soft.erp.domain.sys;

import java.io.Serializable;

/**   
 * @Description: 菜单表 s_rbac_menu
 * @author    :中庸陈
 * @version V1.0   
 */
public class Menu implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Integer parent_id;//父节点
	private String menu_id;//菜单ID
	private String menu_name;//菜单名称
	private String menu_url;//跳转网址
	private Integer sortid;//排序
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_url() {
		return menu_url;
	}
	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}
	public Integer getSortid() {
		return sortid;
	}
	public void setSortid(Integer sortid) {
		this.sortid = sortid;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	

	
}
