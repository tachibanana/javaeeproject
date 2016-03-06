
 <style>

.star{
    color: #ccc;
    cursor: pointer;
    transition: all 0.2s linear;
}
.star-checked{
    color: gold;
}
#result{
    display: none;
    color : green;
}
b.r{
    color: red;
}
b.g{
    color: green;
  }
 </style>
 
 <input type="hidden" value="HERE COME THE PRODUCT ID" id="product_id">
        <div id="star-container">
            <i class="fa fa-star fa-2x star" id="star-1"></i>
            <i class="fa fa-star fa-2x star" id="star-2"></i>
            <i class="fa fa-star fa-2x star" id="star-3"></i>
            <i class="fa fa-star fa-2x star" id="star-4"></i>
            <i class="fa fa-star fa-2x star" id="star-5"></i>
            <div id="result"></div>
        </div>
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>
    $(document).ready(function(){
        /*STAR RATING*/
     	var flagg = true;
        $('.star').on("mouseover",function(){
            //get the id of star
            if(flagg){
	            var star_id = $(this).attr('id');
	            switch (star_id){
	                case "star-1":
	                    $("#star-1").addClass('star-checked');
	                    break;
	                case "star-2":
	                    $("#star-1").addClass('star-checked');
	                    $("#star-2").addClass('star-checked');
	                    break;
	                case "star-3":
	                    $("#star-1").addClass('star-checked');
	                    $("#star-2").addClass('star-checked');
	                    $("#star-3").addClass('star-checked');
	                    break;
	                case "star-4":
	                    $("#star-1").addClass('star-checked');
	                    $("#star-2").addClass('star-checked');
	                    $("#star-3").addClass('star-checked');
	                    $("#star-4").addClass('star-checked');
	                    break;
	                case "star-5":
	                    $("#star-1").addClass('star-checked');
	                    $("#star-2").addClass('star-checked');
	                    $("#star-3").addClass('star-checked');
	                    $("#star-4").addClass('star-checked');
	                    $("#star-5").addClass('star-checked');
	                    break;
	            }
            }
        }).mouseout(function(){
            //remove the star checked class when mouseout
            if(flagg){
           		$('.star').removeClass('star-checked');
            }
        });
     
         
        $('.star').click(function(){
        	if(flagg == true){
        		flagg = false;
        	}else{
        		flagg = true;
        		$("#result").hide().attr("name" , "");
        		switch (star_id){
                case "star-1":
                    $("#star-1").addClass('star-checked');
                    break;
                case "star-2":
                    $("#star-1").addClass('star-checked');
                    $("#star-2").addClass('star-checked');
                    break;
                case "star-3":
                    $("#star-1").addClass('star-checked');
                    $("#star-2").addClass('star-checked');
                    $("#star-3").addClass('star-checked');
                    break;
                case "star-4":
                    $("#star-1").addClass('star-checked');
                    $("#star-2").addClass('star-checked');
                    $("#star-3").addClass('star-checked');
                    $("#star-4").addClass('star-checked');
                    break;
                case "star-5":
                    $("#star-1").addClass('star-checked');
                    $("#star-2").addClass('star-checked');
                    $("#star-3").addClass('star-checked');
                    $("#star-4").addClass('star-checked');
                    $("#star-5").addClass('star-checked');
                    break;
            }
        	}
            //get the stars index from it id
            var star_index = $(this).attr("id").split("-")[1],
                product_id = $("#product_id").val(), //store the product id in variable
                star_container = $(this).parent(), //get the parent container of the stars
                result_div = $("#result"); //result div
             
            $.ajax({
                url: "/FinalWK/star/rating",
                type: "POST",
                data: {star:star_index},
                beforeSend: function(){
                   // star_container.hide(); //hide the star container
                    result_div.show().html("Loading..."); //show the result div and display a loadin message
                },
                success: function(data){
                    result_div.html(data).attr("name" , data);
                }
            });
        });
     
    }); 
    
   </script>