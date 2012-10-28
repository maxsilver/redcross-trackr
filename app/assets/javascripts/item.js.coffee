$ ()->
  return if $(".enable-items-js").length == 0


  class ItemController
    constructor:()->
      @dom_scope = $(".item-form")
      @template = Handlebars.compile($("#fields-template").html())

      @data = @dom_scope.find("#data-fields").data("additional-fields")
      @item_id = @dom_scope.find("#data-item-id").data("item-id")
      @values = @dom_scope.find("#data-field-values").data("field-values")

      @dom_scope.delegate "select", "change", @kind_changed
      @dom_scope.delegate "select", "change", @update_controls

      @kind_changed()
      @update_controls()

    update_controls: ()=>
      type_id = @dom_scope.find("select").val()

      if type_id == ""
        @dom_scope.find("input").attr("disabled", true)
      else
        @dom_scope.find("input").removeAttr("disabled")

    kind_changed: ()=>
      type_id = @dom_scope.find("#item_item_type_definition_id").val()
      context = {}

      if type_id != ""
        context.fields = _.filter @data, (field_def)->
          return field_def.item_type_definition_id.toString() == type_id

        _.inject(context.fields, (memo, field)->
          field.index = memo
          memo += 1
        ,0)

        _.each @values, (value)->
          field_for_value = _.find context.fields, (cf)->
            cf.id == value.item_field_definition_id

          field_for_value.index = value.id
          field_for_value.value = value.value

      else
        context.message = "Please select a kind."

      fields_content = @template(context)
      $('#additional_fields').html(fields_content)

  item_controller = new ItemController()

