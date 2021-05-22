
<%
    String menu = request.getParameter("go");
    if (menu == null || menu.equals("Home")) {

%>
<%@ include file="home.jsp"%>

<%} else if (menu.equals("Kategori")) {
%>
<%@ include file="kategori.jsp"%>
<% } else if (menu.equals("Rak")) {
%>
<%@ include file="rak.jsp"%>
<%} else if (menu.equals("Peminjam")) {
%>
<%@ include file="peminjam.jsp"%>
<%} else if (menu.equals("Produk")) {
%>
<%@ include file="produk.jsp"%>
<%}else if (menu.equals("Peminjaman")){
%>
<%@ include file="peminjaman.jsp"%>
<%}else if (menu.equals("Peminjaman_Tambah")){
%>
<%@ include file="peminjaman_tambah.jsp"%>
<%}
%>




