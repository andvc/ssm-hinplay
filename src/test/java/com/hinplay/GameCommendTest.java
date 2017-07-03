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
import com.hinplay.core.entity.GameCommend;
import com.hinplay.core.entity.GamesManage;
import com.hinplay.modules.admin.service.CommendService;

/**
 * 游戏推荐管理测试类
 * 
 * @author admin
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-mybatis.xml")
public class GameCommendTest {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CommendService cService;

	// 查询
	@Test
	public void selectByPrimary() {
		List<GameCommend> list = cService.selectByPrimary();
		logger.info(JSON.toJSONString(list));
	}

	// 查询游戏表
	@Test
	public void selectOfGameByPrimary() {
		List<GamesManage> list = cService.selectOfGameByPrimary();
		logger.info(JSON.toJSONString(list));
	}

	// 查询和游戏表
	@Test
	public void selectWithGameByPrimary() {
		List<GameCommend> list = cService.selectWithGameByPrimary();
		logger.info(JSON.toJSONString(list));
	}

	// 批量更新
	@Test
	public void updateBatchByPrimaryKey() {
		Integer[] ids = { 5, 9 };
		int num = cService.updateBatchByPrimaryKeySelective("hot", ids, true);
		logger.info(":" + JSON.toJSONString(num));
	}
}
