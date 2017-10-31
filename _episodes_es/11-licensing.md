---
título: Licencia
enseñanza: 5
ejercicios: 0
preguntas:
- "¿Qué información sobre licencias debería incluir en mi trabajo?"
objetivos:
- "Explicar la importancia de agregar información de licencias a nuestro trabajo."
- "Escoger la licencia apropiada."
- "Explicar las diferencias en licencias y algunas expectativas sociales."
palabras clave:
- "Las personas que usan la licencia **GPL** en su software tienen que asegurarse de que toda la estructura esté bajo ésta licencia; muchas otras licencias no requieren esto."
- La familia de licencias **Creative Commons** permite a las personas adaptarse a varios requerimientos y restricciones de atribución, la creación de trabajo derivado, compartir el trabajo, y comercialización."
- "Personas sin conocimientos de leyes no deberían tratar de escribir nuevas licencias desde cero."
---

Cuando un repositorio público contiene código fuente, un manuscrito u otro trabajo creativo, éste debe incluir un archivo con el nombre `LICENCIA` o `LICENCIA.txt` en el directorio base del repositorio, que indique claramente bajo que licencia se pone a  disposición el contenido. Esto se debe, a que se aplica automáticamente a las obras creativas la protección de propiedad intelectual (y por lo tanto derechos de autor). La reutilización de trabajos creativos sin licencia es peligrosa, ya que los titulares de los derechos de autor podrían realiza una demanda por infringir la misma.

Una licencia resuelve el problema otorgando derechos a otros (los licenciatarios) que de otro modo no tendrían. ¿Qué derechos se otorgan bajo qué condiciones difieren, a menudo de forma leve, de una licencia a otra? En la práctica, algunas licencias son las más populares, y [choosealicense.com](http://choosealicense.com/) te ayudará a encontrar una licencia que se adapte a tus necesidades. Las consideraciones importantes incluyen:

* Si deseas abordar los derechos de patente.
* Si necesitas personas que distribuyan los trabajos derivados de tu código fuente.
* Si el contenido que estás otorgando es la licencia del código fuente.
* Si deseas licenciar todo el código.

Elegir una licencia que sea de uso común hace la vida más fácil para los contribuyentes y los usuarios, porque es probable que ya estén familiarizados con la licencia y no tengan que sortear una jerga específica para decidir si está bien.
La [Iniciativa Open Source](http://opensource.org/licenses) y [Free Software Foundation](http://www.gnu.org/licenses/license-list.html) mantienen listas de licencias que pueden ser buenas elecciones.

[Este artículo] [licencia de software] proporciona una excelente descripción de licencias y de opciones de licencias desde la perspectiva de los científicos que escriben código.

Al final del día lo que importa es que haya un informe claro sobre cuál es la licencia. Es mejor elegir la licencia desde el principio, incluso si se trata de un repositorio que no es público. Retrasar la decisión de elección, solo hace más complicado en adelante, porque cada vez que un nuevo colaborador comienza a contribuir, ellos también tienen derechos de autor y, por lo tanto, se les debe pedir aprobación una vez que se elige una licencia.

> ## ¿Puedes usar **Open License**?
>
> Investiga si puedes usar una **Open license** o "Licencia Abierta" en tu **software**. ¿Puedes hacer eso por tí mismo?, ¿o necesitas permiso de alguien dentro de tu institución? Si necesitas permiso, ¿de quién?


> ## ¿Qué licencias ya he aceptado?
>
> Muchas herramientas de **software** que usamos día a día (incluyento las herramientas en este **workshop**) son
> **open-source software**. Escoge uno de los proyectos de GitHub de la lista de abajo, o algún otro que te interese. Encuentra la licencia (usualmente es un archivo que se llama `LICENSE` o `COPYING`) y luego habla con tus compañeros sobre como ésta licencia te permite o te restringe el uso del **software**. ¿Es una de las licencias que hemos visto en esta sesión? ¿Qué tan diferente es ésta licencia?
> - [Git](https://github.com/git/git), herramientas para el manejo de código fuente.
> - [CPython](https://github.com/python/cpython), implementación estándar del lenguaje Python.
> - [Jupyter](https://github.com/jupyter), proyectos web en Python para **notebooks**.
> - [EtherPad](https://github.com/ether/etherpad-lite), un editor colaborativo en tiempo real.

[licencia de software]: http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1002598
