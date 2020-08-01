package com.fh.service.fish.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.fish.Feed_recordManager;

/**
 * 说明： 喂养记录
 * 创建人：Ajie
 * 创建时间：2019-10-14
 * @version
 */
@Service("feed_recordService")
public class Feed_recordService implements Feed_recordManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("Feed_recordMapper.save", pd);
	}

	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("Feed_recordMapper.delete", pd);
	}

	/**清空表
	 * @param pd
	 * @throws Exception
	 */
	public void wipeData(PageData pd)throws Exception{
		dao.delete("Feed_recordMapper.wipeData", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("Feed_recordMapper.edit", pd);
	}

	/**更新出局状态和出局人数
	 * @param pd
	 * @throws Exception
	 */
	public void editState(PageData pd)throws Exception{
		dao.update("Feed_recordMapper.editState", pd);
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Feed_recordMapper.datalistPage", page);
	}

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Feed_recordMapper.listAll", pd);
	}

	/**列表(根据用户ID获取未出局的记录)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listByUserId(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Feed_recordMapper.listByUserId", pd);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Feed_recordMapper.findById", pd);
	}

	/**通过用户id获取累积
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCountByUserId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Feed_recordMapper.findCountByUserId", pd);
	}

	/**获取未出局的最小排号记录
	 * @param pd
	 * @throws Exception
	 */
	public PageData getNotOutMin(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Feed_recordMapper.getNotOutMin", pd);
	}

	/**获取喂养记录累积
	 * @param pd
	 * @throws Exception
	 */
	public PageData getRecCount(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Feed_recordMapper.getRecCount", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Feed_recordMapper.deleteAll", ArrayDATA_IDS);
	}

}

