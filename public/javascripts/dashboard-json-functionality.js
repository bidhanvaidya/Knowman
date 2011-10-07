

/* ======= json functionality ======= */


$(function(){


	$('#__sub').live('click', function() {

	$('#company-1').show();

					 
	var s = $('#search').val().toLowerCase();
	var t = new Array();
		t = s.split(' ');
	var j = t.join('-');
	var u = "http://api.crunchbase.com/v/1/company/";

		   $.getJSON('' + u + '' + j + '.js?callback=?', function(data) {
		   
		   var rels		= [];
		   var emps		= [];
		   var prod		= [];
		   var monies	= [];
		   var funding	= [];
		   var offices	= [];
		   
			   $.each(data, function(key, value) {
				   if ( key == "number_of_employees" ) {
					 emps.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
					 emps.push('<li><input class="hidden-element-emps" type="hidden" value="'+ value +'" name="stlevel[staff_number]"></li>');
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
								  funding.push('<li id="' + l + '"><b>' + l + ':</b><span>' + w + '</span></li>');
								  funding.push('<li><input class="hidden-element-funding" type="hidden" value="'+ w +'" name="'+k+'['+v+']"></li>');
							  //}
							});
						});
					}
					else {
						funding.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
						funding.push('<li><input class="hidden-element-funding" type="hidden" value="'+ value +'" name="'+key+'['+key+']"></li>');
					}
				 });
			   });
			   $.each(data.offices, function(i, obj) {
				  $.each(obj, function(key, value) {
					 offices.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
					 offices.push('<li><input class="hidden-element-offices" type="hidden" value="'+ value +'" name="'+key+'['+key+']"></li>');
				  });
			   });
			   $.each(data.relationships, function(i, obj) {
				  $.each(obj, function(key, value) {
					 if ( key == "person" ) {
						$.each(value, function(key, value) {
							rels.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
							rels.push('<li><input class="hidden-element-rels" type="hidden" value="'+ value +'" name="'+key+'['+key+']"></li>');
						});
					 }
					 else {
						rels.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
						rels.push('<li><input class="hidden-element-rels" type="hidden" value="'+ value +'" name="'+key+'['+key+']"></li>');
					 }
				 });
			   });
			   $.each(data.products, function(i, obj) {
				  $.each(obj, function(key, value) {
					 prod.push('<li id="' + key + '"><b>' + key + ':</b><span>' + value + '</span></li>');
					 prod.push('<li><input class="hidden-element-products" type="hidden" value="'+ value +'" name="'+key+'['+key+']"></li>');
				  });
			   });
			   $('<ul/>', { 'class': 'companies-emps',    html: emps.join('')	  }).appendTo('#staff').prepend('<h3>Staff Levels</h3>');
			   $('<ul/>', { 'class': 'companies-prods',   html: prod.join('')	  }).appendTo('#products').prepend('<h3>Products</h3>');
			   $('<ul/>', { 'class': 'companies-rels',    html: rels.join('')	  }).appendTo('#people').prepend('<h3>Important People</h3>');
			   $('<ul/>', { 'class': 'companies-offices', html: offices.join('') }).appendTo('#location').prepend('<h3>Office Locations</h3>');
			   $('<ul/>', { 'class': 'companies-funding', html: funding.join('') }).appendTo('#funding').prepend('<h3>Funding Information</h3>');
		   });
					 
	$('body').append('<input type="submit" value="submit" name="commit">');
	$('body').wrap('<form method="post" action="companies/new" />');

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
		
				$.each(data.relationships, function(key, val) {
					   console.log(key, val);
					relationships.push('<li id="' + key + '">' + val + '</li>');
				});
				$.each(data.investments, function(key, val) {
					investments.push('<li id="' + key + '">' + val + '</li>');
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

			var test = $('<h2 class="people-name">'+first_name.join('')+' '+last_name.join('')+'</h2>');
			$('<div class="people-overview">'+ overview.join('') +'</div>').appendTo('#staff').prepend(test);
			//$('<ul />', { 'class': 'people-homepage_url', html: homepage_url.join('') }).appendTo('#funding');
			$('<ul />', { 'class': 'people-investments', html: investments.join('')	 }).appendTo('#people').prepend('<h3>Investments</h3>');
			$('<ul />', { 'class': 'people-relationships', html: relationships.join('') }).appendTo('#funding').prepend('<h3>Relationships</h3>');
	     });
	$('#company-1').show();
	});

});