<div class="col-lg-3 col-md-3 col-sm-12 rightSidebar">
<a class="btn btn-primary btn-lg btn-block " title="checkout" href="checkout-1.jsp" style="margin-bottom:20px"> Proceed to
checkout &nbsp; <i class="fa fa-arrow-right"></i> </a>

<div class="w100 cartMiniTable">
<%@ page import="com.wear.kapampangan.project.library.Product" %>
<%@ page import="com.wear.kapampangan.project.database.DBManager" %>
<%@ page import="java.util.List" %>
<%! List<Product> cartItem = null; %>
<%! double total = 0; %>
<% 
	total = 0;
	cartItem = (List<Product>) request.getSession().getAttribute("cartItem");
	for(Product p : cartItem){
		total += p.getTotalPrice();
	}
%>

<table id="cart-summary" class="std table">
<tbody>
<tr>
<td>Total products</td>
<td class="price">PHP <%= total%></td>
</tr>
<tr style="">
<td>Shipping</td>
<td class="price"><span class="success">Free shipping!</span></td>
</tr>
<tr>
<td>Total tax</td>
<td class="price" id="total-tax">PHP 0</td>
</tr>
<tr>
<td> Total</td>
<td class=" site-color" id="total-price">PHP <%= total%></td>
</tr>
</tbody>
<tbody>
</tbody>
</table>
</div>
</div>