<style type="text/css">
    .main {
        margin-top: 5px;
        margin-left: 10px;
        margin-right: 10px;
        margin-bottom: 10px;
    }

    div.ui-datepicker{
        font-size:12px;
    }
</style> 

<link href="JQuery/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet">

<script src="JQuery/jquery-1.9.1.js"></script>
<script src="JQuery/jquery-ui-1.10.3.custom.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
				
        $("#tglpinjam").datepicker({
            showOn: "both", buttonImage: "Gambar/calendar.png", buttonImageOnly: true, changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd"});
	  
        $("#tglkembali").datepicker({
            showOn: "both", buttonImage: "Gambar/calendar.png", buttonImageOnly: true, changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd"}); 
	  			  
        function cari_peminjam(){
            var kodepeminjam=$("#kdpeminjamtxt").val();
            if(kodepeminjam!=""){
                $.ajax({
                    type:"post",
                    url:"cari_data.jsp",
                    data:"kodepeminjam="+kodepeminjam,
                    success:function(data){
                        $("#nmpeminjamtxt").val(data)
                    }
                });
            }                                   
        }  			
			
        function cari_buku(){
            var kodebuku=$("#kdbukutxt").val();
            if(kodebuku!=""){
                $.ajax({
                    type:"post",
                    url:"cari_data.jsp",
                    data:"kodebuku="+kodebuku,
                    success:function(data){
                        $("#judulbukutxt").val(data)
                    }
                });
            }                                   
        }  
				  
        $('#kdpeminjamtxt').change(function() {
            cari_peminjam();
            $('#kdbukutxt').focus()
        });				    
			                           
        $('#kdbukutxt').change(function() {
            cari_buku();
            $('#jmltxt').focus()
        });	
			  			  	
    });	
		

</script>


<div class="main">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
        <th align="left" scope="col"><font face="Tahoma, Geneva, sans-serif" color="#000000" size="3">TRANSAKSI PEMINJAMAN</font></th>
        </tr>
        <tr>
        <td><hr /></td>
        </tr>
        <tr>
        <td>
            <form id="form1" name="form1" method="post" action="PeminjamanController">
                <table width="400" border="0" align="left">
                    <tr>
                    <td width="40%" align="left" valign="middle">Kode Peminjaman</td>
                    <td width="2%" align="left" valign="middle">:</td>
                    <td width="68%" align="left" valign="top"><input name="kdpeminjamantxt" type="text" id="kdpeminjamantxt" size="5" maxlength="5" /></td>
                    </tr>
                    <tr>
                    <td align="left" valign="middle">&nbsp;</td>
                    <td align="left" valign="middle">&nbsp;</td>
                    <td align="left" valign="top"><hr /></td>
                    </tr>
                    <tr>
                    <td align="left" valign="middle">Kode Peminjam</td>
                    <td align="left" valign="middle">:</td>
                    <td align="left" valign="top"><input name="kdpeminjamtxt" type="text" id="kdpeminjamtxt" size="5" maxlength="5" /></td>
                    </tr>
                    <tr>
                    <td align="left" valign="middle">Nama Peminjam</td>
                    <td align="left" valign="middle">:</td>
                    <td align="left" valign="top"><input name="nmpeminjamtxt" type="text" id="nmpeminjamtxt" size="35" maxlength="35" readonly="readonly" /></td>
                    </tr>
                    <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top"><hr /></td>
                    </tr>
                    <tr>
                    <td align="left" valign="top">Kode Buku</td>
                    <td align="left" valign="top">:</td>
                    <td align="left" valign="top"><input name="kdbukutxt" type="text" id="kdbukutxt" size="5" maxlength="5" /></td>
                    </tr>
                    <tr>
                    <td align="left" valign="top">Judul Buku</td>
                    <td align="left" valign="top">:</td>
                    <td align="left" valign="top"><input name="judulbukutxt" type="text" id="judulbukutxt" size="35" maxlength="35" readonly="readonly" /></td>
                    </tr>
                    <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top"><hr /></td>
                    </tr>
                    <tr>
                    <td align="left" valign="top">Tgl Pinjam</td>
                    <td align="left" valign="top">:</td>
                    <td align="left" valign="middle">
                        <input name="tglpinjam" type="text" id="tglpinjam" value="" size="10" maxlength="10" readonly="readonly" />
                    </td>
                    </tr>
                    <tr>
                    <td align="left" valign="top">Tgl Kembali</td>
                    <td align="left" valign="top">:</td>
                    <td align="left" valign="middle">
                        <input name="tglkembali" type="text" id="tglkembali" value="" size="10" maxlength="10" readonly="readonly" />
                    </td>
                    </tr>
                    <tr>
                    <td align="left" valign="top">Catatan</td>
                    <td align="left" valign="top">:</td>
                    <td align="left" valign="top">
                    <textarea name="cattxt" cols="30" rows="3" id="cattxt"></textarea></td>
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
                        <input type="submit" name="Simpan" value="Simpan" />
                        <a href="index.jsp?go=Peminjaman">
                            <input type="button" value="Kembali" />
                        </a>
                    </td>
                    </tr>
                </table>
            </form>
        </td>
        </tr>
    </table>