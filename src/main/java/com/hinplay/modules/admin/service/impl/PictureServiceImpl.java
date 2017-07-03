package com.hinplay.modules.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hinplay.common.RequestData;
import com.hinplay.core.dao.PictureManageDao;
import com.hinplay.core.entity.PictureManage;
import com.hinplay.modules.admin.service.PictureService;

@Service
public class PictureServiceImpl implements PictureService {
	@Autowired
	private PictureManageDao pDao;

	@Override
	public PictureManage selectById(Integer id) {
		RequestData pData = new RequestData();
		pData.put("pid", id);
		return pDao.selectByPrimary(pData).get(0);
	}

	@Override
	public List<PictureManage> select() {
		return pDao.selectByPrimary(new RequestData());
	}

	@Override
	public int insert(PictureManage pManage) {
		return pDao.insertSelective(pManage);
	}

	@Override
	public int deleteBatchByPrimaryKey(Integer[] ids) {
		return pDao.deleteBatchByPrimaryKey(ids);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return pDao.deleteByPrimaryKey(id);
	}

	@Override
	public List<PictureManage> selectSetByKey(Integer[] ids) {
		RequestData pData = new RequestData();
		pData.put("findIn", ids);
		return pDao.selectByPrimary(pData);
	}

	@Override
	public int updateByPrimaryKeySelective(PictureManage pManage) {
		return pDao.updateByPrimaryKeySelective(pManage);
	}

	@Override
	public List<PictureManage> selectByShow() {
		RequestData pData = new RequestData();
		pData.put("isshow", 1);
		return pDao.selectByPrimary(pData);
	}

	@Override
	public List<PictureManage> selectByShowAndOrder(String order) {
		RequestData pData = new RequestData();
		pData.put("isshow", 1);
		pData.put("orderBy", order);
		return pDao.selectByPrimary(pData);
	}

}
