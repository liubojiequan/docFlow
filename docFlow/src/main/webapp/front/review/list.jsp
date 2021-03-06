<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<h1 class="page-header">审阅记录 - 查看</h1>

<!-- <a class="btn btn-xs btn-primary" href="/review/add"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;添加</a> -->
<table class="table table-striped table-bordered">
<tr>
	<th><input type="checkbox" onchange="toggleSelectAll(this,$('[name=selectRow]'));"/></th>
	
	
	<th>审阅时间</th>
	
	<th>审阅意见</th>
	
	<th>公文</th>
	
	<th>部门</th>
	
	<th>审阅状态</th>

	<th>数字证书（摘要）</th>
	
	<th>操作</th>
</tr>
	<c:forEach items="${data }" var="i">
<tr>
<td><input type="checkbox" checked="checked" name="selectRow"/></td>
	
	<td>
		<fmt:formatDate value="${i.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
		
	</td>
	
	<td>
		
		<c:out value="${i.remark}"></c:out>
	</td>
	
	<td>
		<a href="/document/detail?id=${i.doc_id}">查看公文</a>
	</td>
	
	<td>
		
		<c:out value="${i.dept_name}"></c:out>
	</td>
	
	<td>
		
		<span class="
		<c:if test="${i.state eq '同意' }">text-success</c:if>
		<c:if test="${i.state eq '不同意' }">text-danger</c:if>
		">
			<c:out value="${i.state}"></c:out>
		</span>
	</td>
	
	<td>
		<button class="btn btn-xs btn-primary" onclick="layer.msg($(this).next().html(), {time: 5000, icon:6,closeBtn:1});">查看签名</button>
		<div style="display: none;">
		  ${i.digest }
		</div>
	
		<c:if test="${i.verified }">
			<span class="glyphicon glyphicon-ok text-success">已认证</span>
		</c:if>
		<c:if test="${!i.verified }">
			<span class="glyphicon glyphicon-remove text-error">未认证</span>
		</c:if>
	</td>
	
	<td>
	<c:if test="${i.state eq '未处理' }">
	
		<button class="btn btn-xs btn-success" onclick="update(${i.id},true)">同意</button>
		<button class="btn btn-xs btn-default" onclick="update(${i.id},false)">不同意</button>
	</c:if>
	<c:if test="${i.state != '未处理' }">
		<a class="btn btn-xs btn-default btn-link" href="/review/sublevel?reviewId=${i.id }&docId=${i.doc_id}">移交下级</a>
	</c:if>
	</td>
</tr>
</c:forEach>
</table>
<div id="pager"></div>

<!-- Small modal -->



<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/layer/layer.js"></script>
<script type="text/javascript" src="/static/laypage/laypage.js"></script>
<script type="text/javascript">
$(function(){
	/* laypage({
	    cont: "pager",
	    pages: "${pager.pageCount}", 
	    curr: "${pager.pageNumber}", 
	    jump: function(e, first){ 
	        if(!first){ 
	            location.href = "?ps=${pager.pageSize}&pn="+e.curr;
	        }
	    }
	}); */
})
function toggleSelectAll(self,$sel){
	if(self.checked)
		$sel.each(function(){
			if(!this.checked) $(this).click();
		});
	else{
		$sel.each(function(){
			if(this.checked) $(this).click();
		});
	}
}

function del(id){
	if(confirm('确认删除此记录？'))
	$.post('/review/del',{
		id:id
	},function(data){
		if(data){
			alert('操作成功');location.reload();
		}
		else{
			alert('操作失败')
		}
	},'json');
}
function update(id,agree){
	var msg = "";
	if(msg = prompt('请在这里填下审阅意见',(agree?'':'不')+'同意')){
		
		$.post('/review/update_new',{
			id:id,
			state:(agree?'':'不')+'同意',
			remark:msg
		},function(data){
			if(data){
				location.reload();
			}
			else{
				alert('修改失败')
			}
		})
	}
}
function nextLevel(reviewId){
	
	$.post('/review/sublevel',{
		reviewId:reviewId
	},function(data){
		
	});
}
</script>
</body>
</html>