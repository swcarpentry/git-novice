---
título: Creando un repositorio
enseñanza: 10
ejercicios: 0
preguntas:
- "¿Dónde almacena Git la información?"
objetivos:
- "Crear un repositorio local de Git."
puntos clave:
- "`git init` inicializa un repositorio."
---

Una vez que Git está configurado,
podemos comenzar a usarlo.
Vamos a crear un directorio para nuestro trabajo y nos movemos dentro de ese directorio:

~~~
$ mkdir planets
$ cd planets
~~~
{: .bash}

Después le indicamos a Git hacer de `planets` un [repository]({{ page.root }}/reference/#repository)—lugar donde
Git puede almacenar las versiones de nuestros archivos:

~~~
$ git init
~~~
{: .bash}

Si usamos `ls` para mostrar el contenido del directorio,
parece que nada ha cambiado:

~~~
$ ls
~~~
{: .bash}

Pero si agregamos la opción `-a` para mostrar todo,
podemos ver que Git ha creado un directorio oculto dentro de `planets` llamado `.git`:

~~~
$ ls -a
~~~
{: .bash}

~~~
.	..	.git
~~~
{: .output}

Git almacena información sobre el proyecto en este subdirectorio especial.
Si alguna vez lo borramos,
perderemos la historia del proyecto.

Podemos revisar que todo está configurado correctamente
pidiendo a Git que nos informe el estado de nuestro proyecto:

~~~
$ git status
~~~
{: .bash}

~~~
# On branch master
#
# Initial commit
#
nothing to commit (create/copy files and use "git add" to track)
~~~
{: .output}

> ## Lugares para crear repositorio Git
>
> Dracula comienza un nuevo proyecto, `moons`, relacionado a su proyecto `planets`.
> A pesar de las preocupaciones de Wolfman, él ingresa la siguiente secuencia de comandos 
> para crear un repositorio Git dentro de otro:
>
> ~~~
> $ cd             # volver al directorio de inicio
> $ mkdir planets  # crear un nuevo diretorio llamado planets
> $ cd planets     # entrar al directorio planets
> $ git init       # hacer del directorio planets directory un repositorio Git
> $ mkdir moons    # crear un subdirectorio planets/moons
> $ cd moons       # entrar al directorio planets/moons
> $ git init       # hacer del subdirectorio moons un repositorio Git
> ~~~
> {: .bash}
>
> ¿Por qué es una mala idea hacer esto? (Observa aquí que el proyecto `planets` ahora también se encuentra controlando el repositorio completo de `moons`.)
> ¿Cómo puede Dracula deshacer su último `git init`?
>
> > ## Solución
> >
> > Los repositorios Git pueden interferir entre sí si están "anidados" dentro de
> > otro directorio: el repositorio exterior intentará controlar la versión 
> > del repositorio interno. Por lo tanto, lo mejor es crear cada nuevo repositorio Git 
> > en un directorio separado. Para asegurarte que no hay un repositorio en conflicto
> > en el directorio, revisa la salida de `git status`. Si se parece a 
> > lo siguiente, podrás crear un nuevo  repositorio como se ha mostrado 
> > arriba:
> >
> > ~~~
> > $ git status
> > ~~~
> > {: .bash}
> > ~~~
> > fatal: Not a git repository (or any of the parent directories): .git
> > ~~~
> > {: .output}
> >
> > Ten en cuenta que podemos rastrear archivos en directorios dentro de Git:
> >
> > ~~~
> > $ touch moon phobos deimos titan    # crear archivos moon
> > $ cd ..                             # regresar al directorio planets
> > $ ls moons                          # listar el contenido del directorio moons
> > $ git add moons/*                   # añadir todo el contenido de planets/moons
> > $ git status                        # mostrar los archivos moons en el área de almacenamiento
> > $ git commit -m "add moon files"    # ingresar planets/moons al repositorio Git planets 
> > ~~~
> > {: .bash}
> >
> > De manera similar, podemos ignorar (como comentamos anteriormente) directorios completos, como el directorio `moons`:
> >
> > ~~~
> > $ nano .gitignore # abrir el archivo .gitignore en un editor para agregar el directorio moons
> > $ cat .gitignore # si después se ejecuta el comando cat, debería verse así:
> > ~~~
> > {: .bash}
> >
> > ~~~
> > moons
> > ~~~
> > {: .output}
> >
> > Para recuperarse de este pequeño error, Dracula puede simplemente eliminar el directorio `.git`
> > del subdirectorio moons. Para ello puede ejecutar el siguiente comando desde el interior del directorio 'moons':
> >
> > ~~~
> > $ rm -rf moons/.git
> > ~~~
> > {: .bash}
> >
> > !Pero ten cuidado! Ejecutar este comando en el directorio incorrecto, eliminará
> > toda la historia git de un proyecto que tú habrías querido conservar. Por lo tanto, revisa siempre tu directorio actual usando el comando
> > command `pwd`.
> {: .solution}
{: .challenge}
