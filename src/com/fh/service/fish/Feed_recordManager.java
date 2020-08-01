package com.fh.service.fish;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 喂养记录接口
 * 创建人：Ajie
 * 创建时间：2019-10-14
 * @version
 */
public interface Feed_recordManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;

	/**清空表
	 * @param pd
	 * @throws Exception
	 */
	void wipeData(PageData pd)throws Exception;

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;

	/**更新出局状态和出局人数
	 * @param pd
	 * @throws Exception
	 */
	void editState(PageData pd)throws Exception;

	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;

	/**列表(根据用户ID获取未出局的记录)
	 * @param pd
	 * @throws Exception
	 */
	List<PageData> listByUserId(PageData pd)throws Exception;

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;

	/**通过用户id获取累积
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCountByUserId(PageData pd)throws Exception;

	/**获取未出局的最小排号记录
	 * @param pd
	 * @throws Exception
	 */
	PageData getNotOutMin(PageData pd)throws Exception;

	/**获取喂养记录累积
	 * @param pd
	 * @throws Exception
	 */
	PageData getRecCount(PageData pd)throws Exception;

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
}

