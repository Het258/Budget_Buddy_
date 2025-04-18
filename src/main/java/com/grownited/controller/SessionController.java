package com.grownited.controller;
import java.util.List;

import java.util.Optional;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.grownited.Service.MailService;
import com.grownited.entity.UserEntity;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;


@Controller
public class SessionController {
	// 1 method
	// 2 return jsp open
	// 3 Assign the Url
	
	@Autowired
    MailService serviceMail;
	
	@Autowired
	UserRepository repouser;
	
	@Autowired
	PasswordEncoder encoder;
	
	
	@GetMapping(value={"/", "signup"})//url
	public String signup() {
		return "Signup"; // jsp name
	}
	
	@GetMapping("login")
	public String login()
	{
		return "Login";
	}
	
	@PostMapping("saveuser")
	public String saveuser(UserEntity entityuser) {
		repouser.save(entityuser);
		System.out.println(entityuser.getFirstName());
		System.out.println(entityuser.getLastName());
		System.out.println(entityuser.getGender());
		System.out.println(entityuser.getContactNum());
		System.out.println(entityuser.getEmail());
		System.out.println(entityuser.getPassword());
		System.out.println(entityuser.getBornYear());
		
		
		
		
		serviceMail.sendWelcomeMail(entityuser.getEmail(),entityuser.getFirstName());
		
		
		// BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(5); //salt
				//--------> Not use this line  new keyword because it's gain more memeory
			  
			  

				String encPassword = encoder.encode(entityuser.getPassword());
				entityuser.setPassword(encPassword);
				
				entityuser.setRole("USER");
			
				repouser.save(entityuser);	
			//	serviceMail.sendWelcomeMail(userEntity.getEmail(), userEntity.getFirstName());
		
		
		return "Login";
	}
	
	   @GetMapping("DetailPage")
	   public String detailpage(Model model) {
		   
		   List<UserEntity> userlist= repouser.findAll();
		   model.addAttribute("userslist",userlist);
		   return "DetailPage";
		   
		   
	   }	
	// open on Forgetpassword jsp
	@GetMapping("forgotpassword")
	public String forgotpassword() {
		return "ForgotPassword";
	}
	
    // submit on forget password
	
	
	
	
	
	@PostMapping("Changepassword")
	public String changePassword() {
		return "Changepassword";
	}
	
	
	@GetMapping("NewMember")
	public String NewMember() {
		return "NewMember";
	}
	
	@GetMapping("Home")
	public String home() {
	    return "Home";
	}
	
	@GetMapping("AdminDashboard")
	public String admindashboard() {
	    return "AdminDashboard";
	}
	
	
	@PostMapping("authenticate")
	public String authenticate(String email, String password, Model model, HttpSession session) {
	    System.out.println(email);
	    System.out.println(password);

	    Optional<UserEntity> op = repouser.findByEmail(email);
	    if (op.isPresent()) {
	        UserEntity dbUser = op.get();
	        boolean ans = encoder.matches(password, dbUser.getPassword());

	        if (ans) {
	            session.setAttribute("user", dbUser); 
	            if (dbUser.getRole().equals("ADMIN")) {
	                return "redirect:/AdminDashboard";
	            } else if (dbUser.getRole().equals("USER")) {
	                return "redirect:/UserDashboard";
	            } else {
	                model.addAttribute("error", "Please contact Admin with Error Code #0991");
	                return "Login";
	            }
	        }
	    }
	    
	    // This line was outside the correct block, now properly placed.
	    model.addAttribute("error", "Invalid Credentials");
	    return "Login";
	}

		
				
	@PostMapping("sendotp")
	public String sendOtp(String email,Model model) {
		// email valid
	   System.out.println(email);
		Optional<UserEntity> op = repouser.findByEmail(email);
		System.out.println(op);
		if (op.isEmpty()) {
			// email invalid
			model.addAttribute("error", "Email not found");
			return "ForgotPassword";
		} else {
			// email valid
			// send mail otp
			// opt generate
			// send mail otp
			String otp = "";
			otp = (int) (Math.random() * 1000000) + "";// 0.25875621458541

			UserEntity user = op.get();
			user.setOtp(otp);
			repouser.save(user);// update otp for user
			serviceMail.sendOtpForForgetPassword(user.getEmail(), user.getFirstName(), otp);
			System.out.println("otp send");
			return "UpdatePassword";

		}
	}

	
	
	@PostMapping("updatepassword")
	public String updatePassword(String email, String password, String confirmPassword, 
	                           String otp, Model model) {
	    // Add password confirmation check
	    if (!password.equals(confirmPassword)) {
	        model.addAttribute("passwordError", "Passwords do not match");
	        return "UpdatePassword";
	    }

	    Optional<UserEntity> op = repouser.findByEmail(email);
	    if (op.isEmpty()) {
	        model.addAttribute("error", "Invalid Data");
	        return "UpdatePassword";
	    } else {
	        UserEntity user = op.get();
	        if (user.getOtp().equals(otp)) {
	            String encPwd = encoder.encode(password);
	            user.setPassword(encPwd);
	            user.setOtp("");
	            repouser.save(user);
	            model.addAttribute("msg", "Password updated successfully");
	            return "Login";
	        } else {
	            model.addAttribute("error", "Invalid OTP");
	            return "UpdatePassword";
	        }
	    }
	}
	

	
 
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";// login url
	}
	
	@GetMapping("UserDashboard")
	public String userdashboard() {
		return "UserDashboard";
	
	}
	
	@GetMapping("UpdatePassword")
	public String updatepassword() {
		return "UpdatePassword";
	}
	
	
	
	
}
	
				
	


