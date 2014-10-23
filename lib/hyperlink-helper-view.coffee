{View} = require 'atom'

module.exports =
class HyperlinkHelperView extends View
  @content: ->
    @div class: 'hyperlink-helper overlay from-top', =>
      @div "The HyperlinkHelper package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "hyperlink-helper:link", => @link()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  link: ->
    console.log "HyperlinkHelperView was activated!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
