package org.soft.erp.domain.jggly;

import java.util.Collection;  
import java.util.concurrent.BlockingQueue;  
import java.util.concurrent.LinkedBlockingDeque;  

/** 
 * 体检用户任务队列 
 * 
 * 1.新建员工队列和专家队列
 * 2.从体检用户队列中取得一个用户，分配给下一个专家，并将专家加入到队列末尾。
 * 3.如果有新体检用户放入体检用户队列
 * 
 */  
public class QTjyhQueue {  
      
    private static QTjyhQueue instance;  
      
    private static BlockingQueue<Object> queue = null;  
      
    private QTjyhQueue(){  
        queue = new LinkedBlockingDeque<Object>(100);  
    }  
      
    public static QTjyhQueue getInstance(){  
        if(instance == null){  
            instance = new QTjyhQueue();  
        }  
        return instance;  
    }  
      
    /** 
     * 获取队列大小 
     * @return 
     */  
    public static int getSize(){  
        return queue.size();  
    }  
      
    /** 
     * 放入队列中 
     * @param msg 
     */  
    public void put(Object obj){  
        if(obj != null){  
            try {  
                queue.put(obj);  
            } catch (InterruptedException e) {  
                e.printStackTrace();  
            }  
        }  
    }  
      
    /** 
     * 放入队列中 
     * @param msg 
     */  
    public void putAll(Collection<?> objs){  
        if(objs != null){  
            queue.addAll(objs);  
        }  
    }  

    /** 
     * 从队列中取出一个 
     * @return 
     */  
    public Object take(){  
        try {  
            Object obj = queue.take();    
            return obj;  
        } catch (InterruptedException e) {  
            e.printStackTrace();  
        }  
        return null;  
    }  
  
}  