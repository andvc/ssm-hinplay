package com.hinplay.modules.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hinplay.core.entity.GamesManage;

@Service
public interface GamesManageService {
	GamesManage selectById(Integer id);

	List<GamesManage> select();

	List<GamesManage> selectBySearch(String name);

	List<GamesManage> selectWithClassByPrimary();

	GamesManage selectWithClassById(Integer id);

	int deleteByPrimaryKey(Integer id);

	int deleteBatchByPrimaryKey(Integer[] ids);

	int insert(GamesManage gManage);

	int update(GamesManage gManage);
}
