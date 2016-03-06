$.getScript("new-script.js", function(){

   alert("Script loaded but not necessarily executed.");

});

$("#upload-image").click(function(){
	var json = null;
	var text = "";
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		json = convertToJSONFileFormatAtBack(listOfLayerAtBack[ctr].id);
		text = JSON.stringify(json);
		readLayerAtBack(JSON.parse(text));

		document.write(text);
	}
});

$("#save-file").click(function(){
	var json = null;
	var text = "";
	var front = "";
	var back = "";
	var shirt = color_shirt;
	var type = customType;
	var name = prompt("Name of your shirt :" , $("#shirt_name").html());
	var shirtId = $("#shirt_id").html();
	
	if(name == null){
		
	}else{
		if(name.trim() == "")
			name = "Untitled";
		
	setActionSort()
	
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		json = convertToJSONFileFormat(listOfLayer[ctr].id);
		text = JSON.stringify(json);
		front += (text + "@");
	}
	
	json = null;
	text = "";
	
	for(ctr1 = 0 ; ctr1 < listOfLayerAtBack.length ; ctr1 ++){
		
		json = convertToJSONFileFormatAtBack(listOfLayerAtBack[ctr1].id);
		text = JSON.stringify(json);
		back += (text + "@");
	}
	
		window.location.href = "http://localhost:8080/FinalWK/customize/save?front=" + front + "&back=" + back +"&shirt=" + shirt +"&name=" + name + "&type=" + type + "&shirt_id=" + shirtId;
	
	}
});


//Execution of code AND Events /////////////////////////////////////////////////////////////////////
$(document).ready(function(){
	//Set tabs
	$("#option-tabs").tabs();
	
	//Set slider
	$("#slider")
		.slider
		(
			{
				min : 12 ,
				max : 72
			}
		)
		
		.on
		(
			"slide" ,
			function(e , ui)
			{
				if(viewing == "front"){
					$("#current-px").html(ui.value + "px");
					if(activeLayer != null){
						if(activeLayer.type == "text"){
							updateLayerFontSize(activeLayer.id , ui.value + "px");
						}
					}
				}else{
					$("#current-px").html(ui.value + "px");
					if(activeLayerAtBack != null){
						if(activeLayerAtBack.type == "text"){
							updateLayerFontSizeAtBack(activeLayerAtBack.id , ui.value + "px");
						}
					}
				}
			}
	
		);
		
	//Image slider
	$("#image-size")
		.slider
		(
			{
				min: 50,
				max : 200
			}
		)
		.on
		(
			"slide" , 
			function(e , ui)
			{
				if(viewing == "front"){
					$("#image-size-value").html(ui.value);
					if(activeLayer != null){
						if(activeLayer.type == "clipart"){
							updateLayerImageSize(activeLayer.id , ui.value);
						}
					}
				}else{
					$("#image-size-value").html(ui.value);
					if(activeLayerAtBack != null){
						if(activeLayerAtBack.type == "clipart"){
							updateLayerImageSizeAtBack(activeLayerAtBack.id , ui.value);
						}
					}			
				}
			}
		);
		
	//SORTABLE LAYER
	 $( "#panel-item-list" )
		.sortable
		(
			{	
				//"axis" : "y" ,
				"containment":"document",
				"revert" : true ,
				"refreshPositions": false,
				stop : function(event , ui){
					setActionSort();
				}
			}
		
		);
		
	//SORTABLE LAYER
	 $( "#panel-item-list-back" )
		.sortable
		(
			{	
				//"axis" : "y" ,
				"containment":"document",
				"revert" : true ,
				"refreshPositions": false,
				stop : function(event , ui){
					setActionSortAtBack();
				}
			}
		
		);
		
    $( "#panel-item-list" ).disableSelection();
	$( "#panel-item-list-back").disableSelection();
	
	//ORDER INFO
	$("#order-info").draggable({containment:"document"});
	
	//back-view
			
		//createNewTextElement("hello");
		//createPanelLayerForNewElement();
		
	if(true){
		var front = $("#front-design").html();
		var back = $("#back-design").html();
		color_shirt = $("#shirt_color").html();
		var shirtId = $("#shirt_id").html();
		var myIds = new Array();
		var myIds2 = new Array();
		
		if(front.trim() != "" || back.trim() != "")
			customType = "update";
		else
			customType = "new";
		
		for(ctr = 0; ctr < front.split("@").length ; ctr ++){
			if(front.split("@")[ctr].trim() != ""){
				var text = front.split("@")[ctr];
				var obj = JSON.parse(text);
				readLayer(obj);
				myIds.push(obj.id);
			}
		}
		
		for(ctr = 0; ctr < myIds.length ; ctr++){
			readPanel(myIds[ctr]);
		}
		
		for(ctr = 0; ctr < back.split("@").length ; ctr ++){
			if(back.split("@")[ctr].trim() != ""){
				var text = back.split("@")[ctr];
				var obj = JSON.parse(text);
				readLayerAtBack(obj);
				myIds2.push(obj.id);
			}
		}
		
		
		for(ctre = 0; ctre < myIds2.length ; ctre ++){
			readPanelAtBack(myIds2[ctre]);
		}
		
		if(color_shirt == "white"){
			$("#shirt-viewer").css({"background-image" : "url(" + white_front + ")"});
		}else if(color_shirt == "green"){
			$("#shirt-viewer").css({"background-image" : "url(" + green_front + ")"});
		}else if(color_shirt == "red"){
			$("#shirt-viewer").css({"background-image" : "url(" + red_front + ")"});
		}else if(color_shirt == "blue"){
			$("#shirt-viewer").css({"background-image" : "url(" + blue_front + ")"});
		}
		
		myIds = null;
		myIds2 = null;

	}
	//SET CART PRICE
	setOrderInfoText(orderPrice(size , color , quantity));
	
});

//Double Click The Layer
$("#shirt-designer").on("dblclick" , "p , img" , function(){
	var id = $(this).attr("id");
	setSelectedLayer(id);

});

//CLICK Shirt Designer
$("#shirt-designer").click(function(){setSelectedLayerToReset();});

//CLICK Shirt Viewer
$("#shirt-viewer").click(function(){setSelectedLayerToReset();});	
//CHANGE SHIRT COLOR
$("#shirt-color li")
	.click
	(
		function()
		{
			$defaultSkyBlueColor = "assets/images/customizing/default-sky-blue-shirt.png";
			$defaultWhiteColor = "assets/images/customizing/default-white-shirt.png";
			$defaultAppleGreenColor = "assets/images/customizing/default-apple-green-shirt.png";
			$defaultAppleRedColor = "assets/images/customizing/default-apple-red-shirt.png";
			if(viewing == "front"){
				if($(this).attr("id") == "button-white"){
					$('#shirt-viewer').css({'background-image':'url(' + white_front +')'});
					color = 0.00;
					color_shirt = "white";
					setOrderInfoText(orderPrice(size , color , quantity));
				}else if($(this).attr("id") == "button-green"){
					$('#shirt-viewer').css({'background-image':'url(' + green_front +')'});
					color = 20.00;
					setOrderInfoText(orderPrice(size , color , quantity));
					color_shirt = "green";
				}else if($(this).attr("id") == "button-blue"){
					$('#shirt-viewer').css({'background-image':'url(' + blue_front +')'});
					color = 20.00;
					setOrderInfoText(orderPrice(size , color , quantity));
					color_shirt = "blue";
				}else if($(this).attr("id") == "button-red"){
					$('#shirt-viewer').css({'background-image':'url(' + red_front +')'});
					color = 20.00;
					setOrderInfoText(orderPrice(size , color , quantity));
					color_shirt = "red";
				}
			}else{
				if($(this).attr("id") == "button-white"){
					$('#shirt-viewer').css({'background-image':'url(' + white_back +')'});
					color = 0.00;
					color_shirt = "white";
					setOrderInfoText(orderPrice(size , color , quantity));
				}else if($(this).attr("id") == "button-green"){
					$('#shirt-viewer').css({'background-image':'url(' + green_back +')'});
					color = 20.00;
					setOrderInfoText(orderPrice(size , color , quantity));
					color_shirt = "green";
				}else if($(this).attr("id") == "button-blue"){
					$('#shirt-viewer').css({'background-image':'url(' + blue_back +')'});
					color = 20.00;
					setOrderInfoText(orderPrice(size , color , quantity));
					color_shirt = "blue";
				}else if($(this).attr("id") == "button-red"){
					$('#shirt-viewer').css({'background-image':'url(' + red_back +')'});
					color = 20.00;
					setOrderInfoText(orderPrice(size , color , quantity));
					color_shirt = "red";
				}
			}
		}
	);

//Add SHIRT DESIGNER Boder is WHEN HOVER
$("#shirt-designer").mouseenter(function(){
	$(this).addClass("shirt-designer");
});

//Add SHIRT DESIGNER Boder is WHEN HOVER
$("#shirt-designer").mouseleave(function(){
	$(this).removeClass("shirt-designer");
});

//Add SHIRT DESIGNER Boder is WHEN HOVER
$("#shirt-designer-back").mouseenter(function(){
	$(this).addClass("shirt-designer");
});

//Add SHIRT DESIGNER Boder is WHEN HOVER
$("#shirt-designer-back").mouseleave(function(){
	$(this).removeClass("shirt-designer");
});

//CHANGE LAYER TEXT FONT-FAMILY
$('#font-selector')
	.change
	(
		function()
		{
			if(viewing == "front"){
				if(activeLayer != null){
					updateLayerFontFamily(activeLayer.id , $(this).find('option:selected').text());
				}
			}else{
				if(activeLayerAtBack != null){
					updateLayerFontFamilyAtBack(activeLayerAtBack.id , $(this).find('option:selected').text());
				}
			}
		}
	);

//CHANGE LAYER TEXT FONT-COLOR	
$("#color-picker")
	.change
	(
		function()
		{
			if(viewing == "front"){
				if(activeLayer != null){
					updateLayerFontColor(activeLayer.id , $(this).val());
				}
			}else{
				if(activeLayerAtBack != null){
					updateLayerFontColorAtBack(activeLayerAtBack.id , $(this).val());
				}
			}
		}
	);
	
//ADD OR SAVE TEXT			
$("#add-text-item")
	.click
	(
		function()
		{	
			if($("#text-text-item").val().trim().length > 0){
				//EDIT EXISTING TEXT IF TEXT LAYER
		
				if(viewing == "front"){
					if(activeLayer != null){
						if(activeLayer.type == "text"){	
							updateLayerText(activeLayer.id , $("#text-text-item").val());
							updatePanelLayerText();
						
						}else{
							//CREATE A NEW TEXT 
							createNewTextElement($("#text-text-item").val());
							createPanelLayerForNewElement(activeLayer.id);
							
							//SET CART PRICE
							setOrderInfoText(orderPrice(size , color , quantity));							
								
						}
						
					//ADD NEW TEXT IF TEXT LAYER
					}else if(activeLayer == null){
						//CREATE A NEW TEXT 
						createNewTextElement($("#text-text-item").val());
						createPanelLayerForNewElement(activeLayer.id);
						//SET CART PRICE
						setOrderInfoText(orderPrice(size , color , quantity));
					}else{
						alert("Please insert a text..");
					}
				}else{
					if(activeLayerAtBack != null){
						if(activeLayerAtBack.type == "text"){	
							updateLayerTextAtBack(activeLayerAtBack.id , $("#text-text-item").val());
							updatePanelLayerTextAtBack();							
						}else{

							//CREATE A NEW TEXT 
							createNewTextElementAtBack($("#text-text-item").val());
							createPanelLayerForNewElementAtBack(activeLayerAtBack.id);
								
							//SET CART PRICE
							setOrderInfoTextAtBack(orderPriceAtBack(size , color , quantity));
															
						}
						
					//ADD NEW TEXT IF TEXT LAYER
					}else if(activeLayerAtBack == null){
							//CREATE A NEW TEXT 
							createNewTextElementAtBack($("#text-text-item").val());
							createPanelLayerForNewElementAtBack(activeLayerAtBack.id);
								
							//SET CART PRICE
							setOrderInfoTextAtBack(orderPriceAtBack(size , color , quantity));
					}else{
						alert("Please insert a text..");
					}
				
				}
			}
		}
	);

//SELECT ELEMENT BY CLICK LAYER PANEL	
$("#panel-item-list").on("click" , "li" , function(){
	var id = $(this).attr("id");
	setSelectedLayer(id);
	
});	

//CLICK REMOVE TO REMOVE PANEL AND ELEMENT			
$("#panel-item-list").on("click" , "li span + span " , function(){
		var retVal = confirm("Do you want to continue ?");
		if(retVal){		
			var id = $(this).attr("id");
			deleteElementLayerAndPanel(id);
			setSelectedLayerToReset();
			removeLayerById(id);
			
			//SET CART PRICE
			setOrderInfoText(orderPrice(size , color , quantity));
		}
	});			

//CLICK ADD NEW CLIPART	
$("#clipart-container tr td img")
	.dblclick
	(
		function()
		{
			var image = $(this).attr("src");
	
			if(viewing == "front"){
				setSelectedLayerToReset();
				createNewClipartElement(image);
				createPanelLayerForNewElement(activeLayer.id);
			
				//SET CART PRICE
				setOrderInfoText(orderPrice(size , color , quantity));
			}else{
				setSelectedLayerToResetAtBack();
				createNewClipartElementAtBack(image);
				createPanelLayerForNewElementAtBack(activeLayerAtBack.id);
			
				//SET CART PRICE
				setOrderInfoTextAtBack(orderPriceAtBack(size , color , quantity));
			
			}
		}
	);

//SIZE PRICING OPTION	
$("#size-list-option")
	.change
	(
		function()
		{
			if($(this).val() == "XS"){
				size = 80;
				setOrderInfoText(orderPrice(size , color , quantity));
			}else if($(this).val() == "S"){
				size = 90;
				setOrderInfoText(orderPrice(size , color , quantity));
			}else if($(this).val() == "M"){
				size = 100;
				setOrderInfoText(orderPrice(size , color , quantity));
			}else if($(this).val() == "L"){
				size = 110;
				setOrderInfoText(orderPrice(size , color , quantity));
			}else if($(this).val() == "XL"){
				size = 120;
				setOrderInfoText(orderPrice(size , color , quantity));
			}

		}
	);
	
$("#color-list-parent input")
	.click
	(
		function()
		{
			//updateClipartColor($(this).css("background-color"));
			updateVerticalToCenter();
		}
	);

//BUTTON VERTICAL
$("#btnVertical").click(function(){
	if(viewing == "front"){
		updateVerticalToCenter();
	}else{
		updateVerticalToCenterAtBack();
	}
});	

//BUTTON HORIZONTAL
$("#btnHorizontal").click(function(){
	if(viewing == "front"){
		updateHorizontalToCenter();
	}else{
		updateHorizontalToCenterAtBack();
	}
});	

//BUTTON VERTICAL AND VERTICAL
$("#btnVH").click(function(){
	
	if(viewing == "front"){
		updateVerticalToCenter();
		updateHorizontalToCenter();
	}else{
		updateVerticalToCenterAtBack();
		updateHorizontalToCenterAtBack();
	}
});	

//updateClipartPostion
$("#btnNav button").click(function(){
	var id = $(this).attr("id");
	
	if(viewing == "back"){
		if(id == "btnLeft"){
			updateClipartPostionAtBack("left");
		}else if(id == "btnUp"){
			updateClipartPostionAtBack("top");
		}else if(id == "btnRight"){
			updateClipartPostionAtBack("right");
		}else if(id == "btnDown"){
			updateClipartPostionAtBack("down");
		}
	}else{
		if(id == "btnLeft"){
		updateClipartPostion("left");
		}else if(id == "btnUp"){
			updateClipartPostion("top");
		}else if(id == "btnRight"){
			updateClipartPostion("right");
		}else if(id == "btnDown"){
			updateClipartPostion("down");
		}
	}

});

//Rotate
$("#btnRotate").click(function(){
	if(viewing == "front"){
		rotateElementByInput($("#ex1").val());
	}else{
		rotateElementByInputAtBack($("#ex1").val());
	}
});


//FRONT TO BACK , BACK TO FRONT
$("#tae")
	.click
	(
		function()
		{
			if(viewing == "front"){
				$("#shirt-designer").hide();
				$("#shirt-designer-back").show();
				
				$("#panel-item-list").hide();
				$("#panel-item-list-back").show();
				setSelectedLayerToReset();
			
				viewing = "back";
				
				if(color_shirt == "white"){
					$("#shirt-viewer").css({"background-image" : "url(" + white_back + ")"});
				}else if(color_shirt == "green"){
					$("#shirt-viewer").css({"background-image" : "url(" + green_back + ")"});
				}else if(color_shirt == "red"){
					$("#shirt-viewer").css({"background-image" : "url(" + red_back + ")"});
				}else if(color_shirt == "blue"){
					$("#shirt-viewer").css({"background-image" : "url(" + blue_back + ")"});
				}
				$(this).html("Front");
			}else{
				$("#shirt-designer").show();
				$("#shirt-designer-back").hide();
				
				setSelectedLayerToResetAtBack();
				$("#panel-item-list").show();
				$("#panel-item-list-back").hide();
				
				viewing = "front";
				if(color_shirt == "white"){
					$("#shirt-viewer").css({"background-image" : "url(" + white_front + ")"});
				}else if(color_shirt == "green"){
					$("#shirt-viewer").css({"background-image" : "url(" + green_front + ")"});
				}else if(color_shirt == "red"){
					$("#shirt-viewer").css({"background-image" : "url(" + red_front + ")"});
				}else if(color_shirt == "blue"){
					$("#shirt-viewer").css({"background-image" : "url(" + blue_front + ")"});
				}
				$(this).html("Back");
			}
		}
	);

	//SELECT ELEMENT BY CLICK LAYER PANEL	
$("#panel-item-list-back").on("click" , "li" , function(){
	var id = $(this).attr("id");
	setSelectedLayerAtBack(id);
	
});	

//CLICK REMOVE TO REMOVE PANEL AND ELEMENT			
$("#panel-item-list-back").on("click" , "li span + span " , function(){
		var retVal = confirm("Do you want to continue ?");
		if(retVal){		
			var id = $(this).attr("id");
			deleteElementLayerAndPanel(id);
			setSelectedLayerToResetAtBack();
			removeLayerByIdAtBack(id);
			
			//SET CART PRICE
			setOrderInfoText(orderPrice(size , color , quantity));
		}
	});	

//////////////////////////////////////////////////////////////////////////////////////////////////
//Double Click The Layer
$("#shirt-designer-back").on("dblclick" , "p , img" , function(){
	var id = $(this).attr("id");
	setSelectedLayerAtBack(id);
});

//CLICK Shirt Designer
$("#shirt-designer-back").click(function(){setSelectedLayerToResetAtBack();});

//CLICK Shirt Viewer
$("#shirt-viewer").click(function(){setSelectedLayerToReset(); setSelectedLayerToResetAtBack();});	

//Button reverse
$("#btnReverse").click(function(){
	if(viewing == "front"){
		var rot = activeLayer.rotation + 180;
		rotateElementByInput(rot);
	}else{
		var rot = activeLayerAtBack.rotation + 180;
		rotateElementByInputAtBack(rot);
	}
});

$("#btnRot").click(function(){
	if(viewing == "front"){
		var rot = activeLayer.rotation + 20;
		rotateElementByInput(rot);
	}else{
		var rot = activeLayerAtBack.rotation + 20;
		rotateElementByInputAtBack(rot);
	}
});