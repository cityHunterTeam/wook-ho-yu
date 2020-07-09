package search;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class GetTagValue {
	
	public String getTagValue(String tag,Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		
		Node nValue=(Node)nlList.item(0);
		if(nValue == null) {
			return null;
		}
		
		return nValue.getNodeValue();
		
	}
}
