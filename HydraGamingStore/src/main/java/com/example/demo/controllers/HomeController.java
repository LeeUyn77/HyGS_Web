package com.example.demo.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entities.Account;
import com.example.demo.entities.Product;
import com.example.demo.entities.Role;
import com.example.demo.entities.RoleAccount;
import com.example.demo.entities.RoleAccountId;
import com.example.demo.services.AccountService;
import com.example.demo.services.ProductService;

@Controller
@RequestMapping(value = { "", "home" }) // Controller mac dinh
public class HomeController {
	@Autowired
	private ProductService productService;

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		loadData(modelMap);
		return "home.index";

	}

	public void loadData(ModelMap modelMap) {
		List<Product> products1 = productService.findByLastestAndCategory(6, 1);
		List<Product> products2 = productService.findByLastestAndCategory(6, 2);
		List<Product> products3 = productService.findByLastestAndCategory(6, 3);

		modelMap.put("products1", products1);
		modelMap.put("products2", products2);
		modelMap.put("products3", products3);

	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(HttpServletRequest httpServletRequest, ModelMap modelMap) {
		HttpSession session = httpServletRequest.getSession();
		loadData(modelMap);
		Account account = accountService.login(String.valueOf(httpServletRequest.getParameter("username")),
				String.valueOf(httpServletRequest.getParameter("password")));
		if (account == null) {
			modelMap.put("err", "err");
			return "home.index";
		} else {
			modelMap.put("success", "success");
			session.setAttribute("account", account);
			return "home.index";
		}
		// tiles.xml
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest httpServletRequest, ModelMap modelMap) {
		HttpSession session = httpServletRequest.getSession();
		loadData(modelMap);
		session.removeAttribute("account");

		return "home.index";

		// tiles.xml
	}

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(HttpServletRequest httpServletRequest, ModelMap modelMap) throws ParseException {
		HttpSession session = httpServletRequest.getSession();
		loadData(modelMap);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");

		String username = httpServletRequest.getParameter("username");
		String password = httpServletRequest.getParameter("password");
		String fullname = httpServletRequest.getParameter("fullname");
		String gender = httpServletRequest.getParameter("gender");
		String bdate = httpServletRequest.getParameter("birthday");
		Date birthday = simpleDateFormat.parse(bdate);

		try {
			Account account = new Account(username, password, fullname, gender, birthday, new Date(), 0);
			accountService.save(account);
		} catch (Exception e) {
			return "home.index";
		}

		return "home.index";

		// tiles.xml
	}
}