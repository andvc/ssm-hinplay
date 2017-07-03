package com.hinplay.modules.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hinplay.common.RequestData;
import com.hinplay.core.dao.GameCommendDao;
import com.hinplay.core.dao.GamesManageDao;
import com.hinplay.core.entity.GameCommend;
import com.hinplay.core.entity.GamesManage;
import com.hinplay.modules.admin.service.GamesManageService;

@Service
public class GamesManageServiceImpl implements GamesManageService {
	@Autowired
	private GamesManageDao gDao;
	@Autowired
	private GameCommendDao cDao;

	@Override
	public GamesManage selectById(Integer id) {
		RequestData qData = new RequestData();
		qData.put("gid", id);
		return gDao.selectByPrimary(qData).get(0);
	}

	@Override
	public List<GamesManage> select() {
		RequestData qData = new RequestData();
		return gDao.selectByPrimary(qData);
	}

	@Override
	public List<GamesManage> selectBySearch(String name) {
		RequestData qData = new RequestData();
		if (name != null) {
			qData.put("hazyName", "gName");
			qData.put("hazyValue", name);
		}
		return gDao.selectWithClassByPrimary(qData);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		int num = 0;
		if (gDao.deleteByPrimaryKey(id) > 0 && cDao.deleteByPrimaryKey(id) > 0) {
			num++;
		}
		return num;
	}

	@Override
	public int deleteBatchByPrimaryKey(Integer[] ids) {
		int num = 0;
		if (gDao.deleteBatchByPrimaryKey(ids) == ids.length && cDao.deleteBatchByPrimaryKey(ids) == ids.length) {
			num = ids.length;
		}
		return num;
	}

	@Override
	public int insert(GamesManage gManage) {
		int num = 0;
		if (gDao.insertSelective(gManage) > 0) {
			GameCommend commend = new GameCommend();
			commend.setGid(gManage.getGid());
			if (cDao.insertSelective(commend) > 0) {
				num++;
			}
		}
		return num;
	}

	@Override
	public List<GamesManage> selectWithClassByPrimary() {
		return gDao.selectWithClassByPrimary(new RequestData());
	}

	@Override
	public GamesManage selectWithClassById(Integer id) {
		RequestData qData = new RequestData();
		qData.put("gid", id);
		return gDao.selectWithClassByPrimary(qData).get(0);
	}

	@Override
	public int update(GamesManage gManage) {
		return gDao.updateByPrimaryKeySelective(gManage);
	}
}
