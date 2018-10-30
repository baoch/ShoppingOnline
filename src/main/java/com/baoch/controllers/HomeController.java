package com.baoch.controllers;

import com.baoch.entity.Category;
import com.baoch.entity.Product;
import com.baoch.repository.CategoryRepository;
import com.baoch.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
@RequestMapping(value = "/home")
public class HomeController {
    private static final Logger LOGGER = Logger.getLogger(ProductController.class.getName());

    @Value("${resources.img}")
    private String RESOURCES_IMG;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(@RequestParam(value = "page", required = false) Integer page,
                              @RequestParam(value = "keyword", required = false) String keyword,
                              @RequestParam(value = "category", required = false) Integer categoryId) {
        LOGGER.log(Level.INFO, "info: index");
        List<Product> listProduct = new ArrayList<>();

        List<Category> listCategory = categoryRepository.findAll();


        Sort sort = new Sort(new Sort.Order(Sort.Direction.ASC, "name")); //Sorting ASC by name
        int count = 0;

        if (page == null  || page < 0) {
            page = 0;
        }
        if (keyword == null || keyword == "") {
            keyword = "";
            count = productRepository.findAll().size();
        } else {
            count = productRepository.countItemPaging(keyword);
        }
        Pageable pageable = new PageRequest(page, 9, sort);

        if (categoryId == null || categoryId < 0) {
            listProduct = productRepository.findAndPaging(keyword, pageable);
        } else {
            listProduct = productRepository.findByNameAndCategoryAndSorting(keyword, categoryId, pageable);
            count = productRepository.countByNameAndCategory(keyword, categoryId);
        }
        String viewName = "/home/index";
        ModelAndView model = new ModelAndView(viewName, "listProduct", listProduct);


//        int amountProduct = productRepository.findAll().size();
        int totalPage = calTotalPage(count);

        String strPage = "";
        if (totalPage == 0) {
            strPage = "No Result";
        } else {
            strPage = pageable.getPageNumber() + 1 + " / " + totalPage;
        }
        model.addObject(pageable);
        model.addObject("strPage", strPage);
        model.addObject("page", page);
        model.addObject("totalPage", totalPage);
        model.addObject("keyword", keyword);
        model.addObject("listCategory",listCategory);
        model.addObject("category", categoryId);


        return model;
    }

    private int calTotalPage(int count) {
        if( count >= 9 && count % 9 == 0) {
            return count / 9;
        } else if (count > 9 && count % 9 != 0) {
            return  (count / 9) + 1;
        } else if (count > 0){
            return  1;
        }
        return 0;
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView goToDetail(@RequestParam(value = "id", required = false) int id) {
        Product product = productRepository.findOne(id);
        ModelAndView model = new ModelAndView("/home/detail", "product", product);
        List<Category> listCategory = categoryRepository.findAll();

        model.addObject("listCategory",listCategory);
        return model;
    }

}
