package com.smaglyuk.handmadeshop.repositories;

import com.smaglyuk.handmadeshop.models.Person;
import com.smaglyuk.handmadeshop.models.Product;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PersonRepository extends JpaRepository<Person, Integer> {
    Optional<Person> findByLogin(String login);


    @Modifying
    @Query("UPDATE Person person SET person.role = 'ROLE_ADMIN' WHERE person.id = ?1")
    int changeRoleToAdmin(int id);

    @Modifying
    @Query("UPDATE Person person SET person.role = 'ROLE_USER' WHERE person.id = ?1")
    int changeRoleToUser(int id);
}
