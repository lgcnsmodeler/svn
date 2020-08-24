<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Start Modeler</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>   

// function performClick(elemId) {
// 	   var elem = document.getElementById(elemId);
// 	   if(elem && document.createEvent) {
// 	      var evt = document.createEvent("MouseEvents");
// 	      evt.initEvent("click", true, false);
// 	      elem.dispatchEvent(evt);
// 	   }
// 	}
	

// //File Data Access
// var inputElement = document.getElementById("theFile");

// inputElement.addEventListener("change", handleFiles, false);

// function handleFiles() {
//   const fileList = inputElement.files; 
// }


</script>


<style>
	img { display: block; margin: 0px auto; }
	
	body 
	{
  		margin:100px;
  		
	}
	
</style>

</head>

<% String path = request.getContextPath(); %>
<body>

<p align="center" style="font-size:50px; color:red; font-weigh:bold; width: 100%x;  max-width: 100%; "> LG CNS Process Modeler </p> 
        
     <div>
        <form action="/modeler.bgn" method="post">
            <button onclick="submit" class="btn btn-outline-primary" style="position:absolute; left:30px; bottom:30px;" >Create</button>
        </form>
    </div>
    
    <div>
        <form action="/modeler.bgn" method="post">
        	<input type="file" name="file1" class="btn btn-outline-primary" onchange="this.form.submit()" style="position:absolute; left:300px; bottom:30px;"><br/>       	
        	<input type="submit" class="btn btn-outline-primary" value="Open" style="position:absolute; left:120px; bottom:30px;">
        </form>
    </div>
    
   <img src="asset/image/bpmn-js.gif" alt="A screencast of the bpmn-js editing toolkit in action" 
   		style="width: 100%x;  max-width: 100%; border-width:1; border-color:black; border-style:dotted;" >
    
    
    
    <!--  <a href="#" onclick="performClick('theFile');">Open file dialog</a> -->
    <!--  <input type="file" id="theFile" accept=".bpmn" onchange="handleFiles(this.files)" /> -->
    
<!--     <ul class="buttons"> -->
<!-- 	    <li> -->
<!-- 	      download -->
<!-- 	    </li> -->
<!-- 	    <li> -->
<!-- 	      <a id="js-download-diagram" href="" title="download BPMN diagram"> -->
<!-- 	        BPMN diagram -->
<!-- 	      </a> -->
<!-- 	    </li> -->
<!-- 	    <li> -->
<!-- 	      <a id="js-download-svg" href="" title="download as SVG image"> -->
<!-- 	        SVG image -->
<!-- 	      </a> -->
<!-- 	    </li> -->
<!--   	</ul> -->
    
</body>

<script>


//File Data Access
// var inputElement = document.getElementById("theFile");

// inputElement.addEventListener("change", handleFiles, false);

// function handleFiles() {
//   var fileList = inputElement.files; 
// }
</script>

</html>