# Diseño y cálculo de sistemas de transmisión por engranajes
Este repositorio contiene todo el código y los archivos necesarios para ejecutar la herramienta desarrollada en Matlab. Esta herramienta está constituida por:
- Un programa principal que realiza el análisis y dimensionado de los elementos mecánicos del sistema de transmisión.
- Funciones auxiliares que asignan valores a ciertas variables y las devuelve al programa principal.
## Instrucciones
1. Descargar este repositorio en su espacio de trabajo.
2. Ejecutar el fichero [TRANSMISION.m](https://github.com/alegongar/calc_gearsystem/blob/master/TRANSMISION.m).

> **Requisito**: [MATLAB](https://es.mathworks.com/downloads/)
## Interfaz de usuario
Petición al usuario de una serie de especificaciones de diseño del sistema de transmisión deseado.

Primero aparece una ventana de diálogo donde se indican los datos mínimos de diseño que el usuario deberá introducir en la siguiente ventana. Los datos mínimos son:
1. La potencia a transmisitir.
2. La relación de transmisión y una de las velocidades (entrada o salida), o las dos velocidades requeridas.
3. La dimensión de la caja (X) perpendicular a los ejes o la distancia entre ejes.
4. La dimensión mínima de la caja (Y) en la dirección de los ejes.
5. El sentido de giro de los ejes de entrada y salida.

Aceptadas las instrucciones anteriores, se muestra una segunda ventana donde se deben introducir las especificaciones técnicas de diseño para el sistema de transmisión, como son:
- Potencia a transmitir (kW).
- Relación de transmisión.
- Velocidad de entrada (rpm).
- Velocidad de salida (rpm).
- Sentido de giro de los ejes de entrada y salida.
- Dimensión X de la caja (mm).
- Dimensión Y de la caja (mm).
- Altura máxima Z de la caja (mm).
- Distancia entre ejes (mm).

En cuanto a las especificaciones de los elementos mecánicos del sistema, se requieren otra serie de parámetros. Para los engranajes se solicita:
- Fuente de potencia.
- Máquina impulsada.
- Condiciones del soporte.
- Tipo de engrane intermedio.
- Confiabilidad.
- Resistencia a la fatiga por flexión.
- Coeficiente elástico.
- Resistencia a la fatiga superficial.

Las tres últimas especificaciones sólo se deben rellenar si el usuario ha elegido previamente un material para los engranajes. En caso contrario, se puede seleccionar un material de la siguiente lista que ofrece el programa.

Las especificaciones de los ejes son únicamente las relacionadas con el material. Si el usuario ha seleccionado un material previamente, debe conocer e introducir la resistencia a la rotura, la resistencia de fluencia y el tipo de laminado. En caso contrario, dispone de una lista de materiales para seleccionar el que desee.

Por último, se precisa conocer el material para las chavetas. Si el usuario conoce el material, debe introducir el valor de la resistencia de fluencia. En caso contrario, se ofrece una lista de materiales.

La herramienta muestra los resultados obtenidos para el diseño de cada uno de los elementos que forman el sistema de transmisión en diferentes figuras y finaliza la ejecución del programa. Además, estas figuras se guardan en pdf dentro de la misma carpeta que contiene los archivos del programa.
