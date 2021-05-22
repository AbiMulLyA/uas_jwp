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
      <td align="left" valign="top"><select name="cars" id="cars">
    <option value="volvo">Volvo</option>
    <option value="saab">Saab</option>
    <option value="opel">Opel</option>
    <option value="audi">Audi</option>
  </select></td>
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
                    <th width="22%" align="left" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Kategori Produk</font></th>
                    <th width="19%" align="Center" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Harga</font></th>  
                    <th width="6%" align="Center" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Qty</font></th>
                    <th width="19%" align="Center" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Berat</font></th>  
                    <th width="6%" align="Center" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Varian</font></th>
                    <th width="6%" align="Center" scope="col" bgcolor="#66B2A8"><font color="#FFFFFF">Aksi</font></th>
                    </tr>
                    <%
                        String kodeProduk = null;
                        String namaProduk = null;
                        String kategoriProduk = null;
                        String harga = null;
                        String qty = null;
                        String berat = null;
                        String varian = null;


                        try {
                            Koneksi konek = new Koneksi();
                            Connection conn = konek.bukaKoneksi();
                            Statement stm = conn.createStatement();
//                            String sql = "SELECT a.kode_peminjaman as kode_peminjaman,a.tgl_pinjam,a.tgl_kembali, b.nama_peminjam as nama_peminjam, c.judul_buku as judul_buku FROM peminjamantbl a inner join peminjamtbl b on a.kode_peminjam = b.kode_peminjam inner join bukutbl c on a.kode_buku = c.kode_buku ORDER BY a.id DESC";
                            String querySelect = "SELECT * FROM produk";
                            ResultSet resSelect = stm.executeQuery(querySelect);
                            while (resSelect.next()) {
                                kodeProduk = resSelect.getString("kode_produk");
                                namaProduk = resSelect.getString("nama_produk");
                                kategoriProduk = resSelect.getString("kategori_produk");
                                harga = resSelect.getString("harga");
                                qty = resSelect.getString("qty");
                                berat = resSelect.getString("berat");
                                varian = resSelect.getString("varian");
                    %>
                   
                 <tr>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=kodeProduk%></font></td>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=namaProduk%></font></td>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=kategoriProduk%></font></td>
                    <th align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=harga%></font></th>
                    <th align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=qty%></font></th>
                    <th align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=berat%></font></th>
                    <th align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=varian%></font></th>
                    <th align="Center" scope="col" bgcolor="#CCCCCC"> <input type="submit" name="select" value="Select" />  <input type="hidden" name="selectKodeProduk" value="<%=kodeProduk%>" /></th> 
                </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </table>
</td>
</tr>
</table>
                </form>
      
</div>