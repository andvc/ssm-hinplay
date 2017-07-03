package com.hinplay;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.hinplay.core.entity.GiftbagKeys;
import com.hinplay.modules.admin.service.GiftbagKeysService;

/**
 * 兑换码测试类
 * 
 * @author admin
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-mybatis.xml")
public class GiftbagKeysTest {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private GiftbagKeysService kService;

	@Test
	public void select() {
		List<GiftbagKeys> list = kService.select();
		logger.info(JSON.toJSONString(list));
	}

	@Test
	public void selectById() {
		GiftbagKeys list = kService.selectById(1);
		logger.info(JSON.toJSONString(list));
	}
}
