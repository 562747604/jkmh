package org.soft.erp.util.tag;

import org.soft.erp.util.common.ErpConstants;

/**
 *  分页实体 
 */
public class PageModel {
	/** 分页总数据条数  */
	private int recordCount;
	/** 当前页面 */
	private int pageIndex ;
	/** 每页分多少条数据   */
	private int pageSize = ErpConstants.PAGE_DEFAULT_SIZE = 10;
	
	/** 总页数  */
	private int totalSize;

	public int getRecordCount() {
		this.recordCount = this.recordCount <= 0 ? 0:this.recordCount;
		return recordCount;
	}
	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}
	public int getPageIndex() {
		this.pageIndex = this.pageIndex <= 0?1:this.pageIndex;
		/** 判断当前页面是否超过了总页数:如果超过了默认给最后一页作为当前页  */
		this.pageIndex = this.pageIndex>=this.getTotalSize()?this.getTotalSize():this.pageIndex;
		
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		this.pageSize = this.pageSize <= ErpConstants.PAGE_DEFAULT_SIZE?ErpConstants.PAGE_DEFAULT_SIZE:this.pageSize;
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getTotalSize() {
		if(this.getRecordCount() <=0){
			totalSize = 0 ;
		}else{
			totalSize = (this.getRecordCount() -1)/this.getPageSize() + 1;
		}
		return totalSize;
	}
	
	
	public int getFirstLimitParam(){
//		return (this.getPageIndex()-1)*this.getPageSize() ;
		return (this.getPageNumber()-1)*this.getPageSize() ;
	}
	

	
	
	
	
	
	/*
	 * 新增4个字段
	 */
	private String field;//字段排序
	private String sortOrder;//升降序
	private String keyword;//搜索关键字
	private int pageNumber;//当前页面,与jsp取同样名称
	private String fieldString;

	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public String getWhereStr() {
		return whereStr;
	}
	public void setWhereStr(String whereStr) {
		this.whereStr = whereStr;
	}







	public String getFieldString() {
		return fieldString;
	}
	public void setFieldString(String fieldString) {
		this.fieldString = fieldString;
	}














	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}







	public Integer getDays() {
		return days;
	}
	public void setDays(Integer days) {
		this.days = days;
	}







	public String getMin() {
		return min;
	}
	public void setMin(String min) {
		this.min = min;
	}







	public String getMax() {
		return max;
	}
	public void setMax(String max) {
		this.max = max;
	}







	private String whereStr;
	
	private String itemid;
	private Integer days;
	private String min;
	private String max;
	
	
}
