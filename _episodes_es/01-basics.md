---
title: Control Automatizado de Versiones
teaching: 5
exercises: 0
questions:
- "¿Qué es el control de versiones y por qué se deberá usar?"
objectives:
- "Comprender los beneficios de usar un sistema automático de control de versiones."
- "Comprender los fundamentos básicos del funcionamiento de Git."
keypoints:
- "El control de versiones es como un 'deshacer' sin límites."
- "El control de versiones permite que mucha gente trabaje en lo mismo en paralelo."
---

Empezaremos por explorar cómo el control de versiones puede ser usado
para hacer un seguimiento de lo que hizo una persona y cuándo.
Incluso si no se está colaborando con otras personas, 
el control automatizado de versiones es mucho mejor que la siguiente situación:

[![Piled Higher and Deeper by Jorge Cham, http://www.phdcomics.com/comics/archive_print.php?comicid=1531](../fig/phd101212s.png)](http://www.phdcomics.com)

"La pila mas alta y mas profunda" por Jorge Cham, http://www.phdcomics.com

Todos hemos estado en esta situación alguna vez: parece ridículo tener 
varias versiones casi idénticas del mismo documento. Algunos procesadores de texto 
nos permiten lidiar con esto un poco mejor, como por ejemplo el [*Track Changes* de Microsoft Word](https://support.office.com/en-us/article/Track-changes-in-Word-197ba630-0f5f-4a8e-9a77-3712475e806a), el [historial de versiones de Google](https://support.google.com/docs/answer/190843?hl=en) o la [grabación y visualización de cambios de LibreOffice](https://help.libreoffice.org/Common/Recording_and_Displaying_Changes).

Los sistemas de control de versiones comienzan con una versión básica del documento y 
luego van guardando sólo los cambios que se hicieron en cada paso del proceso. Se puede 
pensar en ello como en una cinta: si se rebobina la cinta y se inicia de nuevo en el documento 
base, se puede reproducir cada cambio y terminar con la versión más reciente.

![Changes Are Saved Sequentially](../fig/play-changes.svg)

Una vez que piensas en los cambios como separados del documento en sí, entonces se puede pensar en "deshacer" diferentes conjuntos de cambios en el documento base y obtener así diferentes versiones del documento. Por ejemplo, dos usuarios pueden hacer conjuntos independientes de cambios basados en el mismo documento.

![Different Versions Can be Saved](../fig/versions.svg)

A menos que haya conflictos, se puede incluso tener dos conjuntos de cambios en el mismo documento base.

![Multiple Versions Can be Merged](../fig/merge.svg)

Un sistema de control de versiones es una herramienta que realiza un seguimiento de estos cambios para nosotros y
nos ayuda a controlar la versión y fusionar nuestros archivos. Nos permite
decidir qué cambios conforman la siguiente versión, a lo que llamamos hacer un
[**commit**]({{ page.root }}/reference/#commit), y mantiene metadatos útiles sobre dichos cambios. El
historial completo de **commits** para un proyecto en particular y sus metadatos forman un
[repositorio]({{ page.root }}/reference/#repository). Los repositorios pueden mantenerse sincronizados
en diferentes computadoras, facilitando así la colaboración entre diferentes personas.

> ## La larga historia de los sistemas de control de versiones 
>
> Los sistemas automatizados de control de versiones no son nada nuevo.
> Herramientas como RCS, CVS o Subversion han existido desde principios de los 1980  y son utilizadas por muchas grandes empresas.
> Sin embargo, muchos de estos han sido relegados debido a lo limitado de su capacidad.
> En particular, los sistemas más modernos, como Git y [Mercurial](http://swcarpentry.github.io/hg-novice/) 
> son *distribuidos*, lo que significa que no necesitan un servidor centralizado para alojar el repositorio. 
> Estos sistemas modernos también incluyen potentes herramientas de fusión que hacen posible que múltiples autores trabajen dentro de 
> los mismos archivos simultáneamente. {:.callout}

>## Escritura de artículos 
>
> Imagina que has redactado un excelente párrafo para un artículo que estás escribiendo, pero más tarde lo estropeas. ¿Cómo recuperarías 
> aquella *excelente* versión de la conclusión? ¿Es esto posible?
>
> Imagina que tienes 5 coautores. ¿Cómo administrarías los cambios y comentarios que ellos hagan en el artículo? 
> Si usas LibreOffice Writer o Microsoft Word, ¿qué sucede si aceptas los cambios realizados con la opción 
> ` Track Changes`? ¿Tienes un historial de esos cambios? 
{: .challenge}
