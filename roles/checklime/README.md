checklime
=========

 El **role _checklime_** comprobará la existencia de LiME en el nodo. Para ello, buscará el directorio LiME en el directorio home del usuario remoto y en caso de no encontrarlo devolverá "0"

Requirements
------------

Ninguno.

Role Variables
--------------

**homedirectory:** Contendrá la carpeta home del usuario remoto. Se establece a nivel de grupo de nodos. De esa manera se busca homogeneidad dentro de un mismo grupo de nodos. Será la misma que se utilice en el role *installlime*

Dependencies
------------

Ninguna

Example Playbook
----------------

    - hosts: servers
      roles:
         # Sin parámetros
         - checklime

License
-------

BSD

Author Information
------------------

David García
