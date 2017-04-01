package com.springboot.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.mvc.entity.User;
import com.springboot.mvc.repository.UserRepository;

@Service
@Transactional
public class Pagination {
	
	private static final int PAGE_SIZE = 8;
	
	@Autowired
	private UserRepository userRepository;
	
	public Page<User> getDeploymentLog(Integer pageNumber) {
        PageRequest pageRequest =
            new PageRequest(pageNumber - 1, PAGE_SIZE);
        return userRepository.findAll(pageRequest);
    }
}
