# Uma forma moderna de gerenciar pacotes JavaScript sem precisar de bundlers
# como o "Webpack".

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js" # (para navegação rápida)
pin "@hotwired/stimulus", to: "stimulus.min.js" # framework leve para JavaScript.
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix" # editor de texto rico usado pelo Action Text
pin "@rails/actiontext", to: "actiontext.esm.js"

# Essas linhas dizem ao Rails quais arquivos JS carregar e de onde,
# usando importmap para importar módulos diretamente no navegador,
# sem precisar compilar.
pin "local-time" # @3.0.3
# Esse pacote é usado para exibir datas e horas no fuso horário local do usuário.
# (pasta vendor/javascript), para poder ler (usar) quando quiser, sem depender da internet.
pin "flowbite", to: "https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.turbo.min.js"pin "@avo-hq/marksmith", to: "@avo-hq--marksmith.js" # @0.4.7
