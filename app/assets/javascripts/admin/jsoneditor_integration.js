/* global $,JSONEditor */
function parse(string) {
  try {
    return JSON.parse(string)
  } catch (_error) {
    return {}
  }
}

function instantiateJSONEditor(target, mode) {
  if (target.val() === '') {
    target.val('{}')
  }
  target.val(target.val().replace(/=>/g, ':'))
  var container = $('<div class="jsoneditor-container">').insertAfter(target)
  var editor = new JSONEditor(container[0], {
    mode: mode,
    navigationBar: false,
    onChange: function() {
      return target.val(editor.getText())
    },
    search: false,
  })
  editor.set(parse(target.val()))
  return target.hide()
}

$(function() {
  $('.jsoneditor-edit').each(function() {
    instantiateJSONEditor($(this), 'tree')
  })
  $('.jsoneditor-view').each(function() {
    instantiateJSONEditor($(this), 'view')
  })
})
