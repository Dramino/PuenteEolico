# Manual para obtener las la respuesta en el dominio del tiempo debido al aleteo

Este programa resuelve las ecuaciones de Scanlan en el dominio del tiempo.


### Archivos necesarios
Se requiere un archivo de texto (el nombre del archivo lo elige el susario), archivo principal flutterOde45.m y el archivo auxiliar flu8a45.m.

```
[archivo.txt]
flutterOde45.m
flutterOde45.m
```

Los datos que se requieren usar agregar son los que se indican en el [archivo de entrada]() :


* Densidad del viento.
* Masa modal a flexión.
* Momento másico de inercia
* Ancho del puente.
* Frecuencia angular dirección vertical.
* Frecuencia angular a torsión.
* Frecuencia del aleteo.
* Amortiguamiento crítico dirección Z.
* Amortiguamiento crítico a torsión.
* 8 Derivadas aerodinámicas.
* Coeficientes aerodinámicos.
* Velocidad media.
* Condiciones iniciales del puente.
* Tiempo total de la simulación.
* Intervalos de tiempo de la simulación del viento turbulento
