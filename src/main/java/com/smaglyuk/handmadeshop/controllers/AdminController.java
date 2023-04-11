package com.smaglyuk.handmadeshop.controllers;

import com.smaglyuk.handmadeshop.enumm.Status;
import com.smaglyuk.handmadeshop.models.*;
import com.smaglyuk.handmadeshop.services.CategoryService;
import com.smaglyuk.handmadeshop.services.OrderService;
import com.smaglyuk.handmadeshop.services.PersonService;
import com.smaglyuk.handmadeshop.services.ProductService;
import com.smaglyuk.handmadeshop.util.PersonValidator;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class AdminController {

    private final ProductService productService;
    private final PersonService personService;
    private final OrderService orderService;
    private final CategoryService categoryService;

    @Value("${upload.path}")
    private String uploadPath;

    public AdminController(ProductService productService, PersonService personService, OrderService orderService, CategoryService categoryService) {
        this.productService = productService;
        this.personService = personService;
        this.categoryService = categoryService;
        this.orderService = orderService;
    }

    @GetMapping("admin/product/add")
    public String addProduct(Model model){
        model.addAttribute("product", new Product());
        model.addAttribute("category", categoryService.getAllCategories());
        return "product/addProduct";
    }

    @PostMapping("/admin/product/add")
    public String addProduct(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult, @RequestParam("file_one")MultipartFile file_one, @RequestParam("file_two")MultipartFile file_two, @RequestParam("file_three")MultipartFile file_three, @RequestParam("file_four")MultipartFile file_four, @RequestParam("file_five")MultipartFile file_five, @RequestParam("category") int category, Model model) throws IOException {
        Category category_db = (Category) categoryService.getCategoryId(category);
        if(bindingResult.hasErrors()){
            model.addAttribute("category", categoryService.getAllCategories());
            return "product/addProduct";
        }

        if(file_one != null){
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_one.getOriginalFilename();
            file_one.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);

        }

        if(file_two != null){
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_two.getOriginalFilename();
            file_two.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }

        if(file_three != null){
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_three.getOriginalFilename();
            file_three.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }

        if(file_four != null){
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_four.getOriginalFilename();
            file_four.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }

        if(file_five != null){
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file_five .getOriginalFilename();
            file_five .transferTo(new File(uploadPath + "/" + resultFileName));
            Image image = new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }
        productService.saveProduct(product, category_db);
        return "redirect:/admin";
    }


    @GetMapping("/admin")
    public String admin(Model model)
    {
        model.addAttribute("products", productService.getAllProduct());
        return "admin/admin";
    }

    @GetMapping("admin/product/delete/{id}")
    public String deleteProduct(@PathVariable("id") int id){
        productService.deleteProduct(id);
        return "redirect:/admin";
    }

    @GetMapping("admin/product/edit/{id}")
    public String editProduct(Model model, @PathVariable("id") int id){
        model.addAttribute("product", productService.getProductId(id));
        model.addAttribute("category", categoryService.getAllCategories());
        return "product/editProduct";
    }

    @PostMapping("admin/product/edit/{id}")
    public String editProduct(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult, @PathVariable("id") int id, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("category", categoryService.getAllCategories());
            return "product/editProduct";
        }
        productService.updateProduct(id, product);
        return "redirect:/admin";
    }

    @GetMapping("/users_edit")
    public String editUsers(Model model){
        model.addAttribute("person", personService.getAllPerson());
        return "admin/users_edit";
    }

    @PostMapping("/admin/person/editToUser/{id}")
    public String editPersonToUser(@ModelAttribute("person") Person person, @PathVariable("id") int id){

            personService.updatePersonToUser(id);

        return "redirect:/users_edit";
    }

    @PostMapping("/admin/person/editToAdmin/{id}")
    public String editPersonToAdmin(@ModelAttribute("person") Person person, @PathVariable("id") int id){

        personService.updatePersonToAdmin(id);

        return "redirect:/users_edit";
    }

    @GetMapping("admin/person/delete/{id}")
    public String deletePerson(@PathVariable("id") int id) {
        personService.deletePerson(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/orders")
    public String ordersView(Model model) {
        model.addAttribute("orders", orderService.getAllOrders());
        return "admin/orders";
    }

    @GetMapping("/admin/orders/change_status/{id}")
    public String updateOrderStatus(@PathVariable("id") int id, @RequestParam("statusValue") Status status){
        orderService.updateOrderStatus(status, id);
        return "redirect:/admin/orders";
    }

    @PostMapping("/admin/orders/search")
    public String orderSearch(@RequestParam("search") String search, Model model){
        model.addAttribute("orders", orderService.getAllOrders());
        model.addAttribute("search_orders", orderService.findOrderByNumber(search));
        model.addAttribute("value_search", search);
        return "/admin/orders";
    }

    @GetMapping("admin/order/delete/{id}")
    public String deleteOrder(@PathVariable("id") int id) {
       orderService.deleteOrder(id);
        return "redirect:/admin/orders";
    }
}
