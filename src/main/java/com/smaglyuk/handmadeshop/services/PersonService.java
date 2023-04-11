package com.smaglyuk.handmadeshop.services;

import com.smaglyuk.handmadeshop.models.Person;
import com.smaglyuk.handmadeshop.models.Product;
import com.smaglyuk.handmadeshop.repositories.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class PersonService {
    private final PersonRepository personRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public PersonService(PersonRepository personRepository, PasswordEncoder passwordEncoder) {
        this.personRepository = personRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public Person getPersonId(int id){
        Optional<Person> optionalPerson = personRepository.findById(id);
        return optionalPerson.orElse(null);
    }

    public Person findByLogin(Person person){
        Optional<Person> person_db = personRepository.findByLogin(person.getLogin());
        return person_db.orElse(null);
    }

    public List<Person> getAllPerson(){
        return personRepository.findAll();
    }

    @Transactional
    public void register(Person person){
        person.setPassword(passwordEncoder.encode(person.getPassword()));
        person.setRole("ROLE_USER");
        personRepository.save(person);
    }

    @Transactional
    public void updatePersonToAdmin(int id){

        personRepository.changeRoleToAdmin(id);
    }
    @Transactional
    public void updatePersonToUser(int id){

        personRepository.changeRoleToUser(id);
    }

    @Transactional
    public void deletePerson(int id){
        personRepository.deleteById(id);
    }
}
