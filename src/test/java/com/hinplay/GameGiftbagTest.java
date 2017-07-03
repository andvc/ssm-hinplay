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
import com.hinplay.core.entity.GameGiftbag;
import com.hinplay.modules.admin.service.GiftbagService;

/**
 * 游戏礼包测试类
 * 
 * @author admin
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-mybatis.xml")
public class GameGiftbagTest {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private GiftbagService bService;

	@Test
	public void select() {
		List<GameGiftbag> list = bService.select();
		logger.info(JSON.toJSONString(list));
	}

	@Test
	public void selectById() {
		GameGiftbag list = bService.selectById(1);
		logger.info(JSON.toJSONString(list));
	}

	@Test
	public void selectWithGame() {
		List<GameGiftbag> list = bService.selectWithGame();
		logger.info(JSON.toJSONString(list));
	}

	@Test
	public void selectWithGameById() {
		GameGiftbag list = bService.selectWithGameById(1);
		logger.info(JSON.toJSONString(list));
	}
}
