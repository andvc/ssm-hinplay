package com.hinplay.modules.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hinplay.core.entity.GameCommend;
import com.hinplay.core.entity.GamesManage;

@Service
public interface CommendService {
	List<GameCommend> selectByPrimary();

	GameCommend selectByKey(Integer id);

	List<GamesManage> selectOfGameByPrimary();

	GamesManage selectOfGameByKey(Integer id);

	List<GameCommend> selectWithGameByPrimary();

	GameCommend selectWithGameByKey(Integer id);

	List<GamesManage> selectByType(String type);

	int updateByPrimaryKeySelective(String type, Integer id, boolean b);

	int updateBatchByPrimaryKeySelective(String type, Integer[] ids, boolean b);
}
