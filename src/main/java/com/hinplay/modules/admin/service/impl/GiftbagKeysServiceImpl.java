package com.hinplay.modules.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hinplay.common.RequestData;
import com.hinplay.core.dao.GiftbagKeysDao;
import com.hinplay.core.entity.GiftbagKeys;
import com.hinplay.modules.admin.service.GiftbagKeysService;

@Service
public class GiftbagKeysServiceImpl implements GiftbagKeysService {
	@Autowired
	private GiftbagKeysDao kDao;

	@Override
	public GiftbagKeys selectById(Integer id) {
		RequestData rData = new RequestData();
		rData.put("kid", id);
		return kDao.selectByPrimary(rData).get(0);
	}

	@Override
	public List<GiftbagKeys> select() {
		return kDao.selectByPrimary(new RequestData());
	}

	@Override
	public List<GiftbagKeys> selectBySearch(Integer bid) {
		RequestData rData = new RequestData();
		rData.put("bid", bid);
		return kDao.selectWithGiftbagByPrimary(rData);
	}

	@Override
	public int deleteByPrimaryKey(Integer kid) {
		return kDao.deleteByPrimaryKey(kid);
	}

	@Override
	public int deleteBatchByPrimaryKey(Integer[] kid) {
		return kDao.deleteBatchByPrimaryKey(kid);
	}

	@Override
	public int insert(GiftbagKeys keys) {
		return kDao.insertSelective(keys);
	}

	@Override
	public int update(GiftbagKeys keys) {
		return kDao.updateByPrimaryKeySelective(keys);
	}

	@Override
	public int insertBatch(List<GiftbagKeys> keyList) {
		return kDao.insertBatch(keyList);
	}

}
