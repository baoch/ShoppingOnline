package com.baoch.controllers;

import com.baoch.entity.Role;
import com.baoch.entity.User;
import com.baoch.repository.RoleRepository;
import com.baoch.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
@RequestMapping(value = "user")
public class UserController {
    private static final Logger LOGGER = Logger.getLogger(UserController.class.getName());

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;



    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(@RequestParam(value = "page", required = false) Integer page,
                              @RequestParam(value = "keyword", required = false) String keyword) {
        LOGGER.log(Level.INFO, "info: index");
        if (page == null  || page < 0) {
            page = 0;
        }
        if (keyword == null) {
            keyword = "";
        }
        Sort sort = new Sort(new Sort.Order(Sort.Direction.ASC, "name")); //Sorting ASC by name
        Pageable pageable = new PageRequest(page, 10, sort);
        List<User> listUsers = userRepository.findAndPaging(keyword, pageable);
        ModelAndView model = new ModelAndView("/user/index", "listUsers", listUsers);
        int amountUser = userRepository.findAll().size();
        int totalPage;
        if(amountUser % 10 == 0) {
            totalPage = amountUser / 10;
        } else {
            totalPage = (amountUser / 10) + 1;
        }
        String strPage = pageable.getPageNumber() + 1 + " / " + totalPage;
        model.addObject(pageable);
        model.addObject("strPage", strPage);
        model.addObject("page", page);
        model.addObject("totalPage", totalPage);
        model.addObject("keyword", keyword);

        return model;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView getRegisterForm(){
        User user = new User();
        ModelAndView model = new ModelAndView("/user/register", "user", user);
        return model;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView createUser(
            @Valid @ModelAttribute("user") User user,
            BindingResult bindingResult
    ) {
        if (bindingResult.hasErrors()) {
            return new ModelAndView("/user/register");
        }
        User tmpUser = userRepository.save(user);
        Role role = new Role();
        role.setUser(tmpUser);
        role.setROLE("ROLE_USER");
        roleRepository.save(role);
        return new ModelAndView("/auth/login");
    }


    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView goToDetail(@RequestParam(value = "id", required = false) String id) {
        User user = userRepository.findOne(id);
        ModelAndView model = new ModelAndView("/user/detail", "user", user);
        return model;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView goToEdit(Principal principal) {
        if (principal == null) {
            return new ModelAndView("/403page");
        }
        String username = principal.getName();
        User user = userRepository.findOne(username);
        ModelAndView model = new ModelAndView("/user/edit", "user", user);
        List<Role> listRole = roleRepository.findAll();
        System.out.println(listRole);
        return model;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editUser(
            @Valid @ModelAttribute("user")User user,
            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "error";
        }
        userRepository.save(user);
        return "/home/index";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = false) String id) {
        userRepository.delete(id);
        return "redirect:index";
    }
}
