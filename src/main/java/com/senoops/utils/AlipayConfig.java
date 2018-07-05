package com.senoops.utils;

public class AlipayConfig {
	//商户APPID
	public static String app_id = "";
	//商户私匙
	public static String merchant_private_key = "";
	//支付宝公匙
	public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqu00Yjdw5/5N7NtSay8TuS2X6pCehbgqKQJtBs5o1Bkttn0xU6iAzWR5QFq9t8hd1zaUKR304Rv0yISLVunchtSem8hktvwAZcenbzdfFhY7apMmcPBM+jpyNuO7zm9bdj5PSVxBe7z2qpXXNZVhrTTEUXQyT3Y1LGRKAtEL42vT80QORaE59quqbtcWi8vHr3mu0hl3CgK0YOhBEiNKyHipD9F9rLOgxycV9/BZlzheK8iKKl1DAUy0vwzLZmqazx7BlC/hJlXwfDUYF3XS9SFRKxqBvYPzl8L37PyRWQBdWtVveY8Vuv0tm7L3qXULCMFIqII4+FYMPutM9AFz2wIDAQAB";
	//应用地址
	public static String notify_url = "";
	//返回地址
	public static String return_url = "";
	//签名类型
	public static String sign_type = "RSA2";
	//编码
	public static String charset = "utf-8";
	//支付网关
	public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";
}
