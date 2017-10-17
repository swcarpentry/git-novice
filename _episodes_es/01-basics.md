---
title: Control Automático de versiones
teaching: 5
exercises: 0
questions:
- "¿Qué es el control de versiones y por qué debo usarlo?"
objectives:
- "Comprender las ventajas de un sistema de control de versiones automatizado."
- "Entender los fundamentos de cómo funciona Git."
keypoints:
- 'El control de versiones es como un "deshacer" ilimitado.'
- "El control de versiones también permite que muchas personas trabajen en simultáneo."
---

Empezaremos por explorar como el control de versiones puede ser usado
para hacer un seguimiento de lo que hizo una persona y cuándo.
Incluso si no está colaborando con otras personas, 
el control de versión automatizado es mucho mejor que esta situación:

[![Piled Higher and Deeper by Jorge Cham, http://www.phdcomics.com/comics/archive_print.php?comicid=1531](../fig/phd101212s.png)](http://www.phdcomics.com)

"La pila mas alta y mas profunda" por Jorge Cham, http://www.phdcomics.com

Todos hemos estado en esta situación alguna vez: parece ridículo tener 
varias versiones casi idénticas del mismo documento. Algunos procesadores de palabras 
nos permiten lidiar con esto un poco mejor, como por ejemplo Microsoft
Word [Track Changes] (https://support.office.com/en-us/article/Track-changes-in-Word-197ba630-0f5f-4a8e-9a77-3712475e806a), Google Docs [version
history] (https://support.google.com/docs/answer/190843?hl=en) o LibreOffice [Grabación y visualización de cambios] (https://help.libreoffice.org/Common/Recording_and_Displaying_Changes).

Los sistemas de control de versiones comienzan con una versión básica del documento y 
luego guardan sólo los cambios que hicieron en cada paso del proceso. Tu puedes 
pensar en ello como una cinta: si rebobina la cinta e inicia en el documento 
base, entonces podrías reproducir cada cambio y terminar con
la versión más reciente.

![Changes Are Saved Sequentially](../fig/play-changes.svg)

Una vez que piensas en los cambios como separados del documento en sí, entonces puedes pensar en "reproducir" diferentes conjuntos de cambios en el documento base y obtener diferentes versiones del documento. Por ejemplo, dos usuarios pueden hacer conjuntos independientes de cambios basados en el mismo documento.

![Different Versions Can be Saved](../fig/versions.svg)

A menos que haya conflictos, puedes incluso reproducir dos conjuntos de cambios en el mismo documento base.

![Multiple Versions Can be Merged](../fig/merge.svg)

Un sistema de control de versiones es una herramienta que realiza un seguimiento de estos cambios para nosotros y
nos ayuda a controlar la versión y fusionar nuestros archivos. Te permite
decidir qué cambios conforman la siguiente versión, a lo que llamamos hacer un
[commit]({{ page.root }}/reference/#commit), y mantiene metadatos útiles sobre ellos. El
historial completo de "commits" para un proyecto en particular y sus metadatos forman un
repositorio [repository]({{ page.root }}/reference/#repository). Los repositorios pueden mantenerse sincronizados
en diferentes computadoras facilitando la colaboración entre diferentes personas.

> ## La larga historia de los sistemas de control de versiones 
>
> Los sistemas automatizados de control de versiones no son nada nuevo.
> Herramientas como RCS, CVS o Subversion han existido desde principios de los 1980  y son utilizadas por muchas grandes empresas.
> Sin embargo, muchos de éstos ahora se están considerando como sistemas legado debido a las varias limitaciones en sus capacidades.
> En particular, los sistemas más modernos, como Git y [Mercurial] (http://swcarpentry.github.io/hg-novice/) 
> son * distribuidos *, lo que significa que no necesitan un servidor centralizado para alojar el repositorio. 
> Estos sistemas modernos también incluyen potentes herramientas de fusión que hacen posible que múltiples autores trabajen dentro de 
> los mismos archivos simultáneamente. {:.callout}

>## Escritura de artículos 
>
> * Imagina que has redactado un excelente párrafo para un artículo que estás escribiendo, pero más tarde se arruina. ¿Cómo recuperarías 
> la *excelente* versión concluida? ¿Es posible?
>
> * Imagina que tienes 5 coautores. ¿Cómo administrarías los cambios y comentarios que hagan en tu trabajo? 
> Si usas LibreOffice Writer o Microsoft Word, ¿qué sucede si aceptas los cambios realizados con la opción 
> ` Track Changes`? ¿Tiene un historial de esos cambios? 
{: .challenge}
