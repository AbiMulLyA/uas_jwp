<style type="text/css">
.main {
	margin-top: 5px;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
}
</style>

<link href="JQuery/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet">

<script src="JQuery/jquery-1.9.1.js"></script>
<script src="JQuery/jquery-ui-1.10.3.custom.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
				
        $("#ttl").datepicker({
            showOn: "both", buttonImage: "Gambar/calendar.png", buttonImageOnly: true, changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", appendText: "${ttl}"});
    });	
		

</script>


<div class="main">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<th align="left" scope="col"><font face="Tahoma, Geneva, sans-serif" color="#000000" size="3">DATA PEMINJAM</font></th>
  </tr>
	<tr>
	  <td><hr /></td>
  </tr>
	<tr>
	<td>
            
            <center><h2>${pesan}</h2></center>
<form id="form1" name="form1" method="post" action="CostumerController">
  <table width="400" border="0" align="left">
    <tr>
      <td width="30%" align="left" valign="middle">Kode Costumer</td>
      <td width="2%" align="left" valign="middle">:</td>
      <td width="68%" align="left" valign="top">
          <input name="kode_costumer" type="text" id="kode_costumer" size="5" maxlength="5" value="${kode_costumer}" />
          <input type="submit" name="cari" value="Cari" />
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">No KTP</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top"><input name="no_ktp" type="text" id="no_ktp" size="35" maxlength="35" value="${no_ktp}" /></td>
    </tr>
    <tr>
      <td align="left" valign="top">Nama</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><input name="nama" type="text" id="nama" size="35" maxlength="35" value="${nama}"/></td>
    </tr>
    <tr>
      <td align="left" valign="top">Telepon</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><input name="no_telp" type="text" id="notelp" size="35" maxlength="35" value="${no_telp}"/></td>
    </tr>
    <tr>
      <td align="left" valign="top">TTL</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><input name="ttl" type="text" id="ttl" value="" size="10" maxlength="10" value="${ttl}" /></td>
    </tr>
    <tr>
      <td align="left" valign="top">Alamat</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><textarea name="alamat">${alamat}</textarea></td>
    </tr>
    <tr>
      <td align="left" valign="top">Umur</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><input name="umur" type="text" id="umur" size="35" maxlength="35" value="${umur}"/></td>
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
         <input type="submit" name="hapus" value="Hapus" onClick="confirm('apakah anda yakin ingin dihapus?')" />
         <input type="reset" name="reset" value="Reset"/>
    </td>
    </tr>
  </table>
</form>
</td>
</tr>
</table>
    
