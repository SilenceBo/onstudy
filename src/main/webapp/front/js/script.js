/**
 * Created by Administrator on 2017/6/10.
 */

$(function () {
    //$(".shareKj").hide();
    //$("#offSide").hide(0);
    $(".but").on('mouseover',function () {
        hideIndentation();
    });
    $(".mask").on('mouseout',function () {
       showIndentation();
    });
    var falg=0;
    $("#section1").on('click',function () {
        // $("#offSide").addClass("show").animate({
        //     'speed':1000
        // });
        // $("#offSide").hide(500);

        if(falg==1){
           // alert("_++++++++++++++++++");
            $("#offSide").addClass("show");
            console.log($(".offSide").attr());
            falg=0;
        }

        if(falg==0){
            alert("*************");
            $("#offset").removeClass("show").addClass("hide");
            falg=1;
        }

    });
     //课程目录切换
    listChange();
});

function hideIndentation() {
      $(".mask").fadeIn();
      $(".shareKj").show(300);
}

function showIndentation() {
    $(".mask").fadeOut();
    $(".shareKj").hide(300);
}

// function showSide() {
//     $(".offset").show();
// }

function listChange() {
    var list=$('.switch');
    var elLis=$(".listUl li");
    //console.log(list);
    elLis.on('click',function () {
        alert("****************");
        $(this).removeClass("hide").addClass("show");
    })
}
