package com.springboot.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.springboot.mvc.entity.Search;
import com.springboot.mvc.entity.User;
import com.springboot.mvc.repository.UserRepository;
import com.springboot.mvc.search.UserSearch;
import com.springboot.mvc.service.Pagination;

@Controller
public class UserController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserSearch userSearch;

	@Autowired
	private Pagination pagination;

	private static int userPageNo;

	public Model getError(Model model, String error) {
		return model.addAttribute("error", error);
	}

	@GetMapping("/user")
	public String display(Model model) {
		try {
			Page<User> page = pagination.getDeploymentLog(1);
			int current = page.getNumber() + 1;
			int begin = Math.max(1, current - 5);
			int end = Math.min(begin + 10, page.getTotalPages());
			model.addAttribute("deploymentLog", page);
			model.addAttribute("userinfo", page.getContent());
			model.addAttribute("beginIndex", begin);
			model.addAttribute("endIndex", end);
			model.addAttribute("currentIndex", current);
			model.addAttribute("usersearch", new Search());
			return "user/userview";
		} catch (Exception e) {
			getError(model, e.getMessage());
			return "error";
		}
	}

	@GetMapping("/user/{pageNumber}")
	public String paginateUser(@PathVariable int pageNumber, Model model) {
		try {
			userPageNo = pageNumber;
			Page<User> page = pagination.getDeploymentLog(userPageNo);
			int current = page.getNumber() + 1;
			int begin = Math.max(1, current - 5);
			int end = Math.min(begin + 10, page.getTotalPages());
			model.addAttribute("deploymentLog", page);
			model.addAttribute("userinfo", page.getContent());
			model.addAttribute("beginIndex", begin);
			model.addAttribute("endIndex", end);
			model.addAttribute("currentIndex", current);
			model.addAttribute("usersearch", new Search());
			return "user/userview";
		} catch (Exception e) {
			getError(model, e.getMessage());
			return "error";
		}
	}

	@GetMapping("/userform")
	public String displayUserInsertForm(Model model) {
		try {
			model.addAttribute("user", new User());
			return "user/userinsert";
		} catch (Exception e) {
			getError(model, e.getMessage());
			return "error";
		}

	}

	@PostMapping("/insert")
	public String insertUser(Model model, @ModelAttribute("user") User user) {
		try {
			userRepository.save(user);
			return "redirect:/user/" + userPageNo;
		} catch (Exception e) {
			getError(model, e.getMessage());
			return "error";
		}
	}

	@GetMapping("/edit/{userId}")
	public String editUSer(Model model, @PathVariable("userId") int userId) {
		model.addAttribute("userEdit", userRepository.getOne(userId));
		return "user/useredit";
	}

	@PostMapping("/update")
	public String updateUser(Model model, @ModelAttribute("userEdit") User userEdit) {
		if (userEdit != null) {
			userRepository.save(userEdit);
			return "redirect:/user/" + userPageNo;
		} else {
			return "user/useredit";
		}
	}

	@GetMapping("/delete/{userId}")
	public String deleteUser(Model model, @PathVariable("userId") int userdeleteId) {
		userRepository.delete(userdeleteId);
		return "redirect:/user/" + userPageNo;
	}

	@GetMapping("/search")
	public String searchUser(Model model, @ModelAttribute("usersearch") Search searchName) {
		model.addAttribute("usersearch", new Search());
		if (searchName.getSearchText().isEmpty()) {
			model.addAttribute("userinfo", userRepository.findAll());
			return "user/userview";
		} else {
			model.addAttribute("userSearch", userSearch.search(searchName.getSearchText()));
			return "user/usersearch";
		}
	}

}
