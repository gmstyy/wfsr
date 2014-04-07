<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/hs-tag.tld" prefix="hs"%>

<form id="workflowDetailFormId" name="detailForm" action="" method="post">
	<input type="text" value="${entity.id}" name="id" style="display:none;"/>
	<table class="edittable">
		<colgroup>
			<col style="width: 130px;" />
			<col style="width: 100px;" />
			<col style="width: 130px;" />
			<col style="width: 100px;"/>
			<col style="width: 80px;" />
			<col />
		</colgroup>			
		<tr>
			<th>流程种类</th>
			<td colspan="5" align="left">
				<hs:dic dicName="WORKFLOW_CATEGORY" name="categoryCode" defalt="${entity.categoryCode}" id="workflowCategory_2" onChange="selectCategory(2)" disabled="true"></hs:dic>
				<hs:dic dicName="LICENSE_TYPE" name="businessCode" defalt="${entity.businessCode}" blank="false" id="licenseType_2" disabled="true"></hs:dic>		
			</td>
		</tr>		
		<tr>
			<th>流程名称</th>		
			<td align="left"><input type="text" value="${entity.name}" name="name" readonly="readonly"/></td>
			<th>流程描述</th>			
			<td align="left">
				<textarea rows="2" name="description" readonly="readonly">${entity.description}</textarea>
			</td>
			<td colspan="2"></td>				
		</tr>
		<tr>
			<th>审批通过终点节点</th>		
			<td><input type="text" value="${entity.successNode}" name="successNode" readonly="readonly"/></td>
			<th>审批不通过终点节点</th>		
			<td><input type="text" value="${entity.failNode}" name="failNode" readonly="readonly"/></td>
			<td colspan="2"></td>
		</tr>		
	</table>
	<table class="edittable">
		<colgroup>
			<col style="width: 80px;" />
			<col style="width: 100px;" />
			<col style="width: 80px;" />
			<col style="width: 100px;"/>
			<col style="width: 80px;" />
			<col />
		</colgroup>	
		<c:forEach items="${workflownodeList}" var="wfn" varStatus="status">
		<tr>
			<th>节点名称</th>		
			<td align="left"><input type="text" value="${wfn.workflowNodeName}" name="workflowNodeName" readonly="readonly"/></td>
			<th>角色</th>		
			<td align="left">
				<select name="chargeRole" disabled="disabled">
					<option value=""></option>
					<c:forEach items="${roleList}" var="re">
					<option value="${re.code}" <c:if test="${re.code == wfn.chargeRole}">selected</c:if>>${re.name}</option>
					</c:forEach>
				</select>
			</td>
			<th>限时</th>
			<td align="left">
				<input type="text" value="${wfn.deadline}" name="deadline" style="width:50px;" readonly="readonly"/>天											
			</td>	
		</tr>	
		</c:forEach>
	</table>
	<table class="edittable">	
		<colgroup>
			<col style="width: 80px;" />
			<col style="width: 100px;" />
			<col style="width: 80px;" />
			<col style="width: 100px;"/>
			<col style="width: 80px;" />
			<col />
		</colgroup>		
		<c:forEach items="${workflownodeList}" var="wfn" >
		<tr>
			<th>当前节点</th>
			<td align="left">
				<input type="text" value="${wfn.workflowNodeName}" name="workflowNodeName" readonly="readonly"/>
			</td>
			<th>下个节点</th>
			<td align="left">
				<select name="nextNodeId1" style="width:100px;" disabled="disabled">
					<option value="">请选择</option>
					<c:forEach items="${allWorkflownodeList}" var="wfnvar" >
						<option value="${wfnvar.id}" <c:if test="${wfn.workflowSet.nextNodeId1 == wfnvar.id}">selected</c:if>>${wfnvar.workflowNodeName}</option>
					</c:forEach>
				</select>
			</td>
			<td align="left">
				<select name="nextNodeId2" style="width:100px;" disabled="disabled">
					<option value="">请选择</option>
					<c:forEach items="${allWorkflownodeList}" var="wfnvar" >
						<option value="${wfnvar.id}" <c:if test="${wfn.workflowSet.nextNodeId2 == wfnvar.id}">selected</c:if>>${wfnvar.workflowNodeName}</option>
					</c:forEach>
				</select>
			</td>
			<td align="left">				
				<select name="nextNodeId3" style="width:100px;" disabled="disabled">
					<option value="">请选择</option>
					<c:forEach items="${allWorkflownodeList}" var="wfnvar" >
						<option value="${wfnvar.id}" <c:if test="${wfn.workflowSet.nextNodeId3 == wfnvar.id}">selected</c:if>>${wfnvar.workflowNodeName}</option>
					</c:forEach>
				</select>								
			</td>
		</tr>
		<tr>
			<td colspan="2"></td>
			<th>按钮名称</th>
			<td align="left"><input type="text" value="${wfn.workflowSet.nextButton1}" name="nextButton1" readonly="readonly"/></td>
			<td align="left"><input type="text" value="${wfn.workflowSet.nextButton2}" name="nextButton2" readonly="readonly"/></td>
			<td align="left"><input type="text" value="${wfn.workflowSet.nextButton3}" name="nextButton3" readonly="readonly"/></td>
		</tr>
		</c:forEach>
	</table>	
</form>
 --%>

<!-- Creates a container for the graph with a grid wallpaper -->
<div id="graphContainer"
	style="position:absolute;top:0px;left:0px;overflow:hidden;width:100%;height:100%;overFlow-x: auto; ">
</div>

<script type="text/javascript">
	function Map() 
	{
		var struct = function(key, value) {
			this.key = key;
		 	this.value = value;
		}
		
		var put = function(key, value){
		 	for (var i = 0; i < this.arr.length; i++) {
		  		if ( this.arr[i].key === key ) {
		   			this.arr[i].value = value;
		   			return;
		  		}
		 	}
		 	this.arr[this.arr.length] = new struct(key, value);
		}
		
		var get = function(key) {
		 	for (var i = 0; i < this.arr.length; i++) {
			   	if ( this.arr[i].key === key ) {
			     	return this.arr[i].value;
			   	}
		 	}
		 	return null;
		}
		
		var size = function() {
		 	return this.arr.length;
		}
		
		var containsKey = function(_key) {
			for (var i = 0; i < this.arr.length; i++) {  
				if (this.arr[i].key == _key) {
					return true;
				}
			}
			return false;
		}
		
		this.arr = new Array();
		this.get = get;
		this.put = put;
		this.size = size;
		this.containsKey = containsKey;
	}
	// Program starts here. Creates a sample graph in the
	// DOM node with the specified ID. This function is invoked
	// from the onLoad event handler of the document (see below).
	function main(container)
	{
		// Checks if the browser is supported
		if (!mxClient.isBrowserSupported())
		{
			// Displays an error message if the browser is not supported.
			mxUtils.error('Browser is not supported!', 200, false);
		}
		else
		{
			// Creates the graph inside the given container
			var graph = new mxGraph(container);
			graph.setTooltips(true);

			// Sets the default edge style
			var style = graph.getStylesheet().getDefaultEdgeStyle();
			style[mxConstants.STYLE_EDGE] = mxEdgeStyle.ElbowConnector;
			
			var newStyle1 = new Object(); 
			newStyle1[mxConstants.STYLE_SHAPE] = 'box'; 
			newStyle1[mxConstants.STYLE_FONTCOLOR] = '#000000'; 
			newStyle1[mxConstants.STYLE_FILLCOLOR] = '#EEC900'; //orange
			newStyle1[mxConstants.STYLE_FONTSIZE] = 11;
			graph.getStylesheet().putCellStyle('newStyle1', newStyle1);
			
			var newStyle2 = new Object(); 
			newStyle2[mxConstants.STYLE_SHAPE] = 'box'; 
			newStyle2[mxConstants.STYLE_FONTCOLOR] = '#000000'; 
			newStyle2[mxConstants.STYLE_FILLCOLOR] = '#00EE00'; //green
			newStyle2[mxConstants.STYLE_FONTSIZE] = 11;
			graph.getStylesheet().putCellStyle('newStyle2', newStyle2);
			
			// Truncates the label to the size of the vertex
			graph.getLabel = function(cell)
			{
				var label = (this.labelsVisible) ? this.convertValueToString(cell) : '';
				if (6 < label.length)
				{
					return label.substring(0, 6) + '...';
				}
				return label;
			};
	
			// Gets the default parent for inserting new cells. This
			// is normally the first child of the root (ie. layer 0).
			var parent = graph.getDefaultParent();
							
			// Adds cells to the model in a single step
			graph.getModel().beginUpdate();
			try
			{	
				var padding_left = 20;
				var padding_top = 20;
				var width = 80;
				var height = 30;
				
				var map = new Map();
				
				$.each(${nodes}, function(index, data){
					map.put(data.current, data);
				});
				
				var v1;
				var v2;
				var v_map = new Map();
				$.each(${nodes}, function(index, data){				
					if(v_map.containsKey(data.current)) {
						v1 = v_map.get(data.current)
					}else{
						v1 = graph.insertVertex(parent, null, data.workflowNodeName, padding_left, padding_top, width, height, (data.type==1)?'newStyle1':'newStyle2');	
						v_map.put(data.current, v1);						
					}
					padding_left = padding_left + width + 50;
					
					if(data.next != '-1') {
						var nextArray = (data.next).split("#");
						for(var i=0; i<nextArray.length; i++){
							var nextData = map.get(nextArray[i]);
							if(v_map.containsKey(nextArray[i])) {
								v2 = v_map.get(nextArray[i]);
							}else{
								if (nextData.type == 1) {
									padding_top = 20 * (4 * i + 1);
								}
								if (nextData.type == 2) {
									padding_top = 60;
								}
								v2 = graph.insertVertex(parent, null, nextData.workflowNodeName, padding_left, padding_top, width, height, (nextData.type==1)?'newStyle1':'newStyle2');
								v_map.put(nextArray[i], v2);
							}							
							graph.insertEdge(parent, null, (data.deadline!='')?data.deadline:'', v1, v2);
						}
					}
			    });  
			}
			finally
			{
				// Updates the display
				graph.getModel().endUpdate();
			}
		}
	};
</script>



