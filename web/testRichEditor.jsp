<%-- 
    Document   : testRichEditor
    Created on : Aug 18, 2017, 9:26:50 PM
    Author     : Joe's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    
<head>
  <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=z3nckpsimbih4hb7cgzuvqwxi9mqj7lhhkk4icm4y10dsocp"></script>
  <script>
      /*
   tinymce.init({
  selector: "textarea",
  height: 500,
  toolbar: "image",
  plugins: "image imagetools",
  //  imagetools_cors_hosts: ['www.tinymce.com', 'codepen.io'],
  content_css: [
    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
    '//www.tinymce.com/css/codepen.min.css'
  ]
});
*/
tinymce.init({
  selector: 'textarea',
  max_height: 1000,
  max_width: 300,
  min_height: 200,
  min_width: 400,
  menubar: false,
  plugins: [
    'advlist autolink lists link image charmap print preview anchor',
    'searchreplace visualblocks code fullscreen',
    'insertdatetime media table contextmenu paste code image code'
  ],
  toolbar: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
 
 // without images_upload_url set, Upload tab won't show up
  images_upload_url: 'postAcceptor.php',
  
  // we override default upload handler to simulate successful upload
  images_upload_handler: function (blobInfo, success, failure) {
    setTimeout(function() {
      // no matter what you upload, we will turn it into TinyMCE logo :)
      success('http://moxiecode.cachefly.net/tinymce/v9/images/logo.png');
    }, 2000);
  },
  
  init_instance_callback: function (ed) {
    ed.execCommand('mceImage');
  },       
        content_css: [
    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
    '//www.tinymce.com/css/codepen.min.css']


});
    </script>
  
</head>
<body>
    <form action="testRichMCE" method="get" accept-charset="UTF-8">
        <textarea name="desc">  </textarea>
        <input type='date' name="date"/>
  <input type="submit">
  </form>
    <br><br><br>
    ${desc}

</body>
</html>
