package com.pcConSystem.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.pcConSystem.dto.pcrProduct;
import com.pcConSystem.service.pcrProductrService;

@Controller
public class productController {


	@Autowired
	pcrProductrService pdsvc;


	@RequestMapping(value = "/getCategoryList_type")
	public @ResponseBody String getCategoryList_type(String pcrCode, String prCategory) {
		System.err.println("getCategoryList_type");
		ArrayList<pcrProduct> list = new ArrayList<pcrProduct>();
		list = pdsvc.getCategoryList_type(pcrCode, prCategory);
		System.out.println(list.toString());
		return new Gson().toJson(list);

	}

	@RequestMapping(value = "/productPage")
	public ModelAndView productPage(String pcrCode) {
		System.err.println("productPage()");
		ModelAndView mav = new ModelAndView();
		ArrayList<pcrProduct>prlist = pdsvc.getProductList(pcrCode);
		mav.addObject("prlist", prlist );
		mav.addObject("pcrCode", pcrCode);
		mav.addObject("close", "close");
		mav.setViewName("productPage");
		return mav;
	}

	@RequestMapping(value = "/registryProduct")
	public ModelAndView registryProduct(pcrProduct pdto) {
		System.err.println("registryProduct");
		
		ModelAndView mav = new ModelAndView();
		// prcode생성
		String newprCode = pdsvc.createprCode(pdto.getPcrCode());
		pdto.setPrCode(newprCode);
		pdto.setPrState("1");
		System.out.println(pdto.toString());
		if (pdsvc.registryProduct(pdto) > 0) {

			mav.setViewName("productPage");
		}

		return mav;

	}
	@RequestMapping(value = "/deleteProduct")
	public @ResponseBody String deleteProduct(String pcrCode,String prCode) {
		System.err.println("deleteProduct");
		return pdsvc.deleteProduct(pcrCode,prCode)+"";
	}

}
