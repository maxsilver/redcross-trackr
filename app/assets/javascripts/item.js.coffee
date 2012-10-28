$ ()->
  return if $(".enable-items-js").length == 0


  class ItemController
    constructor:()->
      @dom_scope = $(".item-form")
      @template = Handlebars.compile($("#fields-template").html())

      @data = @dom_scope.find("#data-fields").data("additional-fields")
      @item_id = @dom_scope.find("#data-item-id").data("item-id")
      @values = @dom_scope.find("#data-field-values").data("field-values")

      console.log @values

      @dom_scope.delegate "select", "change", @kind_changed

      @load_state()

    kind_changed: ()=>
      type_id = @dom_scope.find("select").val()
      context = {}

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


      unless type_id != ""
        context.message = "Please select a kind."

      fields_content = @template(context)
      $('#additional_fields').html(fields_content)

    load_state: ()=>
      @kind_changed()

  item_controller = new ItemController()
  item_controller.kind_changed()


