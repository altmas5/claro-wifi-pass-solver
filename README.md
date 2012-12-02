claro-wifi-pass-solver
======================

El ISP claro instala enrutadores con contraseñas basadas en el (E)SSID y BSSID.

Este script automatiza el proceso de obtener la contraseña suponiendo que estos dispositivos todavía tienen la configuración por defecto.

Se funcionamiento ha sido probado únicamente en Nicaragua pensado para ejecurse en Sistemas Operativos basados en GNU/Linux.

Para entender como lo hace referirse a los comentarios en el código del script

descargar
---------

* Vía [HTTP](https://nodeload.github.com/altmas5/claro-wifi-pass-solver/zip/master)
* Vía git:
    git clone https://github.com/altmas5/claro-wifi-pass-solver.git

uso
---
Ejecutamos como usuario root o con un sudoer
    ./solve.sh

licencia
--------

Liberado bajo WTFPL.
Podés obtener una copia de la licencia en: [sam.zoy.org/wtfpl/COPYING](http://sam.zoy.org/wtfpl/COPYING)

bugs
----

Los podés reportar [acá](https://github.com/altmas5/claro-wifi-pass-solver/issues)
