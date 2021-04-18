package org.soft.erp.domain;

/**   
 * @Description: 
 * <br>网站：
 * @author    
 * @version V1.0   
 */
public class Kv{  
	
    private String key;  
    private String value;

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
	public Kv(String key, String value) {
		super();
		this.key = key;
		this.value = value;
	}  
}  

