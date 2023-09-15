package com.example.demo.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entities.Account;
import com.example.demo.entities.Invoice;
import com.example.demo.entities.InvoiceDetail;
import com.example.demo.entities.Item;
import com.example.demo.entities.Product;
import com.example.demo.paypal.PayPalResult;
import com.example.demo.paypal.PayPalSuccess;
import com.example.demo.services.AccountService;
import com.example.demo.services.InvoiceDetailService;
import com.example.demo.services.InvoiceService;
import com.example.demo.services.ProductService;

@Controller
@RequestMapping(value = { "cart" }) // Controller mac dinh
public class CartController {
	@Autowired
	private ProductService productService;

	@Autowired
	private InvoiceService invoiceService;

	@Autowired
	private InvoiceDetailService invoiceDetailService;

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(HttpServletRequest httpServletRequest) {
		String id = httpServletRequest.getParameter("id");
		HttpSession session = httpServletRequest.getSession();
		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(productService.searchById(Integer.parseInt(id)), 1));
			session.setAttribute("cart", cart);
		} else {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			int index = exists(Integer.parseInt(id), cart);
			if (index == -1) {
				cart.add(new Item(productService.searchById(Integer.parseInt(id)), 1));
			} else {
				int newQuantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(newQuantity);
			}
			session.setAttribute("cart", cart);
		}

		return "cart.index";

	}

	@RequestMapping(value = "action=delete&index={index}", method = RequestMethod.GET)
	public String remove(HttpServletRequest httpServletRequest, @PathVariable("index") int index) {
		HttpSession session = httpServletRequest.getSession();
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "cart.index";
	}

	private int exists(int id, List<Item> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getId() == (id)) {
				return i;
			}
		}
		return -1;
	}

	@RequestMapping(value = "action=update", method = RequestMethod.GET)
	public String update(HttpServletRequest httpServletRequest) {
		HttpSession session = httpServletRequest.getSession();
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		String[] quantities = httpServletRequest.getParameterValues("quantity");
		for (int i = 0; i < cart.size(); i++) {
			cart.get(i).setQuantity(Integer.parseInt(quantities[i]));
		}
		session.setAttribute("cart", cart);

		return "cart.index";

	}

	@RequestMapping(value = "action=checkout", method = RequestMethod.GET)
	public String checkout(HttpServletRequest httpServletRequest, ModelMap modelMap) {
		HttpSession session = httpServletRequest.getSession();
		Account account = (Account) session.getAttribute("account");
		List<Item> items = (List<Item>) session.getAttribute("cart");
		if (account == null) {
			modelMap.put("err", "donothaveaccount");
			return "cart.index";
		} else {
			if (httpServletRequest.getParameter("payment").equalsIgnoreCase("Cash")) {
				Invoice invoice = new Invoice(account, new Date(), "Cash",
						Double.parseDouble(httpServletRequest.getParameter("total")), false);
				invoiceService.save(invoice);
				for (Item item : items) {
					InvoiceDetail invoiceDetail = new InvoiceDetail(invoice, item.getProduct(), item.getQuantity(),
							item.getProduct().getPrice(), item.getProduct().getPrice() * item.getQuantity());
					invoiceDetailService.save(invoiceDetail);
				}
				return "redirect:/home/index";
			}
			if (httpServletRequest.getParameter("payment").equalsIgnoreCase("Point")) {
				int point = accountService.findPoint(account.getUsername());

				if (point - Double.parseDouble(httpServletRequest.getParameter("total")) > 0) {
					accountService.checkOutByPoint(account.getUsername(),
							(int) (point - Double.parseDouble(httpServletRequest.getParameter("total")) / 10));
					Invoice invoice = new Invoice(account, new Date(), "Point",
							Double.parseDouble(httpServletRequest.getParameter("total")), true);
					invoiceService.save(invoice);
					for (Item item : items) {
						InvoiceDetail invoiceDetail = new InvoiceDetail(invoice, item.getProduct(), item.getQuantity(),
								item.getProduct().getPrice(), item.getProduct().getPrice() * item.getQuantity());
						invoiceDetailService.save(invoiceDetail);
					}
					return "redirect:/home/index";
				} else {
					modelMap.put("errPoint", "errPoint");
					return "redirect:/home/index";
				}
			}
			if (httpServletRequest.getParameter("payment").equalsIgnoreCase("Paypal")) {

				PayPalSuccess paypalSuccess = new PayPalSuccess();
				PayPalResult result = paypalSuccess.getPayPal(httpServletRequest);

				Invoice invoice = new Invoice(account, new Date(), "Paypal",
						Double.parseDouble(httpServletRequest.getParameter("total")), false);
				invoiceService.save(invoice);
				for (Item item : items) {
					InvoiceDetail invoiceDetail = new InvoiceDetail(invoice, item.getProduct(), item.getQuantity(),
							item.getProduct().getPrice(), item.getProduct().getPrice() * item.getQuantity());
					invoiceDetailService.save(invoiceDetail);
				}
				return "redirect:/home/index";
			}

		}
		return "cart.index";

	}

}