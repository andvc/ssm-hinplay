package com.hinplay.core.dao;

import java.util.List;

import com.hinplay.common.RequestData;
import com.hinplay.core.entity.GameClass;

public interface GameClassDao {
	// 新增
	int insert(GameClass record);

	// 新增，判断字段不为空新增
	int insertSelective(GameClass record);

	// 根据主键删除
	int deleteByPrimaryKey(Integer id);

	// 根据主键批量删除
	int deleteBatchByPrimaryKey(Integer[] ids);

	// 更新，判断字段不为空修改
	int updateByPrimaryKeySelective(GameClass record);

	// 查询
	List<GameClass> selectByPrimary(RequestData qData);
}