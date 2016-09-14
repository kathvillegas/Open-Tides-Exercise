<%--
	- A template page for your reference
	-
	- @author - Your name here
--%>
<%@ page contentType="text/html;utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="tides" uri="http://www.ideyatech.com/tides"%>

<app:header pageTitle="label.employee" active="employee"/>

<div id="employee-body" class="container">

<div id="search-body">

	<div id="search-panel" class="span3">

		<div id="search-panel-inner" data-spy="affix" data-offset-top="60">
			<div class="navbar">
				<div class="navbar-inner">
					<span class="brand"><i class="icon-search"></i><spring:message code="label.search" /></span>
					<a class="show-search-form btn collapsed pull-right hidden-desktop hidden-tablet" data-toggle="collapse" data-target=".search-form">
						<i class="icon-chevron-up"></i>
						<i class="icon-chevron-down"></i>
					</a>
				</div>
			</div>
			<div class="search-form collapse">
				<form:form modelAttribute="searchCommand" id="employee-search" >
					<!-- Define search fields here -->
					<tides:input label = "label.employee.firstName" path="firstName" />
					<tides:input label = "label.employee.lastName" path="lastName" />
					<hr/>
					<input type="submit" class="btn btn-info btn-block" data-submit="search" value="<spring:message code="label.search"/>">
					<button type="button" class="btn btn-link btn-block" data-submit="clear"><spring:message code="label.clear" /></button>
				</form:form>
			</div>
		</div>
	</div>
	
	<div id="results-panel" class="span9">
		
		<div id="message-panel" class="row-fluid">
			<button id="employee-add" class="btn btn-info add-action">
				<i class="icon-plus-sign icon-white"></i>
				<spring:message code="label.employee.add" />
			</button>
			<div class="status" data-display-pagelinks="false" data-display-summary="true" data-summary-message='
				<spring:message code="message.displaying-x-of-y" arguments="${symbol_pound}start,${symbol_pound}end,${symbol_pound}total,records"/>
			'>
				<tides:status results="${results}" />
			</div>
		</div>
		
		<div class="clear"></div>
		
		<div class="table-wrapper-2 overflow-hidden">
			<div class="table-wrapper">
				<table id="employee-results" class="footable table-bordered table-striped table-hover table-condensed" data-page="${results.currPage}" >
					<thead>
						<tr class="table-header">
							<!-- Define headers here -->
							<th><spring:message code="label.employee.email"></spring:message></th>
							<th><spring:message code="label.employee.firstName"></spring:message></th>
							<th><spring:message code="label.employee.lastName"></spring:message></th>
							<th data-field-name="ot3-controls"></th>
						</tr>
					</thead>
					<tbody>
						<script type="text/template" class="template">
	                		<tr id="employee-row-{{id}}" data-id="{{id}}">
								<!-- Define template here -->
								<td>
									{{emailAddress}}
								</td>
								<td>
									{{firstName}}
								</td>
								<td>
									{{lastName}}
								</td>
								<td>
									<i class='icon-pencil edit-action' data-id='{{id}}' data-title="<spring:message code="label.edit" />"></i>
									<i class='icon-trash remove-action' data-id='{{id}}' data-title="<spring:message code="label.delete" />"></i>
									<i class='icon icon-list addSkill-action' data-id='{{id}}' data-title="<spring:message code="label.employee.manageSkill" />"></i>
									<i class='icon icon-calendar addDtr-action' data-id='{{id}}' data-title="<spring:message code="label.employee.addDtr" />"></i>
								</td>
							</tr>
						</script>
						<c:forEach items="${results.results}" var="record" varStatus="status">
							<tr data-id="${record.id}">
								<!-- Define table body here -->
								<td>
									<c:out value="${record.emailAddress}"/>
								</td>
								<td>
									<c:out value="${record.firstName}"/>
								</td>
								<td>
									<c:out value="${record.lastName}"/>
								</td>
								<td>
									<i class='icon-pencil edit-action' data-id='${record.id}' data-title="<spring:message code="label.edit" />"></i>
									<i class='icon-trash remove-action' data-id='${record.id}' data-title="<spring:message code="label.delete" />"></i>
									<i class='icon icon-list addSkill-action' data-id='${record.id}' data-title="<spring:message code="label.employee.manageSkill" />"></i>
									<i class='icon icon-calendar addDtr-action' data-id='${record.id}' data-title="<spring:message code="label.employee.addDtr" />"></i>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>	
			</div>
		</div>

		<div class="paging clearfix">
			<tides:paging results="${results}"/>
		</div>
	</div>
	
</div>

<div id="form-body" class="modal fade hide">

	<div id="form-panel" >
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="${add}"><spring:message code="label.employee.add" /></h4>
			<h4 class="${update}"><spring:message code="label.employee.update" /></h4>
		</div>

		<form:form modelAttribute="formCommand" id="employee-form">
			<div class="modal-body">
				<div class="message-container"></div>
				<!-- Define form fields here -->
				<tides:input label = "label.employee.firstName" path="firstName" required="true" />
				<tides:input label = "label.employee.middleName" path="middleName" />
				<tides:input label = "label.employee.lastName" path="lastName" required="true"/>
				<tides:input label = "label.employee.email" path="emailAddress" required="true"/>
				<tides:date_picker label = "label.employee.birthDate" path="birthDate" required="true"/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-link" data-dismiss="modal"><spring:message code="label.close" /></button>
				<input type="submit" class="btn btn-info  ${add}" data-form-display="add" data-submit="save-and-new" value="<spring:message code="label.save-and-new" />" />
				<input type="submit" class="btn btn-success" data-submit="save" value="<spring:message code="label.save" />" />
				<input type="hidden" name="id" />
			</div>
		</form:form>
	</div>
	
</div>

<div class="adjust-photo-modal modal hide fade" data-width="760" tabindex="-1"></div>
<div class="upload-photo-modal modal hide fade" data-width="760" tabindex="-2"></div>

</div>
<!-- SKILL MODAL -->
<div id="skills-body" class="modal fade hide">
	<div id="form-panel" >
		<div class="modal-header">
			<button id="add-skill" class="btn btn-info add-action">
				<i class="icon-plus-sign icon-white"></i>
				<spring:message code="label.employee.addSkill" />
			</button> 
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
		<div class="modal-body">
			<div class="skills-container">
			</div>
		</div>
	</div>	
</div>
<!-- DTR MODAL -->
<div id="dtr-body" class="modal fade hide">
	<div id="form-panel" >
		<div class="modal-header">
			<button id="add-dtr" class="btn btn-info add-action">
				<i class="icon-plus-sign icon-white"></i>
				<spring:message code="label.employee.addDtr" />
			</button> 
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
		<div class="modal-body">
			<div class="dtr-container">
			</div>
		</div>
	</div>	
</div>

<!--  SKILL SAVE TEMPLATE -->
<script type="text/template" id="skills-template">
	<form id="skillForm" class="row-fluid skill-row" data-id={{id}}>
		<div class="span5">
		    <input type="hidden" value="{{id}}" name="employee" data-id={{id}} />
			<input type="text" readonly="readonly" value="{{name}}" name="name" data-id={{id}} />
		</div>
		<div  class="span5">
			<input type="number" readonly="readonly" value="{{rating}}" name="rating" data-id={{id}} />
		</div>
		<div class="span2">
			<i class='icon-save save-skill-action hide' data-id='{{id}}' data-title="<spring:message code="label.skill.save" />"></i>
			<i class='icon-pencil edit-action' data-id='{{id}}' data-title="<spring:message code="label.edit" />"></i>
			<i class='icon-save update-skill-action hide' data-id='{{id}}' data-title="<spring:message code="label.skill.update" />"></i>
			<i class='icon-trash remove-action' data-id='{{id}}' data-title="<spring:message code="label.delete" />"></i>
		</div>
	</form>
</script>
<!-- DAILY TIME RECORD SAVE TEMPLATE -->
<script type="text/template" id="dtr-template">
	<form id="dtrForm" class="dtr-row">
		<div class="row-fluid" data-id={{id}}>
		<div class="span6">
		    <input type="hidden" value="{{id}}" name="employee" data-id={{id}} />
			<input type="datetime-local" readonly="readonly" value="{{timeInWithTime}}" name="timeIn" data-id={{id}} />
		</div>
		<div  class="span6">
			<input type="datetime-local" readonly="readonly" value="{{timeOutWithTime}}" name="timeOut" data-id={{id}} />
		</div>
		<div class="span6">
			<select disabled="true" value="{{timesheet}}" name="timesheet" data-id={{id}}>
			<c:forEach items="${timesheets}" var="record" varStatus="status">
					console.log(${record.cutOffStart});
					<option value="${record.id}">${record.cutOffStart} to ${record.cutOffEnd}</option>
			</c:forEach>
			</select>
		</div>
		<div class="span6">
			<i class='icon-save save-dtr-action hide' data-id='{{id}}' data-title="<spring:message code="label.edit" />"></i>
			<i class='icon-pencil edit-action' data-id='{{id}}' data-title="<spring:message code="label.edit" />"></i>
			<i class='icon-trash remove-action' data-id='{{id}}' data-title="<spring:message code="label.delete" />"></i>
		</div>
		</div>
	</form>
</script>
<tides:footer>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#employee-body").RESTful();
			
			$('.footable').footable();
			
			$('body').tooltip({selector: '.edit-action, .remove-action, .addSkill-action, .addDtr-action, .update-skill-action, .edit-skill-action'});
			
			// SKILL MODAL TRIGGER
			$('.icon-list').click(function() {
				var id = $(this).data('id');
				$("#skills-body").on("hidden.bs.modal", function(){
				    $(".skills-container").html("");
				});
				$('#skills-body').modal('show');
				$('#skills-body').data('employee', id);
				$.getJSON(
					'skill/findByEmployeeId/' + id, // url
					null, // data
					function(skills) { // callback
						var template = opentides3.template($('#skills-template').html());
						$.each(skills, function(i, skill) {
							var skillRow = template(skill);
							$('#skills-body .skills-container').append(skillRow);
						})
					}
				);
			});
			
			// DTR MODAL TRIGGER
			$('.icon-calendar').click(function() {
				var id = $(this).data('id');
				$("#dtr-body").on("hidden.bs.modal", function(){
				    $(".dtr-container").html("");
				});
				$('#dtr-body').modal('show');
				$('#dtr-body').data('employee', id);
				$.getJSON(
					'dailyTimeRecord/findByEmployeeId/' + id, // url
					null, // data
					function(dtr) { // callback
						var template = opentides3.template($('#dtr-template').html());
						console.log(dtr);
						$.each(dtr, function(i, dtr) {
							var dtrRow = template(dtr);
							
							$('#dtr-body .dtr-container').append(dtrRow);
						})
					}
				);
			});
			
			//SKILL ADD FORM TRIGGER
			$('#add-skill').click(function() {
				var newSkillRow = opentides3.template($('#skills-template').html(), {
					id : $('#skills-body').data('employee'),
					rating : "",
					name : ""
				});
				$('#skills-body .skills-container').append(newSkillRow);
				
				var newRow = $('.skills-container #skillForm').last();
				newRow.find('input').prop('readonly', false);
				newRow.find('.save-skill-action').removeClass('hide');
				newRow.find('.edit-action').addClass('hide');
				newRow.find('.remove-action').addClass('hide');
			});
			
			// DTR ADD FORM TRIGGER
			$('#add-dtr').click(function() {
				var newDtrRow = opentides3.template($('#dtr-template').html(), {
					id : $('#dtr-body').data('employee'),
					timeIn : "",
					timeInWithTime: "",
					timeOut : "",
					timeOutWithTime: "",
					timesheet: ""
				});
				$('#dtr-body .dtr-container').append(newDtrRow);
				var newRow = $('.dtr-container #dtrForm').last();
				newRow.find('input').prop('readonly', false);
				newRow.find('select').prop('disabled', false);
				newRow.find('.save-dtr-action').removeClass('hide');
				newRow.find('.edit-action').addClass('hide');
				newRow.find('.remove-action').addClass('hide');
			});
			
			///SAVING SKILL
		}).on('click', '.save-skill-action', function() {
			var skillRow = $(this).closest('.skill-row');
			$.ajax({type : 'POST', // method
				url : 'skill', // url
				data : skillRow.serialize(), // data
				success : function(json) { // callback
					if (typeof (json.command) === 'object'
						&& json.command.id > 0) {
						skillRow.find('input').prop('readonly', true);
						skillRow.find('.save-skill-action').addClass('hide');
						skillRow.find('.edit-action').removeClass('hide');
						skillRow.find('.remove-action').removeClass('hide');
					}
				},
					dataType : 'json'
			});
				//EDIT SKILL
			}).on('click', '.edit-action', function() {
				var skillRow = $(this).closest('.skill-row');
				skillRow.find('input').prop('readonly', false);
				skillRow.find('.update-skill-action').removeClass('hide');
				skillRow.find('.edit-action').addClass('hide');
				skillRow.find('.remove-action').addClass('hide');

				//UPDATE SKILL
			}).on('click', '.update-skill-action', function() {
				var id =  $(this).data('id');
				alert(id);
				var skillRow = $(this).closest('.skill-row');
				$.ajax({type : 'POST', // method
					url : 'skill/' + id, // url
					data : skillRow.serialize(), // data
					success : function(json) { // callback
						if (typeof (json.command) === 'object'
							&& json.command.id > 0) {
							skillRow.find('input').prop('readonly', true);
							skillRow.find('.update-skill-action').addClass('hide');
							skillRow.find('.edit-action').removeClass('hide');
							skillRow.find('.remove-action').removeClass('hide');
						}
					},
						dataType : 'json'
				});
				//SAVING DTR
			}).on('click', '.save-dtr-action', function() {
				var dtrRow = $(this).closest('.dtr-row');
				$.ajax({type : 'POST', // method
					url : '${home}/dailyTimeRecord', // url
					data : dtrRow.serialize(), // data
					success : function(json) { // callback
						if (typeof (json.command) === 'object'
							&& json.command.id > 0) {
							alert(dtrRow.serialize());
							dtrRow.find('input').prop('readonly', true);
							dtrRow.find('select').prop('disabled', true);
							dtrRow.find('.save-dtr-action').addClass('hide');
							dtrRow.find('.edit-action').removeClass('hide');
							dtrRow.find('.remove-action').removeClass('hide');
						}
					},
						dataType : 'json'
				});
			});
	</script>
</tides:footer>