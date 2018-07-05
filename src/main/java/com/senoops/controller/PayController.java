package com.senoops.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.senoops.model.Course;
import com.senoops.model.Order;
import com.senoops.model.User;
import com.senoops.service.CourseService;
import com.senoops.service.OrderService;
import com.senoops.utils.AlipayConfig;
import com.senoops.utils.TimeUtil;

@Controller
@RequestMapping("/pay")
public class PayController {
	final static Logger log = Logger.getLogger(PayController.class);

	@Autowired
	OrderService orderService;
	@Autowired
	CourseService courseService;

	@RequestMapping("/getConfirmInfoPage")
	public ModelAndView getConfirmInfoPage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("cid");
		Course course = courseService.selectByPrimaryKey(Integer.parseInt(id));
		mv.setViewName("confirmInfo");
		mv.addObject("WIDout_trade_no", TimeUtil.getOrderIdByTime());
		mv.addObject("WIDtotal_amount", course.getPrice());
		mv.addObject("WIDsubject", course.getCourseName());
		return mv;
	}

	/**
	 *
	 * @Title: AlipayController.java
	 * @Package com.sihai.controller
	 * @Description: 前往支付宝第三方网关进行支付 Copyright: Copyright (c) 2017
	 *               Company:FURUIBOKE.SCIENCE.AND.TECHNOLOGY
	 *
	 * @author sihai
	 * @date 2017年8月23日 下午8:50:43
	 * @version V1.0
	 */
	@RequestMapping(value = "/goAlipay", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String goAlipay(HttpServletRequest request, HttpServletRequest response) throws Exception {

		String orderNum = request.getParameter("orderNum");
		String orderName = request.getParameter("orderName");
		String orderPrice = request.getParameter("orderPrice");

		// 获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
				AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
				AlipayConfig.sign_type);

		// 设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

		// 商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = orderNum;
		// 付款金额，必填
		String total_amount = orderPrice;
		// 订单名称，必填
		String subject = orderName;

		// 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。
		// 该参数数值不接受小数点， 如 1.5h，可转换为 90m。
		String timeout_express = "1c";

		alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\"" + total_amount
				+ "\"," + "\"subject\":\"" + subject + "\"," + "\"timeout_express\":\"" + timeout_express + "\","
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

		// 请求
		String result = alipayClient.pageExecute(alipayRequest).getBody();

		return result;
	}

	/**
	 * 添加订单信息
	 * 
	 * @param request
	 * @param session
	 * @return ModelAndView
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/insertOrder")
	public ModelAndView insertOrder(HttpServletRequest request, HttpSession session) {
		Order order = new Order();
		int id = 0;
		String parameter = request.getParameter("cid");
		if (parameter != null || parameter.equals("")) {
			id = Integer.parseInt(parameter);
		} else {
			log.debug("没有可用的用户ID");
		}
		Course course = courseService.selectOrderById(id);
		order.setUser_id(((User) session.getAttribute("loginUser")).getId());
		order.setCourse_id(id);
		order.setOrder_code(TimeUtil.getOrderIdByTime());
		order.setOrder_name(course.getCourseName());
		order.setMoney(course.getPrice());
		order.setPay_method(1);
		int insert = orderService.insert(order);
		if (insert > 0) {
			log.info("订单信息添加成功");
		} else {
			log.info("订单生成失败！");
		}
		ModelAndView mv = new ModelAndView("insertOrder");
		mv.addObject("order", order);
		return mv;
	}

	@RequestMapping(value = "/returnUrl")
	public void returnUrl(HttpServletRequest request) {
		// 获取支付宝GET过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用
			try {
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				boolean signVerified;

				signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
						AlipayConfig.sign_type);

				// 调用SDK验证签名

				// ——请在这里编写您的程序（以下代码仅作参考）——
				if (signVerified) {
					// 商户订单号
					String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),
							"UTF-8");

					// 支付宝交易号
					String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

					// 付款金额
					String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),
							"UTF-8");

					System.out.println("trade_no:" + trade_no + "<br/>out_trade_no:" + out_trade_no
							+ "<br/>total_amount:" + total_amount);
				} else {
					System.out.println("验签失败");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (AlipayApiException e) {
				e.printStackTrace();
			}
			params.put(name, valueStr);
		}

	}

}
