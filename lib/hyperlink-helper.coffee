HyperlinkHelperView = require './hyperlink-helper-view'

module.exports =
  hyperlinkHelperView: null

  activate: ->
    atom.workspaceView.command "hyperlink-helper:link", => @link()

  link: ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.getActivePaneItem()

    # Get selected text
    selection = editor.getLastSelection()

    # Get clipboard data
    clipboard = atom.clipboard
    clipboardText = clipboard.read()

    selection.insertText('<a href="' + clipboardText + '">' + selection.getText() + '</a>')
