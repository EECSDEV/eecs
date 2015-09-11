

$(document).ready(function(){
    // $('#button').click(function(){
    //     var toAdd = $('input[name=checkListItem]').val();
    //     $('.list').append('<div class="item">'+ toAdd + '</div>');
    // });
    
    set_date_position();
    //shining animation effect for "today"
    shining_colors = ['#ff6faf','transparent'];
 
    var i = 0;
    change_today_color = function(){
        var d = new Date(Date.now());
        var day = d.getDate();

        $("#date_" + day.toString()).animate({
            backgroundColor: shining_colors[(i++)%shining_colors.length] 
            }, 700, function(){
                change_today_color();
               
        });
    }
    change_today_color();
});

// function change_pos(){
//     $("#date_2"+"3").css("position","absolute");
//     $("#date_2"+"3").css("left","900px");
//     $("#date_2"+"3").css("top","10px");
// }

function set_date_position(){
    var num_date = 30;  /* number of displayed date circles */
    // $("#date_20").css({"position":"absolute", "margin-left", "300px", "margin-top": "5px"});
    // $("#date_1").css("position":"absoulte", "left":"900px", "top":"5px");
    for (var i = 2; i <= num_date; i++) {
        // var date_pre = $("#date_" + (i-1).toString() )
        // var pre_pos = date_pre.position();
        $( "#date_"+ (i).toString() ).css( "position", "absolute");
        $( "#date_"+ (i).toString() ).css( "left", ((i-1)*40+60).toString() +"px" );
        $( "#date_"+ (i).toString() ).css( "top", "5px" );
    }
}


var animation_complete_back = true;
var animation_complete_forw = true;

$('#calender_back').click(function(){
    var pos = $('#sliding_board').position();
    if(pos.left>0 && animation_complete_back==true){
        animation_complete_back = false;
        $('#sliding_board').animate({'left': "-=250px"},
            {queue:false, duration:800, easing: 'swing'}, function(){
                
            });      
        animation_complete_back = true;  
    }
});

$('#calender_forw').click(function(){
    var pos = $('#sliding_board').position();
    if(pos.left<1000 && animation_complete_forw==true){
        animation_complete_forw = false;
        $('#sliding_board').animate({'left': "+=250px"},
            {queue:false, duration:800, easing: 'swing'}, function(){
                
            });        
        animation_complete_forw = true;
    }
});

$('.date').mouseover(function(){
    $(this).css('background-color',"#ff2f5f");

});

$('.date').mouseout(function(){
    $(this).css('background-color',"transparent");
});





