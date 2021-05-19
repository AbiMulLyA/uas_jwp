
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
		<th align="left" scope="col"><font face="Tahoma, Geneva, sans-serif" color="#000000" size="3">DATA KATEGORI</font></th>
  </tr>
	<tr>
	  <td><hr /></td>
  </tr>
	<tr>
	<td>
<form id="form1" name="form1" method="post" action="KategoriBukuController">
  <table width="400" border="0" align="left">
    <tr>
      <td width="30%" align="left" valign="middle">Kode Kategori</td>
      <td width="2%" align="left" valign="middle">:</td>
      <td width="68%" align="left" valign="top">
          <input name="kodeKategori" type="text" id="kdkategoritxt" size="5" maxlength="5" value="${kodeKategori}" />
          <input type="submit" name="cari" value="Cari"  />
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">Nama Kategori</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top"><input name="namaKategori" type="text" id="nmkategoritxt" size="35" maxlength="50" value="${namaKategori}"/></td>
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