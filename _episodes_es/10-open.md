---
título: Ciencia abierta
enseñanza: 5
ejercicios: 5
preguntas:
- "¿Cómo un control de versiones me puede ayudar a tener mi trabajo más abierto?"
objetivos:
- "Explica como el control de versiones nos ayuda a tener un cuaderno de notas electrónico para todo nuestro trabajo computacional."
puntos clave:
- "Trabajo científico abierto es más útil y puede ser más citado que si no lo es."
---

> Lo opuesto a "abierto" no es "cerrado". 
> Lo opuesto a "abierto" es "quebrado".
>
>--- John Wlbanks

El libre intercambio de información podría ser el ideal en Ciencia. Pero la realidad, a menudo, es mucho más complicada.
En la práctica cotidiana vemos situaciones como la siguiente:  

*   Una científica recoge algunos datos y los almacena en una máquina que seguramente tiene en su oficina.
*   Luego ella escribe y modifica unos pocos programas para analizar los datos (los cuales residen en su computadora).
*   Una vez que tiene algunos resultados, ella escribe y presenta su artículo. Podría incluir sus datos -en varias revistas que los requieran- pero probablemente no incluya su código.
*   El tiempo pasa.
*   La revista envía las revisiones de un puñado de personas anónimas que trabajan en su campo de actividad.
    Ella revisa su artículo para satisfacer las revisiones propuestas. Durante ese tiempo ella también podría modificar los **scripts** que escribió anteriormente,y vuelve a enviar.
*   Pasa más tiempo.
*   El artículo finalmente se publica. 
Se podría incluir un enlace a una copia online de sus datos, pero el mismo artículo está detrás de un paywall: sólo las personas que tienen acceso personal o institucional serán capaces de leerlo.

Para otros muchos científicos, el proceso se ve así:

*   Los datos que obtiene son almacenados, tan pronto como los colecta, en un repositorio de acceso abierto, como puede ser [figshare](http://figshare.com/) o [Zenodo](http://zenodo.org), obteniendo su propio [Digital Object Identifier] (https://en.wikipedia.org/wiki/Digital_object_identifier) (DOI). O los datos que han sido recientemente publicados, son almacenados en [Dryad](http://datadryad.org/).
*   El científico crea un nuevo repositorio en GitHub para guardar su trabajo.
*   Al hacer el análisis de los datos, guarda los cambios de sus **scripts** (y posiblemente algunos archivos de salida)
    en ese repositorio. Utiliza el repositorio para su artículo. Usa ese repositorio como centro de colaboración con sus colegas.
*   Cuando está satisfecho con el estado de su artículo, publica una versión en [arXiv](http://arxiv.org/) o en algún otro servidor de preimpresión para invitar a sus compañeros a una retroalimentación. 
*   Basado en esa retroalimentación, puede escribir varias revisiones antes de enviar finalmente su artículo a la revista. 
*   El artículo publicado incluye enlaces a su preimpresión y a sus repositorios de código y datos, lo que lo hace mucho más fácil para otros científicos utilizar este trabajo como punto de partida para su propia investigación.

Este modelo abierto acelera la investigación: el trabajo abierto [se cita y se reutiliza]  (http://dx.doi.org/10.1371/journal.pone.0000308). Sin embargo, las personas que quieren trabajar de esta manera necesitan tomar algunas decisiones sobre qué significa exactamente "abierto" y cómo hacerlo. Puede encontrar más información sobre los diferentes aspectos de la Ciencia Abierta en [el libro](http://link.springer.com/book/10.1007/978-3-319-00026-8).

Ésta es una de las muchas razones por las que enseñamos el control de versiones. Cuando se utiliza con diligencia, responde a "cómo" actúa un cuaderno de laboratorio electrónico compartible:

*   Las etapas conceptuales del trabajo están documentadas, qué y cuándo. Cada paso está marcado con un identificador (el ID de confirmación) de cada uno de los intentos y propósitos.
*   Puedes vincular tu documentación de ideas y otros trabajos intelectuales directamente con los cambios que surgen de ellos.
*   Puedes referirte a lo que utilizaste en tu investigación para obtener tus resultados computacionales de manera única y recuperable.
*   Con un sistema de control de versiones distribuido como Git, la versión del repositorio de control es fácil de archivar a perpetuidad y contiene toda la historia.

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
> luego trata de hacerlo para obtener un resultado de un laboratorio con el que trabajas.


> ## ¿Cómo encontrar un repositorio de datos adecuado?
>
> Navega por Internet durante un par de minutos y echa un vistazo a los repositorios de datos mencionado anteriormente: [Figshare](http://figshare.com/), [Zenodo](http://zenodo.org), [Dryad](http://datadryad.org/). Dependiendo de tu campo de investigación, encuentra repositorios reconocidos por la comunidad en tu campo. También puede ser útil [estos repositorios de datos recomendados por Nature](http://www.nature.com/sdata/data-policies/repositories). Discute con tu vecino qué repositorio de datos deseas abordar para tu proyecto actual y explicale por qué.


> ## ¿Puedo también publicar código?
>
> Hay nuevas maneras de publicar código y hacer que sea citable. Uno de ellos se describe [en la página principal del mismo GitHub](https://guides.github.com/activities/citable-code/). Básicamente es una combinación de GitHub (donde está el código) y Zenodo (el repositorio que crea el DOI). Lee esta página mientras sabes que ésta es sólo una de las muchas maneras de hacer tu código citable.

