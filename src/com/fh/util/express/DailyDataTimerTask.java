package com.fh.util.express;

import java.util.List;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import com.fh.service.fish.J91008_userManager;
import com.fh.service.fish.impl.J91008_userService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.fh.service.fhoa.impl.FhfileService;
import com.fh.util.DateUtil;
import com.fh.util.Logger;
import com.fh.util.PageData;

import static java.lang.System.*;

/**
 * 定时任务操作主体
 * 
 * @author liming
 *
 */
public class DailyDataTimerTask extends TimerTask {
 
	private static Logger log = Logger.getLogger(DailyDataTimerTask.class);
	
 
	@Override
	public void run() {
		try {
			// 在这里写你要执行的内容
			out.println("定时任务执行时间：//"+DateUtil.getTime());
			ServletContext applicati = ContextLoader.getCurrentWebApplicationContext().getServletContext();
			ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{
					"classpath:spring/ApplicationContext-dataSource.xml",
					"classpath:spring/ApplicationContext-main.xml",
					"classpath:spring/ApplicationContext-redis.xml"}); 
			
			FhfileService fhfileService = context.getBean("fhfileService",FhfileService.class);
			List<PageData> lbt = fhfileService.listAll(null);
			applicati.setAttribute("lbt", lbt);// 轮播图
			// 清除今日提现和喂养次数为0
			J91008_userManager j91008_userService = context.getBean("j91008_userService", J91008_userService.class);
			PageData pd = new PageData();
			j91008_userService.resetRec(pd);
			
			((ConfigurableApplicationContext)context).close();
		} catch (Exception e) {
			log.info("-------------解析信息发生异常--------------");
			e.printStackTrace();
		}
	}	
}

