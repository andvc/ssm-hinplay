package com.hinplay.modules.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hinplay.common.RequestData;
import com.hinplay.core.dao.GameClassDao;
import com.hinplay.core.entity.GameClass;
import com.hinplay.modules.admin.service.GameClassService;

@Service
public class GameClassServiceImpl implements GameClassService {
	@Autowired
	private GameClassDao cDao;

	@Override
	public GameClass selectById(Integer id) {
		RequestData qData = new RequestData();
		qData.put("cid", id);
		return cDao.selectByPrimary(qData).get(0);
	}

	@Override
	public List<GameClass> select() {
		RequestData qData = new RequestData();
		return cDao.selectByPrimary(qData);
	}

	@Override
	public int deleteBatchByPrimaryKey(Integer[] ids) {
		return cDao.deleteBatchByPrimaryKey(ids);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return cDao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(GameClass gClass) {
		return cDao.insertSelective(gClass);
	}

	@Override
	public int updateByPrimaryKeySelective(GameClass gClass) {
		return cDao.updateByPrimaryKeySelective(gClass);
	}

}
