package com.springboot.mvc.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.springboot.mvc.entity.User;
import com.springboot.mvc.repository.UserRepository;

@Controller
public class UserRestController {
	
	@Autowired
	private UserRepository userRepository;
	
	@GetMapping("/userapi")
	public @ResponseBody List<User> getAll(){
		return userRepository.findAll();
	}

}
