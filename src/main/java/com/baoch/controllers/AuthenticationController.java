package com.baoch.controllers;

import com.baoch.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/auth")
public class AuthenticationController {

    @RequestMapping("/login")
    public ModelAndView getLoginForm(@RequestParam(required = false) String authFailed, String logout, String denied) {
        String message = "";
        if (authFailed != null) {
            message = "Invalid username or password, try again.";
        } else if (logout != null) {
            message = "Logged out successfully, login again to continue.";
        } else if (denied != null) {
            message = "Access denied for this user !";
        }
        ModelAndView model = new ModelAndView("/auth/login", "message", message);
        return model;
    }

    @RequestMapping("/403page")
    public String get403denied() {
        return "redirect:/auth/login?denied";
    }

}
