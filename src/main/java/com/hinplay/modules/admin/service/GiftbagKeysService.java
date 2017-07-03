package com.hinplay.modules.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hinplay.core.entity.GiftbagKeys;

@Service
public interface GiftbagKeysService {
	GiftbagKeys selectById(Integer id);

	List<GiftbagKeys> select();

	List<GiftbagKeys> selectBySearch(Integer bid);

	int deleteByPrimaryKey(Integer kid);

	int deleteBatchByPrimaryKey(Integer[] kid);

	int insert(GiftbagKeys keys);

	int update(GiftbagKeys keys);

	int insertBatch(List<GiftbagKeys> keyList);
}
