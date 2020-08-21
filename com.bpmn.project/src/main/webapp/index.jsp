<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Start Modeler</title>
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

</head>

<% String path = request.getContextPath(); %>
<body>

<p> LG CNS Prcess Modeler index.jsp </p> 
        
     <div>
        <form action="/modeler.bgn" method="post">
            <button onclick="submit">modeler!</button>
        </form>
    </div>
    
    <div>
        <form action="/viewer.bgn" method="post">
        	<input type="file" name="file1"><br/>
        	<input type="submit">
          <!--    <button onclick="submit">Viewer!</button>  -->
        </form>
    </div>
    
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