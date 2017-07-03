package com.hinplay.modules.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hinplay.core.entity.MasterManage;

@Service
public interface MasterManageService {
	List<MasterManage> select();

	int deleteBatchByPrimaryKey(Integer[] wid);

	int deleteByPrimaryKey(Integer cid);

	int insert(MasterManage mManage);

	List<MasterManage> selectWithBlobs();

	MasterManage selectWithBlobsByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(MasterManage master);

}
