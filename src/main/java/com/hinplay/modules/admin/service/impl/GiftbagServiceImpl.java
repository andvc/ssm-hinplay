package com.hinplay.modules.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hinplay.common.RequestData;
import com.hinplay.core.dao.GameGiftbagDao;
import com.hinplay.core.entity.GameGiftbag;
import com.hinplay.modules.admin.service.GiftbagService;

@Service
public class GiftbagServiceImpl implements GiftbagService {
	@Autowired
	private GameGiftbagDao bDao;

	@Override
	public List<GameGiftbag> select() {
		return bDao.selectByPrimary(new RequestData());
	}

	@Override
	public GameGiftbag selectById(Integer id) {
		RequestData rData = new RequestData();
		rData.put("bid", id);
		return bDao.selectByPrimary(rData).get(0);
	}

	@Override
	public List<GameGiftbag> selectWithGame() {
		return bDao.selectWithGameByPrimary(new RequestData());
	}

	@Override
	public GameGiftbag selectWithGameById(Integer id) {
		RequestData rData = new RequestData();
		rData.put("bid", id);
		return bDao.selectWithGameByPrimary(rData).get(0);
	}

	@Override
	public List<GameGiftbag> selectBySearch(Integer gid) {
		RequestData rData = new RequestData();
		rData.put("gid", gid);
		return bDao.selectWithGameByPrimary(rData);
	}

	@Override
	public int deleteByPrimaryKey(Integer bid) {
		return bDao.deleteByPrimaryKey(bid);
	}

	@Override
	public int deleteBatchByPrimaryKey(Integer[] bid) {
		return bDao.deleteBatchByPrimaryKey(bid);
	}

	@Override
	public int insert(GameGiftbag gbag) {
		return bDao.insertSelective(gbag);
	}

	@Override
	public int update(GameGiftbag gBag) {
		return bDao.updateByPrimaryKeySelective(gBag);
	}
}
