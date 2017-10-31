---
título: Usando Git desde RStudio
enseñanza: 10
ejercicios: 0
preguntas:
- "¿Cómo puedo usar Git desde RStudio?"
objetivos:
- "Entender cómo usar Git desde RStudio."
puntos clave:
- "Crear un proyecto en RStudio"
---

El uso de control de versiones es muy útil cuando escribimos **scripts**, por eso RStudio puede usarse con Git. Hay algunas funcionalidades de Git que solamente se pueden usar desde la terminal, pero RStudio nos da una rica interfaz de trabajo para realizar las operaciones más habituales de control de versiones.

RStudio te permite crear un proyecto [project][rstudio-projects] asociado a un directorio determinado. Esta es una manera de mantenerse al tanto de los archivos asociados al proyecto. Una manera de tener control de archivos es mediante el uso de un programa de control de versiones. Para empezar a usar RStudio para el control de versiones, comencemos por crear un nuevo proyecto: 

![](../fig/RStudio_screenshot_newproject.png)

Una nueva ventana se abrirá y preguntará cómo queremos crear el proyecto. Tenemos
aquí varias opciones. Supongamos que queremos usar RStudio con el repositorio de planetas
que ya hemos creado. Como ese repositorio ya está en una carpeta en tu computadora,
podemos escoger la opción "Existing Directory": 

![](../fig/RStudio_screenshot_existingdirectory.png)

> ## ¿Puedes ver la opción de "Version Control"?
>
> Aunque no vamos a usar ésta opción aquí, deberías poder ver una opción en el menú que diga
> "Version Control". Esta es la opción que debes escoger cuando quieras crear
> un proyecto en tu computadora mediante una clonación de un repositorio de GitHub.
> Si esta opción no es visible, probablemente significa que RStudio no sabe
> donde está tu ejecutable de Git. Mira 
> [esta página](https://stat545-ubc.github.io/git03_rstudio-meet-git.html)
> para encontrar algunos consejos. Incluso después de instalar Git, si estás usando MacOSX
> algunas veces puede ser necesario que tengas que aceptar la licencia de XCode
{: .callout}

En el siguiente paso, RStudio va a preguntar cuál es la carpeta existente que queremos usar. Haremos 
click en "Browse" para navegar a la carpeta correcta en tu computadora, y luego haremos click en 
"Create Project":

![](../fig/RStudio_screenshot_navigateexisting.png)

¡Y ya está! Ahora tenemos un proyecto en R que contiene su propio repositorio. Fíjate que en el menú ahora aparece un botón con "Git" en letras verticales. Esto significa que RStudio ha reconocido que ésta carpeta es un repositorio de Git, así que te proporcionará las herramientas para usar Git:

![](../fig/RStudio_screenshot_afterclone.png)

Para editar los archivos en tu repositorio, puedes hacer click en el archivo desde el panel inferior izquierdo. Vamos a añadir más información sobre Plutón:

![](../fig/RStudio_screenshot_editfiles.png)

Ahora que hemos guardado nuestros archivos, podemos usar RStudio para hacer un **commit** los cambios. Usa el botón y haz clik a "Commit":

![](../fig/RStudio_screenshot_commit.png)

Esto abrirá una ventana donde puedes seleccionar de qué archivos quieres hacer **commit** (marca
sus casillas en la columna "Staged") y luego escribe un mensaje para el **commit** (en el panel
superior derecho). Los iconos en la columna "Status" indican el estado actual de cada
archivo. También puedes ver los cambios de cada archivo haciendo click en su nombre. Una vez
que todo esté de la forma que quieres, haz click en "Commit":

![](../fig/RStudio_screenshot_review.png)

Puedes subir los cambios seleccionando "Push" en el menú de Git. Allí hay también
opciones para traernos cambios (hacer **push**) desde una versión remota de este repositorio, y ver
el historial de cambios realizados:

![](../fig/RStudio_screenshot_history.png)

> ¿Están los comandos **Push** y **Pull** en gris?
>
> Si este es el caso, generalmente significa que RStudio no sabe dónde están las 
> otras versiones de tu repositorio (por ejemplo, en GitHub).
> Para solucionar esto, abre una terminal, sitúate en el repositorio y luego lanza el siguiente comando:
> `git push -u origin master`. Luego reinicia RStudio.
{: .callout}

Si hacemos click en el historial de cambios "History", podemos ver una versión gráfica de lo
que obtendríamos con el comando `git log`:

![](../fig/RStudio_screenshot_viewhistory.png)

RStudio crea algunos archivos que le ayudan a mantener un control de los cambios en el proyecto. Normalmente no deseamos que Git los incluya en el control de versiones, así que es una buena idea agregar sus nombres al .gitignore:

![](../fig/RStudio_screenshot_gitignore.png)

Hay muchas más opciones que se pueden encontrar en la interfaz de RStudio, pero las que hemos visto son suficientes para comenzar.

[rstudio-projects]: https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects
