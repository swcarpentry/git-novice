---
título: Conflictos
enseñanza: 15
ejercicios: 0
preguntas:
- "¿Qué hago cuando mis cambios entran en conflicto con los de otra persona?"
objetivos:
- "Explicar qué son los conflictos y cuándo pueden ocurrir."
- "Resolver conflictos resultantes de una fusión."
puntos clave:
- "Los conflictos ocurren cuando dos o más personas cambian el mismo archivo(s) al mismo tiempo."
- "El sistema de control de versiones no permite a las personas sobreescribir ciegamente los
cambios del otro, pero resalta los conflictos para poder resolverlos."
---

Tan pronto como podemos trabajar en paralelo, es probable que alquien deshaga lo que otro hizo. Esto incluso es probable con una única persona: si estamos trabajando en un software al mismo tiempo en nuestra computadora portátil y un servidor en el laboratorio, podríamos hacer cambios diferentes a cada copia del trabajo. El control de versiones nos ayuda a manejar estos [confictos]({{ page.root }}/reference/#conflicts) al darnos herramientas para [resolver]({{ page.root }}/reference/#resolve) cambios que se hayan sobrelapado. 

Para ver cómo podemos resolver conflictos, primero debemos crear uno. Actualmente, el archivo `mars.txt` luce de la siguiente manera en dos copias de diferentes compañeros en nuestro repositorio `planetas`:

~~~
$ cat mars.txt
~~~
{: .bash}


~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
~~~
{: .output}

Agreguemos una línea únicamente a la copia de uno de los dos compañeros:

~~~
$ nano mars.txt
$ cat mars.txt
~~~
{: .bash}


~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
This line added to Wolfman's copy
~~~
{: .output}


y luego hacer `push` al cambio a GitHub:


~~~
$ git add mars.txt
$ git commit -m "Add a line in our home copy"
~~~
{: .bash}

~~~
[master 5ae9631] Add a line in our home copy
 1 file changed, 1 insertion(+)
~~~
{: .output}

~~~
$ git push origin master
~~~
{: .bash}

~~~
Counting objects: 5, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 352 bytes, done.
Total 3 (delta 1), reused 0 (delta 0)
To https://github.com/vlad/planets
   29aba7c..dabb4c8  master -> master
~~~
{: .output}

Ahora haremos que el otro compañero
haga un cambio diferente a su copia
*sin* actualizar desde GitHub:

~~~
$ nano mars.txt
$ cat mars.txt
~~~
{: .bash}


~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
We added a different line in the other copy
~~~
{: .output}


Podemos hacer **commit** del cambio localmente

~~~
$ git add mars.txt
$ git commit -m "Add a line in my copy"
~~~
{: .bash}


~~~
[master 07ebc69] Add a line in my copy
 1 file changed, 1 insertion(+)
 ~~~
{: .output}


pero Git no ns dejará hacer **push** a GitHub:

~~~
$ git push origin master
~~~
{: .bash}

~~~
To https://github.com/vlad/planets.git
 ! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'https://github.com/vlad/planets.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Merge the remote changes (e.g. 'git pull')
hint: before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
~~~
{: .output}

![The Conflicting Changes](../fig/conflict.svg)

Git detecta que los cambios hechos en una copia se solapan con los cambios hechos en la otra
y nos impide pisotear nuestro trabajo previo.
Lo que debemos hacer es traer -`pull`- los cambios desde GitHub,
[unirlos]({{ page.root }}/reference/#merge) dentro de la copia en la que estamos trabajando actualmente,
y luego hacer  `push` al resultado.
Empecemos haciendo  `pull` a lo siguiente:

~~~
$ git pull origin master
~~~
{: .bash}

~~~
remote: Counting objects: 5, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 1), reused 3 (delta 1)
Unpacking objects: 100% (3/3), done.
From https://github.com/vlad/planets
 * branch            master     -> FETCH_HEAD
Auto-merging mars.txt
CONFLICT (content): Merge conflict in mars.txt
Automatic merge failed; fix conflicts and then commit the result.
~~~
{: .output}

`git pull` nos dice que hay un conflicto,
y marca ese conflicto en el archivo afectado:

~~~
$ cat mars.txt
~~~
{: .bash}

~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
<<<<<<< HEAD
We added a different line in the other copy
=======
This line added to Wolfman's copy
>>>>>>> dabb4c8c450e8475aee9b14b4383acc99f42af1d
~~~
{: .output}

Nuestro cambio —señalado en `HEAD`— es precedido por `<<<<<<<`.
Luego, Git insertó `=======` como un separador entre los cambios conflictivos
y marcó el fin del contenido descargado desde GitHub con `>>>>>>>`.
(El código  de letras y números luego del marcador
identifica el 'commit' que acabamos de descargar.)

Ahora nosotros debemos editar este archivo para eliminar estos marcadores
y reconciliar los cambios.
Podemos hacer lo que querramos: mantener el cambio hecho en el repositorio local, mantener
el cambio hecho en el repositorio nuevo, redactar algo nuevo para reemplazar ambos,
o eliminar el cambio completamente.
Reemplacemos ambos de manera que el archivo quede así:

~~~
$ cat mars.txt
~~~
{: .bash}

~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
We removed the conflict on this line
~~~
{: .output}

Para finalizar la unión,
agregamos `mars.txt` a los cambios hechos por la unión
y luego hacemos 'commit':

~~~
$ git add mars.txt
$ git status
~~~
{: .bash}

~~~
On branch master
All conflicts fixed but you are still merging.
  (use "git commit" to conclude merge)

Changes to be committed:

	modified:   mars.txt

~~~
{: .output}

~~~
$ git commit -m "Merge changes from GitHub"
~~~
{: .bash}

~~~
[master 2abf2b1] Merge changes from GitHub
~~~
{: .output}

Ahora podemos hacer 'push' a nuestros cambios a GitHub:

~~~
$ git push origin master
~~~
{: .bash}

~~~
Counting objects: 10, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 697 bytes, done.
Total 6 (delta 2), reused 0 (delta 0)
To https://github.com/vlad/planets.git
   dabb4c8..2abf2b1  master -> master
~~~
{: .output}

Git lleva el registro de qué hemos unificado con qué,
de manera que no debemos arreglar las cosas a mano nuevamente
cuando el colaborador que hizo el primer cambio hace **pull** de nuevo:

~~~
$ git pull origin master
~~~
{: .bash}

~~~
remote: Counting objects: 10, done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 6 (delta 2), reused 6 (delta 2)
Unpacking objects: 100% (6/6), done.
From https://github.com/vlad/planets
 * branch            master     -> FETCH_HEAD
Updating dabb4c8..2abf2b1
Fast-forward
 mars.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
~~~
{: .output}

Obtenemos el archivo unificado:

~~~
$ cat mars.txt
~~~
{: .bash}

~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
But the Mummy will appreciate the lack of humidity
We removed the conflict on this line
~~~
{: .output}

No es necesario unificar el contenido nuevamente porque Git sabe que alguien ya ha hecho eso.

La habilidad de Git de resolver conflictos es muy útil, pero la resolución de confilctos
cuesta tiempo y esfuerzo, y puede introducir errores si los conflictos no son resueltos
correctamente. Si te encuentras resolviendo muchos conflictos en un proyecto
ten en cuenta estas aproximaciones técnicas para reducirlas:

- Hacer 'pull' con mayor frecuencia, especialmente antes de empezar una nueva tarea
- Usar ramas temáticas para separar trabajo, uniéndolas a la rama principal - `master`- cuando estén completas
- Hacer comentarios mas cortos y concisos
- Cuando sea apropiado, dividir archivos grandes en varios pequeños de manera que sea
  menos probable que dos autores alteren el mismo archivo simultáneamente

Los conflictos también pueden ser minimizados con estrategias de administración de proyectos:

- Aclarar con tus colaboradores quién es responsable de cada área
- Discutir con tus colaboradores en qué orden deben realizarse las tareas para que 
  las tareas que puedan cambiar las mismas lineas no se trabajen simultáneamente. 
- Si los conflictos son de estilo (e.g. tabulaciones vs. espacios), establecer una
  convención que rija el proyecto y utilizar herramientas de estilo de código (e.g.
  `htmltidy`, `perltidy`, `rubocop`, etc.) para forzarlas, si es necesario

> ## Solucionando conflictos creados por ti
>
> Clona el repositorio creado por tu instructor
> Agregarle un nuevo archivo 
> y modificar un archivo existente (tu instructor te dirá cuál).
> Cuando tu instructor te lo pida, 
> trae los cambios -haciendo 'pull'- desde el repositorio para crear un conflicto,
> y luego resuélvelo.
{: .challenge}

> ## Conflictos en archivos no textuales
>
> ¿Qué hace Git 
> cuando hay un conflicto en una imagen u otro archivo no de texto 
> que está almacenado con control de versiones?
>
> > ## Solución
> >
> > Intentémoslo. Supón que **Dracula** toma una foto de la superficie de Marte y la llama `mars.jpg`.
> >
> > Si no tienes una imagen de Marte, puedes crear un archivo
> > binario de prueba de la siguiente manera:
> >
> > ~~~
> > $ head --bytes 1024 /dev/urandom > mars.jpg
> > $ ls -lh mars.jpg
> > ~~~
> > {: .bash}
> >
> > ~~~
> > -rw-r--r-- 1 vlad 57095 1.0K Mar  8 20:24 mars.jpg
> > ~~~
> > {: .output}
> >
> > `ls` nos muestra que se creó un archivo de 1-kilobyte. Está lleno de bytes al azar
> > leídos a partir del archivo especial, `/dev/urandom`.
> >
> > Ahora, supón que **Dracula** agrega `mars.jpg` a su repositorio:
> >
> > ~~~
> > $ git add mars.jpg
> > $ git commit -m "Add picture of Martian surface"
> > ~~~
> > {: .bash}
> >
> > ~~~
> > [master 8e4115c] Add picture of Martian surface
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  create mode 100644 mars.jpg
> > ~~~
> > {: .output}
> >
> > Supón que Wolfman agregó una imagen similar al mismo tiempo. 
> > La suya es una imagen del cielo de Marte, pero *también* se llama `mars.jpg`.
> > Cuando **Dracula** intenta hacer push, recibe un mensaje familiar:
> >
> > ~~~
> > $ git push origin master
> > ~~~
> > {: .bash}
> >
> > ~~~
> > To https://github.com/vlad/planets.git
> >  ! [rejected]        master -> master (fetch first)
> > error: failed to push some refs to 'https://github.com/vlad/planets.git'
> > hint: Updates were rejected because the remote contains work that you do
> > hint: not have locally. This is usually caused by another repository pushing
> > hint: to the same ref. You may want to first integrate the remote changes
> > hint: (e.g., 'git pull ...') before pushing again.
> > hint: See the 'Note about fast-forwards' in 'git push --help' for details.
> > ~~~
> > {: .output}
> >
> > Hemos aprendido que primero debemos hacer **pull** y resolver conflictos:
> >
> > ~~~
> > $ git pull origin master
> > ~~~
> > {: .bash}
> >
> > Cuando hay un conflicto en una imagen u otro archivo binario, git imprime
> > un mensaje así:
> >
> > ~~~
> > $ git pull origin master
> > remote: Counting objects: 3, done.
> > remote: Compressing objects: 100% (3/3), done.
> > remote: Total 3 (delta 0), reused 0 (delta 0)
> > Unpacking objects: 100% (3/3), done.
> > From https://github.com/vlad/planets.git
> >  * branch            master     -> FETCH_HEAD
> >    6a67967..439dc8c  master     -> origin/master
> > warning: Cannot merge binary files: mars.jpg (HEAD vs. 439dc8c08869c342438f6dc4a2b615b05b93c76e)
> > Auto-merging mars.jpg
> > CONFLICT (add/add): Merge conflict in mars.jpg
> > Automatic merge failed; fix conflicts and then commit the result.
> > ~~~
> > {: .output}
> >
> > El mensaje informando el conflicto es básicamente el mismo que se imprimió para `mars.txt`, pero
> > hay una línea adicional:
> >
> > ~~~
> > warning: Cannot merge binary files: mars.jpg (HEAD vs. 439dc8c08869c342438f6dc4a2b615b05b93c76e)

> > ~~~
> >
> > Git no puede insertar indicadores de conflicto en una imagen como sí lo hace en los
> > archivos de texto. Por lo tanto, en vez de editar la imagen, debemos revisar la versión que 
> > queremos mantener. Luego podemos agregar y hacer **commit** a esta versión.
> >
> > En la línea agregada de arriba, Git convenientemente nos dió identificadores de **commit**
> > para las dos versiones de `mars.jpg`. Nuestra version es  `HEAD`, y la de Wolfman
> > es `439dc8c0...`. Si queremos usar nuestra versión, podemos usar
> > `git checkout`:
> >
> > ~~~
> > $ git checkout HEAD mars.jpg
> > $ git add mars.jpg
> > $ git commit -m "Use image of surface instead of sky"
> > ~~~
> > {: .bash}
> >
> > ~~~
> > [master 21032c3] Use image of surface instead of sky
> > ~~~
> > {: .output}
> >
> > En cambio si queremos usar la versión de Wolfman, podemos usar `git checkout` con
> > el identificador de **commit** de Wolfman, `439dc8c0`:
> >
> > ~~~
> > $ git checkout 439dc8c0 mars.jpg
> > $ git add mars.jpg
> > $ git commit -m "Use image of sky instead of surface"
> > ~~~
> > {: .bash}
> >
> > ~~~
> > [master da21b34] Use image of sky instead of surface
> > ~~~
> > {: .output}
> >
> > También podemos mantener *ambas* imágenes. La clave es que no podemos mantenerlos con el mismo
> > nombre. Pero podemos mirar cada versión de forma sucesiva y *renombrarla*, y luego agregar las versiones renombradas.
> > Primero, revisar cada imagen y renombrarla:
> >
> > ~~~
> > $ git checkout HEAD mars.jpg
> > $ git mv mars.jpg mars-surface.jpg
> > $ git checkout 439dc8c0 mars.jpg
> > $ mv mars.jpg mars-sky.jpg
> > ~~~
> > {: .bash}
> >
> > Luego, eliminar la vieja imagen `mars.jpg` y agregar los dos archivos nuevos:
> >
> > ~~~
> > $ git rm mars.jpg
> > $ git add mars-surface.jpg
> > $ git add mars-sky.jpg
> > $ git commit -m "Use two images: surface and sky"
> > ~~~
> > {: .bash}
> >
> > ~~~
> > [master 94ae08c] Use two images: surface and sky
> >  2 files changed, 0 insertions(+), 0 deletions(-)
> >  create mode 100644 mars-sky.jpg
> >  rename mars.jpg => mars-surface.jpg (100%)
> > ~~~
> > {: .output}
> >
> > Ahora ambas imágenes de Marte estan ingresadas en el repositorio, y `mars.jpg`
> > ya no existe.
> {: .solution}
{: .challenge}
>
> ## Una típica sesión de trabajo
>
> Te sientas en tu computadora para trabajar en un proyecto compartido que es mantenido en un
> repositorio Git remoto. Durante tu sesión de trabajo, realizas las siguientes acciones, 
> pero no en éste orden:
>
>
> - *Hacer cambios* agregando el número `100` al archivo de texto `numbers.txt`
> - *Actualizar repositorio remoto* para actualizar el repositorio local
> - *Celebrar* tu éxito con cerveza(s)
> - *Actualizar repositorio local* para actualizar el repositorio remoto
> - *Realizar cambios* con los cuales voy a hacer commit
> - *Hacer commit a los cambios* al repositorio local
>
> ¿En qué orden deberías hacer estas acciones para minimizar la posibilidad de conflictos?
> Pon los comandos de arriba en orden en la columna *acción* de la tabla de abajo.
> Cuando tengas el orden correcto, ve si puedes escribir los comandos correspondientes en la columna 
> *comando*. Algunos campos ya están completados para ayudarte a 
> comenzar.
>
> |orden|acción . . . . . . . . . . |comando . . . . . . . . . . |
> |-----|---------------------------|----------------------------|
> |1    |                           |                            |
> |2    |                           | `echo 100 >> numbers.txt`  |
> |3    |                           |                            |
> |4    |                           |                            |
> |5    |                           |                            |
> |6    | ¡Celebrar!                | `AFK`                      |
>
> > ## Solución
> >
> > |orden|acción . . . . . . . . . . |comando . . . . . . . . . . |
> > |-----|-------------------|----------------------------------------------|
> > |1    | Actualizar repositorio local      | `git pull origin master`                     |
> > |2    | Hacer cambios      | `echo 100 >> numbers.txt`                    |
> > |3    | Realizar cambios     | `git add numbers.txt`                        |
> > |4    | Hacer commit a los cambios   | `git commit -m "Agregar 100 a numbers.txt"`     |
> > |5    | Actualizar repositorio remoto     | `git push origin master`                     |
> > |6    | ¡Celebrar!        | `AFK`                                        |
> >
>
>
> {: .solution}
{: .challenge}
