<form bind=".table-sort" action="" method="POST">
	<div class="fl">
		<input name="" type="checkbox" value="" rel="parent" id="checkall">
		<label for="checkall">全选</label>
		<button type="button" isconfirm="1" onclick='subform()'>批量删除</button>
	</div>
</form>	
<script type="text/javascript">
function subform(){
	Util.MsgBox.Confirm({text:"确认要批量删除吗？",title:"提示",type:"warm",
		callback:function(r){
			if(r)$('#form1').submit();
		}
	});
}
</script>