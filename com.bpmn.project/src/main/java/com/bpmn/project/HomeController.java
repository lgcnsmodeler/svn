package com.bpmn.project;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import java.io.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import javax.xml.transform.dom.*;
import org.w3c.dom.*;
import org.xml.sax.SAXException;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		
		//Date date = new Date();
		//DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		//String formattedDate = dateFormat.format(date);
		
		//model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
    @RequestMapping("/modeler.bgn")
    public String sampleModeler( @RequestParam(value = "file1", required = false) File file1 , Model model)  {
    	
    	System.out.println(file1);
    	//String filePath = file1.getAbsolutePath(); 
    	String XmlData = "";
//    	StreamResult XmlData = null;
//    	Document doc;
//    	
//    	try{
//              // DOM Document�� �����ϱ� ���Ͽ� ���丮�� �����Ѵ�
//              DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
//              factory.setIgnoringElementContentWhitespace(true);
//              // ���丮�κ��� Document�ļ��� ������ �Ѵ�.
//              DocumentBuilder builder = factory.newDocumentBuilder();
//             
//              // Document DOM�ļ��� �Ͽ��� �Է¹��� ������ �Ľ��ϵ��� ��û�Ѵ�.
//              doc = builder.parse(new File("C:\\Users\\MongE\\Downloads\\diagram.bpmn"));
//
//              //�Ľ̵� ���� ��Ʈ��Ҹ� �������� �ϸ�, �� Ÿ���� ElementŸ���̴�.
//              Element root = doc.getDocumentElement();
//
//              //�ּ��� �ѹ� �߰��Ͽ� �޾ƺ���.
//              Comment comment = doc.createComment("Training test");
//              // ������� �ּ��� ��Ʈ������ �ڽ����� �߰��Ѵ�.
//              root.appendChild(comment);
//             
//              // ��Ʈ������ ���� ������ ����غ����� �Ѵ�
//              // System.out.println("Tag name : " + root.getTagName());
//              // System.out.println("Node type : " + root.getNodeType());
//              // System.out.println("Node Value :"+root.getNodeVal!ue());
//              // System.out.println("First Child : " +root.getFirstChild());
//              // System.out.println("Last Child : " +root.getLastChild());
//              // ���� �޸𸮿� �ö�� �ִ� DOM Document�� ȭ�鿡 ����غ���.
//              // �ٸ� ���� ���� ��µ� �����ϴ�.
//              TransformerFactory tFactory = TransformerFactory.newInstance();
//              Transformer transformer = tFactory.newTransformer();
//              transformer.transform(new DOMSource(doc), new StreamResult(System.out));
//              XmlData =  new StreamResult(System.out); 
//              
//          }catch(Exception e) {
//              System.out.println(e);
//          }
    	
    	
        try{
            //���� ��ü ����
            File file = new File("C:\\Users\\MongE\\Downloads\\diagram (10).bpmn");
        	//File file = new File("");
             //�Է� ��Ʈ�� ����
             FileReader file_reader = new FileReader(file);
             int cur = 0;
             while((cur = file_reader.read()) != -1){
                System.out.print((char)cur);               
                XmlData += (char)cur;
             }
             file_reader.close();
            }catch (FileNotFoundException e) {
                e.getStackTrace();
            }catch(IOException e){
                e.getStackTrace();
            }catch(Exception e) {
            	e.getStackTrace();
            }
        //XmlData = XmlData.trim();
        XmlData = XmlData.replaceAll("(\r|\n|\r\n|\n\r)","");
        //XmlData = XmlData.replaceAll("\\s","");
        
        //Document doc = Util.stringToDom(XmlData);
    	model.addAttribute("XmlData", XmlData.toString());
        return "modeler";
    }
	
    @RequestMapping("/viewer.bgn")
    public String sampleViewer( @RequestParam("file1") File file1 , Model model) {
    	System.out.println(file1);
    	String filePath = file1.getAbsolutePath();    	
    	
    	//model.addAttribute("fileXml" , fileXml);	
    	
    	

    	
    	
    	
    	
    	
    	
    	
    	
    	//model.addAttribute("filePath" , filePath);	
    	//String fileXml = "";
    	//File file = new File(filePath);
        //try{
        	
        //    FileReader filereader = new FileReader(file);
        //    int singleCh = 0;
        //    while((singleCh = filereader.read()) != -1){
        //    	fileXml += (char)singleCh;
        //    }
        //    filereader.close();
        //}catch (FileNotFoundException e) {
        //    // TODO: handle exception
        //}catch(IOException e){
        //    System.out.println(e);
        //}    
        
        //model.addAttribute("fileXml" , fileXml);	
        return "viewer";
    }
    
}



