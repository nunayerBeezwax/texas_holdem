$(document).ready(function(){
  var pathname = window.location.pathname

  $('.seat').click(function() {
    $.ajax({
      type:"POST",
      url:"/api"+pathname+"/sit.json",
      contentType: 'application/json',
      datatype: 'json',
      data: JSON.stringify({seat: this.id}),
      success: function(data){
        console.log(data)
        var seat = data.seats.slice(-1)[0].number;
        $('span#sit'+seat).css("display","none");
        $('#seat'+seat).html("<h4>"+data.name+"</h4>"+"<p>"+data.chips+"</p>");
      }
    });
  });

  $('.footer #deal').click(function(){
    $.ajax({
        url:"/api"+pathname+"/deal.json",
        type:"GET", 
        success: function(data){
          $('.hands span').toggleClass('active');
          for (i=0; i<data.length; i++) {
            var card = i+1;
            var move = (data[i].index * -100).toString();
            $('#card'+card.toString()).css("background-position-y", move+"px");
          }
        }
    });
  }); 

  $('.footer #flop').click(function(){
    $.ajax({
        url:"/api"+pathname+"/flop.json",
        type:"GET", 
        success: function(data){
          $('#board1').toggleClass('active');
          $('#board2').toggleClass('active');
          $('#board3').toggleClass('active');
          for (i=0; i<data.length; i++) {
            var card = i+1;
            var move = (data[i].index * -100).toString();
            $('#board'+card.toString()).css("background-position-y", move+"px");
          }
        }
    });
  }); 

  $('.footer #turn').click(function(){
    $.ajax({
        url:"/api"+pathname+"/turn.json",
        type:"GET", 
        success: function(data){
          $('#board4').toggleClass('active');
          var move = (data[0].index * -100).toString();
          $('#board4').css("background-position-y", move+"px");
        }
    });
  });	

  $('.footer #river').click(function(){
    $.ajax({
        url:"/api"+pathname+"/river.json",
        type:"GET", 
        success: function(data){
          $('#board5').toggleClass('active');
          var move = (data[0].index * -100).toString();
          $('#board5').css("background-position-y", move+"px");
        }
    });
  });

  $('.footer #clear').click(function(){
    $.ajax({
        url:"/api"+pathname+"/clear.json",
        type:"GET", 
        success: function(data){
          $('.hands span').toggleClass('active');
          $('.board span').toggleClass('active');
        
      }
    });
  });

  $('.footer #winner').click(function(){
		$.ajax({
  			url:"/api"+pathname+"/winner.json",
  			type:"GET", 
  			success: function(data){
          //replace player chips with string of what hand they have 
        }
    });
  });
});
