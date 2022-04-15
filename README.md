# TFM-A2EAF

  Respositorio para el código relacionado con el TFM Automatización de la Adquisición de Evidencias para el Análisis Forense

  El objetivo principal del proyecto es investigar, dentro del marco del análisis forense, la posibilidad de adquirir evidencias de forma automática y remota, con especial énfasis en la adquisición de memoria.

  Esta capacidad de adquisición automatizada y en remoto sería realmente interesante para compañías con redes extensas y/o diversas sedes al permitir delegar y centralizar la tarea de adquisión en un único punto de su estructura, al tiempo que supondría un ahorro de costes en tiempo y desplazamientos.
Para alcanzar la automatización se utilizarán herramientas de automatización para la administración de sistemas ya existentes en el mercado, inicialmente Ansible, si bien, en función de los resultados de la investigación y el desarrollo del proyecto no se descarta el uso de otras herramientas alternativas.

  La adquisición se realizará también utilizando herramientas ya existentes. Se buscarán aquellas más convenientes entre las disponibles, e.g. para la adquisición de memoria se analizarán las opciones de LiME para sistemas Linux y DumpIt en el caso de sistemas Windows.
  
  Comandos de ejecución:
  
    ansible-playbook -i inventories/hosts.yml site.yml

