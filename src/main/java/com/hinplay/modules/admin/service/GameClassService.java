package com.hinplay.modules.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hinplay.core.entity.GameClass;

@Service
public interface GameClassService {
	int insert(GameClass gClass);

	GameClass selectById(Integer id);

	List<GameClass> select();

	int deleteBatchByPrimaryKey(Integer[] ids);

	int deleteByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(GameClass gClass);
}
