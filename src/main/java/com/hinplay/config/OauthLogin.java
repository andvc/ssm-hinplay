package com.hinplay.config;

import java.util.Map;

import com.belerweb.social.qq.connect.api.QQConnect;
import com.belerweb.social.weibo.api.Weibo;
import com.belerweb.social.weixin.api.Weixin;
import com.hinplay.common.CommonUtil;

public class OauthLogin {
	private static OauthLogin instance;

	private Map<String, String> MapperConfig;

	private Weibo weibo;
	private QQConnect connect;
	private Weixin weixin;

	private OauthLogin() {
		this.MapperConfig = CommonUtil.PropertiesParseToMap("Oauth-config.properties");
	}

	public static OauthLogin getInstance() {
		if (instance == null) {
			instance = new OauthLogin();
		}
		return instance;
	}

	public Weibo getWeibo() {
		this.weibo = new Weibo(MapperConfig.get("WeiboAppId"), MapperConfig.get("WeiboAppKey"),
				MapperConfig.get("WeiboCallBack"));
		return weibo;
	}

	public QQConnect getConnect() {
		connect = new QQConnect(MapperConfig.get("QQAppId"), MapperConfig.get("QQAppKey"),
				MapperConfig.get("QQCallBack"));
		return connect;
	}

	public Weixin getWeixin() {
		weixin = new Weixin(MapperConfig.get("WeixinAppId"), MapperConfig.get("WeixinAppKey"),
				MapperConfig.get("WeixinCallBack"), MapperConfig.get("WeixinToKen"));
		return weixin;
	}
}
