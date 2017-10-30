---
título: Repositorios remotos en GitHub
enseñanza: 30
ejercicios: 0
preguntas:
- "¿Cómo puedo compartir is cambios con otros en el web?"
objetivos:
- "Explica qué es un repositorio remoto y porqué es útil."
- "Poner y tomar de un repositorio remoto"
puntos clave:
- "Un repositorio Git local puede ser conectado a uno o más repositorios remotos."
- "Usa el protocolo HTTPS para conectarte a un repositorio remoto hasta que hayas aprendido como hacerlo con SSH."
- "`git push` copia los cambios desde el repositorio local a un repositorio remoto."
- "`git pull` copia los cambios desde un repositorio remoto a un repositorio local."
---

Cuando se trabaja en colaboración con otras personas es cuando el sistema de control de versiones alcanza su pleno potencial. Ya hemos visto la mayor parte de las herramientas que necesitamos para ello, tan sólo nos falta ver cómo copiar los cambios realizados de un repositorio a otro.

Sistemas como Git ya nos permiten mover el trabajo realizado entre dos repositorios cualesquiera. Sin embargo, en la práctica es más sencillo establecer uno de ellos como repositorio central y tenerlo en la red en lugar de tu computadora particular. La mayoría de desarrolladores usan servicios de alojamiento en la red, tales como [GitHub](http://github.com), [BitBucket](http://bitbucket.org) o [GitLab](http://gitlab.com/), para alojar ese repositorio central; en la última sección de esta lección exploraremos los pros y los contras de cada uno de ellos.

Empecemos por compartir con todos los demás los cambios que hemos realizado en nuestro proyecto actual. Para ello, ingresa en tu cuenta de GitHub y haz click en el icono que hay en la esquina superior derecha para crear un nuevo repositorio llamado `planets`:

![Creando un Repositorio en GitHub (Paso 1)](../fig/github-create-repo-01.png)

Dale a tu repositorio el nombre "planets" y haz click en "Create repository":

![Creando un Repositorio en GitHub (Paso 2)](../fig/github-create-repo-02.png)

Tan pronto es creado el repositorio, GitHub muestra una página con una URL y algo de información sobre cómo configurar tu repositorio local.

![Creando un Repositorio en GitHub (Paso 3)](../fig/github-create-repo-03.png)

Esto en realidad ejecuta lo siguiente en los servidores de GitHub:

~~~
$ mkdir planets
$ cd planets
$ git init
~~~
{: .bash}

Nuestro repositorio local contiene nuestro trabajo previo en `mars.txt`, pero el repositorio remoto en GitHub todavía no contiene ningún fichero:

![Repositorio en GitHub recién creado](../fig/git-freshly-made-github-repo.svg)

El siguiente paso es conectar los dos repositorios. Ello se consigue convirtiendo al repositorio en GitHub en un [repositorio remoto]({{ page.root }}/reference/#remote) del repositorio local. La página de inicio del repositorio en GitHub incluye la secuencia de caracteres que necesitamos para identificarlo:

![Dónde encontrar la URL del Repositorio en GitHub](../fig/github-find-repo-string.png)

Haz click en el enlace 'HTTPS' para cambiar el [protocol0]({{ page.root }}/reference/#protocol) de SSH a HTTPS.

> ## HTTPS vs. SSH
>
>Usamos aquí HTTPS porque no necesita ninguna configuración adicional.
>Si en el curso quieres configurar el acceso mediante SSH, que es un poco más seguro,
>puedes seguir cualquiera de los excelentes tutoriales que existen en
>[GitHub](https://help.github.com/articles/generating-ssh-keys), 
>[Atlassian/BitBucket](https://confluence.atlassian.com/display/BITBUCKET/Set+up+SSH+for+Git) y
>[GitLab](https://about.gitlab.com/2014/03/04/add-ssh-key-screencast/)
>(este último con capturas animadas de pantalla).
{: .callout}

![Cambiando la URL del Repositorio en GitHub](../fig/github-change-repo-string.png)

Copia dicha URL desde el navegador, ve al repositorio local `planets` y ejecuta allí este comando:

~~~
$ git remote add origin https://github.com/vlad/planets.git
~~~
{: .bash}

Asegúrate de usar la URL de tu repositorio en lugar de la de Vlad: la única diferencia debería ser tu nombre de usuario en lugar de `vlad`.

Podemos comprobar que el comando ha funcionado bien ejecutando `git remote -v`:

~~~
$ git remote -v
~~~
{: .bash}

~~~
origin   https://github.com/vlad/planets.git (push)
origin   https://github.com/vlad/planets.git (fetch)
~~~
{: .output}

El nombre `origin` es un apodo local para tu repositorio remoto. Se puede usar cualquier otro nombre si se desea, pero `origin` es con mucho la elección más habitual.

Una vez seleccionado el apodo local `origin`, el siguiente comando enviará los cambios realizados en nuestro repositorio local al repositorio en GitHub:

~~~
$ git push origin master
~~~
{: .bash}

~~~
Counting objects: 9, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (9/9), 821 bytes, done.
Total 9 (delta 2), reused 0 (delta 0)
To https://github.com/vlad/planets
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
~~~
{: .output}

> ## Proxy
>
> Si la red a la que estás conectado usa un proxy es posible que tu último
> comando fallara con el siguiente mensaje de error: "Could not resolve hostname".
> Para solucionarlo es necesario informar a Git sobre el proxy:
>
> ~~~
> $ git config --global http.proxy http://user:password@proxy.url
> $ git config --global https.proxy http://user:password@proxy.url
> ~~~
> {: .bash}
>
> Si después te conectas a otra red que no usa un proxy es necesario decirle
> a Git que deshabilite el proxy:
>
> ~~~
> $ git config --global --unset http.proxy
> $ git config --global --unset https.proxy
> ~~~
> {: .bash}
{: .callout}

> ## Gestores de contraseñas
>
> Si tu sistema operativo tiene un gestor de contraseñas configurado, `git push`
> intentará usarlo cuando necesite un nombre de usuario y contraseña. Al menos
> ese es el comportamiento por defecto para Git Bash en Windows.
> Si quieres que haya que introducir el nombre de usuario y contraseña en la terminal,
> en lugar de usar el gestor de contraseñas, hay que ejecutar el siguiente
> comando en la terminal antes de lanzar `git push`:
>
> ~~~
> $ unset SSH_ASKPASS
> ~~~
> {: .bash}
>
> A pesar de lo que se podría deducir por el nombre, [git usa `SSH_ASKPASS`
> para todas las peticiones de credenciales](http://git-scm.com/docs/gitcredentials#_requesting_credentials),
> tanto si se está usando git vía SSH como si se está usando vía https, por lo
> que es posible que quieras deshabilitarlo en ambos casos con `unset SSH_ASKPASS` .
>
> Otra alternativa es añadir `unset SSH_ASKPASS` al final de tu `~/.bashrc` para que
> git use por defecto la terminal para los nombres de usuario y las contraseñas.
{: .callout}

Nuestros repositorios local y remoto se encuentran ahora en el siguiente estado:

![Repositorio en GitHub después del primer envío](../fig/github-repo-after-first-push.svg)

> ## La opción '-u'
>
> En la documentación puedes ver que en ocasiones se usa la opción `-u` con el comando `git push`.
> Esta opción es sinónimo de la opción `--set-upstream-to` para el comando `git branch` y se usa
> para asociar la rama actual con una rama remota, de modo que el comando `git pull`
> pueda usarse sin argumentos. Para hacer esto simplemente ejecuta `git push -u origin master`
> una vez el repositorio remoto haya sido creado.
{: .callout}

También podemos hacer **pull**, es decir, traernos cambios desde el repositorio remoto al repositorio local:

~~~
$ git pull origin master
~~~
{: .bash}

~~~
From https://github.com/vlad/planets
 * branch            master     -> FETCH_HEAD
Already up-to-date.
~~~
{: .output}

En este caso, hacer **pull** no ha tenido ningun efecto porque los dos repositorios están ya sincronizados. Por el contrario, si alguien antes hubiera subido con **push** algunos cambios al repositorio en GitHub, este comando los habría incorporado a nuestro repositorio local.

> ## Interfaz gráfica de GitHub
>
> Navega hasta tu repositorio `planets` en GitHub.
> En la pestaña Code, localiza el texto "XX commits" (donde "XX" es algún número) y haz click en él.
> Mueve el cursor sobre los tres botones que hay a la derecha de cada **commit**, y haz click en ellos.
> ¿Qué información puedes obtener/explorar con estos botones?
> ¿Cómo obtendrías la misma información en la terminal?
>
> > ## Solución
> > El botón más a la izquierda (con el dibujo de un portapapeles) sirve para copiar en el portapapeles el identificador completo del **commit** en cuestión. En la terminal, ```git log``` muestra los identificadores completos de cada **commit**.
> >
> > Haciendo click en el botón de en medio, se pueden ver todos los cambios efectuados con el **commit** en cuestión. Las líneas verdes sombreadas indican adiciones y las rojas eliminaciones. En la terminal se puede ver lo mismo con ```git diff```. En particular, ```git diff ID1..ID2``` donde ID1 y ID2 son identificadores de **commits** (e.g. ```git diff a3bf1e5..041e637```) mostrará las diferencias entre esos dos **commits**.
> >
> > El botón más a la derecha permite ver todos los ficheros que existían en el repositorio en el momento del **commit** en cuestión. Para ver lo mismo en la terminal sería necesario hacer **checkout** del repositorio a ese momento del tiempo. Para ello se ejecutaría ```git checkout ID``` donde ID es el identificador del **commit** que queremos investigar. ¡Si se hace esto hay que acordarse luego de poner el repositorio de nuevo en el estado correcto!
> {: .solution}
{: .challenge}

> ## Fecha y Hora en GitHub
>
> Crea un repositorio remoto en GitHub. Haz **push** de los contenidos de tu repositorio local
> al remoto. Haz cambios en tu repositorio local y haz **push** de dichos cambios.
> Ve al repo recién creado en GitHub y comprueba las fechas y horas, también llamadas
> [timestamps]({{ page.root }}/reference/#timestamp) de los ficheros.  ¿Cómo registra
> GitHub los tiempos, y por qué?
>
> > ## Solución
> > Github muestra los tiempos en formato relativo legible para los humanos (i.e. "22 hours ago" or "three weeks ago"). Sin embargo, si mueves el cursor sobre un **timestamp**, podrás ver el tiempo exacto en el que se realizó el último cambio al fichero.
> {: .solution}
{: .challenge}

> ## Push vs. Commit
>
> En esta lección hemos introducido el comando "git push".
> ¿En qué se diferencia "git push" de "git commit"?
>
> > ## Solución
> > Cuando enviamos cambios con **push**, estamos interaccionando con un repositorio remoto para actualizarlo con los cambios que hemos hecho localmente (a menudo esto supone compartir con otros los cambios realizados). Por el contrario, **commit** únicamente actualiza tu repositorio local.
> {: .solution}
{: .challenge}

> ## Corrigiendo ajustes en el repositorio remoto
>
> Es muy frecuente cometer un error al especificar la URL del repositorio remoto.
> Este ejercicio trata de cómo corregir este tipo de errores.
> Empecemos por añadir un repositorio remoto con una URL inválida:
>
> ~~~
> git remote add broken https://github.com/this/url/is/invalid
> ~~~
> {: .bash}
>
> ¿Obtienes un error al añadir el repositorio remoto? ¿Se te ocurre algún
> comando que hiciera obvio que la URL de tu repositorio remoto no es 
> válida? ¿Se te ocurre cómo corregir la URL? (pista: usa `git remote
> -h`). No olvides vaciar y eliminar este repositorio remoto una vez
> hayas terminado este ejercicio.
>
> > ## Solución
> > No aparece ningún error cuando añadimos el repositorio remoto (añadir un repositorio remoto informa a git sobre dicho repositorio, pero no intenta usarlo todavía). Sí que veremos un error en cuanto intentemos usarlo con ```git push```. El comando ```git remote set-url``` nos permite cambiar la URL del repositorio remoto para corregirla.
> {: .solution}
{: .challenge}

> ## Licencia GitHub y ficheros README
>
> En esta sección hemos aprendido cómo crear un repositorio remoto en GitHub, pero cuando lo hicimos
> no añadimos ningún fichero README.md ni ningún fichero de licencia. Si lo hubiéramos hecho, ¿qué crees que hubiera sucedido cuando
> intentaste enlazar tus repositorios local y remoto?
>
> > ## Solución
> > En este caso, puesto que ya teníamos un fichero README en nuestro propio repositorio (local), habríamos visto un conficto de unión, conocido como **merge conflict** (que es cuando git se da cuenta de que hay dos versiones de un mismo fichero y nos pide que resolvamos las diferencias).
> {: .solution}
{: .challenge}
