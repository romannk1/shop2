package com.example.shop.repositories;

import com.example.shop.models.Order;
import com.example.shop.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
    List<Order> findByPerson(Person person);

    List<Order> findByPersonOrderByDateTimeAsc(Person person);

    List<Order> findByPersonOrderByDateTimeDesc(Person person);

    List<Order> findAllByOrderByDateTimeAsc();

    List<Order> findAllByOrderByDateTimeDesc();

    List<Order> findAllByNumber(String number);

    List<Order> findByNumberEndingWithIgnoreCaseOrderByDateTimeDesc(String number);

    List<Order> findByNumberEndingWith(String number);

    List<Order> findByNumberEndingWithIgnoreCase(String number);

}
