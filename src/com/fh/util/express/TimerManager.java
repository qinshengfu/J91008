package com.fh.util.express;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


/**
 * 定时任务时间控制
 * 
 * @author liming
 *
 */
public class TimerManager {
 
	// 时间间隔一天  刷新一次
	private static final long PERIOD_DAY =  24 * 60 * 60 * 1000;
	// 时间间隔5分钟  刷新一次
	private static final long PERIOD_MIN =  5 * 60 * 1000;
	private static ServletContext sContext=ContextLoader.getCurrentWebApplicationContext().getServletContext();
 
	public TimerManager() {
		Calendar calendar = Calendar.getInstance();
 
		Date date = calendar.getTime(); //执行定时任务的时间
		// 在启动服务器时如果第一次执行定时任务的时间小于当前的时间任务会立即执行。
		// 因此为了防止重启服务器造成任务重复执行，需要将执行定时任务的时间修改为第二天。
		if (date.before(new Date())) {
			date = this.addDay(date, 1);
		}
 
		Timer timer = new Timer();
 
		DailyDataTimerTask task = new DailyDataTimerTask();
		// 任务执行间隔。
		//timer.schedule(task, date, PERIOD_DAY);//时间间隔
		//timer.schedule(task, date);//执行一次
		
		
		/*** 定制每日00:00执行方法 ***/
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		
//		StaticRewardTimerTask staticReward = new StaticRewardTimerTask();
	
		// 获取当天的0点
		Date need = calendar.getTime();
		
		if (need.before(new Date())) {
			need = this.addDay(need, 1);
		}
		timer.scheduleAtFixedRate(task, need, PERIOD_DAY);//每天执行
	
	}
 
	// 增加或减少天数
	public Date addDay(Date date, int num) {
		Calendar startDT = Calendar.getInstance();
		startDT.setTime(date);
		startDT.add(Calendar.DAY_OF_MONTH, num);
		return startDT.getTime();
	}

}
