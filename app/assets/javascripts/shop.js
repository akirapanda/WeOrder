//= require jquery
//= require jquery_ujs

//= require shop/config
//= require shop/modernizr-2.6.2.min
//= require shop/jquery-1.8.1.min
//= require bootstrap.min
//= require shop/jquery.nivo.slider.pack
//= require shop/respond.min
//= require shop/script
//= require shop/jquery.colorbox-1.3.19.min
//= require shop/jquery.nivo.slider.pack
//= require carts


$(function(){
        // 页面浮动面板
        $("#floatPanel > .ctrolPanel > a.arrow").eq(0).click(function(){$("html,body").animate({scrollTop :0}, 800);return false;});
        $("#floatPanel > .ctrolPanel > a.arrow").eq(1).click(function(){$("html,body").animate({scrollTop : $(document).height()}, 800);return false;});

        var objPopPanel = $("#floatPanel > .popPanel");	
        var w = objPopPanel.outerWidth();
        $("#floatPanel > .ctrolPanel > a.qrcode").bind({
            mouseover : function(){
                        objPopPanel.css("width","0px").show();
                        objPopPanel.animate({"width" : w + "px"},300);return false;
                },
                mouseout : function(){
                        objPopPanel.animate({"width" : "0px"},300);return false;
                        objPopPanel.css("width",w + "px");
            }	
        });
    });

