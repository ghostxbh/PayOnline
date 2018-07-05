# Onlineducation
#在线教育平台（ssm开发）
#
后端使用Spring+SpringMVC+Mybatis的三层框架搭建基于maven的项目，采用MySQL作为项目数据库，前端利用Bootstrap+jsp实现。项目主要实现了:
#######1. 用户登录登出及注销功能；
#######2.显示课程和课程的详细信息；
#######3.实现登录情况下，用户对所选课程的增删改查功能。
#######4.增加支付功能，不过还在完善之中，目前已经可以支付宝付款功能
#部署：
可通过git clone / 直接下载zip压缩包
####eclipse:
可以通过git=>URL clone=>复制https地址</br>
</br>
下载后import=>maven projects就可以</br>
</br>
修改resourses下面的jdbc数据库账号密码</br>
</br>
支付宝需配置支付宝的APPID、商户私匙、支付宝公匙等=>src/utils/AlipayConfig代码中修改</br>
####IDEA:
可以通过Check Out检出 / 下载后Import导入Maven项目
</br>
修改resourses下面的jdbc数据库账号密码</br>
</br>
支付宝需配置支付宝的APPID、商户私匙、支付宝公匙等=>src/utils/AlipayConfig代码中修改</br>
#
一些效果图：
主页：

课程页面：

#
感谢senoops提供框架
