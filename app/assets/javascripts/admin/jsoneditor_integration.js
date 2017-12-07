$(function() {
  return $('.jsoneditor-edit').each(function() {
    var target = $(this)
    if (target.val() === '') {
      target.val('{}')
    }
    target.val(target.val().replace(/=>/g, ':'))
    var container = $('<div class="jsoneditor-container">').insertAfter(target)
    var editor = new JSONEditor(container[0], {
      search: false,
      navigationBar: false,
      onChange: function() {
        return target.val(editor.getText())
      },
    })
    editor.set(
      (function() {
        try {
          return JSON.parse(target.val())
        } catch (_error) {}
      })(),
    )
    return target.hide()
  })
})
