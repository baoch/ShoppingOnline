package com.baoch.entity;

import javax.persistence.*;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "products")
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @NotNull
    @Size(min = 5, max = 50)
    @Column(name = "name")
    private String name;

    @NotNull
    @Size(min = 5, max = 50)
    @Column(name = "description")
    private String description;

    @DecimalMin(value = "0")
    @Column(name = "price")
    private Double price;

    @DecimalMin(value = "0")
    @Column(name = "amount")
    private int amount;

    @Column(name = "thumbnail")
    private String thumbnailUrl;

    @ManyToOne(cascade = CascadeType.REMOVE)
    private Category category;

    public Product() {
    }

    public Product(String name, String description, Double price, int amount, String thumbnailUrl, Category category) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.amount = amount;
        this.thumbnailUrl = thumbnailUrl;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
