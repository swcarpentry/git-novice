---
título: "Trabajos en colaboración"
enseñanza: 5
ejercicios: 0
preguntas:
- "¿Cómo puedo usar el control de versiones para colaborar con otras personas? 
objetivos:
- Clonar un repositorio remoto.
- Colaborar en crear un repositorio común.
puntos clave: '`git clone` copies a remote repository to create a local repository with a remote called `origin` automatically set up.'
---

Para el siguiente paso, formen parejas. Una persona será el "dueño" y la otra el "colaborador". El objetivo es que el colaborador agregue cambios al repositorio del dueño. Vamos a cambiar roles al final, de modo que ambas personas puedan participar como dueño y colaborador

> ## Practicando por tu cuenta
>
> Si estás trabajando en esta lección por tu cuenta, puedes hacerlo abriendo una segunda sesión en la 
> ventana de la terminal. Esta ventana representará a tu compañero, trabajando en otra computadora. No necesitas darle acceso a nadie en GitHub, pues tu serás ambos "compañeros".
{: .callout}

El dueño debe dar acceso al colaborador. En GitHub, haz click en el botón de configuración arriba a la derecha,
luego selecciona "Colaboradores" e ingresa el nombre de tu colaborador.

![Adding Collaborators on GitHub](../fig/github-add-collaborators.png)

Para aceptar la invitación de acceso al repositorio, el Colaborador
debe ingresar a [https://github.com/notifications](https://github.com/notifications).
Una vez allí, se puede aceptar la invitación a dicho repositorio.

Luego, el colaborador debe descargar una copia del repositorio del dueño a su máquina. Esto se conoce como "clonar un repositorio". Para clonar el repositorio del dueño en su carpeta de `Desktop`, el colaborador debe correr las siguientes líneas:

~~~
$ git clone https://github.com/vlad/planets.git ~/Desktop/vlad-planets
~~~
{: .bash}

Remplazar 'vlad' con el nombre de usuario del dueño.

![After Creating Clone of Repository](../fig/github-collaboration.svg)

El colaborador puede ahora hacer cambios en la versión clonada del repositorio del dueño,en la misma forma en que se hacían previamente:

~~~
$ cd ~/Desktop/vlad-planets
$ nano pluto.txt
$ cat pluto.txt
~~~
{: .bash}

~~~
It is so a planet!
~~~
{: .output}

~~~
$ git add pluto.txt
$ git commit -m "Add notes about Pluto"
~~~
{: .bash}

~~~
 1 file changed, 1 insertion(+)
 create mode 100644 pluto.txt
~~~
{: .output}

Luego enviar, "push", los cambios hacia el *repositorio del dueño* en GitHub:

~~~
$ git push origin master
~~~
{: .bash}

~~~
Counting objects: 4, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 306 bytes, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/vlad/planets.git
   9272da5..29aba7c master -> master
~~~
{: .output}

Nota que no es necesario crear un directorio remoto llamado `origin`: Git utiliza este nombre de manera automática cuando clonamos un repositorio. (Esta es la razón por la cual `origin` era una opción sensata a la hora de configurar directorios remotos a mano).

Ahora echa un vistazo al repositorio del dueño en su sitio de Github (quizás debas refrescar la página). Deberás ver el nuevo commit hecho por el colaborador.

Para descargar los cambios hechos por el colaborador desde GitHub, el dueño corre las siguientes líneas:

~~~
$ git pull origin master
~~~
{: .bash}

~~~
remote: Counting objects: 4, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 3 (delta 0)
Unpacking objects: 100% (3/3), done.
From https://github.com/vlad/planets
 * branch master -> FETCH_HEAD
Updating 9272da5..29aba7c
Fast-forward
 pluto.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 pluto.txt
~~~
{: .output}

Ahora hay tres repositorios sincronizados (el local del Dueño, el local del colaborador y el del dueño en GitHub).

## Un flujo de trabajo colaborativo básico

En la practica, es bueno estar seguro que tienes una versión actualizada del repositorio en el que colaboras. Para ello, es bueno hacer un `git pull` antes de hacer cambios. El enfoque sería:


* actualizar el repositorio local `git pull origin master`,
* realizar cambios `git add`,
* realizar un commit `git commit -m`, y
* cargar las actualizaciones a GitHub con `git push origin master`

Es mejor hacer varias actualizaciones pequeñas que un **commit** grande con cambios enormes. **Commits** pequeños son más fáciles de leer y revisar.
{: .callout}

## Cambiar roles

Cambie los roles y repita todo el proceso.
{: .challenge}

## Revisar Cambios

El dueño hace un **push** de los **commits** al repositorio sin dar información al colaborador. Cómo puede éste saberlo desde la linea de comandos y desde GitHub?

## Solution

En la linea de comandos, el colaborador puede usar ```git fetch origin master``` para acceder a los cambios remotos en el repositorio local, sin hacer un **merge*. Luego, corriendo ```git diff master origin/master```,  el colaborador verá los cambios en la terminal.  

En GitHub, el colaborador puede realizar su propio **fork** y hallar la barra gris que indica "This branch is 1 commit behind Our-Respository:master.". Lejos, a la derecha de la barra gris, hay un link para comparar. En la página para comparar, el colaborador debe cambiar el **fork** hacia su propio repositorio, luego hacer click en el link para "comparar entre forks" y, finalmente, cambiar el **fork** al repositorio principal. Esto mostrará todos los **commits** que sean distintos. 

{: .solution}
{: .challenge}

## Comentar cambios en GitHub

El colaborador tiene algunas preguntas sobre cambios en una línea hechos por el dueño. 

Con GitHub, es posible comentar la diferencia en un **commit**. Sobre la línea de código a comentar, el botón azul aparece para abrir una ventana. 

El colaborador postea los comentarios y sugerencias usando la interfaz de GitHub.
{: .challenge}

## Historial de versiones, backup y control de versiones

Algunos softwares que permiten hacer **backups** también permiten guardar un historial de versiones y recuperar versiones específicas. ¿Cómo es esta funcionalidad distinta del control de versiones? ¿Cuáles son los beneficios de usar control de versiones, Git y GitHub? 
{: .challenge}
