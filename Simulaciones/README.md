# Manual para obtener las simulaciones de Matlab

A continuación se presentan los diferentes programas que se hicieron para obtener la simulación de viento para puentes en el dominio del tiempo. Para ello se empleo la función de densidad de Kaimal (1993) y la coherencia presentada en Strommen (2010).

## Programa "SimulacionesWAWS"

Este programa esta basado en el método WAWS presentado por Shinozuka

### Archivos necesarios
Se requiere un archivo de texto (el nombre del archivo lo elige el susario).

```
[archivo.txt]
```

Los datos que se requieren usar agregar son los que se indican en el [archivo de entrada](https://github.com/Dramino/PuenteEolico/blob/master/Simulaciones/Datos.txt) :
```
Velocidad media del viento
Altura deseada
Rugosidad del terreno
Tiempo total de integración
Intervalos de tiempo
Separación de tramos
Número de simulaciones
Definir si hay coherencia
Definir si se desea graficar
Definir si se desea exportar
Definir el nodo que se desea graficar o exportar
```
