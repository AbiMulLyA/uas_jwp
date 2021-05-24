
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
				
        $("#tanggal_pembelian").datepicker({
            showOn: "both", buttonImage: "Gambar/calendar.png", buttonImageOnly: true, changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd"});
    });	
		

</script>

<div class="main">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<th align="left" scope="col"><font face="Tahoma, Geneva, sans-serif" color="#000000" size="3">DATA TRANSAKSI</font></th>
        </tr>
	<tr>
	  <td><hr /></td>
        </tr>
	<tr>
	<td>
            <center><h2>${pesan}</h2></center>
          
<form id="form1" name="form1" method="post" action="TransaksiController">
  <table width="400" border="0" align="left">
    <tr>
      <td width="30%" align="left" valign="middle">Kode Transaksi</td>
      <td width="2%" align="left" valign="middle">:</td>
      <td width="68%" align="left" valign="top">
          <input name="kode_transaksi" type="text" id="kode_transaksi" size="5" maxlength="5" value="${kode_transaksi}" />
          <input type="submit" name="cari" value="Cari"  />
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">Nama Costumer</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top">
      <select name="nama_costumer" id="kategori">
            <option value="kosong">--Pilih--</option>
        <%
            String nama = null;
           // request.getAttribute("kategoriProduk");
            try {
                    Koneksi konek = new Koneksi();
                    Connection conn = konek.bukaKoneksi();
                    Statement stm = conn.createStatement();
        //          String sql = "SELECT a.kode_peminjaman as kode_peminjaman,a.tgl_pinjam,a.tgl_kembali, b.nama_peminjam as nama_peminjam, c.judul_buku as judul_buku FROM peminjamantbl a inner join peminjamtbl b on a.kode_peminjam = b.kode_peminjam inner join bukutbl c on a.kode_buku = c.kode_buku ORDER BY a.id DESC";
                    String sql = "SELECT * FROM costumer";
                    ResultSet res = stm.executeQuery(sql);
                    while (res.next()) {
                        nama = res.getString("nama");
        %>
            <option value="<%=nama%>"><%=nama%></option>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
        %>
      </select>
      ${nama_costumer}
      <input type="hidden" name="costumerHidden" value="${nama_costumer}">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">Produk</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top">
          <select name="produk" id="kategori">
            <option value="kosong">--Pilih--</option>
        <%
            String nama_produk = null;
           // request.getAttribute("kategoriProduk");
            try {
                    Koneksi konek = new Koneksi();
                    Connection conn = konek.bukaKoneksi();
                    Statement stm = conn.createStatement();
        //          String sql = "SELECT a.kode_peminjaman as kode_peminjaman,a.tgl_pinjam,a.tgl_kembali, b.nama_peminjam as nama_peminjam, c.judul_buku as judul_buku FROM peminjamantbl a inner join peminjamtbl b on a.kode_peminjam = b.kode_peminjam inner join bukutbl c on a.kode_buku = c.kode_buku ORDER BY a.id DESC";
                    String sql = "SELECT * FROM produk";
                    ResultSet res = stm.executeQuery(sql);
                    while (res.next()) {
                        nama_produk = res.getString("nama_produk");
        %>
            <option value="<%=nama_produk%>"><%=nama_produk%></option>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
        %>
      </select>
      ${produk}
      <input type="hidden" name="produkHidden" value="${produk}">
      </td>
    <tr>
      <td align="left" valign="middle">Qty</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top"><input name="qty" type="text" id="brand" size="35" maxlength="50" value="${qty}"/></td>
    </tr>
    <tr>
      <td align="left" valign="middle">Harga</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top"><input name="harga" type="text" id="vendor" size="35" maxlength="50" value="${harga}"/></td>
    </tr>
    <tr>
      <td align="left" valign="top">Tanggal Pembelian</td>
      <td align="left" valign="top">:</td>
      <td align="left" valign="top"><input type="text" name="tanggal_pembelian" id="tanggal_pembelian" value="${tanggal_pembelian}"></td>
    </tr>
    <tr>
      <td align="left" valign="middle">Status</td>
      <td align="left" valign="middle">:</td>
      <td align="left" valign="top">
        <select name="status" id="status">
            <option value="Lunas" ${status == "Lunas" ? 'selected="selected"' : ""}>Lunas</option>
            <option value="Belum Lunas" ${status == "Belum Lunas" ? 'selected="selected"' : ""}>Belum Lunas</option>
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
                    <th width="10%" align="left" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Kode Transaksi</font></th>
                    <th width="22%" align="left" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Nama Costumer</font></th>
                    <th width="22%" align="left" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Produk</font></th>
                    <th width="19%" align="Center" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Harga</font></th>  
                    <th width="19%" align="Center" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Status</font></th>  
                    <th width="6%" align="Center" scope="col" bgcolor="#66B2A8"><font color="#FFFFFF">Aksi</font></th>
                    </tr>

                    <%

                        String kode_transaksi = null;
                        String nama_costumer = null;
                        String produk = null;
                        String harga = null;
                        String status = null;


                        try {
                            Koneksi konek = new Koneksi();
                            Connection conn = konek.bukaKoneksi();
                            Statement stm = conn.createStatement();
//                            String sql = "SELECT a.kode_peminjaman as kode_peminjaman,a.tgl_pinjam,a.tgl_kembali, b.nama_peminjam as nama_peminjam, c.judul_buku as judul_buku FROM peminjamantbl a inner join peminjamtbl b on a.kode_peminjam = b.kode_peminjam inner join bukutbl c on a.kode_buku = c.kode_buku ORDER BY a.id DESC";
                            String sql = "SELECT * FROM transaksi";
                            ResultSet res = stm.executeQuery(sql);
                            while (res.next()) {
                                kode_transaksi = res.getString("kode_transaksi");
                                nama_costumer = res.getString("nama_costumer");
                                produk = res.getString("produk");
                                harga = res.getString("harga");
                                status = res.getString("status");
                    %>
                   
                 <tr>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=kode_transaksi%></font></td>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=nama_costumer%></font></td>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=produk%></font></td>
                    <th align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=harga%></font></th>
                    <th align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=status%></font></th>
                    <th align="Center" scope="col" bgcolor="#CCCCCC"> <a href="http://localhost:8080/Penjualan/TransaksiController?kodeSelected=<%=kode_transaksi%>">Select</a></th> 
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