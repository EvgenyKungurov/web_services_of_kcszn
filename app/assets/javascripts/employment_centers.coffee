$(document).on 'turbolinks:load', ->
  $('input[type="submit"]').prop 'disabled', true if window.location.pathname == '/employment_centers/new'
  $('#files_').change ->
    extensions = []
    file_names = []
    $.each $('#files_')[0].files, (i, v) ->

      if $('#files_')[0].files.length != 0
        extensions.push(v.name.replace(/^.*\./, ''))
        file_names.push(v.name.replace(/\.[^.]*$/, ''))

        $.each extensions, (i, v) ->
          if v != 'dbf'
            alert 'Файлы данного типа запрещены,\nЗагрузить можно только файлы dbf'
            $('#files_').replaceWith($('#files_').val('').clone(true));    
            $('input[type="submit"]').prop 'disabled', true
         
        $.each file_names, (i, v) ->
          if v == 'response'
            $('input[type="submit"]').prop 'disabled', false
          else if v == 'request'
            $('input[type="submit"]').prop 'disabled', false
          else
            alert 'Файлы должны иметь имя request(запрос) или response(ответ)\nНапример: request.dbf'
            $('#files_').replaceWith($('#files_').val('').clone(true));    
            $('input[type="submit"]').prop 'disabled', true

    $('input[type="submit"]').prop 'disabled', false if $('#files_')[0].files.length != 0
  
  @print_spravka = (id) ->
   
    printing_css = '<style media=print>tr:nth-child(even) td{background: #f0f0f0;}</style>'
    html_to_print = printing_css + $('#' + id).html()
    iframe = $('<iframe id="print_frame">')
    $('body').append iframe
    doc = $('#print_frame')[0].contentDocument or $('#print_frame')[0].contentWindow.document
    win = $('#print_frame')[0].contentWindow or $('#print_frame')[0]
    doc.getElementsByTagName('body')[0].innerHTML = html_to_print
    win.print()
    $('iframe').remove()

