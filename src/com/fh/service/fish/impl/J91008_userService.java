package com.fh.service.fish.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.fish.J91008_userManager;

/** 
 * 说明： 用户管理
 * 创建人：Ajie
 * 创建时间：2019-10-14
 * @version
 */
@Service("j91008_userService")
public class J91008_userService implements J91008_userManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("J91008_userMapper.save", pd);
	}

	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("J91008_userMapper.delete", pd);
	}

	/**清空表数据保留顶点账号
	 * @param pd
	 * @throws Exception
	 */
	public void wipeData(PageData pd)throws Exception{
		dao.delete("J91008_userMapper.wipeData", pd);
	}

	/**清空推荐数量
	 * @param pd
	 * @throws Exception
	 */
	public void wipeReNumber(PageData pd)throws Exception{
		dao.update("J91008_userMapper.wipeReNumber", pd);
	}

	/**重置序列
	 * @param pd
	 * @throws Exception
	 */
	public void reset_seq(PageData pd)throws Exception{
		dao.findForObject("J91008_userMapper.reset_seq", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("J91008_userMapper.edit", pd);
	}

	/**增加提现次数
	 * @param pd
	 * @throws Exception
	 */
	public void addNumber(PageData pd)throws Exception{
		dao.update("J91008_userMapper.addNumber", pd);
	}

	/**修改数据
	 * @param pd
	 * @throws Exception
	 */
	public void editData(PageData pd)throws Exception{
		dao.update("J91008_userMapper.editData", pd);
	}

	/**喂养次数+1
	 * @param pd
	 * @throws Exception
	 */
	public void addFeedCount(PageData pd)throws Exception{
		dao.update("J91008_userMapper.addFeedCount", pd);
	}

	/**推荐人团队业绩次数+1
	 * @param pd
	 * @throws Exception
	 */
	public void addTeamCount(PageData pd)throws Exception{
		dao.update("J91008_userMapper.addTeamCount", pd);
	}

	/**增加饲料（钱）
	 * @param pd
	 * @throws Exception
	 */
	public void addMoney(PageData pd)throws Exception{
		dao.update("J91008_userMapper.addMoney", pd);
	}

	/**减少饲料（钱）
	 * @param pd
	 * @throws Exception
	 */
	public void deducMoney(PageData pd)throws Exception{
		dao.update("J91008_userMapper.deducMoney", pd);
	}

	/**减少饲料（钱）并更新领养状态
	 * @param pd
	 * @throws Exception
	 */
	public void deducMoneyAndUpState(PageData pd)throws Exception{
		dao.update("J91008_userMapper.deducMoneyAndUpState", pd);
	}

	/**更新推荐人数
	 * @param pd
	 * @throws Exception
	 */
	public void addReNumber(PageData pd)throws Exception{
		dao.update("J91008_userMapper.addReNumber", pd);
	}

	/**重置喂养次数和提现次数
	 * @param pd
	 * @throws Exception
	 */
	public void resetRec(PageData pd)throws Exception{
		dao.update("J91008_userMapper.resetRec", pd);
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("J91008_userMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("J91008_userMapper.listAll", pd);
	}

	/**列表(推荐图)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> recommendationMap(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("J91008_userMapper.recommendationMap", pd);
	}

	/**列表(所有直接推荐下级)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listByRecommender(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("J91008_userMapper.listByRecommender", pd);
	}

	/**根据推荐路径查找最高N人
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listMostNumByPath(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("J91008_userMapper.listMostNumByPath", pd);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("J91008_userMapper.findById", pd);
	}

	/**验证手机号和密码是否匹配
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByPhoneAndpassword(PageData pd)throws Exception{
		return (PageData)dao.findForObject("J91008_userMapper.findByPhoneAndpassword", pd);
	}

	/**通过手机号获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByPhone(PageData pd)throws Exception{
		return (PageData)dao.findForObject("J91008_userMapper.findByPhone", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("J91008_userMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

