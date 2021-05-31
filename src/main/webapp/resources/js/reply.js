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
		});
	}
		function remove(guestbno, guestwriter, callback, error){
		
		$.ajax({
			type : 'delete',
			url : '/guestreply/' + guestbno,
			data : JSON.stringify({guestbno:guestbno, guestwriter:guestwriter}),
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
	
	function update(guestreply, callback, error){
		
		$.ajax({ 
			type : 'put',
			url : '/guestreply/' + guestreply.gusetbno,
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
		});
	}
	
	function get(guestbno, callback, error){
		
		$.get("/guestreply/" + guestbno + ".json", function(result){
			
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	return {add : add, 
			remove : remove,
			update : update,
			get : get};
})();