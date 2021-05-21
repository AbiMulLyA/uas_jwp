
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
<%} else if (menu.equals("Costumer")) {
%>
<%@ include file="costumer.jsp"%>
<%} else if (menu.equals("Buku")) {
%>
<%@ include file="buku.jsp"%>
<%}else if (menu.equals("Peminjaman")){
%>
<%@ include file="peminjaman.jsp"%>
<%}else if (menu.equals("Peminjaman_Tambah")){
%>
<%@ include file="peminjaman_tambah.jsp"%>
<%}
%>




