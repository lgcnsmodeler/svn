<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Hello World</title>

    <!-- viewer distro (without pan and zoom) -->
    <!--
    <script src="https://unpkg.com/bpmn-js@7.3.0/dist/bpmn-viewer.development.js"></script>
    -->

    <!-- viewer distro (with pan and zoom) -->
    <script src="https://unpkg.com/bpmn-js@7.3.0/dist/bpmn-navigated-viewer.development.js"></script>

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
    </style>
  </head>
  <body>
    <div id="canvas"></div>

    <script>

      var diagramUrl = 'https://cdn.staticaly.com/gh/bpmn-io/bpmn-js-examples/dfceecba/starter/diagram.bpmn';

      // viewer instance
      var bpmnViewer = new BpmnJS({
        container: '#canvas'
      });


      /**
       * Open diagram in our viewer instance.
       *
       * @param {String} bpmnXML diagram to display
       */
      async function openDiagram(bpmnXML) {

        // import diagram
        try {

          await bpmnViewer.importXML(bpmnXML);

          // access viewer components
          var canvas = bpmnViewer.get('canvas');
          var overlays = bpmnViewer.get('overlays');


          // zoom to fit full viewport
          canvas.zoom('fit-viewport');

          // attach an overlay to a node
          overlays.add('SCAN_OK', 'note', {
            position: {
              bottom: 0,
              right: 0
            },
            html: '<div class="diagram-note">Mixed up the labels?</div>'
          });

          // add marker
          canvas.addMarker('SCAN_OK', 'needs-discussion');
        } catch (err) {

          console.error('could not import BPMN 2.0 diagram', err);
        }
      }


      // load external diagram file via AJAX and open it
      $.get(diagramUrl, openDiagram, 'text');
    </script>
    <!--
      Thanks for trying out our BPMN toolkit!

      If you'd like to learn more about what our library,
      continue with some more basic examples:
      * https://github.com/bpmn-io/bpmn-js-examples/overlays
      * https://github.com/bpmn-io/bpmn-js-examples/interaction
      * https://github.com/bpmn-io/bpmn-js-examples/colors
      * https://github.com/bpmn-io/bpmn-js-examples/commenting

      To get a bit broader overview over how bpmn-js works,
      follow our walkthrough:
      * https://bpmn.io/toolkit/bpmn-js/walkthrough/

      Related starters:
      * https://raw.githubusercontent.com/bpmn-io/bpmn-js-examples/starter/modeler.html
    -->
  </body>
</html>
