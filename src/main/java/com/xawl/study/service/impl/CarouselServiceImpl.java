package com.xawl.study.service.impl;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.CarouselMapper;
import com.xawl.study.model.Carousel;
import com.xawl.study.service.CarouselService;

/**
 * 轮播数据的业务逻辑层
 * @author zb
 *
 */
@Service
public class CarouselServiceImpl implements CarouselService{

	@Autowired
	private CarouselMapper carouselMapper;
	
	/**
	 * 查出所有的轮播数据
	 */
	public List<Carousel> findAll() {
		
		return carouselMapper.findAll();
	}
	
	/**
	 * 添加轮播数据
	 */
	public int insertCarousel(Carousel carousel) {
		
		return carouselMapper.insertCarousel(carousel);
	}
	
	/**
	 * 修改轮播数据
	 */
	public int updateCarousel(Carousel carousel) {
		
		return carouselMapper.updateCarousel(carousel);
	}
	
	/**
	 * 按照id查找轮播数据
	 */
	public Carousel SelectCarouselByCaid(Carousel carousel) {
		
		return carouselMapper.SelectCarouselByCaid(carousel);
	}
	
	/**
	 * 删除轮播数据
	 */
	public int deleteCarouselBycaid(String ids, HttpServletRequest request) {
		String [] checkedNums = ids.split(",");
		Carousel carousel = new Carousel();
		String path1 = request.getSession().getServletContext().getRealPath("/");
		
		for (int i = 0; i < checkedNums.length; i++) {
			carousel.setCaid(Integer.parseInt(checkedNums[i]));
			carousel = carouselMapper.SelectCarouselByCaid(carousel);
			if(carousel == null){
				return 0;
			}
			File image= new File(path1+carousel.getValue());
        	//System.out.println(image);
        	if(image.exists()){
        		image.delete();
        	}
		}
		
		return carouselMapper.deleteCarouselBycaid(checkedNums);
	}

}
