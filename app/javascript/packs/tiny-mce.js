tinyMCE.init({
  selector: 'textarea.tinymce',
  plugins: 'link image code',
  toolbar: 'undo redo | bold italic | alignleft aligncenter alignright | image code',
  image_title: true,
  automatic_uploads: true,
  file_picker_types: 'image',
  relative_urls : false, // 画像を絶対パスで取得
  file_picker_callback: function(cb, value, meta) {
    setInput(cb)
  }, // 追加
  language: 'ja'
});


// ローカルから画像を取得できるようになる
function setInput(cb){
  var input = document.createElement('input');
  input.setAttribute('type', 'file');
  input.setAttribute('accept', 'image/*');
  // 画像入力欄に画像URLが入力されると発火
  input.onchange = function() {
    var file = this.files[0];
    var reader = new FileReader();
    reader.onload = function () {
      createContentPageImage(cb, file)
    };
    reader.readAsDataURL(file);
  };
  input.click();
}

// 画像データをアクションへ送信する。
function createContentPageImage(cb, file){
  const formData = new FormData();
  formData.append('file', file)
  console.log(file);
  console.log(formData);
  $.ajax({
    type: 'POST',
    url: '/ticket_images',
    dataType: 'JSON',
    data: formData,
    processData: false,
    contentType: false,
    success: function(data) {
      cb(data.url, { title: file.name });
      console.log('成功しました');
    },
    error: (xhr, status, err) => {
      console.log(xhr.responseText);
      console.log(status);
      console.log(err);
    }
  })
}
