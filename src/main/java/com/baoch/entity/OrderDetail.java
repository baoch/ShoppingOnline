package com.baoch.entity;

import javax.persistence.*;
import javax.validation.constraints.DecimalMin;
import java.io.Serializable;

@Entity
@Table(name = "orderDetail")
public class OrderDetail implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @DecimalMin(value = "0")
    @Column(name = "amount")
    private int amount;

    @ManyToOne(cascade = CascadeType.REMOVE)
    private Order order;

    @ManyToOne(cascade = CascadeType.REMOVE)
    private Product product;

    public OrderDetail() {
    }

    public OrderDetail(int amount, Order order, Product product) {
        this.amount = amount;
        this.order = order;
        this.product = product;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
