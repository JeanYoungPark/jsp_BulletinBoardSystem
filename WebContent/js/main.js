$(document).ready(function(){
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
});