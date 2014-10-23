{WorkspaceView} = require 'atom'
HyperlinkHelper = require '../lib/hyperlink-helper'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "HyperlinkHelper", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('hyperlink-helper')

  describe "when the hyperlink-helper:link event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.hyperlink-helper')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'hyperlink-helper:link'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.hyperlink-helper')).toExist()
        atom.workspaceView.trigger 'hyperlink-helper:link'
        expect(atom.workspaceView.find('.hyperlink-helper')).not.toExist()
