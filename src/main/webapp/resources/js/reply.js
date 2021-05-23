/**
 * 
 */

var userService = (function(){
	
	function list(param, callback, error){
		console.log("list : ");
		
		var boardwriter = param.boardwriter;
		var page = param.page || 1;
		
		$.getJSON("/" + boardwriter + "/list" + page + ".json", 
			function(data){
				if(callback){
					callback(data);
				}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	
	function add(guestreply, callback, error){
		console.log("add reply............");
		
		$.ajax({
			type : 'post',
			url : '/guestreply/register',
			data : JSON.stringify(guestreply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
		function remove(rno, replyer, callback, error){
		
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			data : JSON.stringify({rno:rno, replyer:replyer}),
			contentType : "application/json; charset=utf-8",
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function update(reply, callback, error){
		
		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	return {list : list};
})();