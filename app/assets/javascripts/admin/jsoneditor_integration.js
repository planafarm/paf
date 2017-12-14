/* global $,JSONEditor */
$(function() {
  return $('.jsoneditor-edit').each(function() {
    var target = $(this)
    if (target.val() === '') {
      target.val('{}')
    }
    target.val(target.val().replace(/=>/g, ':'))
    var container = $('<div class="jsoneditor-container">').insertAfter(target)
    var editor = new JSONEditor(container[0], {
      navigationBar: false,
      onChange: function() {
        return target.val(editor.getText())
      },
      search: false,
    })
    const parsedObj = (function() {
      try {
        return JSON.parse(target.val())
      } catch (_error) {
        return {}
      }
    })()
    editor.set(parsedObj)
    return target.hide()
  })
})
