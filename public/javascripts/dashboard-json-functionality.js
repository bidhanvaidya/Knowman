

/* ======= json functionality ======= */


$(document).ready(function(){


	$('#__sub').live('click', function() {

	$('#company-1').show();

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
		   
 		   var company						= [];
		   var offices						= ['{ offices:'						+ data.offices				+ '}'];
		   var products						= ['{ products:'					+ data.products				+ '}'];
		   var staff_levels					= [     /* staff_levels is populated with an if clause below */		 ];
		   var funding_rounds				= ['{ funding_rounds:'				+ data.funding_rounds		+ '}'];
		   var people_employment_statuses	= ['{ people_employment_statuses:'	+ data.relationships		+ '}'];
		   
			   $.each(data, function(key, value) {
				   
				   if ( key == "name" ) {
					 emp.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
					 
					 var name = jQuery.parseJSON(' company:{ "'+ key +'":{"'+ value +'"} ');
					 company.push(name);
					 
				   }
				   if ( key == "number_of_employees" ) {
					 emp.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
					 staff_levels.push('{ staff_levels: {'+ key +': "'+ value +'"} }');
					 
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
					 //offices.push('{'+ key +': "'+ value +'"}');
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

			console.log(company);
			console.log(offices);
			//console.log(products);
			//console.log(staff_levels);
			//console.log(funding_rounds);
			//console.log(people_employment_statuses);
			
				$(':[rel="test"]').live('click', function() {
		
					/*var test =	{ company: {	name: "Facebook",
												company_type: "big",
												company_field: "the webosphere" }
								}*/
										
							
					$.post('/companies', company, function(data) {
							
						console.log(company);	   
								   
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
	$('#company-1').show();
	});
});