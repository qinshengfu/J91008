package com.fh.util.express;

import java.io.IOException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 定时任务监听器
 * 
 * @author liming
 *
 */
 
public class DailyDataTaskListener implements ServletContextListener {
 
	public void contextInitialized(ServletContextEvent event) {
		new TimerManager();
		//new DailyDataTimerTask();//启动执行
	}
 
	public void contextDestroyed(ServletContextEvent event) {
	}
 
}
