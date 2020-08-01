package com.fh.controller.fish;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.fish.J91008_userManager;

/** 
 * 说明：用户管理
 * 创建人：Ajie
 * 创建时间：2019-10-14
 */
@Controller
@RequestMapping(value="/user_j91008")
public class J91008_userController extends BaseController {
	
	String menuUrl = "j91008_user/list.do"; //菜单地址(权限用)
	@Resource(name="j91008_userService")
	private J91008_userManager j91008_userService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增J91008_user");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("J91008_USER_ID", this.get32UUID());	//主键
		pd.put("GMT_CREATE", Tools.date2Str(new Date()));	//创建时间
		pd.put("GMT_MODIFIED", Tools.date2Str(new Date()));	//创建时间
		pd.put("IS_DELETED", "0");	//1 表示删除，0 表示未删除
		pd.put("IS_WITHDRAW ", "0");	//1 表示已提现，0 表示未提现。每日0时 重置为0
		pd.put("PHONE", "0");	//手机号
		pd.put("FEEDING_TODAY", "0");	//今天喂养
		pd.put("RECOMMENDED_NUMBER", "0");	//推荐人数
		pd.put("RECOMMENDER", "0");	//推荐人
		pd.put("RE_PATH", "");	//推荐路径
		j91008_userService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除J91008_user");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		j91008_userService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改J91008_user");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String pwd = pd.getString("PASSWORD");
		// 密码二次加密
		pwd = Tools.encrypt(pwd);
		pd.put("PASSWORD",pwd);
		j91008_userService.edit(pd);
		// 查询用户信息
		pd = j91008_userService.findById(pd);
		// 更新服务器缓存
		applicati.setAttribute(pd.get("PHONE").toString(),pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表J91008_user");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = j91008_userService.list(page);	//列出J91008_user列表
		mv.setViewName("fish/j91008_user/j91008_user_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("fish/j91008_user/j91008_user_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = j91008_userService.findById(pd);	//根据ID读取
		mv.setViewName("fish/j91008_user/j91008_user_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除J91008_user");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			j91008_userService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出J91008_user到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("创建时间");	//1
		titles.add("创建时间");	//2
		titles.add("提现次数");	//4
		titles.add("手机号");	//5
		titles.add("密码");	//6
		titles.add("今天喂养");	//7
		titles.add("钱");	//8
		titles.add("推荐人数");	//9
		titles.add("推荐人");	//10
		titles.add("推荐路径");	//11
		titles.add("爱心币");	//12
		titles.add("昵称");	//13
		titles.add("1 表示领养，0 表示未领养");	//14
		dataMap.put("titles", titles);
		List<PageData> varOList = j91008_userService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("GMT_CREATE"));	    //1
			vpd.put("var2", varOList.get(i).getString("GMT_MODIFIED"));	    //2
			vpd.put("var4", varOList.get(i).get("IS_WITHDRAW").toString());	//4
			vpd.put("var5", varOList.get(i).get("PHONE").toString());	//5
			vpd.put("var6", varOList.get(i).getString("PASSWORD"));	    //6
			vpd.put("var7", varOList.get(i).get("FEEDING_TODAY").toString());	//7
			vpd.put("var8", varOList.get(i).get("MONEY").toString());	//8
			vpd.put("var9", varOList.get(i).get("RECOMMENDED_NUMBER").toString());	//9
			if (varOList.get(i).get("RECOMMENDER").toString() != null && !"".equals(varOList.get(i).get("RECOMMENDER").toString())) {
				vpd.put("var10", varOList.get(i).get("RECOMMENDER").toString());	//10
				vpd.put("var11", varOList.get(i).getString("RE_PATH"));	    //11
			}
			vpd.put("var12", varOList.get(i).get("LOVE_COIN").toString());	//12
			if (varOList.get(i).getString("NICKNAME") != null && !"".equals(varOList.get(i).getString("NICKNAME"))){
				vpd.put("var13", varOList.get(i).getString("NICKNAME"));	    //13
			}

			vpd.put("var14", varOList.get(i).get("IS_ADOPTION").toString());	//14
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
