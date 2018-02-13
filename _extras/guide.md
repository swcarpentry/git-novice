---
layout: page
title: "Instructor Notes"
permalink: /guide/
---

Usar una herramienta de software para manejar las versiones de tus archivos de proyecto
le permite enfocarse en los aspectos más interesantes / innovadores de su proyecto.

* Ventajas del control de versiones
    * Es fácil de configurar
    * Cada copia de un repositorio de Git es una copia de seguridad completa de un proyecto y su historial
    * Unos pocos comandos fáciles de recordar son todo lo que necesita para la mayoría de las tareas cotidianas de control de versiones
    * El servicio de alojamiento [GitHub][github] proporciona un servicio de colaboración basado en la web
* Dos conceptos principales
    * * commit *: un conjunto de cambios registrados en los archivos de su proyecto
    * * repositorio *: el historial de todas las confirmaciones de su proyecto
* ¿Por qué usar GitHub?
    * No es necesario un servidor: fácil de configurar
    * Comunidad fuerte de GitHub: tus colegas probablemente ya estén allí

## En general

El control de versiones podría ser el tema más importante que enseñamos, pero Git es
Definitivamente la herramienta más complicada. Sin embargo, GitHub actualmente domina el
abrir el panorama del repositorio de software, por lo que el tiempo y el esfuerzo necesarios para enseñar
Git fundamental está justificado y vale la pena.

Debido a esta complejidad, no enseñamos a los principiantes acerca de muchos
temas interesantes, como ramificación, hash y commit de objetos.

En cambio, tratamos de convencerlos de que el control de versiones es útil para los investigadores
trabajando en equipo o no, porque es

* una mejor forma de "deshacer" cambios,
* una mejor manera de colaborar que enviar y recibir archivos por correo, y
* una mejor manera de compartir tu código y otro trabajo científico con el mundo.

## Notas de enseñanza

* Recursos para "dividir" su caparazón para que los comandos recientes permanezcan a la vista: https://github.com/rgaiacs/swc-shell-split-window.

* Asegúrese de que la red esté funcionando *antes* de comenzar esta lección.

* Los dibujos son particularmente útiles en esta lección: si tiene una pizarra blanca,
    [usarlo][dibujos]!

* El control de versiones generalmente no es el primer tema en un taller,
    así que haga que los alumnos creen una cuenta de GitHub después de la sesión anterior.
    Recuerde a los alumnos que el nombre de usuario y el correo electrónico que usan para GitHub (y configuración
    durante la configuración de Git) será visible para el público de manera predeterminada.
    Sin embargo, hay muchas razones por las cuales un alumno puede no querer su personal
    información visible, y GitHub tiene [recursos para mantener una dirección de correo electrónico
    privado][github-privacy].

* Si algunos estudiantes usan Windows, inevitablemente habrá problemas
    fusionando archivos con diferentes finales de línea. (Incluso si todos están encendidos
    un poco de sabor de Unix, diferentes editores pueden o no agregar una
    nueva línea a la última línea de un archivo.) Tómese un momento para explicar
    estos problemas, ya que los estudiantes seguramente tropezarán con ellos
    de nuevo. Si los estudiantes se están encontrando con problemas para terminar la línea, GitHub
    tiene una [página][github-line-endings] que ayuda a solucionar problemas.

* No usamos una GUI de Git en estas notas porque no hemos encontrado una que
    se instala fácilmente y funciona confiablemente en los tres principales sistemas operativos, y
    porque queremos que los alumnos entiendan qué comandos se están ejecutando. Ese
    dijo, los instructores deberían demo una GUI en su escritorio en algún momento durante
    esta lección y apunte a los alumnos en [esta página][github-gui].

* Los instructores deben mostrar a los alumnos herramientas gráficas de fusión / fusión como
    [DiffMerge][diffmerge].

* Cuando sea apropiado, explique que enseñamos a Git en lugar de CVS, Subversion, o
    Mercurial principalmente debido a la creciente popularidad de GitHub: CVS y
    Subversion ahora se ve como sistemas heredados, y Mercurial no es tan
    ampliamente utilizado en las ciencias en este momento.

* Recursos adicionales:
    * [git-it][git-it] es una demostración de Git de línea de comandos a tu propio ritmo,
         con [git-it-electron][git-it-electron] su sucesor de GitHub Desktop.
    * [Code School][code-school] tiene un curso interactivo gratuito, [Try Git][try-git].
    * para instructores, [la parábola de Git][git-parábola] es una lectura de fondo útil

## [Control automatizado de versiones]({{page.root}}/01-basics/)

* Pregunte, "¿Quién usa 'deshacer' en su editor?" Todos dicen "Yo". 'Deshacer' es el más simple
    forma de control de versiones.

* Ofrezca a los alumnos una visión general de cinco minutos de lo que el control de versión les hace
    antes de zambullirte en las prácticas de vigilancia. La mayoría de ellos tendrá
    intentó coautar documentos enviando archivos por correo electrónico, o tendrá
    en bicicleta en la oficina solo para darse cuenta de que la llave USB con la última noche
    el trabajo todavía está en la mesa de la cocina. Los instructores también pueden hacer bromas sobre
    directorios con nombres como "versión final", "versión final revisada",
    "versión final con las correcciones del revisor tres", "versión realmente final",
    y, "vamos, realmente tiene que ser la última versión" para motivar la versión
    control como una mejor manera de colaborar y como una mejor manera de respaldar el trabajo.

## [Configuración de Git]({{page.root}}/02-setup/)

* Sugerimos que los instructores y los estudiantes usen `nano` como editor de texto para este
    lecciones porque

    * se ejecuta en los tres principales sistemas operativos,
    * se ejecuta dentro del caparazón (las ventanas de conmutación pueden ser confusas para los estudiantes), y
    * tiene ayuda contextual en la parte inferior de la ventana.

    Señale a los alumnos durante la configuración que pueden y deben usar
    otro editor de texto si ya están familiarizados con él.

* Al configurar Git, tenga muy claro lo que los alumnos deben ingresar: es
    Es común que editen los detalles del instructor (por ejemplo, correo electrónico). Verifique en
    el final usando `git config --list`.

## [Creación de un repositorio]({{page.root}}/03-create/)

* Cuando haces `git status`, los usuarios de Mac pueden ver un archivo` .DS_Store` mostrando como
    sin seguimiento. Este es un archivo que Mac OS crea en cada directorio.

* El desafío "Lugares para crear repositorios" intenta reforzar la idea
    que la carpeta `.git` contiene todo el repositorio de Git y eliminando esta carpeta
    deshace un `git init`. También le da al alumno la manera de solucionar el problema común
    error de poner carpetas no deseadas (como `Escritorio`) bajo control de versión.

    En lugar de eliminar la carpeta `.git` directamente, puede elegir moverla
    primero en un directorio más seguro y eliminarlo de allí:

    ~~~
    $ mv .git temp_git
    $ rm -rf temp_git
    ~~~
    {: .bash}

    El desafío sugiere que es una mala idea crear un repositorio de Git dentro de otro repositorio.
    Para obtener más información sobre este tema, consulte [este número][repos-in-repos].

## [Cambios de seguimiento]({{page.root}}/04-changes/)

* Es importante que los alumnos realicen un ciclo completo de compromiso por sí mismos (hacer
    cambios, `git diff`,` git add`, y `git commit`). El "repositorio de `bio`"
    desafío hace eso.

* Este es un buen momento para mostrar una diferencia con una herramienta gráfica de diferencia. Si tu
    omítalo porque tiene poco tiempo, muéstrelo una vez en GitHub.

* Una cosa puede causar confusión es la recuperación de versiones antiguas. Si, en lugar de
    haciendo `$ git checkout f22b25e mars.txt`, alguien hace `$ git checkout
    f22b25e`, terminan en el estado "HEAD separado" y la confusión abunda.
    Entonces es posible seguir cometiendo, pero cosas como `git push origen
    master` un poco más tarde no dará resultados fácilmente comprensibles. También
    hace que parezca que los commits se pueden perder. Para "arreglar" una "CABEZA separada", simplemente
    `git checkout master`.

* Este es un buen momento para mostrar un registro dentro de una GUI de Git. Si te lo saltas
    porque tienes poco tiempo, muéstralo una vez en GitHub.

## [Ignorando cosas]({{page.root}}/06-ignore/)

Solo recuerda que puedes usar comodines y expresiones regulares para ignorar un
un conjunto particular de archivos en `.gitignore`.

## [Controles remotos en GitHub]({{page.root}}/07-github/)

* Deje en claro que Git y GitHub no son lo mismo: Git es una persona abierta
    herramienta de control de versión fuente, GitHub es una compañía que aloja Git
    repositorios en la web y proporciona una interfaz web para interactuar con repositorios
    ellos hospedan

* Si tus alumnos están lo suficientemente avanzados como para sentirse cómodos con SSH, cuéntales
    pueden usar claves para autenticarse en GitHub en lugar de contraseñas, pero no
    intente configurar esto durante la clase: lleva demasiado tiempo y es una distracción
    de las ideas centrales de la lección.

* Es muy útil dibujar un diagrama que muestre los diferentes repositorios
    involucrado.

## [Collaborating]({{page.root}}/08-collab/)

* Decidir por adelantado si todos los alumnos trabajarán en una compartida
    repositorio, o si van a trabajar en parejas (u otros grupos pequeños) en
    repositorios separados. El primero es más fácil de configurar; el último corre
    más suave.

* El juego de roles entre dos instructores puede ser efectivo cuando se enseña
    secciones de colaboración y conflicto de la lección. Un instructor puede jugar
    el papel del propietario del repositorio, mientras que el segundo instructor puede jugar el
    papel del colaborador. Si es posible, intente usar dos proyectores para
    que se pueden ver las pantallas de los dos instructores. Esto hace para
    una ilustración muy clara para los estudiantes sobre quién hace qué.

* También es efectivo emparejar a los estudiantes durante esta lección y asignar uno
    miembro de la pareja para tomar el papel del propietario y el otro el papel de
    el colaborador En esta configuración, los desafíos pueden incluir preguntar al
    colaborador para hacer un cambio, comprometerlo y enviar el cambio al control remoto
    repositorio para que el propietario pueda recuperarlo y viceversa. los
    el juego de roles entre los instructores puede ser un poco "dramático" en el
    conflictos parte de la lección si los instructores quieren inyectar un poco de humor
    en la habitación.

* Si no tiene dos proyectores, tenga dos instructores al frente del
    habitación. Cada instructor hace su parte de la demostración de colaboración
    en su propia computadora y luego pasa el cable del proyector de un lado a otro
    con el otro instructor cuando es hora de que hagan la otra parte de
    el flujo de trabajo colaborativo. Toma menos de 10 segundos para cada
    cambio, por lo que no interrumpe el flujo de la lección.
    Y, por supuesto, ayuda a dar a cada uno de los instructores un color diferente
    sombrero, o poner notas adhesivas de diferentes colores en sus frentes.

* Si eres el único instructor, la mejor manera de crear es clonar los dos
    repositorios en su escritorio, pero con diferentes nombres, por ejemplo, pretender uno es su
    computadora en el trabajo:

    ~~~
    $ git clone https://github.com/vlad/planets.git planets-at-work
    ~~~
    {: .bash}

* Es muy común que los alumnos escriban mal el alias remoto o la URL remota
    cuando se agrega un control remoto, entonces no pueden 'presionar'. Puedes diagnosticar esto con
    `git remote -v` y comprobando cuidadosamente si hay errores tipográficos.
    - Para arreglar un alias incorrecto, puedes hacer `git remote rename <old><new>`.
    - Para arreglar una URL incorrecta, puedes hacer `git remote set-url <alias><newurl>`.

* Antes de clonar el repositorio, asegúrese de que nadie esté dentro de otro repositorio. los
    La mejor forma de lograr esto es pasar al `Escritorio` antes de la clonación: `cd &&
    cd Desktop`.

* Si ambos repos están en `Desktop`, pídales que clonen a su colaborador
    repo bajo un directorio dado usando un segundo argumento:

    ~~~
    $ git clone https://github.com/vlad/planets.git vlad-planet
    ~~~
    {: .bash}

* El error más común es que los estudiantes "empujan" antes de "tirar". Si ellos
    `pull` después, pueden tener un conflicto.

* Conflictos, a veces extraños, comenzarán a surgir. Mantente apretado: los conflictos son
    siguiente.

## [Conflicts]({{page.root}}/09-conflict/)

* Espere que los alumnos cometan errores. Espere *usted mismo* para cometer errores. Esta
    sucede porque es tarde en la lección y todos están cansados.

* Si eres el único instructor, la mejor forma de crear un conflicto es:

    * Clona tu repositorio en un directorio diferente, pretendiendo que es tu computadora en
        trabajo: `git clone https://github.com/vlad/planets.git planets-at-work`.
    * En la oficina, usted hace un cambio, se compromete y empuja.
    * En su repositorio de la computadora portátil, usted (olvide tirar y) hacer un cambio, comprometerse y
        intenta empujar.
    * `git pull` ahora y muestra el conflicto.

* Los estudiantes generalmente se olvidan de 'agregar' el archivo después de arreglar el conflicto y
    solo (intenta) comprometer. Puedes diagnosticar esto con `git status`.

* Recuerde que puede descartar uno de los dos padres de la combinación:

    * descartar el archivo remoto, `git checkout --ours conflicted_file.txt`
    * descartar el archivo local, `git checkout --the conflictigned_file.txt`

    Aún debe `git add` y` git commit` después de esto. Esto es
    particularmente útil cuando se trabaja con archivos binarios.

## [Ciencia abierta]({{page.root}}/10-open/)

## [Licencias]({{page.root}}/11-licensing/)

Enseñamos sobre licencias porque preguntas sobre quién posee qué o qué puede usar
qué, surgen naturalmente una vez que comenzamos a hablar sobre el uso de servicios públicos como
GitHub para almacenar archivos. Además, la discusión les da a los estudiantes la oportunidad de atrapar
su aliento después de lo que a menudo es un par de horas frustrantes.

## [Citation]({{page.root}}/12-citation/)

## [Alojamiento]({{page.root}}/13-hosting/)

Una preocupación común para los estudiantes es tener su trabajo a disposición del público en
GitHub. Si bien fomentamos la ciencia abierta, a veces los repos privados son
única opción. Siempre es interesante mencionar las opciones para tener
repositorios privados alojados en la web.

[escuela de código]: https://www.codeschool.com/
[diffmerge]: https://sourcegear.com/diffmerge/
[dibujos]: https://marklodato.github.io/visual-git-guide/index-en.html
[git-it]: https://github.com/jlord/git-it
[git-it-electron]: https://github.com/jlord/git-it-electron
[git-parábola]: http://tom.preston-werner.com/2009/05/19/the-git-parable.html
[github]: https://github.com/
[github-gui]: http://git-scm.com/downloads/guis
[github-line-endings]: https://help.github.com/articles/dealing-with-line-endings/#platform-all
[github-privacy]: https://help.github.com/articles/ keeping-your-email-address-private/
[repos-in-repos]: https://github.com/swcarpentry/git-novice/issues/272
[try-git]: https://try.github.io
