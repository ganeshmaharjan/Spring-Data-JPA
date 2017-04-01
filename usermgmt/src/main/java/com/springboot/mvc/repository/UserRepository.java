package com.springboot.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.mvc.entity.User;

@Transactional
public interface UserRepository extends JpaRepository<User, Integer>{
	
}
