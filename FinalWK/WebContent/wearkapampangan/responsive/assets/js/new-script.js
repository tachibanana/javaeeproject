var activeLayer = null;
var activeLayerAtBack = null;

var listOfLayer = new Array();
var listOfLayerAtBack = new Array();

var templList = new Array();
var templListAtBack = new Array();

var shirt = 0.00;
var size = 80.00;
var color = 0.00;
var quantity = 1;
var color_shirt = "white";
var customType = "new";

var viewing = "front";
var white_front = "assets/images/customizing/default-white-shirt.png";
var white_back = "assets/images/customizing/default-white-shirt-back.png";

var green_front = "assets/images/customizing/default-apple-green-shirt.png";
var green_back = "assets/images/customizing/default-apple-green-shirt-back.png";

var red_front = "assets/images/customizing/default-apple-red-shirt.png";
var red_back = "assets/images/customizing/default-apple-red-shirt-back.png";

var blue_front = "assets/images/customizing/default-sky-blue-shirt.png";
var blue_back = "assets/images/customizing/default-sky-blue-shirt-back.png";

var draggablePanel = null;
var droppablePanel = null;

//Layer Object
function Layer(id , element , index , type , price , rotation){
	this.id = id;
	this.element = element;
	this.index = index;
	this.type = type;
	this.price = price;
	this.rotation = rotation || 0;
}

//Remove Layer Object in Array
function removeLayerById(id){
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		if(listOfLayer[ctr].id == id){
			listOfLayer.splice(ctr , 1);
			break;
		}
	}
}

//Add Layer Object in Array
function addNewLayer(id , element , index , type , price , rotation){
	var layer = new Layer(id , element , index , type , price , rotation);
	listOfLayer.push(layer);
}

//Update Layer Object Text
function updateLayerText(id , text){
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		if(listOfLayer[ctr].id == id){
			listOfLayer[ctr].element.innerHTML = text;
			break;
		}
	}
}

//Update Layer Object FontFamily
function updateLayerFontFamily(id , font){
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		if(listOfLayer[ctr].id == id){
			$(listOfLayer[ctr].element).css("font-family", font);
			break;
		}
	}
}

//Update Layer Object FontSize
function updateLayerFontSize(id , size){
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		if(listOfLayer[ctr].id == id){
			$(listOfLayer[ctr].element).css("font-size", size);
			break;
		}
	}
}

//Update Layer Object FontColor
function updateLayerFontColor(id , color){
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		if(listOfLayer[ctr].id == id){
			$(listOfLayer[ctr].element).css("color", color);
			break;
		}
	}
}

//Add New Element on Shirt Designer
function createNewTextElement(text){
	var id = (Math.floor((Math.random() * 100) + 1)) + "" + (Math.floor((Math.random() * 100) + 1)) + "" + (Math.floor((Math.random() * 100) + 1));
	var element = document.createElement("p");
	var index = 0;
	var type = "text";
	var price = 50;
	
	element.setAttribute("id" , id);
	
	
	$(element).css(
		{
			"display":"inline-block",
			"position" : "relative",
			"font-size" : "12px"
		}
	)
	.draggable(
		{
			containment:"#shirt-viewer",
			cursor: "pointer"
		}
	).html(text);
	
	$("#shirt-designer").append(element);
	addNewLayer(id , element , index , type , price);
	setSelectedLayerToReset();
	setSelectedLayer(id);
	
	
	//SET POSITION TO CENTER
	updateVerticalToCenter();
	updateHorizontalToCenter();
}



//Add New Clip Art Element in Shirt Designer
function createNewClipartElement(image){
	
	
	var id = (Math.floor((Math.random() * 100) + 1)) + "" + (Math.floor((Math.random() * 100) + 1)) + "" + (Math.floor((Math.random() * 100) + 1));
	var element = document.createElement("img");
	var index = 0;
	var type = "clipart";
	var price = 80;
	
	element.setAttribute("id" , id);
	
	$(element)
		.css
		(
			{
				"display":"inline-block",
				"position" : "relative",
				"width" : "50px",
				"height" : "50px",
				"background-image" : 'url(' + image +')',
				"background-size": "100% 100%",
				"background-repeat" : "no-repeat"
			}
		)
		.attr
		(
			{
				"src" : image
			}
		)
		
		.draggable
		(
			{
					containment:"#shirt-viewer",
					cursor: "pointer"
			}
		);
		
		$("#shirt-designer").append(element);
		addNewLayer(id , element , index , type , price);
		setSelectedLayerToReset();
		setSelectedLayer(id);
		
		//SET POSITION TO CENTER
		updateVerticalToCenter();
		updateHorizontalToCenter();
}

//Set the selection element
function setSelectedLayer(id){
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
	
		$(listOfLayer[ctr].element).removeClass("shirt-designer");
		if(listOfLayer[ctr].id == id){
			var layer = listOfLayer[ctr];
			activeLayer = layer;
			if(layer.type == "text"){
				//SET ACTIVE LAYER
				var index = -1;
				//ADD BORDERS
				$(layer.element).addClass("shirt-designer");
				//EDIT PANEL DISPLAY TO BLOCK
				$("#edit-panel").css("display" , "block");
				//SET SLIDER VALUE
				$("#slider").slider("value" , $(layer.element).css("font-size").replace("px" ,""));
				//SET THE FONT-SIZE DISPLAY
				$("#current-px").html($(layer.element).css("font-size"));
				//SET BUTTON TEXT TO SAVE
				$("#add-text-item").html("Save Text");
				//SET TEXT AREA VALUE TO ELEMENT TEXT
				$("#text-text-item").val($(layer.element).html());
				//SET FONT-COLOR
				$("#color-picker").val(rgb2hex($(layer.element).css("color")));
				//SET FONT-FAMILY
				$("#font-selector option")
					.each
					(
						function()
						{
							index += 1;
							if($(this).val() == $(layer.element).css("font-family").replace("\'" ,"").replace("\'" ,"")){
								$("#font-selector").val($(this).val());
							};
						}
					);
			$( "#option-tabs" ).tabs({ active : 2 });
			}else if(layer.type == "clipart"){
				//SET ACTIVE LAYER
				//activeLayer = layer;
				//ADD BORDERS
				$(layer.element).addClass("shirt-designer");
				//EDIT PANEL DISPLAY TO BLOCK
				$("#edit-panel")
					.css
					(
						{
							"display" : "block" , 
							"position" : "relative"
						}
					);
				//SET SLIDER IMAGE VALUE
				$("#image-size").slider("value" , $(layer.element).css("width").replace("px" ,""));
				//SET THE FONT-IMAGE DISPLAY
				$("#image-size-value").html($(layer.element).css("width").replace("px" , ""));
				//SET POSITION
				$( "#option-tabs" ).tabs({ active : 1 });
			}
		}
	}
}


//Convert RBG To Hex
function rgb2hex(rgb) {
    rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
    function hex(x) {
        return ("0" + parseInt(x).toString(16)).slice(-2);
    }
	
    return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}

//Set Not SelectedLayer
function setSelectedLayerToReset(){
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		//SET BORDERS
		$(listOfLayer[ctr].element).removeClass("shirt-designer");
		$(listOfLayer[ctr].element)
			.css
			(
				{
					"position" : "absolute",
				}
			);
			
	}
	//SET ACTIVE LAYER TO NULL
	activeLayer = null;
	//EDIT PANEL DISPLAY TO BLOCK
	$("#edit-panel").css("display" , "none");
	//SET SLIDER VALUE
	$("#slider").slider("value" , "12");
	//SET SLIDER IMAGE VALUE
	$("#image-size").slider("value" , "50");
	//SET THE IMAGE-SIZE DISPLAY
	$("#image-size-value").html("50");
	//SET THE FONT-SIZE DISPLAY
	$("#current-px").html("12px");
	//SET BUTTON TEXT TO SAVE
	$("#add-text-item").html("New Text");
	//SET TEXT AREA VALUE TO ELEMENT TEXT
	$("#text-text-item").val("");
	//SET FONT-COLOR
	$("#color-picker").val("#202020");
	//SET FONT-FAMILY
	$("#font-selector").val("Arial");
}

//ADD PANEL FOR NEW LAYER
function createPanelLayerForNewElement(id){
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		if(listOfLayer[ctr].id == id){
			var layer = listOfLayer[ctr];
			
			if(layer.type == "text"){
				
				var tempLayerText = "";
				var element = document.createElement("li");
				var id = layer.id;
				var classs = "list-group-item text-center";
				
				element.setAttribute("id" , id);
				element.setAttribute("class" , classs);
				
				if($(layer.element).html().length > 8){
					tempLayerText = $(layer.element).html().substring(0 , 5) + " ...";
				}else{
					tempLayerText =  $(layer.element).html();
				}
								
				$(element)
					.html
					(
						tempLayerText
					)
					.css
					(
						{
							"position":"relative"
							
						}
					)
					.append
					(
						'<span class="pull-left">' +
						'<img style="height:20px;width: 20px; border: 1px solid black; padding:2px;" src="assets/images/logo/text.png" />' + 
						'</span>' +
						'<span class="glyphicon glyphicon-trash pull-right" id="' +  $(element).attr("id") + '"></span>'
					)
					
				
				$("#panel-item-list")
					.prepend
					(
						element
					);
					
				setActionSort();
				break;
			}else if(layer.type == "clipart"){
			
				var element = document.createElement("li");
				var id = layer.id;
				var classs = "list-group-item text-center";
				
				element.setAttribute("id" , id);
				element.setAttribute("class" , classs);
				
				$(element)
					.html
					(
						"Clipart"
					)
					.css
					(
						{
							"position":"relative"
						}
					)
					.append
					(
						'<span class="pull-left">' +
						'<img style="height:20px;width: 20px; border: 1px solid black; padding:2px;" src="'+ $(layer.element).attr("src") +'" />' + 
						'</span>' +
						'<span class="glyphicon glyphicon-trash pull-right" id="' +  $(element).attr("id") + '"></span>'
					)
					
				
				$("#panel-item-list")
					.prepend
					(
						element
					);
				setActionSort();
				break;
			}
		}
	}

}

//ADD PANEL FOR NEW LAYER
function readPanel(id){
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		if(listOfLayer[ctr].id == id){
			var layer = listOfLayer[ctr];
			
			if(layer.type == "text"){
				
				var tempLayerText = "";
				var element = document.createElement("li");
				var id = layer.id;
				var classs = "list-group-item text-center";
				
				element.setAttribute("id" , id);
				element.setAttribute("class" , classs);
				
				if($(layer.element).html().length > 8){
					tempLayerText = $(layer.element).html().substring(0 , 5) + " ...";
				}else{
					tempLayerText =  $(layer.element).html();
				}
								
				$(element)
					.html
					(
						tempLayerText
					)
					.css
					(
						{
							"position":"relative"
							
						}
					)
					.append
					(
						'<span class="pull-left">' +
						'<img style="height:20px;width: 20px; border: 1px solid black; padding:2px;" src="assets/images/logo/text.png" />' + 
						'</span>' +
						'<span class="glyphicon glyphicon-trash pull-right" id="' +  $(element).attr("id") + '"></span>'
					)
					
				
				$("#panel-item-list")
					.prepend
					(
						element
					);
					
//				setActionSort();
				break;
			}else if(layer.type == "clipart"){
			
				var element = document.createElement("li");
				var id = layer.id;
				var classs = "list-group-item text-center";
				
				element.setAttribute("id" , id);
				element.setAttribute("class" , classs);
				
				$(element)
					.html
					(
						"Clipart"
					)
					.css
					(
						{
							"position":"relative"
						}
					)
					.append
					(
						'<span class="pull-left">' +
						'<img style="height:20px;width: 20px; border: 1px solid black; padding:2px;" src="'+ $(layer.element).attr("src") +'" />' + 
						'</span>' +
						'<span class="glyphicon glyphicon-trash pull-right" id="' +  $(element).attr("id") + '"></span>'
					)
					
				
				$("#panel-item-list")
					.prepend
					(
						element
					);
//				setActionSort();
				break;
			}
		}
	}

}


function readPanelAtBack(id){
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		if(listOfLayerAtBack[ctr].id == id){
			var layer = listOfLayerAtBack[ctr];

			if(layer.type == "text"){
				
				var tempLayerText = "";
				var element = document.createElement("li");
				var id = layer.id;
				var classs = "list-group-item text-center";
				
				element.setAttribute("id" , id);
				element.setAttribute("class" , classs);
				
				if($(layer.element).html().length > 8){
					tempLayerText = $(layer.element).html().substring(0 , 5) + " ...";
				}else{
					tempLayerText =  $(layer.element).html();
				}
								
				$(element)
					.html
					(
						tempLayerText
					)
					.css
					(
						{
							"position":"relative"
							
						}
					)
					.append
					(
						'<span class="pull-left">' +
						'<img style="height:20px;width: 20px; border: 1px solid black; padding:2px;" src="assets/images/logo/text.png" />' + 
						'</span>' +
						'<span class="glyphicon glyphicon-trash pull-right" id="' +  $(element).attr("id") + '"></span>'
					)
					
				
				$("#panel-item-list-back")
					.prepend
					(
						element
					);
					
//				setActionSort();
				break;
			}else if(layer.type == "clipart"){
			
				var element = document.createElement("li");
				var id = layer.id;
				var classs = "list-group-item text-center";
				
				element.setAttribute("id" , id);
				element.setAttribute("class" , classs);
				
				$(element)
					.html
					(
						"Clipart"
					)
					.css
					(
						{
							"position":"relative"
						}
					)
					.append
					(
						'<span class="pull-left">' +
						'<img style="height:20px;width: 20px; border: 1px solid black; padding:2px;" src="'+ $(layer.element).attr("src") +'" />' + 
						'</span>' +
						'<span class="glyphicon glyphicon-trash pull-right" id="' +  $(element).attr("id") + '"></span>'
					)
					
				
				$("#panel-item-list-back")
					.prepend
					(
						element
					);
//				setActionSort();
				break;
			}
		}
	}

}

//Update LAYER PANEL TEXT
function updatePanelLayerText(){
	if(activeLayer != null){
		if(activeLayer.type == "text"){
			var layer = activeLayer;
			var id = layer.id;
			var tempLayerText = "";
			
			if($(layer.element).html().length > 8){
				tempLayerText = $(layer.element).html().substring(0 , 5) + " ...";
			}else{
				tempLayerText =  $(layer.element).html();
			}
			
			$("#panel-item-list li")
				.each
				(
					function()
					{
						if($(this).attr("id") == id){
							$(this)
								.html
								(
									tempLayerText
								)
								
								.append
								(
									'<span class="pull-left">' +
									'<img style="height:20px;width: 20px; border: 1px solid black; padding:2px;" src="assets/images/logo/text.png" />'+
									'</span><span class="glyphicon glyphicon-trash pull-right" id="' +  id + '"></span>'
								);	
						}
					}
				);
		}
	}
}

//Update LAYER PANEL TEXT
function updatePanelLayerTextAtBack(){
	if(activeLayerAtBack != null){
		if(activeLayerAtBack.type == "text"){
			var layer = activeLayerAtBack;
			var id = layer.id;
			var tempLayerText = "";
			
			if($(layer.element).html().length > 8){
				tempLayerText = $(layer.element).html().substring(0 , 5) + " ...";
			}else{
				tempLayerText =  $(layer.element).html();
			}
			
			$("#panel-item-list-back li")
				.each
				(
					function()
					{
						if($(this).attr("id") == id){
							$(this)
								.html
								(
									tempLayerText
								)
								
								.append
								(
									'<span class="pull-left">' +
									'<img style="height:20px;width: 20px; border: 1px solid black; padding:2px;" src="assets/images/logo/text.png" />'+
									'</span><span class="glyphicon glyphicon-trash pull-right" id="' +  id + '"></span>'
								);	
						}
					}
				);
		}
	}
}
//DELETE LAYER ELEMENT AND PANEL
function deleteElementLayerAndPanel(id){
	var element = document.getElementById(id);
	element.parentNode.removeChild(element);
	element = document.getElementById(id);
	element.parentNode.removeChild(element);
	
}

//Update Layer Object ImageSize
function updateLayerImageSize(id , size){
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		if(listOfLayer[ctr].id == id){
		
			$(listOfLayer[ctr].element)
				.css
				(
					{
						"width": size , 
						"height" : size
					}
				);
			break;
		}
	}
}

//Update Layer Object ImageSize
function updateLayerImageSizeAtBack(id , size){
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		if(listOfLayerAtBack[ctr].id == id){
			$(listOfLayerAtBack[ctr].element)
				.css
				(
					{
						"width": size , 
						"height" : size
					}
				);
			break;
		}
	}
}

//AUTO PRICING RETURN PRICE
function orderPrice(size , color ,  quantity){
	var totalPrice = 0.00;
	var elementPrice = 0;
	var sizePrice = size;
	var colorPrice = color;
	var quantityPrice  = quantity;
	
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		var price = listOfLayer[ctr].price;
		elementPrice += price;
	}

	return (elementPrice + sizePrice + color) * quantityPrice;
}

//AUTO PRICING RETURN PRICE
function orderPriceAtBack(size , color ,  quantity){
	var totalPrice = 0.00;
	var elementPrice = 0;
	var sizePrice = size;
	var colorPrice = color;
	var quantityPrice  = quantity;
	
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		var price = listOfLayerAtBack[ctr].price;
		elementPrice += price;
	}

	return (elementPrice + sizePrice + color) * quantityPrice;
}


//SET ORDER INFO Text
function setOrderInfoText(price){
	$("#total-list-option").val(price);
}

//SET ORDER INFO Text
function setOrderInfoTextAtBack(price){
	$("#total-list-option").val(price);
}

//Update the color of clipart
function updateClipartColor(color){
	var id = activeLayer.id;
	
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		if(listOfLayer[ctr].id == id && listOfLayer[ctr].type == "clipart"){
			$(listOfLayer[ctr].element).css("background-color", color);
			break;
		}
	}
}

//Update Vertical center position
function updateVerticalToCenter(){
	var id = activeLayer.id;
	var element = null;
	
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		element = listOfLayer[ctr].element;
		
		if(listOfLayer[ctr].id == id){
		
			var parentHeight = $(element).parent().css("height");
			var height = $(element).css("height");	
			var newHeight = parseFloat((parseInt(parentHeight) / 2)) - parseFloat((parseInt(height) / 2));

			$(element).css({"top" : newHeight + "px"});			
			break;
		}
	}

}

//Update Vertical center position
function updateVerticalToCenterAtBack(){
	var id = activeLayerAtBack.id;
	var element = null;
	
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		element = listOfLayerAtBack[ctr].element;
		
		if(listOfLayerAtBack[ctr].id == id){
		
			var parentHeight = $(element).parent().css("height");
			var height = $(element).css("height");	
			var newHeight = parseFloat((parseInt(parentHeight) / 2)) - parseFloat((parseInt(height) / 2));

			$(element).css({"top" : newHeight + "px"});			
			break;
		}
	}

}

//Update Vertical center position
function updateHorizontalToCenter(){
	var id = activeLayer.id;
	var element = null;
	
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		element = listOfLayer[ctr].element;
		
		if(listOfLayer[ctr].id == id){
		
			var parentWidth = $(element).parent().css("width");
			var width = $(element).css("width");	
			var newWidth = parseFloat((parseInt(parentWidth) / 2)) - parseFloat((parseInt(width) / 2));

			$(element).css({"left" : newWidth + "px"});			
			break;
		}
	}

}

//Update Vertical center position
function updateHorizontalToCenterAtBack(){
	var id = activeLayerAtBack.id;
	var element = null;
	
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		element = listOfLayerAtBack[ctr].element;
		
		if(listOfLayerAtBack[ctr].id == id){
		
			var parentWidth = $(element).parent().css("width");
			var width = $(element).css("width");	
			var newWidth = parseFloat((parseInt(parentWidth) / 2)) - parseFloat((parseInt(width) / 2));

			$(element).css({"left" : newWidth + "px"});			
			break;
		}
	}

}

//update Rotation
function rotateElementByInput(degree){
	var id = activeLayer.id;
	var element = null;
	
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		element = listOfLayer[ctr].element;
		
		if(listOfLayer[ctr].id == id){
			$(element)
				.css
				(
					{
						'-webkit-transform' : 'rotate('+ degree +'deg)'
					}
				);
			listOfLayer[ctr].rotation = degree;	
			
			break;
		}
	}

}


//update Rotation
function rotateElementByInputAtBack(degree){
	var id = activeLayerAtBack.id;
	var element = null;
	
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		element = listOfLayerAtBack[ctr].element;
		
		if(listOfLayerAtBack[ctr].id == id){
			$(element)
				.css
				(
					{
						'-webkit-transform' : 'rotate('+ degree +'deg)'
					}
				);
			listOfLayerAtBack[ctr].rotation = degree;	
			break;
		}
	}

}

//UPDATE IMAGE OR TEXT POSITION
function updateClipartPostion(position){
	var id = activeLayer.id;
	var element = null;
	
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		element = listOfLayer[ctr].element;
		
		if(listOfLayer[ctr].id == id){
			if(position == "left"){
				var pos = parseInt($(element).css("left")) - 5;
				//if(pos > 0)
					$(element).css({"left" : pos  });		
			}else if(position == "top"){
				var pos = parseInt($(element).css("top")) - 5;
				//if(pos > 0)
					$(element).css({"top" : pos  });	
			}else if(position == "right"){
				var pos = parseInt($(element).css("left")) + 5;
				$(element).css({"left" : pos  });	
			}else if(position == "down"){
				var pos = parseInt($(element).css("top")) + 5;
				$(element).css({"top" : pos  });	
			}
	
			//$(element).css({"left" : newWidth + "px"});			
			break;
		}
	}

}

//UPDATE IMAGE OR TEXT POSITION
function updateClipartPostionAtBack(position){
	var id = activeLayerAtBack.id;
	var element = null;
	
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		element = listOfLayerAtBack[ctr].element;
		
		if(listOfLayerAtBack[ctr].id == id){
			if(position == "left"){
				var pos = parseInt($(element).css("left")) - 5;
				//if(pos > 0)
					$(element).css({"left" : pos  });		
			}else if(position == "top"){
				var pos = parseInt($(element).css("top")) - 5;
				//if(pos > 0)
					$(element).css({"top" : pos  });	
			}else if(position == "right"){
				var pos = parseInt($(element).css("left")) + 5;
				$(element).css({"left" : pos  });	
			}else if(position == "down"){
				var pos = parseInt($(element).css("top")) + 5;
				$(element).css({"top" : pos  });	
			}
	
		//	$(element).css({"left" : newWidth + "px"});			
			break;
		}
	}

}



function findElementInArrayById(id){
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		if(listOfLayer[ctr].id == id){
			return listOfLayer[ctr];
		}
	}
}

function findElementInArrayByIdAtBack(id){
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		if(listOfLayerAtBack[ctr].id == id){
			return listOfLayerAtBack[ctr];
		}
	}
}

function refreshIndex(){
	
	
	for(ctr = 0 ; ctr < listOfLayer.length ; ctr ++){
		$(listOfLayer[ctr].element).zIndex(listOfLayer[ctr].index);
	}
	
	sortArrayByIndex(listOfLayer);
}

function refreshIndexAtBack(){
	
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		$(listOfLayerAtBack[ctr].element).zIndex(listOfLayerAtBack[ctr].index);
	}
}


function sortArrayByIndex(layer){
	var temp = 0;
	for(ctr = 0 ; ctr < layer.length ; ctr++){
		
		for(ctr1 = 0 ; ctr1 < layer.length - 1; ctr1 ++){
			if(layer[ctr1].index  < layer[ctr1 + 1]){
				console.log(layer[ctr1].index  > layer[ctr1 + 1]);
				temp = layer[ctr1 + 1];
				layer[ctr1 + 1] = layer[ctr1];
				layer[ctr1] = temp;
			}
		}
	}
}


function setActionSort(){
	
	var index_ = listOfLayer.length;
	var element = null;
	var id = 0;
	$("#panel-item-list li").each(function(){
		id = $(this).attr("id");
		//element = document.getElementById(id);
		//element.index = index_
		
		element = findElementInArrayById(id);
		element.index = index_;
		index_ -= 1;

	});
	refreshIndex();
}

function setActionSortAtBack(){
	var index_ = listOfLayerAtBack.length;
	var element = null;
	var id = 0;
	$("#panel-item-list-back li").each(function(){
		id = $(this).attr("id");
		
		element = findElementInArrayByIdAtBack(id);
		element.index = index_;
		index_ -= 1;

	});
	refreshIndexAtBack();
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
//Remove Layer Object in Array
function removeLayerByIdAtBack(id){
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		if(listOfLayerAtBack[ctr].id == id){
			listOfLayerAtBack.splice(ctr , 1);
			break;
		}
	}
}

//Add Layer Object in Array
function addNewLayerAtBack(id , element , index , type , price){
	var layer = new Layer(id , element , index , type , price);
	listOfLayerAtBack.push(layer);
}

//Update Layer Object Text
function updateLayerTextAtBack(id , text){
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		if(listOfLayerAtBack[ctr].id == id){
			listOfLayerAtBack[ctr].element.innerHTML = text;
			break;
		}
	}
}

//Update Layer Object FontFamily
function updateLayerFontFamilyAtBack(id , font){
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		if(listOfLayerAtBack[ctr].id == id){
			$(listOfLayerAtBack[ctr].element).css("font-family", font);
			break;
		}
	}
}

//Update Layer Object FontSize
function updateLayerFontSizeAtBack(id , size){
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		if(listOfLayerAtBack[ctr].id == id){
			$(listOfLayerAtBack[ctr].element).css("font-size", size);
			break;
		}
	}
}

//Update Layer Object FontColor
function updateLayerFontColorAtBack(id , color){
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		if(listOfLayerAtBack[ctr].id == id){
			$(listOfLayerAtBack[ctr].element).css("color", color);
			break;
		}
	}
}

//Add New Element on Shirt Designer
function createNewTextElementAtBack(text){
	var id = (Math.floor((Math.random() * 100) + 1)) + "" + (Math.floor((Math.random() * 100) + 1)) + "" + (Math.floor((Math.random() * 100) + 1));
	var element = document.createElement("p");
	var index = 0;
	var type = "text";
	var price = 50;
	
	element.setAttribute("id" , id);
	
	
	$(element).css(
		{
			"display":"inline-block",
			"position" : "relative",
			"font-size" : "12px"
		}
	)
	.draggable(
		{
			containment:"#shirt-viewer",
			cursor: "pointer"
		}
	).html(text);
	
	$("#shirt-designer-back").append(element);
	setSelectedLayerToResetAtBack();
	addNewLayerAtBack(id , element , index , type , price);
	setSelectedLayerAtBack(id);
	
	
	//SET POSITION TO CENTER
	updateVerticalToCenterAtBack();
	updateHorizontalToCenterAtBack();
}

//Set the selection element
function setSelectedLayerAtBack(id){
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		$(listOfLayerAtBack[ctr].element).removeClass("shirt-designer");
		if(listOfLayerAtBack[ctr].id == id){
			var layer = listOfLayerAtBack[ctr];
			activeLayerAtBack = layer;
			if(layer.type == "text"){
				//SET ACTIVE LAYER
				var index = -1;
				//ADD BORDERS
				$(layer.element).addClass("shirt-designer");
				//EDIT PANEL DISPLAY TO BLOCK
				$("#edit-panel").css("display" , "block");
				//SET SLIDER VALUE
				$("#slider").slider("value" , $(layer.element).css("font-size").replace("px" ,""));
				//SET THE FONT-SIZE DISPLAY
				$("#current-px").html($(layer.element).css("font-size"));
				//SET BUTTON TEXT TO SAVE
				$("#add-text-item").html("Save Text");
				//SET TEXT AREA VALUE TO ELEMENT TEXT
				$("#text-text-item").val($(layer.element).html());
				//SET FONT-COLOR
				$("#color-picker").val(rgb2hex($(layer.element).css("color")));
				//SET FONT-FAMILY
				$("#font-selector option")
					.each
					(
						function()
						{
							index += 1;
							if($(this).val() == $(layer.element).css("font-family").replace("\'" ,"").replace("\'" ,"")){
								$("#font-selector").val($(this).val());
							};
						}
					);
			$( "#option-tabs" ).tabs({ active : 2 });
			}else if(layer.type == "clipart"){
				//SET ACTIVE LAYER
				//activeLayer = layer;
				//ADD BORDERS
				$(layer.element).addClass("shirt-designer");
				//EDIT PANEL DISPLAY TO BLOCK
				$("#edit-panel")
					.css
					(
						{
							"display" : "block" , 
							"position" : "relative"
						}
					);
				//SET SLIDER IMAGE VALUE
				$("#image-size").slider("value" , $(layer.element).css("width").replace("px" ,""));
				//SET THE FONT-IMAGE DISPLAY
				$("#image-size-value").html($(layer.element).css("width").replace("px" , ""));
				//SET POSITION
				$( "#option-tabs" ).tabs({ active : 1 });
			}
		}
	}
}

//Add New Clip Art Element in Shirt Designer
function createNewClipartElementAtBack(image){
	
	
	var id = (Math.floor((Math.random() * 100) + 1)) + "" + (Math.floor((Math.random() * 100) + 1)) + "" + (Math.floor((Math.random() * 100) + 1));
	var element = document.createElement("img");
	var index = 0;
	var type = "clipart";
	var price = 80;
	
	element.setAttribute("id" , id);
	
	$(element)
		.css
		(
			{
				"display":"inline-block",
				"position" : "relative",
				"width" : "50px",
				"height" : "50px",
				"background-image" : 'url(' + image +')',
				"background-size": "100% 100%",
				"background-repeat" : "no-repeat"
			}
		)
		.attr
		(
			{
				"src" : image
			}
		)
		
		.draggable
		(
			{
					containment:"#shirt-viewer",
					cursor: "pointer"
			}
		);
		
		$("#shirt-designer-back").append(element);
		addNewLayerAtBack(id , element , index , type , price);
		setSelectedLayerToResetAtBack();
		setSelectedLayerAtBack(id);
		
		//SET POSITION TO CENTER
		updateVerticalToCenterAtBack();
		updateHorizontalToCenterAtBack();
}


//ADD PANEL FOR NEW LAYER
function createPanelLayerForNewElementAtBack(id){
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		if(listOfLayerAtBack[ctr].id == id){
			var layer = listOfLayerAtBack[ctr];
			
			if(layer.type == "text"){
				
				var tempLayerText = "";
				var element = document.createElement("li");
				var id = layer.id;
				var classs = "list-group-item text-center";
				
				element.setAttribute("id" , id);
				element.setAttribute("class" , classs);
				
				if($(layer.element).html().length > 8){
					tempLayerText = $(layer.element).html().substring(0 , 5) + " ...";
				}else{
					tempLayerText =  $(layer.element).html();
				}
					
				$(element)
					.html
					(
						tempLayerText
					)
					.css
					(
						{
							"position":"relative"
							
						}
					)
					.append
					(
						'<span class="pull-left">' +
						'<img style="height:20px;width: 20px; border: 1px solid black; padding:2px;" src="assets/images/logo/text.png" />' + 
						'</span>' +
						'<span class="glyphicon glyphicon-trash pull-right" id="' +  $(element).attr("id") + '"></span>'
					)
					
				
				$("#panel-item-list-back")
					.prepend
					(
						element
					);
					
				setActionSortAtBack();
					
			}else if(layer.type == "clipart"){
			
				var element = document.createElement("li");
				var id = layer.id;
				var classs = "list-group-item text-center";
				
				element.setAttribute("id" , id);
				element.setAttribute("class" , classs);
				
				$(element)
					.html
					(
						"Clipart"
					)
					.css
					(
						{
							"position":"relative"
						}
					)
					.append
					(
						'<span class="pull-left">' +
						'<img style="height:20px;width: 20px; border: 1px solid black; padding:2px;" src="'+ $(layer.element).attr("src") +'" />' + 
						'</span>' +
						'<span class="glyphicon glyphicon-trash pull-right" id="' +  $(element).attr("id") + '"></span>'
					)
					
				
				$("#panel-item-list-back")
					.prepend
					(
						element
					);
				setActionSortAtBack();
			}
		}
	}

}

//Set Not SelectedLayer
function setSelectedLayerToResetAtBack(){
	for(ctr = 0 ; ctr < listOfLayerAtBack.length ; ctr ++){
		//SET BORDERS
		$(listOfLayerAtBack[ctr].element).removeClass("shirt-designer");
		$(listOfLayerAtBack[ctr].element)
			.css
			(
				{
					"position" : "absolute",
				}
			);
			
	}
	//SET ACTIVE LAYER TO NULL
	activeLayerAtBack = null;
	//EDIT PANEL DISPLAY TO BLOCK
	$("#edit-panel").css("display" , "none");
	//SET SLIDER VALUE
	$("#slider").slider("value" , "12");
	//SET SLIDER IMAGE VALUE
	$("#image-size").slider("value" , "50");
	//SET THE IMAGE-SIZE DISPLAY
	$("#image-size-value").html("50");
	//SET THE FONT-SIZE DISPLAY
	$("#current-px").html("12px");
	//SET BUTTON TEXT TO SAVE
	$("#add-text-item").html("New Text");
	//SET TEXT AREA VALUE TO ELEMENT TEXT
	$("#text-text-item").val("");
	//SET FONT-COLOR
	$("#color-picker").val("#202020");
	//SET FONT-FAMILY
	$("#font-selector").val("Arial");
}

function convertToJSONFileFormat(id){
	var json = "";
	for(ctr = 0; ctr < listOfLayer.length ; ctr ++){
		if(listOfLayer[ctr].id == id){
			if(listOfLayer[ctr].type == "text"){
				json = { 
							"id" : listOfLayer[ctr].id ,
							"index" : listOfLayer[ctr].index ,
							"price" : listOfLayer[ctr].price ,
							"rotation" : listOfLayer[ctr].rotation ,
							"type" : listOfLayer[ctr].type,
							"element" : 
							{
								"attr" :
								{
									
								},
								"css" :
								{
									"display" : "inline-block" ,
									"position" : "absolute",
									"family" : $(listOfLayer[ctr].element).css("font-family"),
									"size" : $(listOfLayer[ctr].element).css("font-size"),
									"color" : $(listOfLayer[ctr].element).css("color") ,
									"left" : $(listOfLayer[ctr].element).css("left") ,
									"top" : $(listOfLayer[ctr].element).css("top")
								},
								"html" : $(listOfLayer[ctr].element).html()
							}
							
					}
					
				return json;
			}else{
				json = 
				{
					"id" : listOfLayer[ctr].id ,
					"index" : listOfLayer[ctr].index ,
					"price" : listOfLayer[ctr].price ,
					"rotation" : listOfLayer[ctr].rotation ,
					"type" : listOfLayer[ctr].type,
					"element" : 
							{
								"attr" :
								{
									"src" : $(listOfLayer[ctr].element).attr("src")
								},
								"css" :
								{
									"display" : "inline-block" ,
									"position" : "absolute",
									"width" : $(listOfLayer[ctr].element).css("width") ,
									"height" : $(listOfLayer[ctr].element).css("height") ,
									"left" : $(listOfLayer[ctr].element).css("left") ,
									"top" : $(listOfLayer[ctr].element).css("top")
								}
							}
				
				}
				
				return json;
				
			}
		
		
		}
	}
}

function convertToJSONFileFormatAtBack(id){
	var json = "";
	for(ctr = 0; ctr < listOfLayerAtBack.length ; ctr ++){
		if(listOfLayerAtBack[ctr].id == id){
			if(listOfLayerAtBack[ctr].type == "text"){
				json = { 
							"id" : listOfLayerAtBack[ctr].id ,
							"index" : listOfLayerAtBack[ctr].index ,
							"price" : listOfLayerAtBack[ctr].price ,
							"rotation" : listOfLayerAtBack[ctr].rotation ,
							"type" : listOfLayerAtBack[ctr].type,
							"element" : 
							{
								"attr" :
								{
									
								},
								"css" :
								{
									"display" : "inline-block" ,
									"position" : "absolute",
									"family" : $(listOfLayerAtBack[ctr].element).css("font-family"),
									"size" : $(listOfLayerAtBack[ctr].element).css("font-size"),
									"color" : $(listOfLayerAtBack[ctr].element).css("color") ,
									"left" : $(listOfLayerAtBack[ctr].element).css("left") ,
									"top" : $(listOfLayerAtBack[ctr].element).css("top")
								},
								"html" : $(listOfLayerAtBack[ctr].element).html()
							}
							
					}
					
				return json;
			}else{
				json = 
				{
					"id" : listOfLayerAtBack[ctr].id ,
					"index" : listOfLayerAtBack[ctr].index ,
					"price" : listOfLayerAtBack[ctr].price ,
					"rotation" : listOfLayerAtBack[ctr].rotation ,
					"type" : listOfLayerAtBack[ctr].type,
					"element" : 
							{
								"attr" :
								{
									"src" : $(listOfLayerAtBack[ctr].element).attr("src")
								},
								"css" :
								{
									"display" : "inline-block" ,
									"position" : "absolute",
									"width" : $(listOfLayerAtBack[ctr].element).css("width") ,
									"height" : $(listOfLayerAtBack[ctr].element).css("height") ,
									"left" : $(listOfLayerAtBack[ctr].element).css("left") ,
									"top" : $(listOfLayerAtBack[ctr].element).css("top")
								}
							}
				
				}
				
				return json;
				
			}
		
		
		}
	}
}


function readLayer(layer){
	if(layer.type == "text"){
		var id = layer.id;
		var element = document.createElement("p");
		var index = layer.index;
		var type = layer.type;
		var price = layer.price;
		
		element.setAttribute("id" , id);	
		
		$(element).css(
			{
				"display": layer.element.css.display ,
				"position" : layer.element.css.position,
				"font-size" : layer.element.css.size,
				"font-family" : layer.element.css.family,
				"color" : layer.element.css.color,
				"left" : layer.element.css.left,
				"top" : layer.element.css.top,
				'-webkit-transform' : 'rotate('+ layer.rotation +'deg)'
			}
		)
		.draggable(
			{
				containment:"#shirt-viewer",
				cursor: "pointer"
			}
		).html(layer.element.html);
		
		$("#shirt-designer").append(element);
		
		addNewLayer(id , element , index , type , price);
		
			
	}else{
		var id = layer.id;
		var element = document.createElement("img");
		var index = layer.index;
		var type = layer.type;
		var price = layer.price;
	
		element.setAttribute("id" , id);
	
		$(element)
			.css
			(
				{
					"display": layer.element.css.display ,
					"position" : layer.element.css.position,
					"width" : layer.element.css.width ,
					"height" : layer.element.css.height,
					"left" : layer.element.css.left,
					"top" : layer.element.css.top,
					"background-image" : 'url(' + layer.element.attr.src +')',
					"background-size": "100% 100%",
					"background-repeat" : "no-repeat",
					'-webkit-transform' : 'rotate('+ layer.rotation +'deg)'
				}
			)
			.attr
			(
				{
					"src" : layer.element.attr.src
				}
			)
		
			.draggable
			(
				{
						containment:"#shirt-viewer",
						cursor: "pointer"
				}
			);
		
			$("#shirt-designer").append(element);
			addNewLayer(id , element , index , type , price);
			//var layer = new Layer(id , element , index , type , price , rotation);
			//templList.push(layer)
	
	}
}

function readLayerAtBack(layer){
	if(layer.type == "text"){
		var id = layer.id;
		var element = document.createElement("p");
		var index = layer.index;
		var type = layer.type;
		var price = layer.price;
		
		element.setAttribute("id" , id);	
		
		$(element).css(
			{
				"display": layer.element.css.display ,
				"position" : layer.element.css.position,
				"font-size" : layer.element.css.size,
				"font-family" : layer.element.css.family,
				"color" : layer.element.css.color,
				"left" : layer.element.css.left,
				"top" : layer.element.css.top,
				'-webkit-transform' : 'rotate('+ layer.rotation +'deg)'
			}
		)
		.draggable(
			{
				containment:"#shirt-viewer",
				cursor: "pointer"
			}
		).html(layer.element.html);
		
		$("#shirt-designer-back").append(element);
		addNewLayerAtBack(id , element , index , type , price);
		
		
	}else{
		var id = layer.id;
		var element = document.createElement("img");
		var index = layer.index;
		var type = layer.type;
		var price = layer.price;
	
		element.setAttribute("id" , id);
	
		$(element)
			.css
			(
				{
					"display": layer.element.css.display ,
					"position" : layer.element.css.position,
					"width" : layer.element.css.width ,
					"height" : layer.element.css.height,
					"left" : layer.element.css.left,
					"top" : layer.element.css.top,
					"background-image" : 'url(' + layer.element.attr.src +')',
					"background-size": "100% 100%",
					"background-repeat" : "no-repeat",
					'-webkit-transform' : 'rotate('+ layer.rotation +'deg)'
				}
			)
			.attr
			(
				{
					"src" : layer.element.attr.src
				}
			)
		
			.draggable
			(
				{
						containment:"#shirt-viewer",
						cursor: "pointer"
				}
			);
		
			$("#shirt-designer-back").append(element);
			addNewLayerAtBack(id , element , index , type , price);
	
	}
}