package com.xawl.study.dao;

import java.util.List;

import com.xawl.study.model.Carousel;

/**
 * 轮播数据的dao层接口
 * @author zb
 *
 */
public interface CarouselMapper {

	List<Carousel> findAll();

	int insertCarousel(Carousel carousel);

	int updateCarousel(Carousel carousel);

	Carousel SelectCarouselByCaid(Carousel carousel);

	int deleteCarouselBycaid(String[] checkedNums);

}
