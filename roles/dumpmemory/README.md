dumpmemory
=========

Realiza un volcado de memoria del nodo y la envía a la máquina controladora donde la almacenará en una estructura de carpetas con la siguiente forma:

      carpetaAlmacen/usuario/nodo/memDump-YYYYMMDDTHHMMSS.dd

Requirements
------------

Se requiere que LiME esté instalado en el nodo en el que se quiere realizar el volcado de memoria. Dicha instalación se puede realizar ejecutando el **role _installlime_** siempre que no se localice la carpeta LiME en el nodo. Para realizar la comprobación de si existe la carpeta LiME o no se dispone del **role _checklime_** 

Role Variables
--------------

**memorydumpname:** Nombre inicial del archivo que contiene la adquisición de memoria. Se establecerá a nivel de grupo de nodos. De esta manera todos los archivos que contengan un volcado de memoria comenzarán de la misma manera, pudiendo identificar así las evidencias de tipo adquisición de memoria.

**memorydumpextension:** Extensión de los archivos que contendrán adquisiciones de memoria. Se establecerá a nivel de grupo de nodos.

**storagepath:** Ruta donde se almacenarán las evidencias adquiridas. Se establecerá a nivel de grupo de nodos.

**limedirectory:** Ruta donde se ha instalado LiME. Se establecerá a nivel de grupo de nodos y será la misma que se utilice en el role *installlime*.

Dependencies
------------

Ninguna.

Example Playbook
----------------

    - hosts: servers
      roles:
         # Sin parámetros
         - dumpmemory

License
-------

BSD

Author Information
------------------

David García
