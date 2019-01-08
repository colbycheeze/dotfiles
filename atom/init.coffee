# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

atom.commands.add atom.views.getView(atom.workspace), 'custom:insert-line-below', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.newlineBelow()

atom.commands.add atom.views.getView(atom.workspace), 'custom:insert-line-above', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.newlineAbove()

atom.commands.add atom.views.getView(atom.workspace), 'custom:insert-semicolon-at-end', ->
  editor = atom.workspace.getActiveTextEditor()
  position = editor.getCursorBufferPosition()
  editor.moveToEndOfLine()
  editor.insertText(";")
  editor.setCursorBufferPosition(position)

atom.commands.add atom.views.getView(atom.workspace), 'custom:insert-comma-at-end', ->
  editor = atom.workspace.getActiveTextEditor()
  position = editor.getCursorBufferPosition()
  editor.moveToEndOfLine()
  editor.insertText(",")
  editor.setCursorBufferPosition(position)
