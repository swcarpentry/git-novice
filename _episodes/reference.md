---
layout: reference
permalink: /reference/
---

## Cheatsheets de Git para Referencia Rápida

*   Un excelente [cheatsheet de git listo para impresión](https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf) está disponible en formato PDF desde
[el sitio de preparación de GitHub](https://services.github.com/resources/).
*   Una [visualización interactiva](http://ndpsoftware.com/git-cheatsheet.html)
    sobre las relaciones entre entorno de trabajo, área de staging, repositorio local y remoto, así los comandos asociados con cada caso (y sus explicaciones)
*   Ambos recursos están disponibles en varios lenguajes e.g. español, francés, y muchos más.

## Glosario

{:auto_ids}
changeset
:   Un grupo de cambios a uno o más ficheros que son o serán añadidos
    en un solo [commit](#commit) en un [repositorio](#repositorio)
    de [control de versiones](#control-de-versiones).

commit
:   Como verbo *hacer un commit* es la acción de registrar el estado
    de un conjunto de ficheros en un momento determinado (un [changeset](#changeset))
    en un [repositorio](#repositorio) de [control de versiones](#control-de-versiones). Como sustantivo,
    *un commit* es el resultado de esta acción, i.e. un changeset almacenado en un repositorio.
    Si un commit contiene cambios hechos a múltiples ficheros,
    todos los cambios son almacenados juntos.

conflicto
:   Un cambio hecho por un usuario de un [sistema de control de versiones](#control-de-versiones)
    que es incompatible con cambios hechos por otros usuarios.
    Asistir a los usuarios a [resolver](#resolver) conflictos
    es una de las funciones más importantes del control de versiones.

HTTP
:   Siglas de Hypertext Transfer Protocol, el [protocolo](#protocolo) utilizado para compartir páginas web y otros datos
    en la World Wide Web.

mezclar
:   (un repositorio): Reconciliar dos conjuntos de cambios en un
    [repositorio](#repositorio).

protocolo
:   Un conjunto de reglas que definen cómo una computadora se comunica con otra.
    Entre los protocolos más utilizados en la Internet se encuentran [HTTP](#http) y [SSH](#ssh).

remote
:   (de un repositorio) Un [repositorio](#repositorio) de [control de versiones](#control-de-versiones) conectado con otro
    de forma tal que ambos pueden ser actualizados intercambiando [commits](#commit).

repositorio
:   Un área de almacenamiento donde un sistema de [control de versiones](#control-de-versiones)
    almacena la historia completa de [commits](#commit) de un proyecto, así como información
    sobre quién cambio qué, cuándo.

resolver
:   Eliminar los [conflictos](#conflicto) entre dos o más cambios incompatibles sobre un fichero o un conjunto de ficheros
    administrados por un sistema de [control de versiones](#control-de-versiones).

revisión
:   Un sinónimo de [commit](#commit).

SHA-1
:   [SHA-1 hashes](http://en.wikipedia.org/wiki/SHA-1) es lo que Git utiliza para generar identificadores, incluyendo los de los commits.
    Para calcularlos, Git no solamente utiliza los cambios que forman parte de un commit, sino también sus metadatos (tales como fecha, autor,
    mensaje), incluyendo los identificadores de todos los commits hechos para cambios anteriores. Esto hace que los ID de commits de Git san virtualmente únicos.
    I.e., es ínfima la probabilidad de que un mismo ID se refiera a dos commits hechos de forma independiente, incluso si tuvieran los mismos cambios.

SSH
:   Abreviatura de Secure Shell, un [protocolo](#protocolo) utilizado para la comunicación de forma segura entre computadoras.

timestamp
:   Un registro de cuando ocurrió un evento específico.

control de versiones
:   Una herramienta para administrar los cambios hechos a un conjunto de ficheros.
    Cada conjunto de cambios crea un nuevo[commit](#commit) de los ficheros;
    el sistema de control de versiones permite a los usuarios recibir de manera fiable los commits precedentes,
    y ayuda a solventar cambios conflictivos hechos por diferentes usuarios.
