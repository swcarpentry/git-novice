---
layout: page
title: Discussion
permalink: /discuss/
---

## Preguntas frecuentes

La gente a menudo tiene preguntas sobre Git más allá del alcance del material central.
Los estudiantes que han completado el resto de las lecciones pueden encontrar valor al examinar los siguientes temas.

Tenga en cuenta que dado que este material no es esencial para el uso básico de Git, no será cubierto por el instructor.

## Más configuración avanzada de Git

En [Configuración de Git]({{page.root}}/02-setup/),
usamos `git config --global` para establecer algunas opciones predeterminadas para Git.
Resulta que estas opciones de configuración se almacenan en su directorio de inicio
en un archivo de texto sin formato llamado `.gitconfig`.

~~~
$ cat ~/.gitconfig
~~~
{: .bash}

~~~
[user]
	name = Vlad Dracula
	email = vlad@tran.sylvan.ia
[color]
	ui = true
[core]
	editor = nano
~~~
{: .output}

Este archivo se puede abrir en su editor de texto preferido.
(Tenga en cuenta que se recomienda continuar usando el comando `git config`,
ya que esto ayuda a evitar la introducción de errores de sintaxis).

Eventualmente, querrás comenzar a personalizar el comportamiento de Git.
Esto se puede hacer agregando más entradas a su `.gitconfig`.
Las opciones disponibles se describen en el manual:

~~~
$ git config --help
~~~
{: .bash}

En particular, puede resultarle útil agregar alias.
Estos son como accesos directos para comandos de git más largos.
Por ejemplo, si te cansas de escribir `git checkout` todo el tiempo,
podrías ejecutar el comando:

~~~
$ git config --global alias.co checkout
~~~
{: .bash}

Ahora, si volvemos al ejemplo de [Explorando el historial]({{ page.root }}/05-history/) where we ran:

~~~
$ git checkout f22b25e mars.txt
~~~
{: .bash}

ahora podríamos escribir:

~~~
$ git co f22b25e mars.txt
~~~
{: .bash}

## Diseñando el registro de Git

Un buen objetivo para la personalización sale del registro.
El registro predeterminado es bastante detallado pero no da pistas gráficas
como información sobre qué confirmaciones se realizaron localmente
y que fueron sacados de controles remotos.

Puede usar `git log --help` y` git config --help` para buscar diferentes formas de cambiar
la salida de registro.
Pruebe los siguientes comandos y vea qué efecto tienen:

~~~
$ git config --global alias.lg "log --graph"
$ git config --global log.abbrevCommit true
$ git config --global format.pretty oneline
$ git lg
~~~
{: .bash}

Si no te gustan los efectos,
puedes deshacerlos con:

~~~
$ git config --global --unset alias.lg
$ git config --global --unset log.abbrevCommit
$ git config --global --unset format.pretty
~~~
{: .bash}

> ## Deshacer cambios en la configuración de Git
>
> Puede usar el indicador `--unset` para eliminar las opciones no deseadas de` .gitconfig`.
> Otra forma de deshacer los cambios es almacenar su `.gitconfig` usando Git.
>
> Para sugerencias sobre lo que puede querer configurar,
> vaya a GitHub y busque "gitconfig".
> Encontrará cientos de repositorios en los que las personas han almacenado
> sus propios archivos de configuración de Git.
> Ordenarlos por el número de estrellas y echar un vistazo a los mejores.
> Si encuentras alguno que te guste,
> compruebe que estén cubiertos por una licencia de código abierto antes de clonarlos.
{: .callout}

## Archivos sin texto

Recordar cuando discutimos [Conflictos]({{page.root}}/09-conflict/)
hubo un desafío que preguntó,
"¿Qué hace Git?
cuando hay un conflicto en una imagen o algún otro archivo no textual
que está almacenado en el control de la versión?"

Ahora revisitaremos esto con más detalle.

Muchas personas desean controlar versiones que no sean archivos de texto, como imágenes, archivos PDF y documentos de Microsoft Office o LibreOffice.
Es cierto que Git puede manejar estos tipos de archivos (que caen bajo el título de tipos de archivos "binarios").
Sin embargo, solo porque *se puede* hacer no significa que *se deba* hacer.

Gran parte de la magia de Git proviene de poder hacer comparaciones línea por línea ("diffs") entre archivos.
Esto es generalmente fácil para programar el código fuente y el texto marcado.
Para archivos que no son de texto, un diff generalmente solo puede detectar que los archivos han cambiado
pero no puedo decir cómo o dónde.

Esto tiene varios impactos en el rendimiento de Git y hará que sea difícil
compare diferentes versiones de su proyecto.

Para un ejemplo básico para mostrar la diferencia que hace,
vamos a ver qué hubiera pasado si Drácula hubiera intentado
utilizando salidas de un procesador de texto en lugar de texto sin formato.

Crea un nuevo directorio y entra en él:

~~~
$ mkdir planets-nontext
$ cd planets-nontext
~~~
{: .bash}

Use un programa como Microsoft Word o LibreOffice Writer para crear un documento nuevo.
Ingrese el mismo texto con el que comenzamos antes:

~~~
Cold and dry, but everything is my favorite color
~~~
{: .output}

Guarde el documento en el directorio `planets-nontext` con el nombre de `mars.doc`.
De vuelta en la terminal, ejecute los comandos habituales para configurar un nuevo repositorio de Git:

~~~
$ git init
$ git add mars.doc
$ git commit -m "Starting to think about Mars"
~~~
{: .bash}

Luego haga los mismos cambios a `mars.doc` que nosotros (o Vlad) previamente hicimos a `mars.txt`.

~~~
Cold and dry, but everything is my favorite color
The two moons may be a problem for Wolfman
~~~
{: .output}

Guarde y cierre el procesador de texto.
Ahora mira lo que Git piensa de tus cambios:

~~~
$ git diff
~~~
{: .bash}

~~~
diff --git a/mars.doc b/mars.doc
index 53a66fd..6e988e9 100644
Binary files a/mars.doc and b/mars.doc differ
~~~
{: .output}

Compare esto con el anterior `git diff` obtenido al usar archivos de texto:

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

Observe cómo los archivos de texto plano dan una diferencia mucho más informativa.
Puede ver exactamente qué líneas cambiaron y cuáles fueron los cambios.

Un `git diff` no informativo no es la única consecuencia de usar Git en archivos binarios.
Sin embargo, la mayoría de los otros problemas se reducen a si es posible o no una buena diferencia.

Esto no quiere decir que *nunca* debes usar Git en archivos binarios.
Una regla de oro es que está bien si el archivo binario no cambiará muy a menudo,
y si cambia, no te importa fusionarte en pequeñas diferencias entre versiones.

Ya hemos visto cómo un informe procesado por palabra no pasará esta prueba.
Un ejemplo que pasa la prueba es un logotipo para su organización o proyecto.
Aunque un logotipo se almacenará en un formato binario, como `jpg` o `png`,
puede esperar que permanezca bastante estático durante la vida útil de su repositorio.
En la rara ocasión en que la marca cambia,
probablemente solo quiera reemplazar el logotipo por completo en lugar de combinar pequeñas diferencias.

## Eliminar un archivo

Agregar y modificar archivos no son las únicas acciones que uno podría tomar
cuando se trabaja en un proyecto. Puede ser necesario para eliminar un archivo
del repositorio.

Crea un nuevo archivo para el planeta Nibiru:

~~~
$ echo "This is another name for fake planet X" > nibiru.txt
~~~
{: .bash}

Ahora agregue al repositorio como lo aprendió anteriormente:

~~~
$ git add nibiru.txt
$ git commit -m 'adding info on nibiru'
$ git status
~~~
{: .bash}

~~~
On branch master
nothing to commit, working directory clean
~~~
{: .output}

Nibiru no es un planeta real. Esa fue una idea tonta. Vamos a eliminar
desde el disco y deja que Git lo sepa:

~~~
$ git rm nibiru.txt
$ git status
~~~
{: .bash}

~~~
On branch master
Changes to be committed:
   (use "git reset HEAD <file>..." to unstage)

   deleted:    nibiru.txt

~~~
{: .output}

El cambio ha sido organizado. Ahora comprometa la eliminación y elimine
archivo del propio repositorio. Tenga en cuenta que el archivo se eliminará
en el nuevo compromiso La confirmación anterior seguirá
tener el archivo, si fueras a recuperar esa confirmación específica.

~~~
$ git commit -m 'Removing info on Nibiru.  It is not a real planet!'
~~~
{: .bash}

## Eliminar un archivo con Unix

A veces podríamos olvidar eliminar el archivo a través de Git. Si eliminaste el
archivo con Unix `rm` en lugar de usar` git rm`, sin preocupaciones,
Git es lo suficientemente inteligente como para notar el archivo perdido. Vamos a recrear el archivo y
cometerlo de nuevo.

~~~
$ echo "This is another name for fake planet X" > nibiru.txt
$ git add nibiru.txt
$ git commit -m 'adding nibiru again'
~~~
{: .bash}

Ahora eliminamos el archivo con Unix `rm`:

~~~
$ rm nibiru.txt
$ git status
~~~
{: .bash}

~~~
On branch master
Changes not staged for commit:
   (use "git add/rm <file>..." to update what will be committed)
   (use "git checkout -- <file>..." to discard changes in working directory)

    deleted:    nibiru.txt

no changes added to commit (use "git add" and/or "git commit -a")
~~~
{: .output}

Vea cómo Git ha notado que el archivo `nibiru.txt` ha sido eliminado
del disco. El siguiente paso es "escenificar" la eliminación del archivo
del repositorio. Esto se hace con el comando `git rm` igual que
antes de.

~~~
$ git rm nibiru.txt
$ git status
~~~
{: .bash}

~~~
On branch master
Changes to be committed:
   (use "git reset HEAD <file>..." to unstage)

   deleted:    nibiru.txt

~~~
{: .output}

El cambio que se hizo en Unix ahora se ha organizado y debe ser
comprometido.

~~~
$ git commit -m 'Removing info on Nibiru, again!'
~~~
{: .bash}

## Renombrar un archivo

Otro cambio común cuando se trabaja en un proyecto es cambiar el nombre de un archivo.

Crea un archivo para el planeta Krypton:

~~~
$ echo "Superman's home planet" > krypton.txt
~~~
{: .bash}

Añádalo al repositorio:

~~~
$ git add krypton.txt
$ git commit -m 'Adding planet Krypton'
~~~
{: .bash}

Todos sabemos que Superman se mudó a la Tierra. No es que tuviera mucho
elección. Ahora su planeta de origen es la Tierra.

Cambie el nombre del archivo `krypton.txt` a` earth.txt` con Git:

~~~
$ git mv krypton.txt earth.txt
$ git status
~~~
{: .bash}

~~~
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#	renamed:    krypton.txt -> earth.txt
#
~~~
{: .output}

El último paso es comprometer nuestro cambio al repositorio:

~~~
$ git commit -m 'Superman's home is now Earth'
~~~
{: .bash}

## Renombrar un archivo con Unix

Si olvidó usar Git y usó Unix `mv` en su lugar
de `git mv`, tendrás un poco más de trabajo que hacer, pero Git lo hará
ser capaz de lidiar con eso. Intentemos nuevamente cambiar el nombre del archivo,
esta vez con Unix `mv`. Primero, necesitamos recrear el
archivo `krypton.txt`:

~~~
$ echo "Superman's home planet" > krypton.txt
$ git add krypton.txt
$ git commit -m 'Adding planet Krypton again.'
~~~
{: .bash}

Vamos a renombrar el archivo y ver lo que Git puede descifrar por sí mismo:
~~~
$ mv krypton.txt earth.txt
$ git status
~~~
{: .bash}

~~~
On branch master
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        deleted:    krypton.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    earth.txt

no changes added to commit (use "git add" and/or "git commit -a")
~~~
{: .output}

Git notó que el archivo `krypton.txt` ha desaparecido del
sistema de archivos y un nuevo archivo `earth.txt` ha aparecido.

Agregue esos cambios al área de ensayo:

~~~
$ git add krypton.txt earth.txt
$ git status
~~~
{: .bash}

~~~
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    renamed:    krypton.txt -> earth.txt

~~~
{: .output}

Observe cómo Git ahora ha descubierto que el `krypton.txt` no tiene
desapareció simplemente ha sido renombrado.

El último paso, como antes, es comprometer nuestro cambio al repositorio:

~~~
$ git commit -m 'Superman's home is Earth, told you before.'
~~~
{: .bash}
	
