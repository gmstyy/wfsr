<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<form id="taskResultFormId" name="taskResultForm" action="" method="post">
	<input type="text" value="${entity.taskId}" name="taskId" style="display:none;"/>
	<table class="edittable">
		<colgroup>
			<col style="width: 150px;" />
			<col />
		</colgroup>
		<tbody>	
			<tr>
				<th>任务结果</th>		
				<td colspan="3">
					<textarea rows="5" name="taskResult" maxlength="200" style="width:78.5%;">${entity.taskResult}</textarea>
				</td>
			</tr>		
		</tbody>			
	</table>
</form>

