package com.baoch.repository;

import com.baoch.entity.Product;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query(value = "select p from Product p where LOWER(p.name) like concat('%',lower(:name),'%')")
    List<Product> findAndPaging(@Param("name") String name, Pageable pageable);

    @Query(value = "select count(p) from Product p where LOWER(p.name) like concat('%',lower(:name),'%')")
    int countItemPaging(@Param("name") String name);

    @Query(value = "Select p from Product p where LOWER(p.name) like concat('%', lower(:name), '%') and p.category.id=:categoryId")
    List<Product> findByNameAndCategoryAndSorting(@Param("name") String name, @Param("categoryId") int categoryId, Pageable pageable);

    @Query(value = "Select count(p) from Product p where LOWER(p.name) like concat('%', lower(:name), '%') and p.category.id=:categoryId")
    int countByNameAndCategory(@Param("name") String name, @Param("categoryId") int categoryId);

    @Query(value = "select p from Product p where p.category.id=:id")
    List<Product> findByCategoryId(@Param("id")int id);
}
