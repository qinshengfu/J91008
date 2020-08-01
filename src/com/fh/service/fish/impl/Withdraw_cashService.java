package com.fh.service.fish.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.fish.Withdraw_cashManager;

/** 
 * 说明： 提现管理
 * 创建人：Ajie
 * 创建时间：2019-10-14
 * @version
 */
@Service("withdraw_cashService")
public class Withdraw_cashService implements Withdraw_cashManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("Withdraw_cashMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("Withdraw_cashMapper.delete", pd);
	}

	/**清空表
	 * @param pd
	 * @throws Exception
	 */
	public void wipeData(PageData pd)throws Exception{
		dao.delete("Withdraw_cashMapper.wipeData", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("Withdraw_cashMapper.edit", pd);
	}

	/**更改订单状态
	 * @param pd
	 * @throws Exception
	 */
	public void editState(PageData pd)throws Exception{
		dao.update("Withdraw_cashMapper.editState", pd);
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Withdraw_cashMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Withdraw_cashMapper.listAll", pd);
	}

	/**列表(根据用户ID列出)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listByUserId(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Withdraw_cashMapper.listByUserId", pd);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Withdraw_cashMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Withdraw_cashMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

