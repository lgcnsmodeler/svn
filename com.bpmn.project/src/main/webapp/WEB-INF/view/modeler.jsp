<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Hello World</title>

    <!-- required modeler styles -->
    <link rel="stylesheet" href="https://unpkg.com/bpmn-js@7.3.0/dist/assets/diagram-js.css">
    <link rel="stylesheet" href="https://unpkg.com/bpmn-js@7.3.0/dist/assets/bpmn-font/css/bpmn.css">

    <!-- modeler distro -->
    <script src="https://unpkg.com/bpmn-js@7.3.0/dist/bpmn-modeler.development.js"></script>

    <!-- needed for this example only -->
    <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script>

    <!-- example styles -->
    <style>
      html, body, #canvas {
        height: 100%;
        padding: 0;
        margin: 0;
      }

      .diagram-note {
        background-color: rgba(66, 180, 21, 0.7);
        color: White;
        border-radius: 5px;
        font-family: Arial;
        font-size: 12px;
        padding: 5px;
        min-height: 16px;
        width: 50px;
        text-align: center;
      }

      .needs-discussion:not(.djs-connection) .djs-visual > :nth-child(1) {
        stroke: rgba(66, 180, 21, 0.7) !important; /* color elements as red */
      }

      #save-button {
        position: fixed;
        bottom: 20px;
        left: 20px;
      }
    </style>
  </head>
  <body>
    <div id="canvas"></div>

    <button id="save-button">download</button>

    <script>
	  debugger;
      var bpmnData = '${XmlData}';
    		  
      var diagramUrl = 'https://cdn.staticaly.com/gh/bpmn-io/bpmn-js-examples/dfceecba/starter/diagram.bpmn';

      // modeler instance
      var bpmnModeler = new BpmnJS({
        container: '#canvas',
        keyboard: {
          bindTo: window
        }
      });

      /**
       * Save diagram contents and print them to the console.
       */
       
      var downloadLink = $('#save-button');

      async function exportDiagram() {

        try {

          var result = await bpmnModeler.saveXML({ format: true });
          //alert('Diagram exported. Check the developer tools!');
          //console.log('DIAGRAM', result.xml);
          download('diagram.bpmn', result.xml);
          
        } catch (err) {

          console.error('could not save BPMN 2.0 diagram', err);
        }
      }
      
      //encoded
//       function setEncoded(link, name, data) {
//     	    var encodedData = encodeURIComponent(data);

//     	    if (data) {
//     	      link.addClass('active').attr({
//     	        'href': 'data:application/bpmn20-xml;charset=UTF-8,' + encodedData,
//     	        'download': name
//     	      });
//     	    } else {
//     	      link.removeClass('active');
//     	    }
//     	  }
      
      
      function download(filename, text) {
    	    var pom = document.createElement('a');
    	    pom.setAttribute('href', 'data:application/bpmn20-xml;charset=UTF-8,' + encodeURIComponent(text));
    	    pom.setAttribute('download', filename);

    	    if (document.createEvent) {
    	        var event = document.createEvent('MouseEvents');
    	        event.initEvent('click', true, true);
    	        pom.dispatchEvent(event);
    	    }
    	    else {
    	        pom.click();
    	    }
    	}


      /**
       * Open diagram in our modeler instance.
       *
       * @param {String} bpmnXML diagram to display
       */
      async function openDiagram(bpmnXML) {

        // import diagram
        try {

          await bpmnModeler.importXML(bpmnXML);

          // access modeler components
          var canvas = bpmnModeler.get('canvas');
          var overlays = bpmnModeler.get('overlays');


          // zoom to fit full viewport
          canvas.zoom('fit-viewport');

          // attach an overlay to a node
//           overlays.add('SCAN_OK', 'note', {
//             position: {
//               bottom: 0,
//               right: 0
//             },
//             html: '<div class="diagram-note">Mixed up the labels?</div>'
//           });

          // add marker
          canvas.addMarker('SCAN_OK', 'needs-discussion');
        } catch (err) {

          console.error('could not import BPMN 2.0 diagram', err);
        }
      }


      // load external diagram file via AJAX and open it
      
      
      if(bpmnData != null && bpmnData != ""){
          $.get(diagramUrl, openDiagram(bpmnData), 'text');
      }else{
          $.get(diagramUrl, openDiagram, 'text');
      }
      //$.get(diagramUrl, openDiagram, 'text');

      // wire save button
      $('#save-button').click(exportDiagram);
      
      
      //read File Xml
      function readTextFile(file)
      {
          var rawFile = new XMLHttpRequest();
          rawFile.open("GET", file, false);
          rawFile.onreadystatechange = function ()
          {
              if(rawFile.readyState === 4)
              {
                  if(rawFile.status === 200 || rawFile.status == 0)
                  {
                      var allText = rawFile.responseText;
                      alert(allText);
                  }
              }
          }
          rawFile.send(null);
      }
      
    </script>
    <!--
      Thanks for trying out our BPMN toolkit!

      This example uses the pre-built distribution of the bpmn-js modeler.
      Consider rolling your own distribution to have more flexibility
      regarding which features to include.

      Checkout our advanced examples section to learn more:
      * https://github.com/bpmn-io/bpmn-js-examples#advanced

      To get a bit broader overview over how bpmn-js works,
      follow our walkthrough:
      * https://bpmn.io/toolkit/bpmn-js/walkthrough/

      Related starters:
      * https://raw.githubusercontent.com/bpmn-io/bpmn-js-examples/starter/viewer.html
    -->
  </body>
</html>
