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
