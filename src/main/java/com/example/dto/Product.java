package com.example.dto;

public class Product {
	private String productId; // 상품 아이디
	private String productName; // 상품명
	private Integer unitPrice; // 상품 가격
	private String description; // 상품 설명
	private String manufacturer; // 제조사
	private String category; // 분류
	private Long unitInStock; // 재고수
	private String condition; // 신상품 or 중고품 or 재생품
	private String fileName; // 이미지 파일명

	public Product() {
		super();
	}
	
	public Product(String productId, String productName, Integer unitPrice) {
		this.productId = productId;
		this.productName = productName;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitInStock() {
		return unitInStock;
	}

	public void setUnitInStock(Long unitInStock) {
		this.unitInStock = unitInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", unitPrice=" + unitPrice
				+ ", description=" + description + ", manufacturer=" + manufacturer + ", category=" + category
				+ ", unitInStock=" + unitInStock + ", condition=" + condition + ", fileName=" + fileName + "]";
	}
}
