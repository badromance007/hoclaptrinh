// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require social-share-button
//= require_tree .


$( document ).on('page:load', function() {
  // Handler for .ready() called.
  $("#post_content").bind('paste', function(e) {
      var el = $(this);
   
      setTimeout(function() {
          var text = $(el).val();
           
          // send url to service for parsing
          $.ajax('/linkpreview', {
              type: 'POST',
              data: { url: text },
              success: function(data,textStatus,jqXHR ) {
                  // handle received data
                  $("#preview-title").text(data['title']);
                  $("#preview-description").text(data['description']);
                  $("#preview-image").attr('src', data['image_url']);
                  $("#preview-url").text("By " + data['url']);
              },
              error: function() { alert("Extract link error"); }
          });
      }, 100);
  });
});

// after the page is loaded
$( document ).ready( function() {
  // Handler for .ready() called.
  $("#post_content").bind('paste', function(e) {
      var el = $(this);
   
      setTimeout(function() {
          var text = $(el).val();
           
          // send url to service for parsing
          $.ajax('/linkpreview', {
              type: 'POST',
              data: { url: text },
              success: function(data,textStatus,jqXHR ) {
                  // handle received data
                  $("#preview-title").text(data['title']);
                  $("#preview-description").text(data['description']);
                  $("#preview-image").attr('src', data['image_url']);
                  $("#preview-url").text("By " + data['url']);
              },
              error: function() { alert("error"); }
          });
      }, 100);
  });
});



      /*// for index page
      $( document ).on('page:load', function() {
        // Handler for .ready() called.   
            setTimeout(function() {
                var text = "http://news.zing.vn/the-thao/the-thao-viet-nam.htmlhttp://news.zing.vn/Cong-Phuong-vuot-ky-luc-ghi-ban-cua-Cong-Vinh-post499847.html";
          
                 
                // send url to service for parsing
                $.ajax('/linkpreview', {
                    type: 'POST',
                    data: { url: text },
                    success: function(data,textStatus,jqXHR ) {
                        // handle received data
                        $( "._2 > .preview-title").text(data['title']);
                        $( "._2 > .preview-description").text(data['description']);
                        $( "._2 > .preview-image").attr('src', data['image_url']);
                        $( "._2 > .preview-url").text("By " + data['url']);
                    },
                    error: function() { alert("Extract link error"); }
                });
            }, 100);
       
      });
      $( document ).ready(function() {
        // Handler for .ready() called.   
            setTimeout(function() {
                var text = "http://news.zing.vn/the-thao/the-thao-viet-nam.htmlhttp://news.zing.vn/Cong-Phuong-vuot-ky-luc-ghi-ban-cua-Cong-Vinh-post499847.html";
                 
                // send url to service for parsing
                $.ajax('/linkpreview', {
                    type: 'POST',
                    data: { url: text },
                    success: function(data,textStatus,jqXHR ) {
                        // handle received data

                        $( "._2.preview-title").text(data['title']);
                        $( "._2.preview-description").text(data['description']);
                        $( "._2.preview-image").attr('src', data['image_url']);
                        $( "._2.preview-url").text("By " + data['url']);
                    },
                    error: function() { alert("Extract link error"); }
                });
            }, 100);
       
      });
    
      // for index page
      $( document ).on('page:load', function() {
        // Handler for .ready() called.   
            setTimeout(function() {
                var text = "http://thethao.vnexpress.net/tin-tuc/la-liga/atletico-day-real-vao-chan-tuong-tai-cup-nha-vua-3130785.html";
          
                 
                // send url to service for parsing
                $.ajax('/linkpreview', {
                    type: 'POST',
                    data: { url: text },
                    success: function(data,textStatus,jqXHR ) {
                        // handle received data
                        $( "._3 > .preview-title").text(data['title']);
                        $( "._3 > .preview-description").text(data['description']);
                        $( "._3 > .preview-image").attr('src', data['image_url']);
                        $( "._3 > .preview-url").text("By " + data['url']);
                    },
                    error: function() { alert("Extract link error"); }
                });
            }, 100);
       
      });
      $( document ).ready(function() {
        // Handler for .ready() called.   
            setTimeout(function() {
                var text = "http://thethao.vnexpress.net/tin-tuc/la-liga/atletico-day-real-vao-chan-tuong-tai-cup-nha-vua-3130785.html";
                 
                // send url to service for parsing
                $.ajax('/linkpreview', {
                    type: 'POST',
                    data: { url: text },
                    success: function(data,textStatus,jqXHR ) {
                        // handle received data

                        $( "._3 > .preview-title").text(data['title']);
                        $( "._3 > .preview-description").text(data['description']);
                        $( "._3 > .preview-image").attr('src', data['image_url']);
                        $( "._3 > .preview-url").text("By " + data['url']);
                    },
                    error: function() { alert("Extract link error"); }
                });
            }, 100);
       
      });
    
      // for index page
      $( document ).on('page:load', function() {
        // Handler for .ready() called.   
            setTimeout(function() {
                var text = "http://news.zing.vn/Barcelona-trai-tham-do-moi-cuu-HLV-Real-thay-Luis-Enrique-post500669.html";
          
                 
                // send url to service for parsing
                $.ajax('/linkpreview', {
                    type: 'POST',
                    data: { url: text },
                    success: function(data,textStatus,jqXHR ) {
                        // handle received data
                        $( "._4 > .preview-title").text(data['title']);
                        $( "._4 > .preview-description").text(data['description']);
                        $( "._4 > .preview-image").attr('src', data['image_url']);
                        $( "._4 > .preview-url").text("By " + data['url']);
                    },
                    error: function() { alert("Extract link error"); }
                });
            }, 100);
       
      });
      $( document ).ready(function() {
        // Handler for .ready() called.   
            setTimeout(function() {
                var text = "http://news.zing.vn/Barcelona-trai-tham-do-moi-cuu-HLV-Real-thay-Luis-Enrique-post500669.html";
                 
                // send url to service for parsing
                $.ajax('/linkpreview', {
                    type: 'POST',
                    data: { url: text },
                    success: function(data,textStatus,jqXHR ) {
                        // handle received data

                        $( "._4 > .preview-title").text(data['title']);
                        $( "._4 > .preview-description").text(data['description']);
                        $( "._4 > .preview-image").attr('src', data['image_url']);
                        $( "._4 > .preview-url").text("By " + data['url']);
                    },
                    error: function() { alert("Extract link error"); }
                });
            }, 100);
       
      });
    
      // for index page
      $( document ).on('page:load', function() {
        // Handler for .ready() called.   
            setTimeout(function() {
                var text = "http://thethao.vnexpress.net/tin-tuc/la-liga/hlv-barca-gui-thong-diep-cung-ran-den-messi-3131276.html";
          
                 
                // send url to service for parsing
                $.ajax('/linkpreview', {
                    type: 'POST',
                    data: { url: text },
                    success: function(data,textStatus,jqXHR ) {
                        // handle received data
                        $( "._5 > .preview-title").text(data['title']);
                        $( "._5 > .preview-description").text(data['description']);
                        $( "._5 > .preview-image").attr('src', data['image_url']);
                        $( "._5 > .preview-url").text("By " + data['url']);
                    },
                    error: function() { alert("Extract link error"); }
                });
            }, 100);
       
      });
      $( document ).ready(function() {
        // Handler for .ready() called.   
            setTimeout(function() {
                var text = "http://thethao.vnexpress.net/tin-tuc/la-liga/hlv-barca-gui-thong-diep-cung-ran-den-messi-3131276.html";
                 
                // send url to service for parsing
                $.ajax('/linkpreview', {
                    type: 'POST',
                    data: { url: text },
                    success: function(data,textStatus,jqXHR ) {
                        // handle received data

                        $( "._5 > .preview-title").text(data['title']);
                        $( "._5 > .preview-description").text(data['description']);
                        $( "._5 > .preview-image").attr('src', data['image_url']);
                        $( "._5 > .preview-url").text("By " + data['url']);
                    },
                    error: function() { alert("Extract link error"); }
                });
            }, 100);
       
      });
    

*/
