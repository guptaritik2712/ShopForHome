package com.shopForHomeFirstMicroservice.response;

import java.util.List;

import com.shopForHomeFirstMicroservice.entity.ProductInfo;

public class ProductsResponse {
	
	private List<ProductInfo> productList;

	public List<ProductInfo> getProductList() {
		return productList;
	}

	public void setProductList(List<ProductInfo> productList) {
		this.productList = productList;
	}
	

}
