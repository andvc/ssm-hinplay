package com.hinplay.modules.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hinplay.core.entity.SlideManage;

@Service
public interface SlideManageService {
	List<SlideManage> select();

	SlideManage selectById(Integer sid);

	int deleteBatchByPrimaryKey(Integer[] sid);

	int deleteByPrimaryKey(Integer sid);

	int insert(SlideManage sManage);

	int updateByPrimaryKeySelective(SlideManage slide);
}
