package com.hinplay.core.dao;

import java.util.List;

import com.hinplay.common.RequestData;
import com.hinplay.core.entity.GameGiftbag;

public interface GameGiftbagDao {
	// 新增
	int insert(GameGiftbag record);

	// 新增，判断字段不为空新增
	int insertSelective(GameGiftbag record);

	// 根据主键删除
	int deleteByPrimaryKey(Integer id);

	// 根据主键批量删除
	int deleteBatchByPrimaryKey(Integer[] ids);

	// 更新，判断字段不为空修改
	int updateByPrimaryKeySelective(GameGiftbag record);

	// 查询
	List<GameGiftbag> selectByPrimary(RequestData qData);

	// 查询以及查询游戏表
	List<GameGiftbag> selectWithGameByPrimary(RequestData qData);
}