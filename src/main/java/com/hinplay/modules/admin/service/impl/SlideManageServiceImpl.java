package com.hinplay.modules.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hinplay.common.RequestData;
import com.hinplay.core.dao.SlideManageDao;
import com.hinplay.core.entity.SlideManage;
import com.hinplay.modules.admin.service.SlideManageService;

@Service
public class SlideManageServiceImpl implements SlideManageService {
	@Autowired
	private SlideManageDao sDao;

	@Override
	public List<SlideManage> select() {
		RequestData rData = new RequestData();
		rData.put("orderBy", "sOrder");
		return sDao.selectByPrimary(rData);
	}

	@Override
	public int deleteBatchByPrimaryKey(Integer[] sid) {
		return sDao.deleteBatchByPrimaryKey(sid);
	}

	@Override
	public int deleteByPrimaryKey(Integer sid) {
		return sDao.deleteByPrimaryKey(sid);
	}

	@Override
	public int insert(SlideManage sManage) {
		return sDao.insertSelective(sManage);
	}

	@Override
	public SlideManage selectById(Integer sid) {
		RequestData qData = new RequestData();
		qData.put("sid", sid);
		return sDao.selectByPrimary(qData).get(0);
	}

	@Override
	public int updateByPrimaryKeySelective(SlideManage slide) {
		return sDao.updateByPrimaryKeySelective(slide);
	}

}
