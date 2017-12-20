---
layout: lesson
root: .
---

El Hombre Lobo y Drácula han sido contratados por Universal Missions (una
spinoff de servicios de Euphoric State University) para investigar si es
posible enviar su próximo explorador planetario a Marte. Ellos quieren
poder trabajar al mismo tiempo en los planes, pero ya han experimentado
ciertos problemas anteriormente al hacer algo similar. Si se rotan por
turnos entonces cada uno gastará mucho tiempo esperando a que el otro
termine, pero si trabajan en sus propias copias e intercambian los cambios
por email las cosas se perderán, se sobreescribirán o se duplicarán.

Un colega sugiere utilizar [control de versiones]({{ page.root }}/reference/#version-control)
para lidiar con el trabajo. El control de versiones es mejor que el intercambio de ficheros:

*   Nada se pierde una vez que se incluye bajo control de versiones,
    a no ser que se haga un esfuerzo sustancial. Como se van guardando
    todas las versiones precedentes de los ficheros, siempre es posible
    volver atrás en el tiempo y ver exactamente quién escribió qué en
    un día en particular, o que versión de un programa fue utilizada
    para generar un conjunto de resultados en particular.

*   Como se tienen estos registros de quién hizo qué y en qué momento,
    es posible saber a quién preguntar si se tiene una pregunta en un
    momento posterior y, si es necesario, revertir el contenido a una
    versión anterior, de forma similar a como funciona el comando "undo"
    de los editores de texto.

*   Cuando varias personas colaboran en el mismo proyecto, es posible
    pasar por alto o sobreescribir de manera accidental los cambios
    hechos por otra persona. El sistema de control de versiones
    notifica automáticamente a los usuarios cada vez que hay un
    conflicto entre el trabajo de una persona y la otra.

Los equipos no son los únicos que se benefician del control de
versiones: los investigadores independientes se pueden beneficiar
en gran medida. Mantener un registro de qué ha cambiado,
cuando y porqué es extremadamente útil para todos los investigadores
si alguna vez necesitan retomar el proyecto en un momento
posterior (e.g. un año después, cuando el se ha desvanecido el
recuerdo de los detalles).

El control de versiones es la bitácora de laboratorio del mundo
digital: es lo que los profesionales utilizan para darle
seguimiento a lo que han hecho y colaborar con otras personas.
Todos los proyectos de desarrollo de software de grandes dimensiones
utilizan estas herramientas, y la mayoría de los programadores
lo utilizan también para sus pequeños proyectos. No solamente se
limita al software: libros, artículos científicos, pequeños
conjuntos de datos, en fin, todo lo que pueda ser modificado en el
tiempo o necesite ser compartido puede y debe ser almacenado
en un sistema de control de versiones.

> ## Pre-requisitos
> 
> En esta lección utilizamos Git desde el terminal de Unix.
> Se espera de los participantes alguna experiencia previa,
> *pero esto no es requisito indispensable*.
{: .prereq}
