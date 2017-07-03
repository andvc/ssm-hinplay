package com.hinplay.modules.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hinplay.common.RequestData;
import com.hinplay.core.dao.GameCommendDao;
import com.hinplay.core.entity.GameCommend;
import com.hinplay.core.entity.GamesManage;
import com.hinplay.modules.admin.service.CommendService;

@Service
public class CommendServiceImpl implements CommendService {
	@Autowired
	private GameCommendDao cDao;

	@Override
	public List<GameCommend> selectByPrimary() {
		return cDao.selectByPrimary(new RequestData());
	}

	@Override
	public List<GamesManage> selectOfGameByPrimary() {
		return cDao.selectOfGameByPrimary(new RequestData());
	}

	@Override
	public List<GameCommend> selectWithGameByPrimary() {
		return cDao.selectWithGameByPrimary(new RequestData());
	}

	@Override
	public GameCommend selectByKey(Integer id) {
		RequestData rData = new RequestData();
		rData.put("gid", id);
		return cDao.selectByPrimary(rData).get(0);
	}

	@Override
	public GamesManage selectOfGameByKey(Integer id) {
		RequestData rData = new RequestData();
		rData.put("gid", id);
		return cDao.selectOfGameByPrimary(rData).get(0);
	}

	@Override
	public GameCommend selectWithGameByKey(Integer id) {
		RequestData rData = new RequestData();
		rData.put("gid", id);
		return cDao.selectWithGameByPrimary(rData).get(0);
	}

	@Override
	public List<GamesManage> selectByType(String type) {
		RequestData rData = new RequestData();
		if (type.equalsIgnoreCase("hot")) {
			rData.put("ghot", 1);
		} else if (type.equalsIgnoreCase("nice")) {
			rData.put("gnice", 1);
		} else {
			rData.put("gnew", 1);
		}
		return cDao.selectOfGameByPrimary(rData);
	}

	/**
	 * 
	 * @param type
	 * @param id
	 * @param isDel
	 *            是否是删除，否则更新
	 * @return
	 */
	@Override
	public int updateByPrimaryKeySelective(String type, Integer id, boolean isDel) {
		Integer num = isDel ? 0 : 1;
		GameCommend gCommend = new GameCommend();
		gCommend.setGid(id);
		if (type.equalsIgnoreCase("hot")) {
			gCommend.setGhot(num);
		} else if (type.equalsIgnoreCase("nice")) {
			gCommend.setGnice(num);
		} else if (type.equalsIgnoreCase("new")) {
			gCommend.setGnew(num);
		}
		return cDao.updateByPrimaryKeySelective(gCommend);
	}

	/**
	 * 
	 * @param type
	 * @param ids
	 * @param isDel
	 *            是否是删除，否则更新
	 * @return
	 */
	@Override
	public int updateBatchByPrimaryKeySelective(String type, Integer[] ids, boolean isDel) {
		Integer num = isDel ? 0 : 1;
		GameCommend gCommend = new GameCommend();
		if (type.equalsIgnoreCase("hot")) {
			gCommend.setGhot(num);
		} else if (type.equalsIgnoreCase("nice")) {
			gCommend.setGnice(num);
		} else if (type.equalsIgnoreCase("new")) {
			gCommend.setGnew(num);
		}
		return cDao.updateBatchByPrimaryKeySelective(gCommend, ids);
	}

}
