---
título: Hospedaje
enseñanza: 10
ejercicios: 0
preguntas:
- "¿Dónde debería alojar mis repositorios de control de versiones?"
objetivos:
- "Explicar diferentes opciones para realizar trabajos científicos."
puntos clave:
- "Los proyectos pueden alojarse en servidores de la universidad, en dominios personales o públicas."
- "Las reglas con respecto a la propiedad intelectual y el almacenamiento de información confidencial se aplican sin importar dónde se alojan el código y los datos."
---

La segunda gran pregunta para los grupos que quieren liberar su trabajo es dónde
hospedar su código y datos. Una opción es que el laboratorio, departamento o la
universidad provean un servidor, gestionen cuentas y respaldos, etc. El principal
beneficio de esto es que clarifica quién es dueño de qué, lo cual es particularmente
importante si algún material es sensible (es decir, se relaciona a experimentos
que involucran sujetos humanos o pueden ser usados en una patente). Las principales
desventajas son el costo de proveer el servicio y su longevidad: un científico
que ha pasado diez años colectando datos quisiera asegurarse de que estos estarán
disponibles en diez años más, pero eso está más allá del tiempo de vida de muchos 
de los subsidios que financían la infraestructura académica.

Otra opción es comprar un dominio y pagar a un Proveedor de Servicios de Internet
(ISP por sus siglas en inglés) para hospedarlo. Esto da al individuo o grupo mayor
control, y le da la vuelta a problemas que pueden surgir cuando se cambien de una 
institución a otra, pero requiere más tiempo y esfuerzo para configurar que la
opcion anterior o siguiente.

La tercera opción es utilizar un servicio de hospedaje público como
[GitHub](http://github.com), [GitLab](http://gitlab.com),
[BitBucket](http://bitbucket.org) o [SourceForge](http://sourceforge.net).
Cada uno de estos servicios proveé una interfaz web que permite a las personas
crear, ver y editar sus repositorios de código. Estos servicios también proveen 
herramientas de comunicación y gestión de proyectos que incluyen `issue tracking`,
páginas wiki, notificaciones de correo electrónico y revisiones de código. Estos
servicios se benefician de economías de escalamiento y efectos de redes: es más
fácil correr un servicio grande bien que correr varios pequeños servicios al
mismo estándar. También es más fácil para la gente colaborar. Usando un servicio 
popular puede ayudar a conectar tu proyecto con una comunidad que ya está usando el
mismo servicio.

Como un ejemplo, Software Carpentry [está en 
GitHub]({{ swc_github }}), donde puedes encontrar el [código fuente para esta
página]({{page.root}}/_episodes/13-hosting.md).
Cualquiera con una cuenta de GitHub puede sugerir cambios a este texto.

Usando servicios grandes y bien establecidos puede también ayudarte a tomar
ventaja rápidamente de herramientas poderosas tales como la Integración 
Continua (CI por sus siglas en inglés). CI puede correr `builds` y tests de 
software automáticamente cada vez que se hace un `commit` o se somete un 
`pull request`. La integración directa de CI con un servicio de hospedaje en 
línea significa que esta información está presente en cualquier `pull request`
y ayudar a mantener la integridad y estándares de calidad del código. Si bien
CI está disponible en situaciones de auto-hospedaje, hay menos configuración y
mantenimiento al usar un servicio en línea. Más aún, estas herramientas son 
proporcionadas sin costo alguno para proyectos de código abierto y están también
disponibles para repositorios privados por una cuota.

> ## Barreras Institucionales
>
> Compartir es el ideal de la ciencia,
> pero muchas instituciones imponen restricciones al compartir,
> por ejemplo para proteger propiedad intelectual potencialmente patentable.
> Si encuentras tales restricciones,
> pudiera ser productivo indagar acerca de las motivaciones
> ya sea para solicitar una excepción para un proyecto específico o dominio,
> o para impulsar una reforma institucional más amplia para el apoyo de la ciencia abierta.
{: .callout}

> ## ¿Mi Trabajo Puede Ser Público?
>
> Averigua si tienes permitido hospedar tu trabajo abiertamente en un repositorio público.
> ¿Puedes hacer esto unilateralmente,
> o necesitas permiso de alguien en tu institución?
> Si ese es el caso, ¿de quién?
{: .challenge}

> ## ¿Dónde Puedo Compartir Mi Trabajo?
>
> ¿Tu institución tiene un repositorio(s) donde puedas compartir tus 
> artículos, datos y software? ¿Cómo los repositorios institucionales
> difieren de servicios como [arXiV](http://arxiv.org/), [figshare](http://figshare.com/) y [GitHub](http://github.com/)?
{: .challenge}
