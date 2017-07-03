package com.hinplay.modules.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hinplay.core.entity.GameGiftbag;

@Service
public interface GiftbagService {
	List<GameGiftbag> select();

	GameGiftbag selectById(Integer id);

	List<GameGiftbag> selectWithGame();

	GameGiftbag selectWithGameById(Integer id);

	List<GameGiftbag> selectBySearch(Integer gid);

	int deleteByPrimaryKey(Integer bid);

	int deleteBatchByPrimaryKey(Integer[] bid);

	int insert(GameGiftbag gbag);

	int update(GameGiftbag gBag);
}
