package com.hinplay.modules.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hinplay.core.entity.PictureManage;

@Service
public interface PictureService {
	PictureManage selectById(Integer id);

	List<PictureManage> select();

	List<PictureManage> selectByShow();

	List<PictureManage> selectSetByKey(Integer[] ids);

	int insert(PictureManage pManage);

	int deleteBatchByPrimaryKey(Integer[] ids);

	int deleteByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(PictureManage pManage);

	List<PictureManage> selectByShowAndOrder(String order);

}
