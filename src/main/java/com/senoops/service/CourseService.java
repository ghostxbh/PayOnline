package com.senoops.service;

import java.util.List;

import com.senoops.model.Course;


public interface CourseService {
	 int deleteByPrimaryKey(Integer courseid);

	    int insert(Course record);

	    int insertSelective(Course record);

	    Course selectByPrimaryKey(Integer courseid);

	    int updateByPrimaryKeySelective(Course record);

	    int updateByPrimaryKey(Course record);
	    
	    List<Course> selectAll();
	    /**
	     * 根据id查询订单需要的信息
	     * @return
	     */
	    Course selectOrderById(int id);
}
