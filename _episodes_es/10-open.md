---
title: Ciencia abierta
teaching: 5
exercises: 5
questions:
- "¿Cómo control de versiones con Git me puede ayudar a tener mi trabajo **open**?"
objectives:
- "Explica como ontrol de versiones nos ayuda a tener un cuaderno de notas electrónico para todo nuestro trabajo computacional."
keypoints:
- "Trabajo científico abierto **Open** es más útil y citado que el trabajo que no lo es."
---

> Lo opuesto a "abierto" no es "cerrado". 
> Lo opuesto a "abierto" es "quebrado".
>
>--- John Wlbanks
{: .quotation}

El libre intercambio de información podría ser el ideal en Ciencia, pero la realidad, a menudo, es mucho mas complicada.
En la práctica cotidiana vemos situaciones como la siguiente:  

*   Una científica recoge algunos datos y los almacena en una máquina
    que es seguramente guarda en su oficina.
*   Luego ella escribe y modifica unos pocos programas
    (los cuales residen en su computadora)
    para analizar los datos.
*   Una vez que tiene algunos resultados,
    ella escribe y presenta su artículo.
    Podría incluir sus datos -en varias revistas que los requieran- pero
    probablemente no incluya su código.
*   El tiempo pasa.
*   La revista envía las revisiones de un puñado de personas anónimas que trabajan en el campo de actividad de ella.
    Ella revisa su artículo para satisfacer a las revisiones propuestas,
    durante ese tiempo también ella podría modificar los scripts que escribió anteriormente,
    y vuelve a enviar.
*   Pasa mas tiempo.
*   El artículo finalmente se publica.
    Se podría incluir un enlace a una copia online de sus datos,
    pero el mismo artículo estará detrás de un paywall:
    sólo las personas que tienen acceso personal o institucional
    serán capaz de leerlo.

Sin embargo, para muchos científicos, el proceso se ve así:

*   Los datos que colecciona son almacenados en un repositorio de acceso abierto, 
    como puede ser [figshare](http://figshare.com/) o
    [Zenodo](http://zenodo.org), tan pronto como se los colecta,
    obteniendo su propio 
    [Digital Object Identifier] (https://en.wikipedia.org/wiki/Digital_object_identifier) (DOI).
    O los datos que han sido publicados, son almacenados en
    [Dryad](http://datadryad.org/).
*   El científico crea un nuevo repositorio en GitHub para guardar su trabajo.
*   Al hacer su análisis de los datos,  
    ella guarda los cambios de sus scripts
    (y posiblemente algunos archivos de salida)
    en ese repositorio.
    Ella usa el repositorio para su artículo; 
    ese repositorio es entonces el centro de colaboración con sus colegas.
*   Cuando ella está satisfecha con el estado de su artículo, 
    publica una versión en [arXiv](http://arxiv.org/)
    o en algún otro servidor de preimpresión
    para invitar a sus compañeros a una devolución. 
*   Basado en esa devolución, 
    ella puede escribir varias revisiones
    antes de enviar finalmente su artículo a la revista. 
*   El artículo publicado incluye enlaces a su preimpresión
    y a sus repositorios de código y datos,
    lo que lo hace mucho más fácil para otros científicos
    utilizar el trabajo como punto de partida para su propia investigación.

Este modelo abierto acelera la investigación: el trabajo abierto [se cita y se reutiliza]  (http://dx.doi.org/10.1371/journal.pone.0000308). 
Sin embargo, las personas que quieren trabajar de esta manera necesitan tomar algunas decisiones sobre qué significa exactamente "abierto" y cómo hacerlo. Puede encontrar más información sobre los diferentes aspectos de la Ciencia Abierta en [el libro] (http://link.springer.com/book/10.1007/978-3-319-00026-8).

Esta es una de las (muchas) razones por las que enseñamos el control de versiones. Cuando se utiliza con diligencia, responde a la pregunta "cómo" actuando como un cuaderno de laboratorio electrónico compartible para el trabajo computacional:

*   Las etapas conceptuales de su trabajo están documentadas,
    qué y cuándo. Cada paso está marcado con un identificador (el ID de confirmación)
    de cada uno de los intentos y propósitos.
*   Puedes vincular tu documentación de ideas y otros
    trabajos intelectuales directamente con los cambios que surgen de ellos.
*   Puedes referirte a lo que utilizaste en tu investigación para obtener tus
    resultados computacionales de manera única y recuperable.
*   Con un sistema de control de versiones distribuido como Git, la versión
    del repositorio de control es fácil de archivar a perpetuidad y contiene
    toda la historia.

> ## Haciendo código citable
>
> [Esta breve guía](https://guides.github.com/activities/citable-code/) from GitHub
> explica cómo crear un "Digital Object Identifier (DOI)" para tu código,
> tus artículos,
> o cualquier cosa alojada en un repositorio de control de versiones.
{: .callout}

> ## ¿Cuán reproducible es mi trabajo?
>
> Pide a uno de tus compañeros de laboratorio que reproduzca un resultado que obtuvo recientemente
> utilizando sólo lo que ellos puedan encontrar en tus artículos o en la web.
> Trata de hacer lo mismo para uno de sus resultados,
> luego tratar de hacerlo para obtener un resultado de un laboratorio con el que trabaja.
{: .challenge}

> ## ¿Cómo encontrar un repositorio de datos adecuado?
>
> Navega por Internet durante un par de minutos y echa un vistazo a los repositorios de datos
> mencionado anteriormente: [Figshare](http://figshare.com/), [Zenodo](http://zenodo.org),
> [Dryad](http://datadryad.org/). Dependiendo de tu campo de investigación,
> encuentre repositorios reconocidos por la comunidad en tu campo.
> También puede ser útil [estos repositorios de datos recomendados por Nature] (
> http://www.nature.com/sdata/data-policies/repositories).
> Analice con su vecino el repositorio de datos que desee
> enfoquelo en su proyecto actual y explique por qué.
{: .challenge}

> ## ¿Puedo también publicar código?
>
> Hay muchas nuevas maneras de publicar código y hacer que sea citable. Un
> se describe [en la pagina principal del mismo GitHub](
> https://guides.github.com/activities/citable-code/).
> Básicamente es una combinación de GitHub (donde está el código) y Zenodo (el
> repositorio que crea el DOI). Lee esta página mientras sabes
> que ésta es sólo una de las muchas maneras de hacer tu código citable.
{: .challenge}
