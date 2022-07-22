package com.reportMicroService.response;

import java.util.List;

import com.reportMicroService.entity.ProductInfo;

public class ProductInfoResponse {
	private List<ProductInfo> productList;

	public List<ProductInfo> getProductList() {
		return productList;
	}
	public void setProductList(List<ProductInfo> productList) {
		this.productList = productList;
	}
}
