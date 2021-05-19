<%@page import="java.sql.*" %>
<%@page import="com.perpustakaan.koneksi.Koneksi" %>
<style type="text/css">
.main {
	margin-top: 5px;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
}
</style>


<div class="main">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<th align="left" scope="col"><font face="Tahoma, Geneva, sans-serif" color="#000000" size="3">DATA BUKU</font></th>
  </tr>
	<tr>
	  <td><hr /></td>
  </tr>
	<tr>
	<td>
<form id="form1" name="form1" method="post" action="index.php?go=Buku_Simpan">
  <table width="450" border="0" align="left">
    <tr>
      <td width="30%" align="left" valign="middle">Kode Buku</td>
      <td width="2%" align="left" valign="middle">:</td>
      <td width="68%" align="left" valign="top">
          <input name="kdbuku" type="text" id="kdbukutxt" size="5" maxlength="5" value="" />
          <input type="submit" name="cari" value="Cari" />
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">ISBN</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top"><input name="isbn" type="text" id="isbntxt" size="15" maxlength="15" value=""/></td>
    </tr>
    <tr>
      <td align="left" valign="top">Judul Buku</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><input name="judul" type="text" id="judultxt" size="50" maxlength="50" value=""/></td>
    </tr>
    <tr>
      <td align="left" valign="top">Pengarang</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><input name="pengarang" type="text" id="pengarangtxt" size="35" maxlength="35" value=""/></td>
    </tr>
    <tr>
      <td align="left" valign="top">Halaman</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><input name="hal" type="text" id="haltxt" size="10" maxlength="10" value=""/></td>
    </tr>
    <tr>
      <td align="left" valign="top">Kategori</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><select name="kategorilist" id="kategorilist">
      <option selected="selected"></option>
         <%
       String kodeKategori=null;
       String namaKategori=null;
        try{
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "select * from kategoritbl order by id asc";
            ResultSet res = stm.executeQuery(sql);
            while(res.next()){
                kodeKategori = res.getString("kode_kategori");
                namaKategori = res.getString("nama_kategori");
                %>
              
                   <option value="<%=kodeKategori%>"><%=kodeKategori+" -"+namaKategori%></option>
                  
                <%      
            }
        }catch(Exception e){
        }
%>
      </select></td>
    </tr>
    <tr>
      <td align="left" valign="top">Rak</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><select name="raklist" id="raklist">
        <option selected="selected"></option>
       <%
       String kodeRak=null;
       String namaRak=null;
        try{
            Koneksi konek = new Koneksi();
            Connection conn = konek.bukaKoneksi();
            Statement stm = conn.createStatement();
            String sql = "select * from raktbl order by kode_rak asc";
            ResultSet res = stm.executeQuery(sql);
            while(res.next()){
                kodeRak = res.getString("kode_rak");
                namaRak = res.getString("nama_rak");
                %>
              
                   <option value="<%=kodeRak%>"><%=kodeRak+" -"+namaRak%></option>
                  
                <%      
            }
        }catch(Exception e){
        }
%>
      </select></td>
    </tr>
    <tr>
      <td align="left" valign="top">&nbsp;</td>
      <td align="left" valign="top">&nbsp;</td>
      <td align="left" valign="top">&nbsp;</td>
    </tr>
    <tr>
      <td align="left" valign="top">&nbsp;</td>
      <td align="left" valign="top">&nbsp;</td>
      <td align="left" valign="top">
        <input type="submit" name="simpan" value="Simpan" />
         <input type="submit" name="ubah" value="Ubah"  />
         <input type="submit" name="hapus" value="Hapus" />
         <input type="reset" name="reset" value="Reset"/>
        </td>
    </tr>
  </table>
</form>
</td>
</tr>
</table>