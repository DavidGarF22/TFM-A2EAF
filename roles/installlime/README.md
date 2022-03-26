installlime
=========

Instala LiME (Linux Memory Extractor) en el nodo.

Requirements
------------

Ninguno.

Role Variables
--------------

**homedirectory:** Contendrá la carpeta home del usuario remoto. Se establece a nivel de grupo de nodos. De esa manera se busca homogeneidad dentro de un mismo grupo de nodos. Será la misma que la que se utilice en el role *checklime*.

**limedirectory:** Ruta donde se ha instalado LiME. Se establecerá a nivel de grupo de nodos y será la misma que se utilice en el role *dumpmemory*.

Dependencies
------------

Este role hará uso del **role _installgit_** el cual permitirá clonar el proyecto LiME al nodo.

Example Playbook
----------------

    - hosts: servers
      roles:
         # Sin parámetros
         - installlime

License
-------

BSD

Author Information
------------------

David García
