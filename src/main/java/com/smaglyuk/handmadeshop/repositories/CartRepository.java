package com.smaglyuk.handmadeshop.repositories;

import com.smaglyuk.handmadeshop.models.Cart;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Transactional
@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {
    List<Cart> findByPersonId(int id);

    @Modifying
    @Query("DELETE FROM Cart product_cart WHERE product_cart.productId=?1")
    int deleteCartByProductId(int id);
}
