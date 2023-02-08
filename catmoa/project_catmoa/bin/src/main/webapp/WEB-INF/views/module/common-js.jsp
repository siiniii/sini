<%@ page language="java" 
		 contentType="text/html; charset=UTF-8"
   		 pageEncoding="UTF-8"%>

	<script src="/project_catmoa/resources/assets/js/main.min.js"></script>
	<script src="/project_catmoa/resources/assets/js/script.js"></script>
	<script src="/project_catmoa/resources/assets/js/strip.pkgd.min.js"></script>
	
	<script type="text/javascript">
		$(function() {
			$('#mypage-Timeline').on('click',function(event){
				location.href="/project_catmoa/mypage-Timeline";
			})
		});
		
		$(function() {
			$('#adminMain').on('click',function(event){
				location.href="/project_catmoa/admins/adminMain";
			})
		});
		
		$(function() {
			
			if($('.right-sidebar').length > 0) {
				$.ajax({
		    		"url": "donate-rank",
		    		"method": "get",
		    		"success": function(data, status, xhr) {
		    			
		    			const lis = $('ul.donate-rank li');
		    			/* lis.each(function (idx,li){
		    				$(li).find('.nic').text(data[idx].nic);
		    				$(li).find('.sum').text(data[idx].sum);
		    			}); */
						$.each(data, function (idx, d){
							$(lis[idx]).find('.memberImg').text(d.memberImg);
							$(lis[idx]).find('.nic').text(d.nic);
							$(lis[idx]).find('.sum').text(d.sum);
						});
		    			
		    		},
		    		"error": function(xhr, status, err) {
		    			alert(status);
		    		}
		    		
		    	});
			}
			
		});

	</script>
	