package com.fh.service.fish.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.fish.Bonus_recManager;

/** 
 * 说明： 奖金明细
 * 创建人：Ajie
 * 创建时间：2019-10-14
 * @version
 */
@Service("bonus_recService")
public class Bonus_recService implements Bonus_recManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("Bonus_recMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("Bonus_recMapper.delete", pd);
	}

	/**清空表
	 * @param pd
	 * @throws Exception
	 */
	public void wipeData(PageData pd)throws Exception{
		dao.delete("Bonus_recMapper.wipeData", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("Bonus_recMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Bonus_recMapper.datalistPage", page);
	}

	/**根据用户ID列出
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listByUserId(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Bonus_recMapper.listByUserId", pd);
	}

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Bonus_recMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Bonus_recMapper.findById", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Bonus_recMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

