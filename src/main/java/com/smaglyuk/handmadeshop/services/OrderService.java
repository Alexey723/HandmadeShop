package com.smaglyuk.handmadeshop.services;

import com.smaglyuk.handmadeshop.enumm.Status;
import com.smaglyuk.handmadeshop.models.Order;
import com.smaglyuk.handmadeshop.models.Product;
import com.smaglyuk.handmadeshop.repositories.OrderRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class OrderService {
    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public List<Order> getAllOrders(){
        return orderRepository.findAll();
    }

    public List<Order> findOrderByNumber(String numbers){
        return orderRepository.findByNumberContaining(numbers);
    }

    @Transactional
    public void updateOrderStatus(Status status, int id){
        orderRepository.updateOrderStatus(status, id);
    }

    @Transactional
    public void deleteOrder(int id){
        orderRepository.deleteById(id);
    }
}

