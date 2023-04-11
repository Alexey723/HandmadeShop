package com.smaglyuk.handmadeshop.repositories;

import com.smaglyuk.handmadeshop.enumm.Status;
import com.smaglyuk.handmadeshop.models.Order;
import com.smaglyuk.handmadeshop.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
    List<Order> findByPerson(Person person);

    @Modifying
    @Query("UPDATE Order orders SET orders.status = ?1 WHERE orders.id = ?2")
    int updateOrderStatus(Status status, int id);
}
