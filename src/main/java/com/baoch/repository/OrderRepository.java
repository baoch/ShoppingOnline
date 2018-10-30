package com.baoch.repository;

import com.baoch.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {
    @Query(value = "select o from Order o where o.user.username=:id")
    List<Order> findByUser(@Param("id")String id);
}
