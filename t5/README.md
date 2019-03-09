# Taller de shaders

## Propósito

Estudiar los [patrones de diseño de shaders](http://visualcomputing.github.io/Shaders/#/4).

## Tarea

Escoja una de las siguientes dos:

1. Hacer un _benchmark_ entre la implementación por software y la de shaders de varias máscaras de convolución aplicadas a imágenes y video.
2. Estudiar e implementar el [shadow mapping](http://www.opengl-tutorial.org/intermediate-tutorials/tutorial-16-shadow-mapping/). Se puede emplear la escena del [punto 2 del taller de transformaciones](https://github.com/VisualComputing/Transformations_ws), así como la librería [frames](https://github.com/VisualComputing/frames). Ver el ejemplo [ShadowMap](https://github.com/VisualComputing/frames/tree/master/examples/demos/ShadowMap).

## Integrantes

Máximo tres.

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
|Andres David Gonzalez Ortiz|Anvido|
|Juan Pablo Ovalle Sanchez|Juanc0|

## Informe

El proyecto contiene una escena, en la cual su grafo de escena cuenta con el ojo, dos figuras (laberinto, personaje), un frame auxiliar (que servira de camara para navegar en la vista del personaje). La interacción tiene 4 grados de libertad y se realiza a traves de un joystick similar al de un ps1, con el cual a traves de las dos palancas y los botones L1 y R1 se puede manejar la escena. Adicionalmente con la tecla "V" del teclado se cambia la vista entre la escena general y la camara del personaje.

Adicionalmente se implementaron los shaders de iluminacion simples dentro de los cuales encontramos:

| Shader | Tecla acción|
|------------|-------------|
|Luz difusa vertice|a|
|Luz difusa pixel|b|
|Luz especular vertice|c|
|Luz especular pixel|d|


## Entrega

Fecha límite Domingo 10/3/19 a las 24h.
