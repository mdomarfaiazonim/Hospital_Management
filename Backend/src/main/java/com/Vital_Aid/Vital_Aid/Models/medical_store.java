package com.Vital_Aid.Vital_Aid.Models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

@Entity
public class medical_store {

    @Id
    @Column(unique = true)
    private Long product_id;
    @NotNull
    @Min(value = 0, message = "Price must be a non negative integer")
    private int product_price;
    @NotNull
    @Min(value = 0, message = "Product quantity must be a non negative integer")
    private int product_quantity;
    @NotNull
    private String product_category;

    public medical_store() {
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