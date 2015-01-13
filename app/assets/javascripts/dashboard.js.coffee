$(document).ready ->
# Hide/show edit panel
  $(".main0list0item-crew").on "click", ->
    $this = $(this)
    $this.siblings(".edit-panel").slideToggle(600)
    return
  return