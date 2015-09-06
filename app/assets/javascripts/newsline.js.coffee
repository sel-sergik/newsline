$(document).ready ()->
	$('#event_datepicker').datetimepicker(
		format:'d/m/Y H:i'
	)

	#illuminate the current category
	$('.categories_filter_block a').on 'click', ()->
		$('.filters_form input#category_id').val($(this).data('id'))
		$('.categories_filter_block a').removeClass('active')
		$(this).addClass('active')
		check_cat = $('.categories_filter_block a i.fa-check-circle')
		check_cat.removeClass('fa-check-circle')
		check_cat.addClass('fa-check-circle-o')
		$(this).find('i').removeClass('fa-check-circle-o')
		$(this).find('i').addClass('fa-check-circle')

	#add load indicator
	$('a.next_page_link').on 'click', ()->
		$(this).remove()
		$('.pagination span.next').text('Loading...')