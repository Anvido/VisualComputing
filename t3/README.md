# Taller de representaci�n

## Prop�sitos

1. Estudiar la relaci�n entre las [aplicaciones de mallas poligonales](https://github.com/VisualComputing/representation), su modo de [representaci�n](https://en.wikipedia.org/wiki/Polygon_mesh) (i.e., estructuras de datos empleadas para representar la malla en RAM) y su modo de [renderizado](https://processing.org/tutorials/pshape/) (i.e., modo de transferencia de la geometr�a a la GPU).
2. Estudiar algunos tipos de [curvas y superficies param�tricas](https://github.com/VisualComputing/Curves) y sus propiedades.

## Tareas

Empleando el [FlockOfBoids](https://github.com/VisualComputing/frames/tree/master/examples/demos/FlockOfBoids):

1. Represente la malla del [boid](https://github.com/VisualComputing/frames/blob/master/examples/demos/FlockOfBoids/Boid.pde) al menos de dos formas distintas.
2. Renderice el _flock_ en modo inmediato y retenido, implementando la funci�n ```render()``` del [boid](https://github.com/VisualComputing/frames/blob/master/examples/demos/FlockOfBoids/Boid.pde).
3. Implemente las curvas c�bicas de Hermite y Bezier (c�bica y de grado 7), empleando la posici�n del `frame` del _boid_ como punto de control.

## Opcionales

1. Represente los _boids_ mediante superficies de spline.
2. Implemente las curvas c�bicas naturales.

## Integrantes

Uno, o m�ximo dos si van a realizar al menos un opcional.

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
| Andres Gonzalez Ortiz  | Anvido |
| Juan Pablo Ovalle | Juanc0 |

## Uso

| Letra | Acci�n |
|------------|-------------|
| i | Cambia entre modo retenido e inmediato |
| f | Cambia la representaci�n de la malla |
| h | Cambia la malla poligonal usada |

## Entrega

* Subir el c�digo al repositorio de la materia antes del 3/2/19 a las 24h.
* Presentar el trabajo en la clase del 6/2/19 o 7/2/19.
