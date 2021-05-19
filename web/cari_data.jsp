<%@page import="java.sql.*" %>
<%@page import="com.perpustakaan.koneksi.Koneksi" %>
<%

  String namaPeminjam = null;  
  String judulBuku = null; 
  String kodePeminjam = request.getParameter("kodepeminjam"); 
  String kodeBuku = request.getParameter("kodebuku"); 
 
  if(kodePeminjam != null){
           try{
          
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "SELECT * FROM peminjamtbl where kode_peminjam ='"+kodePeminjam+"'";
            ResultSet res = stm.executeQuery(sql);
            if(res.next()){
             namaPeminjam= res.getString("nama_peminjam");
                               
            }
 %>
 <%=namaPeminjam%>
 <% 
          conn.close();
          stm.close();         
        }catch(Exception e){
            e.printStackTrace();
        }
%>

<%
 }else if(kodeBuku != null){
        try{
          
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "SELECT * FROM bukutbl where kode_buku ='"+kodeBuku+"'";
            ResultSet res = stm.executeQuery(sql);
            if(res.next()){
             judulBuku= res.getString("judul_buku");    
            }
%>
 <%=judulBuku%>
 <% 
          conn.close();
          stm.close();       
        }catch(Exception e){
            e.printStackTrace();
        }
   }
%>

     



 
