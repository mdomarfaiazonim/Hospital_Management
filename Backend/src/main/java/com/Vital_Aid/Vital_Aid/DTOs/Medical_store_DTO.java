package com.Vital_Aid.Vital_Aid.DTOs;

import jakarta.persistence.Column;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

public class Medical_store_DTO {

    @Id
    @Column(unique = true)
    private Long product_id;
    @NotNull
    @Positive
    private int product_price;
    @NotNull
    @Positive
    private int product_quantity;
    @NotNull
    private String product_category;

    public Medical_store_DTO() {
    }

    public Long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Long product_id) {
        this.product_id = product_id;
    }

    public int getProduct_price() {
        return product_price;
    }

    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }

    public int getProduct_quantity() {
        return product_quantity;
    }

    public void setProduct_quantity(int product_quantity) {
        this.product_quantity = product_quantity;
    }

    public String getProduct_category() {
        return product_category;
    }

    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }
}
/*
 * 
 * private String product_id;
 * private int product_price;
 * private int product_quantity;
 * private String product_category;
 */