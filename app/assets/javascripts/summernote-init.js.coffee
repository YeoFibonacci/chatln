$(document).on 'turbolinks:load', ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote
      height: 300,
      lang: 'fr-FR',
      placeholder: "Le contenu du cours ou du série d'exercice ..."     


