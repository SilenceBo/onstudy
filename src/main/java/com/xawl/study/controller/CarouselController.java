package com.xawl.study.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xawl.study.interceptor.Role;
import com.xawl.study.model.Carousel;
import com.xawl.study.model.Course;
import com.xawl.study.service.CarouselService;
import com.xawl.study.service.CourseService;
import com.xawl.study.utils.UploadImages;

/**
 * 轮播数据的controller层
 * @author zb
 *
 */
@Controller
@RequestMapping("/carousel")
public class CarouselController {
	
	@Autowired
	private CarouselService carouselService;
	@Autowired
	private CourseService courseService;
	
	/**
	 * 查找出所有的轮播数据
	 * @param request
	 * @param response
	 * @return 返回到前端页面
	 */
	@RequestMapping("/findAllFront.action")
	public ModelAndView findAllFront(HttpServletRequest request,
			HttpServletResponse response) {
		
		List<Carousel> caList = carouselService.findAll();
		request.setAttribute("caList", caList);
		List<Course> cList = courseService.findByLinkNum();
		request.setAttribute("cList", cList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/front/indexContent.jsp");
		return mv;
	}
	
	/**
	 * 查找出所有的轮播数据
	 * @param request
	 * @param response
	 * @return 返回到后端页面
	 */
	@RequestMapping("/findAll.action")
	public ModelAndView findAll(HttpServletRequest request,
			HttpServletResponse response) {
		
		List<Carousel> caList = carouselService.findAll();
		request.setAttribute("caList", caList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/table_bootstrap_carousel.jsp");
		return mv;
	}
	
	/**
	 * 添加轮播数据
	 * @param request
	 * @param response
	 * @param carousel
	 * @param file
	 * @return
	 */
	@RequestMapping("/addCarousel.action")
	@Role(role=Role.ROLE_ADMIN)
	public ModelAndView addCarousel(HttpServletRequest request,
			HttpServletResponse response, Carousel carousel, MultipartFile file) {
		ModelAndView mv = new ModelAndView();
		String msg;
		if(carousel.getName() == null || carousel.getName().isEmpty()){
			msg="添加失败,名称不能为空";
            request.setAttribute("msg", msg);
            mv.setViewName("redirect:/carousel/findAll.action");
    		return mv;
		}
		//图片上传
        UploadImages uploadImage = new UploadImages();  
        String path1 = request.getSession().getServletContext().getRealPath("/");  //上传的路径
        //System.out.println("HHFHGGG"+path1);
        String path2 = "CarouselImages";  //保存的文件夹  
        String bigImg = uploadImage.upLoadImage(request, file, path1, path2);  
        if(!bigImg.contains(".")){
        	msg="未选择文件";
            request.setAttribute("msg", msg);		
        }
        carousel.setValue(bigImg); 
        try {  
        	int rows = carouselService.insertCarousel(carousel);  
        	if(rows == 0){
        		msg="添加失败,插入数据库失败";
                request.setAttribute("msg", msg); 
        	}else{
        		msg="添加成功";
                request.setAttribute("msg", msg);   
        	}    	
        } catch (Exception e) {  
            e.printStackTrace();
            msg="添加失败,服务器异常";
            request.setAttribute("msg", msg);    
        }
		mv.setViewName("redirect:/carousel/findAll.action");
		return mv;
	}
	
	/**
	 * 修改轮播数据
	 * @param request
	 * @param response
	 * @param carousel
	 * @param file
	 * @return
	 */
	@RequestMapping("/updateCarousel.action")
	@Role(role=Role.ROLE_ADMIN)
	public ModelAndView updateCourse(HttpServletRequest request,
			HttpServletResponse response, Carousel carousel,
			MultipartFile file) {
		
		ModelAndView mv = new ModelAndView();
		String msg;
		if(carousel.getName() == null || carousel.getName().equals("")){
			msg="修改失败,数据名不能为空";
            request.setAttribute("msg", msg);
            mv.setViewName("redirect:/carousel/findAll.action");
    		return mv;
		}
		
		//图片上传
        UploadImages uploadImage = new UploadImages();  
        String path1 = request.getSession().getServletContext().getRealPath("/");  //上传的路径  
        String path2 = "CarouselImages";  //保存的文件夹  
        String bigImg = uploadImage.upLoadImage(request, file, path1, path2);  
        if(!bigImg.contains(".")){
        	carousel.setValue(null);	
        }else{
        	Carousel carousel2 = new Carousel();
        	carousel2 = carouselService.SelectCarouselByCaid(carousel);
        	
        	File image= new File(path1+carousel2.getValue());
        	//System.out.println(image);
        	if(image.exists()){
        		image.delete();
        	}
        	carousel.setValue(bigImg);
        }
        try {  
        	int rows = carouselService.updateCarousel(carousel);  
        	if(rows == 0){
        		msg="修改失败,注入数据库失败";
                request.setAttribute("msg", msg); 
        	}else{
        		msg="修改成功";
                request.setAttribute("msg", msg);   
        	}    	
        } catch (Exception e) {  
            e.printStackTrace();
            msg="修改失败,服务器异常";
            request.setAttribute("msg", msg);    
        }
        mv.setViewName("redirect:/carousel/findAll.action");
		return mv;			
	}
	
	/**
	 * 按照id查找轮播数据
	 * @param request
	 * @param response
	 * @param carousel
	 * @return
	 */
	@RequestMapping("/SelectCarouselJsonByCaid.action")//rteyjh
	@ResponseBody
	public Carousel SelectCarouselJsonByCaid(HttpServletRequest request,
			HttpServletResponse response, Carousel carousel) {
		return carouselService.SelectCarouselByCaid(carousel);
	}
	
	/**
	 * 按照id删除轮播数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteCarousel.action")
	@Role(role=Role.ROLE_ADMIN)
	public ModelAndView deleteCarouselBycaid(HttpServletRequest request,
			HttpServletResponse response) {
		String ids=request.getParameter("ids");
		//System.out.println(ids.length()+"________________"+ids);
		ModelAndView mv = new ModelAndView();
		String msg;
		
		if(ids.length()!=0){
			int rows = carouselService.deleteCarouselBycaid(ids,request);
			if(rows == 0){
        		msg="删除失败,此id不存在";
                request.setAttribute("msg", msg); 
        	}else{
        		msg="删除成功";
                request.setAttribute("msg", msg);   
        	}   
	    }       
        mv.setViewName("redirect:/carousel/findAll.action");
		return mv;
	}
}
