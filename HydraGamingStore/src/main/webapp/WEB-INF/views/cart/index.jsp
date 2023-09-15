<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://fonts.googleapis.com/css?family=Poppins"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/user/css/main.css"
	rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="product-main">
	<div class="col span_1_of_about">
		<form method="get"
			action="${pageContext.request.contextPath }/cart/action=update">
			<table border="1">
				<tr style="text-align: center">
					<th>Action</th>
					<th>Id</th>
					<th>Name</th>
					<th>Photo</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Sub Total</th>
				</tr>
				<c:set var="total" value="0"></c:set>
				<c:forEach var="item" items="${sessionScope.cart }" varStatus="i">
					<c:set var="total"
						value="${total + item.product.price * item.quantity }"></c:set>
					<tr style="text-align: center">
						<td align="center"><a
							href="${pageContext.request.contextPath }/cart/action=delete&index=${i.index }"
							onclick="return confirm('Are you sure?')">X</a></td>
						<td>${item.product.id }</td>
						<td>${item.product.productName }</td>
						<td><img
							src="${pageContext.request.contextPath }/resources/user/images/${item.product.photo }"
							width="120" height="100"></td>
						<td>${item.product.price }</td>
						<td><input type="number" min="1" value="${item.quantity }"
							style="width: 50px;" name="quantity"></td>
						<td>${item.product.price * item.quantity }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="right"><input type="submit"
						value="Update"></td>
					<td align="right">Total :</td>
					<td><input type="number" value="${total }" name="total"
						disabled="disabled" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="col span_1_of_about1">
		<form
			action="${pageContext.request.contextPath }/cart/action=checkout"
			method="get">
			<div class="input-field first-wrap">
				<div class="input-select">
					<select data-trigger="" name="payment">
						<option>Cash</option>
						<option>Point</option>
						<option>Paypal</option>
					</select>
				</div>
				<div>
					<input type="hidden" value="${total }" name="total" />
				</div>
			</div>
			<div class="input-field second-wrap">
				<input id="btnCheckOut" type="submit" value="Check Out" />
			</div>
		</form>
	</div>
	<div class="clear"></div>
</div>
