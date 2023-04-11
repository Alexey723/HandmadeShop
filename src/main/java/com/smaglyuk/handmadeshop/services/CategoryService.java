package com.smaglyuk.handmadeshop.services;

import com.smaglyuk.handmadeshop.models.Category;
import com.smaglyuk.handmadeshop.models.Order;
import com.smaglyuk.handmadeshop.models.Product;
import com.smaglyuk.handmadeshop.repositories.CategoryRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> getAllCategories(){
        return categoryRepository.findAll();
    }

    public Category getCategoryId(int id){
        Optional<Category> optionalCategory = categoryRepository.findById(id);
        return optionalCategory.orElse(null);
    }
}
