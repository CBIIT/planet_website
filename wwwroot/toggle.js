// JavaScript Document


function loadjscssfile(filename, filetype){
 if (filetype=="js"){ //if filename is a external JavaScript file
  var fileref=document.createElement('script')
  fileref.setAttribute("type","text/javascript")
  fileref.setAttribute("src", filename)
 }
 else if (filetype=="css"){ //if filename is an external CSS file
  var fileref=document.createElement("link")
  fileref.setAttribute("rel", "stylesheet")
  fileref.setAttribute("type", "text/css")
  fileref.setAttribute("href", filename)
 }
 if (typeof fileref!="undefined")
  document.getElementsByTagName("head")[0].appendChild(fileref)
}

loadjscssfile("toggle.css", "css") ////dynamically load and add this .css file

function toggleVis( elemID )
{    var elem = document.getElementById( elemID );

 				
	if( elem.className == 'toggleHidden' )
        {        elem.className = 'toggleVisible';
        }
        else
        {        elem.className = 'toggleHidden';
        }
}



function toggle_with_image(image, elemID){ 
		var elem = document.getElementById( elemID );
		
		if( elem.className == 'toggleHidden' )
		{       
			elem.className = 'toggleVisible';
			
	     } else {        
			elem.className = 'toggleHidden';
		
        }
}
	
function ShowShareBox(id) { 
 
  var elem = document.getElementById( id );
  
  if( elem.className == 'toggleHidden' )
  
  
        {        
		
		elem.className = 'toggleVisible';
		document.getElementById(id).style.display = 'none'; 
			//document.getElementById(image).src="images/x.gif"; 
			//document.getElementById(image).alt="Close the window";
		//window.alert("hello! hide");
        }
        else
        {    
			document.getElementById(id).style.display = 'block'; 
			//	document.getElementById(image).src="images/x.gif"; 
			//document.getElementById(image).alt="Close the window";
        }
		
} 
	
function HideShareBox(id) { 
  document.getElementById(id).style.display = 'none'; 
} 



