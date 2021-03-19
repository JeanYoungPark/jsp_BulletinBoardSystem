$(document).ready(function(){
	//메인
	if($("#favArticle").length){
		$.ajax({
		   	url:"./favArticleAction.jsp",
		   	dataType:"JSON",
		   	type:"POST",
		   	success:function(data){
		   		var val = data.result;
		   		$('#favList').html(val);
			}
	   });
	}
	
	//게시글 보기
	if($("#view").length){
		$.ajax({
		   	url:"./viewAction.jsp",
		   	dataType:"JSON",
		 	data:{bbsID:bbsID},
		   	type:"POST",
		   	success:function(data){
		   		console.log(data.result);
			}
		});
	}
	
	//회원정보수정
	if($("#userModify").length){
		$("input[name='image']").on("change",function(){
			$("form[name='imageUpload']").submit();
		});
	}
});