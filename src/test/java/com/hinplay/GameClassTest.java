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
import com.hinplay.core.entity.GameClass;
import com.hinplay.modules.admin.service.GameClassService;

/**
 * 游戏分类测视类
 * 
 * @author admin
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-mybatis.xml")
public class GameClassTest {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private GameClassService classService;

	@Test
	public void testSelect() {
		List<GameClass> list = classService.select();
		logger.info(JSON.toJSONString(list));
	}

	@Test
	public void testSelectById() {
		GameClass list = classService.selectById(1);
		logger.info(JSON.toJSONString(list));
	}
}
