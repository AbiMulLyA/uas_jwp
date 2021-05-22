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
      <td align="left" valign="top"><input name="kategoriProduk" type="text" id="kategoriproduktxt" size="50" maxlength="50" value="${kategoriProduk}"/></td>
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
</form>
</td>
</tr>
</table>