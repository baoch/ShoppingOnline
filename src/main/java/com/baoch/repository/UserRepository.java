package com.baoch.repository;

import com.baoch.entity.User;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends JpaRepository<User, String> {
    @Query(value = "select u from User u where LOWER(u.fullName) like concat('%',lower(:name),'%')")
    List<User> findAndPaging(@Param("name") String name, Pageable pageable);
}
