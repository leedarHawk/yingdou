package com.zmsport.iyuesai.util;

import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

/**
 * xml工具类
 * @author bilei
 *
 */
public final class XmlUtil {

	/**
	 * 对象生成xml
	 * @param t
	 * @return
	 */
	@SuppressWarnings("finally")
	public static <T> String objectToXml(T t) {
		JAXBContext context;
		Writer writer = new StringWriter();
		try {
			context = JAXBContext.newInstance(t.getClass());
			Marshaller marshaller = context.createMarshaller();  
			marshaller.marshal(t, writer);
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			return writer.toString();
		}
        
	}
	
	/**
	 * xml转化为对象
	 * @param xml
	 * @param clazz
	 * @return
	 */
	@SuppressWarnings({ "finally", "unchecked" })
	public static <T> T xmlToObject(String xml, Class<T> clazz) {
		JAXBContext context;
		T result = null;
		try {
			context = JAXBContext.newInstance(clazz);
			Unmarshaller unmarshaller = context.createUnmarshaller(); 
			result = (T)unmarshaller.unmarshal(new StringReader(xml));  
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			return result;
		}
	}
}
