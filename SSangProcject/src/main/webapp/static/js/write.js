/**
 * 
 */
 
 $(document).ready(function(){
    $('.ac-button').on('click',function(){
		
        var part = $(this).data("key");
        location.href="qusans_write.jsp?part="+part; 
    });
    
    $("#cancle").on("click",function(){
		location.href="questions.jsp";	
});
   $("#enroll").on("click",function(){
		document.writef.submit();
}) ;



});