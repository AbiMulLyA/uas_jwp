 
<%
    String menu = request.getParameter("go");
    if   (menu == null || menu.equals("Home")) {

%>
<%@ include file="home.jsp"%>

<%} else if (menu.equals("Kategori")) {
%>
<%@ include file="kategori.jsp"%>

<%} else if (menu.equals("Costumer")) {
%>

<%@ include file="costumer.jsp"%>

<%} else if (menu.equals("Transaksi")) {
%>

<%@ include file="transaksi.jsp"%>

<%} else if (menu.equals("Produk")) {
%>
<%@ include file="produk.jsp"%>

<%}

%>




