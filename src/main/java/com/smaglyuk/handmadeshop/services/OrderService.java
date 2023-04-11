package com.smaglyuk.handmadeshop.services;

import com.smaglyuk.handmadeshop.enumm.Status;
import com.smaglyuk.handmadeshop.repositories.OrderRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class OrderService {
    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @Transactional
    public void updateOrderStatus(Status status, int id){

        orderRepository.updateOrderStatus(status, id);

    }
}
