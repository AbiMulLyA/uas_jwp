
<%@page import="java.sql.*" %>

<%@page import="com.penjualan.koneksi.Koneksi" %>

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
				
        $("#tanggal").datepicker({
            showOn: "both", buttonImage: "Gambar/calendar.png", buttonImageOnly: true, changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd"});
    });	
		

</script>

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
            <center><h2>${pesan}</h2></center>
          
<form id="form1" name="form1" method="post" action="KategoriController">
  <table width="400" border="0" align="left">
    <tr>
      <td width="30%" align="left" valign="middle">Kode Kategori</td>
      <td width="2%" align="left" valign="middle">:</td>
      <td width="68%" align="left" valign="top">
          <input name="id" type="text" id="kdkategoritxt" size="5" maxlength="5" value="${id}" />
          <input type="submit" name="cari" value="Cari"  />
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">Input Kategori</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top"><input name="kategori" type="text" id="nmkategoritxt" size="35" maxlength="50" value="${kategori}"/></td>
    </tr>
    <tr>
      <td align="left" valign="middle">Tanggal</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top"><input name="tanggal" type="text" id="tanggal" size="35" maxlength="50" value="${tanggal}" /><input name="tanggalHidden" type="hidden" id="tanggal" size="35" maxlength="50" value="${tanggal}"/>
    <tr>
      <td align="left" valign="middle">Brand</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top"><input name="brand" type="text" id="brand" size="35" maxlength="50" value="${brand}"/></td>
    </tr>
    <tr>
      <td align="left" valign="middle">Vendor</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top"><input name="vendor" type="text" id="vendor" size="35" maxlength="50" value="${vendor}"/></td>
    </tr>
    <tr>
      <td align="left" valign="top">Remark</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><textarea name="remark">${remark}</textarea></td>
    </tr>
    <tr>
      <td align="left" valign="middle">Status</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top">
        <select name="status" id="status">
            <option value="aktif" ${status == "aktif" ? 'selected="selected"' : ""}>Aktif</option>
            <option value="nonaktif" ${status == "nonaktif" ? 'selected="selected"' : ""}>Non Aktif</option>
        </select>
      </td>
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
        <input type="submit" name="hapus" value="Hapus" onClick="return confirm('Are you sure you want to delete this item?');" />
        <input type="reset" name="reset" value="Reset"/>
      </td>
    </tr>
  </table>
        
        <table width="700" border="0" align="center" cellpadding="4" cellspacing="1">
<!--                    <tr>
                    <td colspan="6" align="right" valign="middle" scope="col"><font color="#000000" face="Tahoma, Geneva, sans-serif" size="2"><b><a href="index.jsp?go=Peminjaman_Tambah"><img src="Gambar/Tambah.png" width="32" height="32" title="Tambah Data" /></a></b></font></td>
                    </tr>-->
                    <tr>
                    <th width="10%" align="left" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Kode Kategori</font></th>
                    <th width="22%" align="left" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Kategori</font></th>
                    <th width="22%" align="left" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Tanggal</font></th>
                    <th width="19%" align="Center" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Vendor</font></th>  
                    <th width="6%" align="Center" scope="col" bgcolor="#66B2A8"><font color="#FFFFFF">Aksi</font></th>
                    </tr>

                    <%

                        String id = null;
                        String kategori = null;
                        String tanggal = null;
                        String vendor = null;


                        try {
                            Koneksi konek = new Koneksi();
                            Connection conn = konek.bukaKoneksi();
                            Statement stm = conn.createStatement();
//                            String sql = "SELECT a.kode_peminjaman as kode_peminjaman,a.tgl_pinjam,a.tgl_kembali, b.nama_peminjam as nama_peminjam, c.judul_buku as judul_buku FROM peminjamantbl a inner join peminjamtbl b on a.kode_peminjam = b.kode_peminjam inner join bukutbl c on a.kode_buku = c.kode_buku ORDER BY a.id DESC";
                            String sql = "SELECT * FROM kategori";
                            ResultSet res = stm.executeQuery(sql);
                            while (res.next()) {
                                id = res.getString("id");
                                kategori = res.getString("kategori");
                                tanggal = res.getString("tanggal");
                                vendor = res.getString("vendor");
                    %>
                   
                 <tr>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=id%></font></td>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=kategori%></font></td>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=tanggal%></font></td>
                    <th align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=vendor%></font></th>
                    <th align="Center" scope="col" bgcolor="#CCCCCC"> <a href="http://localhost:8080/Penjualan/KategoriController?idSelected=<%=id%>">Select</a></th> 
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