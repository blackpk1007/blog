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
	
	return {list : list};
})();