<%@tag import="java.util.Date"%>
<%@tag import="java.text.SimpleDateFormat"%>
<%@tag pageEncoding="UTF-8"%>
<%@ attribute name="name" type="java.lang.String" required="true"%>
<%@ attribute name="id" type="java.lang.String" required="false"%>
<%@ attribute name="cssClass" type="java.lang.String" required="false"%>
<%@ attribute name="date" type="java.util.Date" required="false"%>
<%@ attribute name="pattern" type="java.lang.String" required="false"%>
<%@ attribute name="style" type="java.lang.String" required="false"%>
<%@ attribute name="onlypast" type="java.lang.Boolean" required="false"%>
<%@ attribute name="onlyfuture" type="java.lang.Boolean" required="false"%>
<%@ attribute name="nullToToday" type="java.lang.Boolean" required="false"%>
<%@ attribute name="disabled" type="java.lang.Boolean" required="false"%>
<%@ attribute name="maxId" type="java.lang.String" required="false"%>
<%@ attribute name="minId" type="java.lang.String" required="false"%>
<%@ attribute name="onpropertychange" type="java.lang.String" required="false"%>
<%
	if (null == pattern || "".equals(pattern.trim().length() < 1)) {
		pattern = "yyyy-MM-dd";
	}
	String value = "";
	if (null != date) {
		value = new SimpleDateFormat(pattern).format(date);
	}
%>
<input type="text" <%if (null != name) {%> name="<%=name%>" <%}%>
	<%if (null != id) {%> id="<%=id%>" <%}%>
	<%if (null != cssClass) {%>	class="date_input <%=cssClass%>" <%} else {%> class="date_input" <%} %>
	<%if (null != value) {%> value="<%=value%>"<%}%>
	<%if (null != style) {%> style="<%=style%>" <%}%>
	<%if (null != disabled && disabled) {%> disabled="disabled" <%}%>
	onfocus="WdatePicker({skin:'twoer',oncleared:onDatePickerChanged,onpicked:onDatePickerChanged,dateFmt:'<%=pattern%>'
	<%if(null != onlypast && onlypast&&null!=maxId){ %>,maxDate:'#F{$dp.$D(\'<%=maxId%>\')||\'%y-%M-%d\'}'<%} %>
	<%if (null != onlypast && onlypast&&maxId==null) {%>,maxDate:'%y-%M-%d'<%}%>
	<%if (null != onlyfuture && onlyfuture&&minId==null) {%>,minDate:'%y-%M-%d'<%}%>
	<%if(null!=maxId&&onlypast==null){ %>,maxDate:'#F{$dp.$D(\'<%=maxId%>\')}'<%} %>
	<%if(null!=minId){ %>,minDate:'#F{$dp.$D(\'<%=minId%>\')}'<%} %>  })"
	readonly="readonly" data-inputtype="date" <%if(null!=onpropertychange){ %>onpropertychange="<%=onpropertychange%>"<%} %> />

