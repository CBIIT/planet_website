// Javascript File

var addthisboxinitialized = false;
   $(document).ready(function() {
      $.listen('focus','#at16filt',function(e){
         if (!addthisboxinitialized){
            $('#at16filt').attr('title','Filter AddThis Resources.');
            var totalItems = 0;
            $('#at16ps div.at_item').each(
               function( itemIndex ){
                  totalItems = itemIndex;
                  innerspan = $( this ).html();
                  $( this ).html('');
                  jQuery(" <a />" ).attr("id","newItem" + itemIndex).attr( "href", "#").attr("tabindex",itemIndex+2).html( innerspan).appendTo($(this)); 
               }
            );
            $('#at16ptx').attr("tabindex",totalItems+3);
         }
         addthisboxinitialized = true;
      });
   });