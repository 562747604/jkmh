
function rightToUrl(msg, url) {
	swal({
		title : "",
		text : msg,
		type : "",
		showCancelButton : true,
		closeOnConfirm : false,
		showLoaderOnConfirm : true
	}, function() {
		location.reload();
	});
}
function parentconfrimToUrl(msg, url) {
	swal({
		title : "",
		text : msg,
		type : "",
		showCancelButton : true,
		closeOnConfirm : false,
		showLoaderOnConfirm : true
	}, function() {
		parent.location.reload();
	});
}
function pRightToUrl(msg, url) {
	swal({
		title : "",
		text : msg,
		type : "",
		showCancelButton : true,
		closeOnConfirm : false,
		showLoaderOnConfirm : true,
	}, function() {
		location.reload();
	});
}
function right(msg) {//弹出信息事件
	swal({
		title : "",
		text : msg,
		type : "",
		showCancelButton : false,
		closeOnConfirm : false,
		showLoaderOnConfirm : true,
	}, function() {
		location.reload();
	});
}
function right1(msg) {//弹出信息事件
	swal({
		title : "",
		text : msg,
		type : "",
		showCancelButton : false,
		closeOnConfirm : false,
		showLoaderOnConfirm : true,
	}, function() {
		swal.close();
	});
}
function noRight(msg) {//弹出信息事件
	swal(msg);
}
function del(url,tblname) {
	var ids="";
	var row=$.map($("#rsTab").bootstrapTable('getSelections'),function(row){
		return row ;
		});
	for(var i=0;i<row.length;i++){
		if(ids==""){
			ids=row[i].id;
		}else{
			ids=ids+","+row[i].id;
		}
	}

	if(ids==""){
		right("请选择要删除的数据!");return false;
	}
	//alert(url);
	//alert(tblname);
	//alert(ids);
	swal({
		title : "",
		text : "删除后无法还原,确定删除么?",
		type : "",
		showCancelButton : true,
		closeOnConfirm : false,
		showLoaderOnConfirm : true,
	}, function() {	
	    	$.ajax({
                cache: false,
                type: "get",
                dataType: "Json",
                url: url,
                data: {
                    type: "sxrs",
                    tblname:tblname,
                    id: ids,
                    time: Math.random()
                },
                success: function (data)
                {
                	right("删除成功!");
                },
                error:function(data){
                	right("删除失败!");
                }
            });
	});
    
}
function sx() {//筛选按钮方法
	$('#sxModel').modal();
}

function sx(url,tblname) {//筛选按钮方法
	
	//alert(url);
	//alert(tblname)
	var obj=document.getElementsByName('sxck'); 
	var s='';
	for(var i=0; i<obj.length; i++){
	if(obj[i].checked) 
		s+=obj[i].value+','; //如果选中，将value添加到变量s中
	} 
	$.ajax({
        cache: false,
        type: "post",
        dataType: "Json",
        url: url,
        data: {
            type: "sx",
            tblname: tblname,
            field:s,
            time: Math.random()
        },
        success: function (data)
        {
        	var t = eval(data);
        	document.getElementById("sxtd").innerHTML=t.msg;
        }
    });
	$('#sxModel').modal();
}

function doSx(url,tblname){//新增保存方法
//	alert(url)
	
	var id = "[";
    var chkother = document.getElementsByName("sxck");
    for (var i = 0; i < chkother.length; i++)
    {
        if (chkother[i].checked == true)
        {
            if (id == "[")
            {
                id += "\""+chkother[i].value+"\"";
            } else
            {
                id += ",\"" + chkother[i].value+"\"";
            }
        }
    }
    id+="]";
    
    if (id == "[]")
    {
        right("请选择要显示的选项");
    } else
    {
    	$.ajax({
            cache: false,
            type: "get",
            dataType: "Json",
            url: url,
            data: {
                tblname:tblname,
                clickColumn: id,
                time: Math.random()
            },
            success: function (data)
            {
                $('#sxModel').modal('hide');
            	right("保存成功!");
            },
            error:function(data){
            	right("保存失败!");
            }
        });
    }
}

function reset(){
	window.location.href="${ctx}/sys/organ?tableName=s_organ";
}
function search(){
	$('#rsTab').bootstrapTable('refresh');
}

function sxstr(str){
 var	t='[';
	var c=str.split(',');
	for(var i=0;i<c.length;i++){
		if(c[i]!=""){
		if(t=="["){
			if(c[i].split('-')[1]=="1"||c[i].split('-')[1]=="3"){
				if(c[i].split('-')[0]!=document.getElementById(c[i].split('-')[0]).value&&document.getElementById(c[i].split('-')[0]).value!=""){
			    t=t+"{\"type\":\""+c[i].split('-')[1]+"\",\"enname\":\""+c[i].split('-')[0]+"\",\"cnname\":\""+document.getElementById(c[i].split('-')[0]).value+"\"}";
				}
			}else{
				if(document.getElementById(c[i].split('-')[0]+"1").value!=""&&document.getElementById(c[i].split('-')[0]+"2").value!=""){
				t=t+"{\"type\":\""+c[i].split('-')[1]+"\",\"enname\":\""+c[i].split('-')[0]+"\",\"cnname\":\""+document.getElementById(c[i].split('-')[0]+"1").value+"|"+document.getElementById(c[i].split('-')[0]+"2").value+"\"}";
				}
			}
		}else{
			if(c[i].split('-')[1]=="1"||c[i].split('-')[1]=="3"){
				if(c[i].split('-')[0]!=document.getElementById(c[i].split('-')[0]).value&&document.getElementById(c[i].split('-')[0]).value!=""){
			    t=t+","+"{\"type\":\""+c[i].split('-')[1]+"\",\"enname\":\""+c[i].split('-')[0]+"\",\"cnname\":\""+document.getElementById(c[i].split('-')[0]).value+"\"}";
				}
			}else{
				if(document.getElementById(c[i].split('-')[0]+"1").value!=""&&document.getElementById(c[i].split('-')[0]+"2").value!=""){
				t=t+","+"{\"type\":\""+c[i].split('-')[1]+"\",\"enname\":\""+c[i].split('-')[0]+"\",\"cnname\":\""+document.getElementById(c[i].split('-')[0]+"1").value+"|"+document.getElementById(c[i].split('-')[0]+"2").value+"\"}";
				}
			}
		}
	 }
	}
	if(c.length>0){
		t=t+"]";
	}
	if(t=="["||t=="[]"){
		t="";
	}
	return t;
}

function selChange(id){
    var objS = document.getElementById(id);
   if (objS.selectedIndex==0)
	{
	     objS.style.cssText = "color:#999999;";	
	}
	else
	{
		objS.style.cssText = "color:#000000;";	
		
	}
 
         }

function ck(id){
	if(document.getElementById(id).checked==true){
	document.getElementById(id).checked="";
}else{
	document.getElementById(id).checked="checked";
}
}
