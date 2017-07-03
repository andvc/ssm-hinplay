package com.hinplay.modules.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hinplay.common.CommonUtil;
import com.hinplay.common.RequestData;
import com.hinplay.core.dao.MasterManageDao;
import com.hinplay.core.entity.MasterManage;
import com.hinplay.modules.admin.service.MasterManageService;

@Service
public class MasterManageServiceImpl implements MasterManageService {
	@Autowired
	private MasterManageDao mDao;

	@Override
	public List<MasterManage> select() {
		return mDao.selectByPrimary(new RequestData());
	}

	@Override
	public int deleteBatchByPrimaryKey(Integer[] wid) {
		return mDao.deleteBatchByPrimaryKey(wid);
	}

	@Override
	public int deleteByPrimaryKey(Integer cid) {
		return mDao.deleteByPrimaryKey(cid);
	}

	@Override
	public int insert(MasterManage mManage) {
		if (mManage != null) {
			mManage.setWcentent(CommonUtil.replaceLineAndTab(mManage.getWcentent()).replaceAll(">\\s<", "><"));
		}
		return mDao.insertSelective(mManage);
	}

	@Override
	public List<MasterManage> selectWithBlobs() {
		return mDao.selectWidthBlobByPrimary(new RequestData());
	}

	@Override
	public MasterManage selectWithBlobsByPrimaryKey(Integer id) {
		RequestData rData = new RequestData();
		rData.put("wid", id);
		return mDao.selectWidthBlobByPrimary(rData).get(0);
	}

	@Override
	public int updateByPrimaryKeySelective(MasterManage master) {
		if (master != null) {
			master.setWcentent(CommonUtil.replaceLineAndTab(master.getWcentent()).replaceAll(">\\s<", "><"));
		}
		return mDao.updateByPrimaryKeySelective(master);
	}
}
