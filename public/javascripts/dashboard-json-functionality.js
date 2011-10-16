

/* ======= json functionality ======= */

$(document).ready(function(){

	//jQuery(document).ajaxError(function(event, request, settings){
	
	//	alert("Error");
	
	//});
	
	$('#__sub').live('click', function() {

	$('#accordion-wrapper:first, #company-1').show();

	var s = $('#search').val().toLowerCase();
	var t = new Array();
		t = s.split(' ');
	var j = t.join('-');
	var u = "http://api.crunchbase.com/v/1/company/";

		   $.getJSON('' + u + '' + j + '.js?callback=?', function(data) {
		   
		   var rel	= [];
		   var emp	= [];
		   var prd	= [];
		   var fnd	= [];
		   var off	= [];
		   
		   offices = { office: data.offices };
		   products = { product: data.products };
		   people_employment_statuses = { employment_status: data.relationships };
		   
		   funding_rounds = data.funding_rounds;
		   
			   $.each(data, function(key, value) {
				   
				   if ( key == "name" ) {
					 emp.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
					 
					 company = { 
						
								company: {	
						
										name: data.name,
						 				permalink: data.permalink
										
										} 
								
								};
								//console.log(company);
					 
				   }
				   if ( key == "number_of_employees" ) {
					 emp.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
					 
					 staff_levels = { 
					 
						staff_level: {
						
							number_of_employees: data.number_of_employees,
							company_permalink: data.permalink
						
						}
					 };
					 //console.log(staff_levels);

				   }
				   
			   });
			   $.each(data.funding_rounds, function(i, obj) {
				 $.each(obj, function(key, value) {
					if ( key == "investments" ) {
						$.each(value, function(k, v) {
						   //console.log(k, v);
						   $.each(v, function(l, w) {
							  /*if ( l == "person" ) {
							  $.each(w, function(m, x) {
								  console.log(m, x);
								  funding.push('<li id="' + m + '"><b>' + m + ':</b><span>' + x + '</span></li>');	 
							  });
							  }
							  else {*/
								fnd.push('<li class="' + l + '"><b>' + l + ':</b><span>' + w + '</span></li>');
								//funding_rounds.push();
							  //}
							});
						});
					}
					else {
						fnd.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
					}
				 });
			   });
			   $.each(data.offices, function(i, obj) {
				  $.each(obj, function(key, value) {
					 off.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
				  });
			   });
			   $.each(data.relationships, function(i, obj) {
				  $.each(obj, function(key, value) {
					 if ( key == "person" ) {
						$.each(value, function(key, value) {
							rel.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
							//people_employment_statuses.push('{ relationships1:{'+ key +': "'+ value +'"} }');
						});
					 }
					 else {
						rel.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
						//people_employment_statuses.push('{ relationships2: {'+ key +': "'+ value +'"} }');
					 }
				 });
			   });
			   $.each(data.products, function(i, obj) {
				  $.each(obj, function(key, value) {
					 prd.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
					 //products.push('{ products: {'+ key +': "'+ value +'"} }');
				  });
			   });
			   $('<ul/>', { 'class': 'companies-emp',     html: emp.join('')	  }).appendTo('#staff')		.prepend('<h3>Staff Levels</h3>');
			   $('<ul/>', { 'class': 'companies-prd',	  html: prd.join('')	  }).appendTo('#products')	.prepend('<h3>Products</h3>');
			   $('<ul/>', { 'class': 'companies-rel',     html: rel.join('')	  }).appendTo('#people')	.prepend('<h3>Important People</h3>');
			   $('<ul/>', { 'class': 'companies-off',	  html: off.join('')	  }).appendTo('#location')	.prepend('<h3>Office Locations</h3>');
			   $('<ul/>', { 'class': 'companies-fnd',	  html: fnd.join('')	  }).appendTo('#funding')	.prepend('<h3>Funding Information</h3>');
			   
			
				$(':[rel="test"]').live('click', function() {
					
					var o = data.offices.length;
					var p = data.products.length;
					var f = funding_rounds.length;
					var s = people_employment_statuses.employment_status.length;
					
					$.post('/companies', company, function(data) {
							
						//console.log(data);
						
					});
					$.post('/staff_levels', staff_levels, function(data) {
						
						//console.log(data);
					
					});
					for ( i=0; i<o; i++ ) {
						
						office = { 
						 
							office: { 
							
								description: offices.office[i].description,
								address1: offices.office[i].address1,
								address2: offices.office[i].address2,
								zip_code: offices.office[i].zip_code,
								city: offices.office[i].city,
								state_code: offices.office[i].state_code,
								country_code: offices.office[i].country_code,
								latitude: offices.office[i].latitude,
								longitude: offices.office[i].longitude,
								company_permalink: company.company.permalink
							
							} 
							
						 };
						//console.log(office);
					
						$.post('/offices', office, function(data) {
								
							//console.log(data);
							
						});
					
					}
					for ( i=0; i<p; i++ ) {
					
						product = {
						
							product: {
							
								name: products.product[i].name,
								permalink: products.product[i].permalink,
								company_permalink: company.company.permalink
							
							}
						
						};
					
						$.post('/products', product, function(data) {
								
							//console.log(data);
							
						});
					
					}
					for ( i=0; i<s; i++ ) {
					
						person = {
						
							person: {
							
								first_name: people_employment_statuses.employment_status[i].person.first_name,
								last_name:	people_employment_statuses.employment_status[i].person.last_name,
								permalink:	people_employment_statuses.employment_status[i].person.permalink
							
							}
						
						};
						employment_status = {
						
							employment_status: {
							
								is_past: people_employment_statuses.employment_status[i].is_past,
								title: people_employment_statuses.employment_status[i].title,
								company_permalink: company.company.permalink,
								person_permalink: people_employment_statuses.employment_status[i].person.permalink
							
							}
						
						};
						//console.log(person);
					
						$.post('/people', person, function(data) {
								
							//console.log(data);
							
						});
						$.post('/employment_statuses', employment_status, function(data) {
								
							//console.log(data);
							
						});
					
					}
					$.get('/companies', function(data) {
						
					$('#accordion-wrapper').append('<h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all"><a>'+data.name+'</a></h3><div id="company-1" class="ui-tabs ui-widget ui-widget-content ui-corner-all ui-accordion-content ui-helper-reset ui-corner-bottom"><p>Here we have some new data on '+data.name+'</div></div>');
					
					});
					$.getScript('/dashboard.json', function(data){

						console.log(data);

					});
					
				});

		   });

	});

	$(':[rel="people_sub"]').live('click', function(){
	
	var s = $('#search').val().toLowerCase();
	var t = new Array();
		t = s.split(' ');
	var j = t.join('-');
	var u = "http://api.crunchbase.com/v/1/person/";
								  
		$.getJSON('' + u + '' + j + '.js?callback=?', function(data) {
		
  			var first_name		= [];
			var last_name		= [];
			var investments		= [];
			var relationships	= [];
			var overview		= [];
			//var homepage_url	= [];
		
				$.each(data.relationships, function(i, obj) {
					$.each(obj, function(key, value) {
					   if ( key == "firm" ) {
							$.each(value, function(k, v) {
								  relationships.push('<li id="' + k + '">' + v + '</li>'); 
							});
					   }
					   else {
						   relationships.push('<li class="' + key + '">' + value + '</li>');
					   }
					});
				});
				$.each(data.investments, function(i, obj) {
					$.each(obj, function(key, value) {
					   $.each(value, function(k, v) {
						  if ( k == "company" ) {
							  $.each(v, function(l, w) {
								investments.push('<li id="' + l + '">' + w + '</li>'); 	 
							  });
						  }
						  else {
							  investments.push('<li id="' + k + '">' + v + '</li>'); 
						  }
						});
					});
				});
				$.each(data.first_name, function(key, val) {
				    var n = new Array();
				        n.push(val);
					var o = n.join('');
					    first_name.push(o);
				});
				$.each(data.last_name, function(key, val) {
					var p = new Array();
					    p.push(val);
					var q = p.join('');
					    last_name.push(q);
				});
				//$.each(data.homepage_url, function(key, val) {
				//	homepage_url.push('<li id="' + key + '">' + val + '</li>');
				//});
				$.each(data.overview, function(key, val) {
					var r = new Array();
					    r.push(val);
					var s = r.join('');
					    overview.push(s);
				});

			var name = $('<h2 class="people-name">'+first_name.join('')+' '+last_name.join('')+'</h2>');
			$('<div class="people-overview">'+ overview.join('') +'</div>').appendTo('#staff').prepend(name);
			//$('<ul />', { 'class': 'people-homepage_url', html: homepage_url.join('') }).appendTo('#funding');
			$('<ul />', { 'class': 'people-investments', html: investments.join('')	 }).appendTo('#people').prepend('<h3>Investments</h3>');
			$('<ul />', { 'class': 'people-relationships', html: relationships.join('') }).appendTo('#funding').prepend('<h3>Relationships</h3>');
	     });
	$('div[id^="company-"]').show();
	});
});