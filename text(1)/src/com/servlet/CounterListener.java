package com.servlet;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class CounterListener implements HttpSessionListener {
    public static int count;
    public CounterListener(){
        count=0;
    }
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        count++;
    }

    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        if(count>0){
            count--;
        }
    }
}
