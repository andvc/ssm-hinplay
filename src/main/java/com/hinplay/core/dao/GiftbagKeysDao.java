package com.hinplay.core.dao;

import java.util.List;

import com.hinplay.common.RequestData;
import com.hinplay.core.entity.GiftbagKeys;

public interface GiftbagKeysDao {
	// 新增
	int insert(GiftbagKeys record);

	// 新增，判断字段不为空新增
	int insertSelective(GiftbagKeys record);

	// 批量新增
	int insertBatch(List<GiftbagKeys> list);

	// 根据主键删除
	int deleteByPrimaryKey(Integer id);

	// 根据主键批量删除
	int deleteBatchByPrimaryKey(Integer[] ids);

	// 更新，判断字段不为空修改
	int updateByPrimaryKeySelective(GiftbagKeys record);

	// 查询
	List<GiftbagKeys> selectByPrimary(RequestData qData);

	// 查询以及查询礼包表
	List<GiftbagKeys> selectWithGiftbagByPrimary(RequestData qData);
}