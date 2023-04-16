package com.smaglyuk.handmadeshop.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "Person")
public class Person {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotEmpty(message = "Логин не может быть пустым")
    @Size(min = 5, max = 100, message = "Логин должен быть от 5 до 100 символов")
    @Column(name = "login")
    private String login;

    @NotEmpty(message = "Фамилия не может быть пустой")
    @Size(min = 1, max = 50, message = "Фамилия должна быть от 1 до 50 символов")
    @Column(name = "last_name")
    private String lastName;

    @NotEmpty(message = "Имя не может быть пустым")
    @Size(min =2, max = 50, message = "Имя должно быть от 2 до 50 символов")
    @Column(name = "first_name")
    private String firstName;

    @NotEmpty(message = "Отчество не может быть пустым")
    @Size(min = 5, max = 50, message = "Отчество должно быть от 5 до 50 символов")
    @Column(name = "patronymic")
    private String patronymic;

    @NotEmpty(message = "Адрес не может быть пустым")
    @Size(min = 5, max = 100, message = "Адрес должен быть от 5 до 100 символов")
    @Column(name = "address")
    private String address;

    @NotEmpty(message = "E-mail не может быть пустым")
    @Size(min = 5, max = 100, message = "E-mail должен быть от 5 до 100 символов")
    @Column(name = "email")
    private String email;

    @NotEmpty(message = "Пароль не может быть пустым")
    @Column(name = "password")
    private String password;

    @Column(name = "role")
    private String role;

    @ManyToMany()
    @JoinTable(name = "product_cart", joinColumns = @JoinColumn(name = "person_id"),inverseJoinColumns = @JoinColumn(name = "product_id"))
    private List<Product> productList;

    @OneToMany(mappedBy = "person", fetch = FetchType.EAGER)
    private List<Order> orderList;



    public String getRole() {
        return role;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Person person = (Person) o;
        return id == person.id && Objects.equals(login, person.login) && Objects.equals(lastName, person.lastName) && Objects.equals(firstName, person.firstName) && Objects.equals(patronymic, person.patronymic) && Objects.equals(address, person.address) && Objects.equals(email, person.email) && Objects.equals(password, person.password) && Objects.equals(role, person.role) && Objects.equals(productList, person.productList) && Objects.equals(orderList, person.orderList);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, login, lastName, firstName, patronymic, address, email, password, role, productList, orderList);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        this.patronymic = patronymic;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public List<Order> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<Order> orderList) {
        this.orderList = orderList;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
