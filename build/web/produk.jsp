<%@page import="com.penjualan.koneksi.Koneksi"%>
<%@page import="java.sql.*" %>
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
		<th align="left" scope="col"><font face="Tahoma, Geneva, sans-serif" color="#000000" size="3">DATA PRODUK</font></th>
  </tr>
	<tr>
	  <td><hr /></td>
  </tr>
	<tr>
	<td>
            <center><h2>${pesan}</h2></center>
<form id="form1" name="form1" method="post" action="ProdukController">
  <table width="450" border="0" align="left">
    <tr>
      <td width="30%" align="left" valign="middle">Kode Produk</td>
      <td width="2%" align="left" valign="middle">:</td>
      <td width="68%" align="left" valign="top">
          <input name="kodeProduk" type="text" id="kdproduktxt" size="5" maxlength="5" value="${kodeProduk}" />
          <input type="submit" name="cari" value="Cari" />
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">Nama Produk</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top"><input name="namaProduk" type="text" id="namaproduktxt" size="15" maxlength="15" value="${namaProduk}"/></td>
    </tr>
    <tr>
      <td align="left" valign="top">Kategori Produk</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top">
        <select name="kategoriProduk" id="kategori">
            <option value=null>--Pilih--</option>
        <%
            String kategori = null;
            request.getAttribute("kategoriProduk");
            try {
                    Koneksi konek = new Koneksi();
                    Connection conn = konek.bukaKoneksi();
                    Statement stm = conn.createStatement();
        //          String sql = "SELECT a.kode_peminjaman as kode_peminjaman,a.tgl_pinjam,a.tgl_kembali, b.nama_peminjam as nama_peminjam, c.judul_buku as judul_buku FROM peminjamantbl a inner join peminjamtbl b on a.kode_peminjam = b.kode_peminjam inner join bukutbl c on a.kode_buku = c.kode_buku ORDER BY a.id DESC";
                    String sql = "SELECT * FROM kategori WHERE status='aktif'";
                    ResultSet res = stm.executeQuery(sql);
                    while (res.next()) {
                        kategori = res.getString("kategori");
        %>
            <option value="<%=kategori%>"><%=kategori%></option>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
        %>
      </select>
      ${kategoriProduk}
      <input type="hidden" name="kategoriProdukHidden" value="${kategoriProduk}">
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">Harga</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><input name="harga" type="text" id="hargatxt" size="35" maxlength="35" value="${harga}"/></td>
    </tr>
    <tr>
      <td align="left" valign="top">Qty</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><input name="qty" type="text" id="qtytxt" size="10" maxlength="10" value="${qty}"/></td>
    </tr>
    <tr>
      <td align="left" valign="top">Berat</td>
            <td align="left" valign="top">:</td>
      <td align="left" valign="top"><input name="berat" type="text" id="berattxt" size="10" maxlength="10" value="${berat}"/></td>
    </tr>
    <tr>
      <td align="left" valign="top">Varian</td>
            <td align="left" valign="top">:</td>
      <td align="left" valign="top"><input name="varian" type="text" id="variantxt" size="10" maxlength="10" value="${varian}"/></td>
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
  
  <table width="700" border="0" align="center" cellpadding="4" cellspacing="1">
<!--                    <tr>
                    <td colspan="6" align="right" valign="middle" scope="col"><font color="#000000" face="Tahoma, Geneva, sans-serif" size="2"><b><a href="index.jsp?go=Peminjaman_Tambah"><img src="Gambar/Tambah.png" width="32" height="32" title="Tambah Data" /></a></b></font></td>
                    </tr>-->
                    <tr>
                    <th width="10%" align="left" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Kode Produk</font></th>
                    <th width="22%" align="left" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Nama Produk</font></th>
                    <th width="22%" align="left" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Kategori</font></th>
                    <th width="19%" align="Center" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Harga</font></th>  
                    <th width="19%" align="Center" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">qty</font></th>  
                    <th width="6%" align="Center" scope="col" bgcolor="#66B2A8"><font color="#FFFFFF">Aksi</font></th>
                    </tr>

                    <%

                        String kode_produk = null;
                        String nama_produk = null;
                        String kategori_produk = null;
                        String harga = null;
                        String qty = null;
                        String berat = null;
                        String varian = null;
                        try {
                            Koneksi konek = new Koneksi();
                            Connection conn = konek.bukaKoneksi();
                            Statement stm = conn.createStatement();
//                            String sql = "SELECT a.kode_peminjaman as kode_peminjaman,a.tgl_pinjam,a.tgl_kembali, b.nama_peminjam as nama_peminjam, c.judul_buku as judul_buku FROM peminjamantbl a inner join peminjamtbl b on a.kode_peminjam = b.kode_peminjam inner join bukutbl c on a.kode_buku = c.kode_buku ORDER BY a.id DESC";
                            String sql = "SELECT * FROM produk";
                            ResultSet res = stm.executeQuery(sql);
                            while (res.next()) {
                                kode_produk = res.getString("kode_produk");
                                nama_produk = res.getString("nama_produk");
                                kategori_produk = res.getString("kategori_produk");
                                harga = res.getString("harga");
                                qty = res.getString("qty");
                    %>
                   
                 <tr>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=kode_produk%></font></td>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=nama_produk%></font></td>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=kategori_produk%></font></td>
                    <th align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=harga%></font></th>
                    <th align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=qty%></font></th>
                    <th align="Center" scope="col" bgcolor="#CCCCCC"> <a href="http://localhost:8080/Penjualan/ProdukController?kodeSelected=<%=kode_produk%>">Select</a></th> 
                </tr>
              
                   
          
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </table>
</form>
</td>
</tr>
</table>