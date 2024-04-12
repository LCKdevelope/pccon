package com.pcConSystem.service;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcConSystem.dao.pcrOrderDao;
import com.pcConSystem.dao.pcrProductDao;
import com.pcConSystem.dto.pcrOrders;
import com.pcConSystem.dto.pcrProduct;



@Service
public class pcrProductrService {
	@Autowired
	pcrProductDao pdao;

	public String createprCode(String pcrCode) {
		String prCode =pdao.getprCode(pcrCode);
		String pr = (String) prCode.subSequence(0,2);
		String Code = (String) prCode.subSequence(2,5);
		System.out.println(pr);
		int code = Integer.parseInt(Code);
		code++;
		Code=String.format("%03d", code);
		System.out.println(Code);
		String newCode=pr+Code;
		System.err.println(newCode);
		
		return newCode;
	}

	public int registryProduct(pcrProduct pdto) {
		return pdao.registryProduct(pdto);

		
	}

	public ArrayList<pcrProduct>  getProductList_time(String pcrCode) {
		return pdao.getProductList_time(pcrCode);

		
	}

	public ArrayList<pcrProduct> getProductList(String pcrCode) {

		return pdao.getProductList(pcrCode);
	}

	public ArrayList<String> getcategoryList(String pcrCode) {

		return pdao.getcategoryList(pcrCode);
	}

	public ArrayList<pcrProduct> getCategoryList_type(String pcrCode, String prCategory) {

		return pdao.getCategoryList_type(pcrCode,prCategory);
	}

	public ArrayList<pcrProduct> getAllproductList(String pcrCode) {
		
		return pdao.getProductList(pcrCode);
	}

	public int deleteProduct(String pcrCode, String prCode) {
		return pdao.deleteProduct(pcrCode,prCode);
	}

			
	

}
