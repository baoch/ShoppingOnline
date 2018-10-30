package com.baoch.controllers;

import com.baoch.entity.Category;
import com.baoch.entity.FileModel;
import com.baoch.entity.Product;
import com.baoch.repository.CategoryRepository;
import com.baoch.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
    private static final Logger LOGGER = Logger.getLogger(ProductController.class.getName());
    @Value("${resources.img}")
    private String RESOURCES_IMG;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    ServletContext context;

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
        Pageable pageable = new PageRequest(page, 3, sort);

        if (categoryId == null || categoryId < 0) {
            listProduct = productRepository.findAndPaging(keyword, pageable);
        } else {
            listProduct = productRepository.findByNameAndCategoryAndSorting(keyword, categoryId, pageable);
            count = productRepository.countByNameAndCategory(keyword, categoryId);
        }
        ModelAndView model = new ModelAndView("/product/index", "listProduct", listProduct);


//        int amountProduct = productRepository.findAll().size();
        int totalPage = 0;
        if( count >= 3 && count % 3 == 0) {
            totalPage = count / 3;
        } else if (count > 3 && count % 3 != 0) {
            totalPage = (count / 3) + 1;
        } else if (count > 0){
            totalPage = 1;
        }
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

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView goToCreateProductPage() {
        Product product = new Product();
        List<Category> listCategory = categoryRepository.findAll();
        product.setCategory(listCategory.get(0));
        ModelAndView model = new ModelAndView("/product/create", "product", product);
        model.addObject("listCategory",listCategory);
        return model;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createProduct(
            @Valid @ModelAttribute("product")Product product,
            BindingResult bindingResult,
            FileModel fileModel
    ) throws IOException {
        if (bindingResult.hasErrors()) {
            return "/product/create";
        }
        //Upload file
        //        String uploadPath = context.getRealPath("/img");
//        FileCopyUtils.copy(fileModel.getFile().getBytes(), new File(uploadPath + fileModel.getFile().getOriginalFilename()));
        //        File file = new File(uploadPath);
//        if(file.isDirectory()){
//            System.out.println("hihi");
//        }
        MultipartFile multipartFile = fileModel.getFile();
        String uploadPath = RESOURCES_IMG;

        if (fileModel.getFile().getSize() > 0) {
            FileCopyUtils.copy(fileModel.getFile().getBytes(), new File(uploadPath + fileModel.getFile().getOriginalFilename()));

            String fileName = multipartFile.getOriginalFilename();
            product.setThumbnailUrl(fileName);
        }
            productRepository.save(product);

        return "redirect:index?page=0&keyword=";
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView goToDetail(@RequestParam(value = "id", required = false) int id) {
        Product product = productRepository.findOne(id);
        ModelAndView model = new ModelAndView("/product/detail", "product", product);
        return model;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView goToEdit(@RequestParam(value = "id", required = false) int id) {
        Product product = productRepository.findOne(id);
        List<Category> listCategory = categoryRepository.findAll();
        ModelAndView model = new ModelAndView("/product/edit", "product", product);
        model.addObject("listCategory",listCategory);
        return model;
    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public String edit(
            @Valid @ModelAttribute("product")Product product,
            @Validated FileModel fileModel,
            BindingResult bindingResult) throws IOException {
        if (bindingResult.hasErrors()) {
//            return new ModelAndView("product/edit");
            return "/product/edit";
        }

        //Upload file
        String uploadPath = RESOURCES_IMG;
        MultipartFile multipartFile;
        String fileName = "";
        if (!fileModel.getFile().isEmpty()) {
            multipartFile = fileModel.getFile();
            FileCopyUtils.copy(fileModel.getFile().getBytes(), new File(uploadPath + fileModel.getFile().getOriginalFilename()));
            fileName = multipartFile.getOriginalFilename();
        }
//        if(!fileName.equals("")) {
            product.setThumbnailUrl(fileName);
//        }
        productRepository.save(product);
        return ("redirect:index?page=0&keyword=");
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = false) int id) {
        productRepository.delete(id);
        return "redirect:index";
    }
}
