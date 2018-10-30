package com.baoch.repository;

import com.baoch.entity.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
    @Query(value = "select c from Category c where LOWER(c.name) like concat('%',lower(:name),'%')")
    List<Category> findAndPaging(@Param("name") String name, Pageable pageable);

}
