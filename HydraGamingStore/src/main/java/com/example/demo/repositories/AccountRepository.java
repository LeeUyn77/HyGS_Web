package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entities.Account;
import com.example.demo.entities.Product;

@Repository("accountRepository")
public interface AccountRepository extends CrudRepository<Account, Integer> {

	@Query(value = "select * from account where username like :username and password like :password", nativeQuery = true)
	public Account login(@Param("username") String username, @Param("password") String password);

	@Query(value = "select point from account where username like :username", nativeQuery = true)
	public int findPoint(@Param("username") String username);

	@Query(value = "select * from account", nativeQuery = true)
	public Page<Account> findAll(Pageable pageable);

	@Transactional
	@Modifying
	@Query(value = "update account set point=:point where username like :username", nativeQuery = true)
	public void checkOutByPoint(@Param("username") String username, @Param("point") int point);

	@Modifying
	@Transactional
	@Query(value = "delete from account where account_id =:id", nativeQuery = true)
	public void delete_account(@Param("id") int id);
}
