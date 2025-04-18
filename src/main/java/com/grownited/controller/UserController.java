package com.grownited.controller;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.RoleEntity;
import com.grownited.entity.RoleEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.RoleRepository;
import com.grownited.repository.UserRepository;

@Controller
public class UserController {
	
	
	@Autowired
	UserRepository userRepo;
	@Autowired
	RoleRepository roleRepo;
	
	@GetMapping("/newuser")
	public String newUser(Model model) {
		List<RoleEntity> roleList = roleRepo.findAll();
		model.addAttribute("roleList", roleList);
		return "NewUser";
	}
	
	
	@GetMapping("/listuser")
	public String listUser(Model model) {
		List<UserEntity> userList = userRepo.findAll();
		model.addAttribute("userList", userList);
		return "ListUser";
	}
	
	@GetMapping("/deleteUser")
	public String deleteUser(@RequestParam Integer userId) {
	    userRepo.deleteById(userId);
	    return "redirect:/listuser";
	}
	
	@GetMapping("/viewUser")
	public String viewUser(@RequestParam("userId") Integer userId, Model model) {
	    Optional<UserEntity> user = userRepo.findById(userId);

	    if (user.isPresent()) {
	        model.addAttribute("user", user.get());
	        return "viewUser";
	    } else {
	        return "redirect:/listuser";
	    }
	} 
	
	@GetMapping("/editUser")
	public String editUser(@RequestParam("userId") Integer userId, Model model) {
	    Optional<UserEntity> user = userRepo.findById(userId);

	    if (user.isPresent()) {
	        model.addAttribute("user", user.get());
	        return "editUser";
	    } else {
	        return "redirect:/listuser";
	    }
	}  
	
	@PostMapping("/updateUser")
	public String updateUser(@ModelAttribute UserEntity user, BindingResult result) {
	    if (user.getUserId() == null) {
	        return "redirect:/listuser";
	    }
	    
	    Optional<UserEntity> existingUser = userRepo.findById(user.getUserId());
	    
	    if(existingUser.isPresent()) {
	        UserEntity dbUser = existingUser.get();
	        dbUser.setFirstName(user.getFirstName());
	        dbUser.setLastName(user.getLastName());
	        dbUser.setGender(user.getGender());
	        dbUser.setContactNum(user.getContactNum());
	        dbUser.setEmail(user.getEmail());
	        dbUser.setBornYear(user.getBornYear());
	        userRepo.save(dbUser);
	    }
	    
	    return "redirect:/listuser";
	}
	
}
	

	
	



