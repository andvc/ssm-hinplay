package com.hinplay.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hinplay.common.RequestData;
import com.hinplay.core.entity.GameCommend;
import com.hinplay.core.entity.GamesManage;

public interface GameCommendDao {
	// 新增
	int insert(GameCommend record);

	// 新增，判断字段不为空新增
	int insertSelective(GameCommend record);

	// 根据主键删除
	int deleteByPrimaryKey(Integer id);

	// 根据主键批量删除
	int deleteBatchByPrimaryKey(Integer[] ids);

	// 更新，判断字段不为空修改
	int updateByPrimaryKeySelective(GameCommend record);

	// 更新，根据主键批量更新实体类,判断字段不为空修改
	int updateBatchByPrimaryKeySelective(@Param("record") GameCommend record, @Param("ids") Integer[] ids);

	// 查询
	List<GameCommend> selectByPrimary(RequestData rData);

	// 查询游戏表
	List<GamesManage> selectOfGameByPrimary(RequestData rData);

	// 查询和游戏表
	List<GameCommend> selectWithGameByPrimary(RequestData rData);
}