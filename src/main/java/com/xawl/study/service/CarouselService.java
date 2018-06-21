package com.xawl.study.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.xawl.study.model.Carousel;

/**
 * 轮播数据的service层接口
 * @author zb
 *
 */
public interface CarouselService {

	public List<Carousel> findAll();

	public int insertCarousel(Carousel carousel);

	public int updateCarousel(Carousel carousel);

	public Carousel SelectCarouselByCaid(Carousel carousel);

	public int deleteCarouselBycaid(String ids, HttpServletRequest request); 
	
}
