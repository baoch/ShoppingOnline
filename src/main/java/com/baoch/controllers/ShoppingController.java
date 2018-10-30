package com.baoch.controllers;

import com.baoch.entity.Order;
import com.baoch.entity.OrderDetail;
import com.baoch.entity.Product;
import com.baoch.entity.User;
import com.baoch.models.Cart;
import com.baoch.repository.OrderDetailRepository;
import com.baoch.repository.OrderRepository;
import com.baoch.repository.ProductRepository;
import com.baoch.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

@Controller
@RequestMapping(value = "/shop")
public class ShoppingController {
    private static final Logger LOGGER = Logger.getLogger(ProductController.class.getName());

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;


    private int isExistItem(int id, List<Cart> myCart) {
        for (int i = 0; i < myCart.size(); i++) {
            if (myCart.get(i).getProduct().getId() == id){
                return i;
            }
        }
        return -1;
    }

    private double calTotal(List<Cart> myCart){
        double result = 0.0;
        if (myCart != null) {
            for (Cart item : myCart) {
                result = result + (item.getQuantity() * item.getProduct().getPrice());
            }
        }
        return result;
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(HttpSession session){
        List<Cart> myCart = (List<Cart>) session.getAttribute("cart");
        double total = calTotal(myCart);
        ModelAndView model = new ModelAndView("/shop/index", "myCart", myCart);
        model.addObject("total", total);
        return model;
    }


    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String order(@RequestParam int id,
                        @RequestParam int quantity,
                        HttpSession session) {
        System.out.println("-------------------");
        System.out.println(session);
        List<Cart> myCart = (List<Cart>) session.getAttribute("cart");
        Product product = productRepository.findOne(id);
        if (myCart == null) {
            myCart = new ArrayList<>();
            Cart cart = new Cart();
            cart.setProduct(product);
            cart.setQuantity(quantity);
            myCart.add(cart);
        } else {
            int index = isExistItem(id, myCart);
            if (index == -1){
                Cart cart = new Cart();
                cart.setProduct(product);
                cart.setQuantity(quantity);
                myCart.add(cart);
            } else {
                int inCartAmount = myCart.get(index).getQuantity();
                int amount = inCartAmount + quantity;
                myCart.get(index).setQuantity(amount);
            }
        }
        session.setAttribute("cart", myCart);
        return "redirect:index";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = false) int id, HttpSession session) {
        List<Cart> myCart = (List<Cart>) session.getAttribute("cart");
        if(myCart != null) {
            int index = isExistItem(id, myCart);
            if (index != -1) {
                myCart.remove(index);
            }
        }
        session.setAttribute("cart", myCart);
        return "redirect:index";
    }

    @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public ModelAndView payment(@RequestParam(value = "user", required = false) Principal principal, @RequestParam(value = "price", required = false) float price, HttpSession session) {
        List<Cart> myCart = (List<Cart>) session.getAttribute("cart");
        Order order = new Order();
        if (principal != null && (price != 0)) {
            String username = principal.getName();
            User user = userRepository.findOne(username);
            if (user != null) {
                order.setUser(user);
                Date date = new Date();
                String name = "order-" + date;
                order.setName(name);
                order.setPrice(price);
            }
        }
        Order tmpOrder = orderRepository.save(order);
        if (myCart != null && myCart.size() > 0) {
            for (Cart cart: myCart) {
                Product product = productRepository.findOne(cart.getProduct().getId());
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrder(tmpOrder);
                orderDetail.setProduct(product);
                orderDetail.setAmount(cart.getQuantity());
                orderDetailRepository.save(orderDetail);
            }
        }
        session.setAttribute("cart", null);
        return new ModelAndView("/home/index");
    }

}
