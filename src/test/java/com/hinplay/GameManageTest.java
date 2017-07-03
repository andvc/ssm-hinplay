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
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hinplay.core.entity.GamesManage;
import com.hinplay.modules.admin.service.GamesManageService;

/**
 * 游戏测视类
 * 
 * @author admin
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-mybatis.xml")
public class GameManageTest {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private GamesManageService gameService;

	@Test
	public void testSelect() {
		List<GamesManage> list = gameService.select();
		logger.info(JSON.toJSONString(list));
	}

	@Test
	public void testSelectById() {
		GamesManage list = gameService.selectById(1);
		logger.info(JSON.toJSONString(list));
	}

	@Test
	public void testSelectWithClass() {
		// 获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(0, 1);
		List<GamesManage> list = gameService.selectWithClassByPrimary();
		// 取记录总条数
		PageInfo<GamesManage> pageInfo = new PageInfo<>(list);
		logger.info("总记录数" + pageInfo.getTotal());
		logger.info(JSON.toJSONString(list));
	}
}
