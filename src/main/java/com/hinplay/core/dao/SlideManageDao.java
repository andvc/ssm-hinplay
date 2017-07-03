package com.hinplay.core.dao;

import java.util.List;

import com.hinplay.common.RequestData;
import com.hinplay.core.entity.SlideManage;

public interface SlideManageDao {
	// 新增
	int insert(SlideManage record);

	// 新增，判断字段不为空新增
	int insertSelective(SlideManage record);

	// 根据主键删除
	int deleteByPrimaryKey(Integer id);

	// 根据主键批量删除
	int deleteBatchByPrimaryKey(Integer[] ids);

	// 更新，判断字段不为空修改
	int updateByPrimaryKeySelective(SlideManage record);

	// 查询
	List<SlideManage> selectByPrimary(RequestData qData);
}