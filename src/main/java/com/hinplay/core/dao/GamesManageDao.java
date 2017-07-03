package com.hinplay.core.dao;

import java.util.List;

import com.hinplay.common.RequestData;
import com.hinplay.core.entity.GamesManage;

public interface GamesManageDao {
	// 新增
	int insert(GamesManage record);

	// 新增，判断字段不为空新增
	int insertSelective(GamesManage record);

	// 根据主键删除
	int deleteByPrimaryKey(Integer id);

	// 根据主键批量删除
	int deleteBatchByPrimaryKey(Integer[] ids);

	// 更新，判断字段不为空修改
	int updateByPrimaryKeySelective(GamesManage record);

	// 查询
	List<GamesManage> selectByPrimary(RequestData qData);

	// 查询以及查询分类表
	List<GamesManage> selectWithClassByPrimary(RequestData qData);
}