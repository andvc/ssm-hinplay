package com.hinplay.core.ajaxResult;

public class AjaxResult {
	// 0为失败，1为成功
	private int code;
	// 消息
	private String msg;
	// 结果集
	private Object result;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getResult() {
		return result;
	}

	public void setResult(Object result) {
		this.result = result;
	}

	/**
	 * 自定义返回
	 * 
	 * @param code
	 * @param msg
	 * @param result
	 * @return
	 */
	public static AjaxResult getObject(int code, String msg, Object result) {
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setCode(code);
		if (msg != null) {
			ajaxResult.setMsg(msg);
		}
		if (result != null) {
			ajaxResult.setResult(result);
		}
		return ajaxResult;
	}

	/**
	 * 成功返回，带自定义消息和结果集
	 * 
	 * @param msg
	 * @param result
	 * @return
	 */
	public static AjaxResult getSuccess(String msg, Object result) {
		return getObject(1, msg, result);
	}

	/**
	 * 成功返回,带自定义结果集
	 * 
	 * @param result
	 * @return
	 */
	public static AjaxResult getSuccess(Object result) {
		return getSuccess("success!", result);
	}

	/**
	 * 成功返回，带自定义消息
	 * 
	 * @param msg
	 * @return
	 */
	public static AjaxResult getSuccess(String msg) {
		return getSuccess(msg, null);
	}

	/**
	 * 成功返回
	 * 
	 * @param result
	 * @return
	 */
	public static AjaxResult getSuccess() {
		return getSuccess("success!", null);
	}

	/**
	 * 错误返回，带自定义消息和结果集
	 * 
	 * @param msg
	 * @param result
	 * @return
	 */
	public static AjaxResult getError(String msg) {
		return getObject(0, msg, null);
	}

	/**
	 * 错误返回
	 * 
	 * @param result
	 * @return
	 */
	public static AjaxResult getError() {
		return getError("error!");
	}
}
