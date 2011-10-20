$(function(){
	
$(function() {$( ".datepicker" ).datepicker({dateFormat: "yy-mm-dd"});});
$('#input-new-company-dialog').dialog({ 
	autoOpen:false,
	title:"Sorry, we couldn't find what you were looking for. Feel free to add a new record.",
	width:400,
	modal:true,
	position:'top',
	draggable:false,
	closeOnEscape:true
	
});
$('#input-new-company-form').formToWizard({ submitButton:'input-new-company-form-button' });

//interface functionality
$(function() {

  $('#actions > *').hide();
  
  
  $('.accordion-sub-menu > a').live('click', function(e) {
  
								var src = $(this).parent().parent().attr('id');
								tmp = $(this).parent().parent().parent().attr('id');
								
								t = new Array();
								t = tmp.split('-');
								
								s = new Array();
								s = src.split('-');
									
								$('#actions').children().hide();
								$('#actions').children(':[class$="'+s[0]+'"]').show();
								e.preventDefault();
							
  });
	$('button[rel="new-staff-level"]').live('click', function(e){

		var company_permalink = s[1];		
		var number_of_employees = $('input[name="new_staff_level"]').val();
		var date = $('input[name="staff-date"]').val();

		new_staff_level = { 
			
			staff_level: {	
			
					number_of_employees: number_of_employees,
					company_permalink: company_permalink,
					date_of_record: date
							
			} 
					
		};
		$.post('/staff_levels', new_staff_level, function(data){});
		e.preventDefault();

	});
	$('button[rel="new-office-location"]').live('click', function(e){

		var company_permalink 	= s[1];		
		var description 		= $('input[name="description"]').val();
		var address1 			= $('input[name="address1"]').val();
		var address2 			= $('input[name="address2"]').val();
		var zip_code 			= $('input[name="zip-code"]').val();
		var state_code 			= $('input[name="state-code"]').val();
		var city_code 			= $('input[name="city-code"]').val();
		var country_code 		= $('input[name="country-code"]').val();
		
		new_office = { 
			
			office: {	
			
				company_permalink: company_permalink,
				description: description,
				address1: address1,
				address2: address2,
				zip_code: zip_code,
				state_code: state_code,
				city_code: city_code,
				country_code: country_code
							
			} 
					
		};
		console.log(office);
		//$.post('/offices', new_office, function(data){});
		e.preventDefault();

	});
	$('button[rel=input-new-company-button]').live('click', function(e){
	
		var company_name		= $('input[name="new-company"]').val();
		var number_of_employees = $('input[name="new-company-staff-level"]').val();
		
		e.preventDefault();
		
		company = { company: { name: company_name, permalink: company_name } };
		staff_levels = { staff_level: { number_of_employees: number_of_employees, company_permalink: company_name } };
		
		$.post('/companies', company, function(data){});
		$.post('/staff_levels', staff_levels, function(data){});
		$('#actions > #query-status').show().append('<p>'+ company_name +' details sre now stored in the database.</p>');
		$('#input-new-company-dialog').dialog('close');
	
	});
	

		
  $('#choice-tabs, div[id^="company-"]').tabs();
  $('#choice-tabs').removeClass('ui-corner-all');
  
  $('#toolbar > div > a > span').click(function(e){
									   
									   $('.active').removeClass('active'); // for usability
									   
									   e.preventDefault(); //prevent anchor behaviour
									   var h = $(this).parent('a[class^="tabs-"]').attr('class'); //parse list of anchor's classes
									   var i = new Array(); //create empty array
									   i = h.split(' '); // populate array with list
									   var j = $('a[href="#'+ i[0] +'"]'); // find anchor with href which matches anchor user clicked on
									   
									   j.click(); // click corresponding anchor
									   
									   var name = "name"; //
									   
									   if ( $('#'+ i[0] +'').is(':empty') ) {
									   
									   $('#input-field').clone().appendTo('#'+ i[0] +'');
									   
									   }
									   $(this).addClass('active');
									   
									   });
  $('#mainmenu-button-holder > button').click(function(){
											  
											  var h = $(this).attr('id');
											  var i = $('a[href="/'+ h +'"]');
											  i.click();
											  
											  });
  
  $('.accordion > div > h3 > button').click(function(){
											
											var h = $(this).attr('rel');
											var i = $('a[href="#'+ h +'"]');
											i.click();
											
											});
  
  $('body').keypress(function(e){
  
	 var s = $('#__sub');
	 
	 if ( e.which == 13) {
	 
		e.preventDefault();
		s.click();
	 
	 }
	
  });
  
  var stop = false;
  
  $('.accordion h3').click(function(e) {
						   
						   if ( stop ) {
						   e.stopImmediatePropagation();
						   e.preventDefault();
						   stop = false;
						   }
						   
						   });
  
  $('.accordion').accordion({
							header: "> div > h3"
							}).sortable({
										axis: "y",
										handle: "h3",
										stop: function() {
										stop = true;
										}
										});
  });
$('li > span').live('click', function(){
					
					var val	= $(this).text();
					
					if (val == "null") {
					
					$('#actions').show();
					
					}
					
					}).live('click', function(){
							
							//$('#actions').hide();
							
							});
  
});
