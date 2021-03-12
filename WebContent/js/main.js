$(document).ready(function(){
	if($("#favArticle").length){
		$.ajax({
		   	url:"./favArticleAction.jsp",
		   	type:"POST",
		   	dataType:"JSON",
		   	success:function(data){
		   		var val = decodeURIComponent(data.result);
		   		$('#favList').html(val);
			}
	   });
	}
	
	if($("#view").length){
		$.ajax({
		   	url:"./viewAction.jsp",
		   	dataType:"json",
		 	data:{bbsID:bbsID},
		   	type:"POST",
		   	success:function(data){
		   		console.log(data.result);
			}
		});
	}
	
	if($("#board").length){
		//ajax로 보드 가져오기
	}
});