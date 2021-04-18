package org.soft.erp.domain.jggly;

import java.util.Collection;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingDeque;
import org.soft.erp.domain.jggly.User;

/** 
 * 健康专家、健康专员任务队列
 * @author  
 * 
 */  
public class QJkzyQueue {  
      
    private static QJkzyQueue instance = null;  
    private static BlockingQueue<User> queue = null;  
      
    private QJkzyQueue(){  
        queue =  new LinkedBlockingDeque<User>();  
    }  
      
    public static QJkzyQueue getInstance(){  
        if(instance == null){  
            instance = new QJkzyQueue();  
        }  
        return instance;  
    }  
  
    /** 
     * 取下一个专家 
     * @return 
     */  
    public User takeNext(){  
        User user = null;  
        try {  
            user = queue.take();  
            this.put(user);  
        } catch (InterruptedException e) {  
            e.printStackTrace();  
        }  
        return user;  
    }  
      
    /** 
     * 将新专家放入队列中未尾 
     */  
    public void put(User user){  
        if(queue.contains(user)){  
            return;  
        }else{  
            try {  
                queue.put(user);  
            } catch (InterruptedException e) {  
                e.printStackTrace();  
            }  
        }  
    }  
      
    public void putAll(Collection<User> users){  
        for(User user : users){  
            this.put(user);  
        }  
    }  
      
    /** 
     * 将已不存在的专家移除 
     */  
    public void remove(User user){  
        if(queue.contains(user)){  
            queue.remove(user);  
        }  
    }  
      
    /** 
     * 获取目前队列中所有的user 
     * @return 
     */  
    public Object[] getAllUsers(){  
        Object[] obj = queue.toArray();  
        return obj;  
    }  

}  