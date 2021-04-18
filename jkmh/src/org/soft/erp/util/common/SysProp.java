package org.soft.erp.util.common;
import java.util.Properties;

public class SysProp {   
	
    public  String getProperty(String key) {   
  
        Properties props = new Properties();
        try{
        		props.load( this.getClass().getResourceAsStream("SysProp.properties"));
        		return props.getProperty(key);
        	}catch(Exception e){
        		e.printStackTrace();
        		return "";
        	}
        }
    public  long getZq(String key) { 
    	long  zq;
    	try
    	{
	     zq=Integer.parseInt(getProperty(key))*1000;
    	}
    	catch(Exception e){
    		 zq=20*1000;
    	}
    	return zq;
    }
  
}  
