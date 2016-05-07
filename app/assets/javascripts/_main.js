$(function() { 
  $.fn.modal.Constructor.prototype.enforceFocus = function() {};
  $('#topic').upvote();
  $('#course_id').select2();
  $('#academium_id').select2();
  $('#user_id').select2();

  var academiumToken = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch: '../search/academy.json',
    remote: {
      url: '../search/academy.json?q=%QUERY',
      wildcard: '%QUERY'
      }
  });

  var bestPictures = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('subject'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch: '../search/topic.json',
    remote: {
      url: '../search/topic.json?q=%QUERY',
      wildcard: '%QUERY'
      }
  });

  $('.typeahead').typeahead(null, {
    name: 'best-pictures',
    display: 'subject',
    source: bestPictures,
    highlight: true

  }).on('typeahead:selected', onAutocompleted);


  $('#academium-input').typeahead(null, {
    name: 'academium',
    display: 'name',
    source: academiumToken,
    highlight: true
  });

  function onAutocompleted($e, datum) {
    window.location.href = '/topics/' + datum.id;
  }


  var $popoverParent = $('[data-toggle=popover]').popover({
    html: true, 
    content: function() {
      return $('#popover-content').html();
    }
  });

  function split( val ) {
    return val.split( /,\s*/ );
  }
  
  function extractLast( term ) {
    return split( term ).pop();
  }

  $popoverParent.on('shown.bs.popover', function()
  {
      var $popover = $(this).data('bs.popover').tip();
      var $closeButton = $popover.find('.test');
      var $input = $popover.find('.tags');
      var $divData = $popover.find('.searchSuggest');

      $closeButton.click(function(){
          $popoverParent.popover('hide');
      });

      $input.bind( "keydown", function( event ) {
        if ( event.keyCode === $.ui.keyCode.TAB &&
          $( this ).autocomplete( "instance" ).menu.active ) {
          event.preventDefault();
        }
      }).autocomplete({
          source: function( request, response ) {
            $.getJSON( "/search/course", {
              q: $input.val()
            }, response );
          },
          search: function() {
            var term = extractLast( this.value );
            if ( term.length < 2 ) {
              return false;
            }
          },
          focus: function() {
            return false;
          },
          open: function(event, ui) {
              $('ul.ui-autocomplete')
                .removeAttr('style').hide()
                .appendTo($divData).show();
          },
          close : function (event, ui) {
            if (!$("ul.ui-autocomplete").is(":visible")) {
              $("ul.ui-autocomplete").show();
            }
          },
          messages: {
            noResults: '',
            results: function() {}
          },
          select: function (event, ui) {
            var terms = split( this.value );
            terms.pop();
            terms.push( ui.item.value );
            terms.push( "" );
            this.value = terms.join( ", " );
            console.log('hey');
          }
      }).autocomplete( "instance" )._renderItem = function( ul, item ) {
          var constructUrl = '/courses/' + item.id + '/follow';
      return $( '<li>' )
        .append( 
           "<form action='"+ constructUrl +"' method='post'>" +
               "<button type='submit' class='btn-link'>" + item.name + "</button></form>" 
          )
        .appendTo( ul );
    };
  });

  $("html").on("click", function(e) {
      if (typeof $(e.target).data('original-title') == 'undefined' && 
        !$(e.target).parents().is('.popover.in')) {
         $('[data-original-title]').popover('hide');
      }
  });

  console.log('passed');

});