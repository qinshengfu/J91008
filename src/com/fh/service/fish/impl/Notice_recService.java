package com.fh.service.fish.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.fish.Notice_recManager;

/** 
 * 说明： 公告管理
 * 创建人：Ajie
 * 创建时间：2019-10-14
 * @version
 */
@Service("notice_recService")
public class Notice_recService implements Notice_recManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("Notice_recMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("Notice_recMapper.delete", pd);
	}

	/**清空表数据
	 * @param pd
	 * @throws Exception
	 */
	public void wipeData(PageData pd)throws Exception{
		dao.delete("Notice_recMapper.wipeData", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("Notice_recMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Notice_recMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Notice_recMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Notice_recMapper.findById", pd);
	}

	/**获取最新一条新闻公告
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByNewTime(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Notice_recMapper.findByNewTime", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Notice_recMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

