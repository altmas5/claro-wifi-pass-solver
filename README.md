claro-wifi-pass-solver
======================

El ISP claro instala enrutadores con contraseñas basadas en el (E)SSID y BSSID.

Este script automatiza el proceso de obtener la contraseña suponiendo que estos dispositivos todavía tienen la configuración por defecto.

Su funcionamiento ha sido probado únicamente en Nicaragua pensado para ejecurse en Sistemas Operativos basados en GNU/Linux.

Para entender como lo hace referirse a los comentarios en el código del script

ejemplo
-------

            x               x
           xx               xx
          xx   xx       xx    xx
          x   xx         xx    x              (E)SSID: CLARO_FBDA73
         xx   x     +     x    xx             BSSID: 64:68:0C:FB:DA:74
         xx   x     |     x    xx             ------------------------
          x   xx    |    xx    x              passphrase: 680CFBDA73
          xx   xx   |   xx    xx
           xx       |        xx
            x       |        x
                    |
     +------------------------------+
     |    pw lan wlan rx/tx         |
     +------------------------------+
 diagrama hecho en [ASCIIFlow](http://www.asciiflow.com)

descargar
---------

* Vía [HTTP](https://nodeload.github.com/altmas5/claro-wifi-pass-solver/zip/master)
* Vía git: ```git clone https://github.com/altmas5/claro-wifi-pass-solver.git```

uso
---
Para obtener contraseñas de redes alcanzables ejecutás como usuario root o con un sudoer:
    ```./solve.sh```

El privilegio de root es requerido para poder usar el binario /usr/sbin/iwlist

Una vez autenticado en el enrutador podés usar los perl scripts check_owning_req.pl y 0wn3r.pl para cambiar el nombre de la red. Hacelo bajo tu responsabilidad.

licencia
--------

Liberado bajo WTFPL.
Podés obtener una copia de la licencia en: [sam.zoy.org/wtfpl/COPYING](http://sam.zoy.org/wtfpl/COPYING)

bugs
----

Los podés reportar [acá](https://github.com/altmas5/claro-wifi-pass-solver/issues)
