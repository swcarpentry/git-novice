---
title: Rastreando Cambios
enseñanza: 20
ejercicios: 0
preguntas:
- "¿Cómo registro cambios en Git?"
- "¿Cómo reviso el estatus de mi repositorio de control de versiones?"
- "¿Cómo registro notas acerca de los cambios que he hecho y por qué?"
objetivos:
- "Ir a traves del ciclo modificar-agregar-commit para uno o más archivos."
- "Explicar donde se almacena la información en cada etapa del flujo de trabajo de un **commit** de Git."
- "Distinguir entre mensajes descriptivos y no-descriptivos de un **commit**."
Puntos clave:
- "`git status` muestra el estatus de un repositorio."
- "Los archivos pueden ser almacenados en un directorio de trabajo del proyecto (el cual ven los usuarios), el área de ensayo (donde el siguiente **commit** está siendo construido) y el repositorio local (donde los **commits** son registrados permanentemente)."
- "`git add` pone archivos en el área de ensayo."
- "`git commit` guarda el contenido del **staging area** como un nuevo **commit** en el repositorio local."
- "Siempre escribe un mensaje de registro cuando hagas un **commit** con cambios."
---

Primero asegúrate que estamos aún en el directorio correcto.
Tú deberías estar en el directorio `planets`.

~~~
$ pwd
~~~
{: .bash}

Si aún estás en `moons` navega de regreso a `planets`

~~~
$ cd ..
~~~
{: .bash}

Vamos a crear un archivo llamado `mars.txt` que contiene algunas notas
sobre Red Planet's suitability como base.
Usaremos `nano`para editar el archivo;
puedes usar el editor que prefieras.
En particular, éste no tiene que ser el `core.editor` que definiste globalmente con anterioridad. Pero recuerda, los comandos **bash** para crear o editar un nuevo archivo van a depender del editor que tú escojas (podría no ser `nano`). Para una actualización sobre editores de texto, echa un vistazo  ["¿Cuál editor?"](https://swcarpentry.github.io/shell-novice/03-create/) en la lección [El Shell Unix](https://swcarpentry.github.io/shell-novice/) .

~~~
$ nano mars.txt
~~~
{: .bash}

Teclea el texto siguiente en el archivo `mars.txt`:

~~~
Cold and dry, but everything is my favorite color
~~~
{: .output}

`mars.txt` ahora contiene una sola línea, la cual podemos ver ejecutando:

~~~
$ ls
~~~
{: .bash}

~~~
mars.txt
~~~
{: .output}

~~~
$ cat mars.txt
~~~
{: .bash}

~~~
Cold and dry, but everything is my favorite color
~~~

{: .output}

Si revisamos el estatus de nuestro proyecto otra vez,
Git nos dice que ha notado el nuevo archivo:

~~~
$ git status
~~~
{: .bash}

~~~
On branch master

Initial commit

Untracked files:
   (use "git add <file>..." to include in what will be committed)

	mars.txt
nothing added to commit but untracked files present (use "git add" to track)
~~~
{: .output}

El mensaje de "untracked files" significa que hay un archivo en el directorio
que Git no le está siguiendo la pista. Podemos decirle a Git que le siga la pista a un archivo usando  `git add`: 

~~~
$ git add mars.txt
~~~
{: .bash}

y luego verifica que pasó lo correcto:

~~~
$ git status
~~~
{: .bash}

~~~
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   mars.txt

~~~
{: .output}

Git ahora sabe que tiene que seguir la pista de `mars.tx`,
pero no ha registrado estos cambios con un **commit** aún.
Para que lo haga,
necesitamos ejecutar un comando más:

~~~
$ git commit -m "Start notes on Mars as a base"
~~~
{: .bash}

~~~
[master (root-commit) f22b25e] Start notes on Mars as a base
 1 file changed, 1 insertion(+)
 create mode 100644 mars.txt
~~~
{: .output}

Cuando ejecutamos `git commit`,
Git toma todo lo que le hemos dicho para salvarlo usando `git add`
y almacena una copia permanentemente dentro del directorio especial `.git`.
Esta copia permanente es llamada un [commit]({{ page.root }}/reference/#commit)
(or [revision]({{ page.root }}/reference/#revision)) y su identificador corto es  `f22b25e`
(Tu **commit** podría tener otro identificador.)

Usamos la bandera `-m` (de "message")
para registrar un comentario corto, descriptivo y específico que nos ayudará a recordar más tarde lo que hicimos y por qué.
Si ejecutamos `git commit` sin  la opción `-m`,
Git ejecutará `nano` (o cualquier otro editor que configuramos como `core.editor`)
así que podemos escribir un mensaje más largo.

[Los Buenos mensajes en un **commit**][commit-messages] inician con un breve resumen (<50 caracteres) de los
cambios hechos en el **commit**.  Si quieres entrar en más detalles, agrega
una línea blanca entre la línea del resumen y tus notas adicionales.

Si ejecutamos `git status` ahora:

~~~
$ git status
~~~
{: .bash}

~~~
On branch master
nothing to commit, working directory clean
~~~
{: .output}

nos dice que todo está actualizado.
Si queremos saber lo que hemos hecho recientemente,
podemos pedir a Git  que nos muestre la historia del proyecto usando `git log`:

~~~
$ git log
~~~
{: .bash}

~~~
commit f22b25e3233b4645dabd0d81e651fe074bd8e73b
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 09:51:46 2013 -0400

    Start notes on Mars as a base
~~~
{: .output}

`git log`  lista todos los **commits** hechos a un repositorio en orden cronológico inverso.
El listado de cada **commit** incluye
el identificador completo del **commit**
(el cual inicia con el mismo caracter que
el identificador corto que imprime el comando `git commit` anteriormente ),
el autor del **commit**,
cuándo fue creado,
y el mensaje de registro que se le dio a Git cuando el **commit** fue creado.

> ## ¿Dónde están mis cambios?
>
> Si ejecutamos `ls` en este punto, aún veremos un solo archivo llamado `mars.txt`.
> Esto es porque Git guarda información acerca de la historia de los archivos
> en el directorio especial `.git` mencionado antes
>para que nuestro sistema de archivos no se abarrote
> (y para que no podamos editar o borrar accidentalmente una versión anterior).
{: .callout}

Ahora supón que Dracula agrega más información al archivo.
(Otra vez, editaremos con `nano` y luego con  `cat` mostraremos el contenido del archivo;
podrías usar un editor diferente y no necesitar a `cat`.)

~~~
$ nano mars.txt
$ cat mars.txt
~~~
{: .bash}

~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
~~~
{: .output}

Cuando ejecutamos `git status` ahora
nos dice que un archivo ya sabe que ha sido modificado:

~~~
$ git status
~~~
{: .bash}

~~~
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   mars.txt

no changes added to commit (use "git add" and/or "git commit -a")
~~~
{: .output}

La última línea es la frase clave:
"no changes added to commit".
Hemos cambiado este archivo,
pero no le hemos dicho a Git que queremos que guarde los cambios
(lo cual hacemos con `git add`)
ni lo hemos guardado (lo cual hacemos con `git commit`).
Así que hagamos eso ahora. Es una buena práctica revisar siempre
nuestros cambios antes de guardarlos. Hacemos esto usando `git diff`.
Esto nos muestra las diferencias entre el estado actual
del archivo y la versión guardada más reciente:

~~~
$ git diff
~~~
{: .bash}

~~~
diff --git a/mars.txt b/mars.txt
index df0654a..315bf3a 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1 +1,2 @@
 Cold and dry, but everything is my favorite color
+The two moons may be a problem for Wolfman
~~~
{: .output}

La salida es críptica porque 
actualmente es una serie de comandos para herramientas como editores y `patch`
que les dicen cómo reconstruir un archivo dado el otro.
Si lo dividimos en pedazos:

1.  La primera línea nos dice que Git está produciendo una salida similar a la del comando Unix `diff`
    comparando las versiones anterior y nueva del archivo.
2.  La segunda línea dice exactamente cuáles versiones del archivo
    está comparando Git;
    `df0654a` y `315bf3a` son etiquetas únicas generadas por computadora para esas versiones.
3.  Las líneas tercera y cuarta muestran una vez más el nombre del archivo que se está cambiando.
4.  Las líneas restantes son las más interesantes, ellas nos muestran las diferencias actuales
    y las líneas donde ellas ocurren.
    En particular,
    el marcador `+` en la primera columna muestra dónde agregamos una línea.

Después de revisar nuestro cambio, es tiempo de hacer un **commit** de eso:

~~~
$ git commit -m "Add concerns about effects of Mars' moons on Wolfman"
$ git status
~~~
{: .bash}

~~~
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   mars.txt

no changes added to commit (use "git add" and/or "git commit -a")
~~~
{: .output}

Vaya:
Git no hará **commit** porque no usamos `git add` primero.
Arreglemos esto:

~~~
$ git add mars.txt
$ git commit -m "Add concerns about effects of Mars' moons on Wolfman"
~~~
{: .bash}

~~~
[master 34961b1] Add concerns about effects of Mars' moons on Wolfman
 1 file changed, 1 insertion(+)
~~~
{: .output}

Git insiste en que agreguemos archivos al conjunto que queremos hacer **commit**
antes de hacer **commit** real de alguna cosa. Esto permite hacer **commit** de nuestros
cambios en etapas y atrapar cambios en porciones lógicas en lugar de
solo lotes grandes.
Por ejemplo,
supongamos que agregamos pocas citas para nuestro supervisor de trabajo
en nuestra tesis.
Podríamos querer hacer **commit** a esas adiciones,
y su correspondiente adición a la bibliografía,
pero *no* hacer **commit** del trabajo que estamos haciendo en la conclusión
(el cual no hemos terminado aún).


Para permitir esto,
Git tiene un *staging area* especial
donde mantiene registro de cosas que han sido agregadas a
el actual [changeset]({{ page.root }}/reference/#changeset)
pero aún no se hace **commit**.

> ## Staging Area
>
> Piensa en Git como si tomara instantáneas de cambios durante la vida de un proyecto,
> `git add` especifica *qué* irá en una instantánea
> (poniendo cosas en el **staging area**),
> y `git commit` entonces *realmente toma* la instantánea, y
> hace un registro permanente de esto (como un **commit**).
> Si no tienes nada en el staging area cuando escribes  `git commit`,
> Git te pedirá que uses `git commit -a` o `git commit --all`,
> que es como reunir ¡*a todos* para la foto!
> Sin embargo, es casi siempre mejor
> agregar explícitamente cosas al **staging area**, porque podrías
> hacer **commit** de cambios que habías olvidado. (Ir atrás en las instantáneas,
> podrías obtener el extra con maquillaje incompleto caminando sobre
> la etapa de la instantánea porque usaste  `-a`!)
> Trata de organizar las cosas manualmente
> o podrías verte buscando "git undo commit" más
> de lo que te gustaría!
{: .callout}

![The Git Staging Area](../fig/git-staging-area.svg)

Veamos cómo nuestros cambios a un archivo se mueven de nuestro editor
al área de ensayo
y  luego al almacenamiento de largo plazo.
Primero,
agregamos otra línea al archivo:

~~~
$ nano mars.txt
$ cat mars.txt
~~~
{: .bash}

~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
~~~
{: .output}

~~~
$ git diff
~~~
{: .bash}

~~~
diff --git a/mars.txt b/mars.txt
index 315bf3a..b36abfd 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1,2 +1,3 @@
@@ -1,2 +1,3 @@
 Cold and dry, but everything is my favorite color
 The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~
{: .output}

Hasta aquí, todo bien:
hemos agregado una línea al final del archivo
(mostrado con un `+` en la primera columna).
Ahora pongamos el cambio en el **staging area**
y veamos lo que reporta `git diff`:

~~~
$ git add mars.txt
$ git diff
~~~
{: .bash}

No hay salida:
en lo que Git puede decir,
no hay diferencia entre lo que se pidió guardar permanentemente
y lo que actualmente está en el directorio.
Sin embargo,
si hacemos esto:

~~~
$ git diff --staged
~~~
{: .bash}

~~~
diff --git a/mars.txt b/mars.txt
index 315bf3a..b36abfd 100644
--- a/mars.txt
+++ b/mars.txt
@@ -1,2 +1,3 @@
 Cold and dry, but everything is my favorite color
 The two moons may be a problem for Wolfman
+But the Mummy will appreciate the lack of humidity
~~~
{: .output}

esto nos muestra la diferencia entre
el último cambio que sí hizo **commit**
y lo que está en el **staging area**.
Guardemos nuestros cambios:

~~~
$ git commit -m "Discuss concerns about Mars' climate for Mummy"
~~~
{: .bash}

~~~
[master 005937f] Discuss concerns about Mars' climate for Mummy
 1 file changed, 1 insertion(+)
~~~
{: .output}

revisa nuestro estatus:

~~~
$ git status
~~~
{: .bash}

~~~
On branch master
nothing to commit, working directory clean
~~~
{: .output}

y mira en la historia lo que hemos hecho hasta aquí:

~~~
$ git log
~~~
{: .bash}

~~~
commit 005937fbe2a98fb83f0ade869025dc2636b4dad5
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 10:14:07 2013 -0400

    Discuss concerns about Mars' climate for Mummy

commit 34961b159c27df3b475cfe4415d94a6d1fcd064d
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 10:07:21 2013 -0400

    Add concerns about effects of Mars' moons on Wolfman

commit f22b25e3233b4645dabd0d81e651fe074bd8e73b
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 09:51:46 2013 -0400

    Start notes on Mars as a base
~~~
{: .output}

> ## Diferencias basadas en palabra
>
> A veces, en el caso de documentos de texto un diff en línea
> es demasiado caótico. Es ahí donde la opción `--color-words` de
> `git diff` se vuelve muy útil ya que resalta las palabras
> modificadas usando colores.
{: .callout}

> ## Paginación del Registro
>
> Cuando la salida de `git log` es demasiado larga para caber en tu pantalla,
> `git` usa un programa para dividir en páginas del tamaño de tu pantalla.
> Cuando este "paginador" es llamado, notarás que la última línea de tu
> pantalla es un `:`, en lugar de tu prompt de siempre.
>
> *   Para salir del paginador, presiona `q`.
> *   Para mover a la siguiente página, presiona la barra espaciadora.
> *   Para buscar `alguna_palabra` en todas las páginas, escribe `/alguna_palabra`
>     y navega entre las coincidencias presionando `n` (next).
{: .callout}

> ## Tamaño Límite del Registro
>
> Para evitar que `git log` cubra toda la pantalla de tu terminal, puedes limitar el
> número de **commits** que Git lista usando `-N`, donde `N` es el número de
> **commits** que tu quieres ver. Por ejemplo, si sólo quieres información de
> el último **commit**, puedes usar:
>
> ~~~
> $ git log -1
> ~~~
> {: .bash}
>
> ~~~
> commit 005937fbe2a98fb83f0ade869025dc2636b4dad5
> Author: Vlad Dracula <vlad@tran.sylvan.ia>
> Date:   Thu Aug 22 10:14:07 2013 -0400
>
>    Discuss concerns about Mars' climate for Mummy
> ~~~
> {: .output}
>
> Puedes reducir la cantidad de información usando la
> opción `--oneline`:
>
> ~~~
> $ git log --oneline
> ~~~
> {: .bash}
> ~~~
> * 005937f Discuss concerns about Mars' climate for Mummy
> * 34961b1 Add concerns about effects of Mars' moons on Wolfman
> * f22b25e Start notes on Mars as a base
> ~~~
> {: .output}
>
> Puedes combinar las opciones `--oneline` con otras. Una combinación
> útil es:
>
> ~~~
> $ git log --oneline --graph --all --decorate
> ~~~
> {: .bash}
> ~~~
> * 005937f Discuss concerns about Mars' climate for Mummy (HEAD, master)
> * 34961b1 Add concerns about effects of Mars' moons on Wolfman
> * f22b25e Start notes on Mars as a base
> ~~~
> {: .output}
{: .callout}

> ## Directorios
>
> Dos hechos importantes que deberías saber acerca de directorios en Git.
>
> 1. Git no rastrea directorios por su cuenta, sólo archivos dentro de ellos.
> Inténtalo tú mismo:
>
> ~~~
> $ mkdir directory
> $ git status
> $ git add directory
> $ git status
> ~~~
> {: .bash}
>
> Nota, nuestro nuevo y vació directorio  `directory` no aparece en
> la lista de archivos no rastreados aún si nosotros explícitamente lo agregamos(_via_ `git add`) a nuestro
> repositorio. Esta es la razón por la que algunas veces verás archivos `.gitkeep`
> en directorios vacíos. A diferencia de `.gitignore`, estos archivos no son especiales
> y su único propósito es poblar un directorio para que Git lo agregue
> al repositorio. En efecto, podrías nombrar estos archivos como quieras.
>
> {:start="2"}
> 2. Si creas un directorio en tu repositorio Git y poblas éste con archivos,
> podrás agregar todos los archivos en el directorio a la vez haciendo:
>
> ~~~
> git add 1
> ~~~
> {: .bash}
>
{: .callout}

Recapitulando, cuando queremos agregar cambios a nuestro repositorio,
primero necesitamos agregar los archivos cambiados al área de ensayo
(`git add`) y luego hacer un **commit** de los cambios al
repositorio (`git commit`):

![The Git Commit Workflow](../fig/git-committing.svg)

> ## Escogiendo un Mensaje para el **Commit**
>
> ¿Cuál de los siguientes mensajes de un **commit** debería ser más apropiado para el
> último **commit** hecho a `mars.txt`?
>
> 1. "Changes"
> 2. "Added line 'But the Mummy will appreciate the lack of humidity' to mars.txt"
> 3. "Discuss effects of Mars' climate on the Mummy"
>
> > ## Solución
> > La respuesta 1 no es suficientemente descriptiva,
> > y la respuesta 2 es demasiado descriptiva y redundante,
> > pero la respuesta 3 es buena: corta pero descriptiva.
> {: .solution}
{: .challenge}

> ## Haciendo Commit de Cambios a Git
>
> ¿Cuál comando(s) de abajo deberían guardar los cambios de `myfile.txt`
> a mi repositorio local Git?
>
> 1. `$ git commit -m "my recent changes"`
>
> 2. `$ git init myfile.txt`
>    `$ git commit -m "my recent changes"`
>
> 3. `$ git add myfile.txt`
>    `$ git commit -m "my recent changes"`
>
> 4. `$ git commit -m myfile.txt "my recent changes"`
>
> > ## Solución
> >
> > 1. Debería crear solamente un **commit** si los archivos ya han sido organizados.
> > 2. Trataría de crear un nuevo respositorio.
> > 3. Es correcto: primero agrega el archivo al **staging area**, luego hace **commit**.
> > 4. Intentaría hacer **commit** al archivo "my recent changes" con el mensaje myfile.txt.
> {: .solution}
{: .challenge}

> ## Haciendo **Commit** a Multiples Archivos
>
> El **staging area** puede tener cambios de cualquier número de archivos
> que quieras hacer **commit** como una sóla instantanea.
>
> 1. Agrega algún texto a `mars.txt` anotando tu decisión
> para considerar Venus como base
> 2. Crea un nuevo archivo `venus.txt` con tus pensamientos iniciales
> acerca de Venus como base para tí y tus amigos
> 3. Agrega los cambios de ambos archivos al **staging area**,
> y haz un **commit** de esos cambios.
>
> > ## Solución
> >
> > Primero haremos nuestros cambios a los archivos `mars.txt` y `venus.txt`:
> > ~~~
> > $ nano mars.txt
> > $ cat mars.txt
> > ~~~
> > {: .bash}
> > ~~~
> > Maybe I should start with a base on Venus.
> > ~~~
> > {: .output}
> > ~~~
> > $ nano venus.txt
> > $ cat venus.txt
> > ~~~
> > {: .bash}
> > ~~~
> > Venus is a nice planet and I definitely should consider it as a base.
> > ~~~
> > {: .output}
> > Ahora puedes agregar ambos archivos al **staging area**. Podemos hacer esto en una sóla línea:
> >
> > ~~~
> > $ git add mars.txt venus.txt
> > ~~~
> > {: .bash}
> > O con varios comandos:
> > ~~~
> > $ git add mars.txt
> > $ git add venus.txt
> > ~~~
> > {: .bash}
> > Ahora los archivos están listos para hacer **commit**. Puedes verificar esto usando `git status`. Si estás listo para hacer **commit** usa:
> > ~~~
> > $ git commit -m "Write plans to start a base on Venus"
> > ~~~
> > {: .bash}
> > ~~~
> > [master cc127c2]
> >  Write plans to start a base on Venus
> >  2 files changed, 2 insertions(+)
> >  create mode 100644 venus.txt
> > ~~~
> > {: .output}
> {: .solution}
{: .challenge}

> ## Author y Committer

> Para cada uno de los  **commits** que hayas hecho, Git almacenó tu nombre 2 veces.
> Tú eres nombrado como el **author** y el **committer**. Puedes observar
> esto, diciendo a Git que te muestre más información acerca de tus últimos
> **commits**:
>
> ~~~
> $ git log --format=full
> ~~~
> {: .bash}
>
> Cuando haces **commit** puedes nombrar a alguien más como el **author**:
>
> ~~~
> $ git commit --author="Vlad Dracula <vlad@tran.sylvan.ia>"
> ~~~
> {: .bash}
>
> Crea un nuevo repositorio y crea dos **commits**: uno sin la
> opción `--author` y uno nombrando a un colega tuyo como el
> **author**. Ejecuta `git log` y `git log --format=full`.  Piensa acerca de formas de
> cómo esto puede permitir colaborar con tus colegas.
>
> > ## Solución
> >
> > ~~~
> > $ git add me.txt
> > $ git commit -m "Update Vlad's bio." --author="Frank N. Stein <franky@monster.com>"
> > ~~~
> > {: .bash}
> > ~~~
> > [master 4162a51] Update Vlad's bio.
> > Author: Frank N. Stein <franky@monster.com>
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > $ git log --format=full
> > commit 4162a51b273ba799a9d395dd70c45d96dba4e2ff
> > Author: Frank N. Stein <franky@monster.com>
> > Commit: Vlad Dracula <vlad@tran.sylvan.ia>
> >
> > Update Vlad's bio.
> >
> > commit aaa3271e5e26f75f11892718e83a3e2743fab8ea
> > Author: Vlad Dracula <vlad@tran.sylvan.ia>
> > Commit: Vlad Dracula <vlad@tran.sylvan.ia>
> >
> > Vlad's initial bio.
> > ~~~
> > {: .output}
> {: .solution}
{: .challenge}

[commit-messages]: http://chris.beams.io/posts/git-commit/
