package com.fh.controller.fish;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.fh.util.*;
import com.fh.util.express.ImageUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.fish.System_configManager;

/** 
 * 说明：系统参数配置
 * 创建人：Ajie
 * 创建时间：2019-10-14
 */
@Controller
@RequestMapping(value="/system_config")
public class System_configController extends BaseController {
	
	String menuUrl = "system_config/list.do"; //菜单地址(权限用)
	@Resource(name="system_configService")
	private System_configManager system_configService;


	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	@ResponseBody
	public String edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改System_config");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		Date date = new Date();
		pd.put("GMT_MODIFIED",Tools.date2Str(date));
		logger.info("修改系统参数："+pd);
		logger.info("系统参数长度为："+pd.size());
		system_configService.edit(pd);
		// 更新缓存中的参数
		applicati.setAttribute(Const.Par,pd);
		return "success";
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表System_config");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd.put("SYSTEM_CONFIG_ID",1);
		pd  = system_configService.findById(pd);
		mv.setViewName("fish/system_config/system_config_list");
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出System_config到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("创建时间");	//1
		titles.add("更新时间");	//2
		titles.add("每天提现次数");	//3
		titles.add("提现手续费");	//4
		titles.add("提现倍数");	//5
		titles.add("推广人数");	//6
		titles.add("获得喂养次数");	//7
		titles.add("喂养封顶");	//8
		titles.add("饲料价格");	//9
		titles.add("出局收益");	//10
		titles.add("没有推人喂养次数");	//11
		dataMap.put("titles", titles);
		List<PageData> varOList = system_configService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("GMT_CREATE"));	    //1
			vpd.put("var2", varOList.get(i).getString("GMT_MODIFIED"));	    //2
			vpd.put("var3", varOList.get(i).get("WITHDRAW_TODAY").toString());	//3
			vpd.put("var4", varOList.get(i).get("PAYMENT_FEE").toString());	//4
			vpd.put("var5", varOList.get(i).get("CASH_MULTIPLIER").toString());	//5
			vpd.put("var6", varOList.get(i).get("EXTENSION").toString());	//6
			vpd.put("var7", varOList.get(i).get("GET_FREQUENCY").toString());	//7
			vpd.put("var8", varOList.get(i).get("FEED_CAPPING").toString());	//8
			vpd.put("var9", varOList.get(i).get("FEED_PRICE").toString());	//9
			vpd.put("var10", varOList.get(i).get("OUT_EARNINGS").toString());	//10
			vpd.put("var11", varOList.get(i).get("FEEDING_TIMES").toString());	//11
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
