package com.hinplay.core.dao;

import java.util.List;

import com.hinplay.common.RequestData;
import com.hinplay.core.entity.MasterManage;

public interface MasterManageDao {
	// 新增
	int insert(MasterManage record);

	// 新增，判断字段不为空新增
	int insertSelective(MasterManage record);

	// 根据主键删除
	int deleteByPrimaryKey(Integer id);

	// 根据主键批量删除
	int deleteBatchByPrimaryKey(Integer[] ids);

	// 更新，判断字段不为空修改
	int updateByPrimaryKeySelective(MasterManage record);

	// 查询
	List<MasterManage> selectByPrimary(RequestData qData);

	// 查询和查询blob字段
	List<MasterManage> selectWidthBlobByPrimary(RequestData qData);
}