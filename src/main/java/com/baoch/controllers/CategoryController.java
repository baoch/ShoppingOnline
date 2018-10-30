package com.baoch.controllers;

import com.baoch.entity.Category;
import com.baoch.entity.Product;
import com.baoch.repository.CategoryRepository;
import com.baoch.repository.ProductRepository;
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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
@RequestMapping(value = "category")
public class CategoryController {
    private static final Logger LOGGER = Logger.getLogger(CategoryController.class.getName());

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ProductRepository productRepository;

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
        List<Category> listCategory = categoryRepository.findAndPaging(keyword, pageable);
        ModelAndView model = new ModelAndView("/category/index", "listCategory", listCategory);
        int amountCategory = categoryRepository.findAll().size();
        int totalPage;
        if(amountCategory % 10 == 0) {
            totalPage = amountCategory / 10;
        } else {
            totalPage = (amountCategory / 10) + 1;
        }
        String strPage = pageable.getPageNumber() + 1 + " / " + totalPage;
        model.addObject(pageable);
        model.addObject("strPage", strPage);
        model.addObject("page", page);
        model.addObject("totalPage", totalPage);
        model.addObject("keyword", keyword);

        return model;
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView goToCreateCateGoryPage() {
        Category category = new Category();
        ModelAndView model = new ModelAndView("/category/create", "category", category);
        return model;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createCategory(
            @Valid @ModelAttribute("category")Category category,
            BindingResult bindingResult
    ) {
        if (bindingResult.hasErrors()) {
            return "/category/create";
        }
        categoryRepository.save(category);
        return "redirect:index";
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView goToDetail(@RequestParam(value = "id", required = false) int id) {
        Category category = categoryRepository.findOne(id);
        ModelAndView model = new ModelAndView("/category/detail", "category", category);
        return model;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView goToEdit(@RequestParam(value = "id", required = false) int id) {
        Category category = categoryRepository.findOne(id);
        ModelAndView model = new ModelAndView("/category/edit", "category", category);
        return model;
    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public String editCategory(
            @Valid @ModelAttribute("category")Category category,
            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "error";
        }
        categoryRepository.save(category);
        return "redirect:index";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public ModelAndView delete(@RequestParam(value = "id", required = false) int id) {
        List<Product> listProduct = productRepository.findByCategoryId(id);
        String errorMessage = "Please delete all products have relationship with this category before delete.";
        if (listProduct == null || listProduct.isEmpty()) {
            categoryRepository.delete(id);
            errorMessage = "";
        }
        ModelAndView model = index(0, "");
        model.addObject("errorMessage", errorMessage);
        return model;
    }
}
