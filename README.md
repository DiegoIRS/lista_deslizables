# lista_deslizables
Opciones deslizables en una lista

Descripción
Este repositorio contiene una implementación de opciones deslizables en listas utilizando el framework Flutter. En dispositivos móviles, el espacio en pantalla es limitado, por lo que las interacciones con elementos de la lista suelen ser más intuitivas cuando se realizan mediante gestos. En nuestras listas verticales, implementamos el deslizamiento hacia la izquierda o la derecha para mostrar opciones adicionales, como eliminar un elemento. Este comportamiento se consigue mediante el uso del widget Dismissible de Flutter o utilizando plugins de terceros.

Para demostrar esta funcionalidad, hemos creado dos listas:

1.Lista de Hoy: Donde los elementos se pueden deslizar para revelar una opción de eliminar.
2.Historial de Lista: Una lista estática para comparar la interactividad.

Caso de Uso:

Caso de Uso 1: Visualización de Actividades Educativas Actuales
               Objetivo: Ver las actividades educativas programadas para el día actual.
Caso de Uso 2: Gestión de Actividades Educativas (Eliminar)
               Objetivo: Eliminar una actividad educativa de la lista.
Caso de Uso 3: Visualización del Historial de Actividades Educativas
               Objetivo: Ver el historial de actividades educativas pasadas.

Pasos de Implementación

1. Estructura de la Lista: Crea un ListView.builder que generará nuestra lista de elementos.
2. Integración de Dismissible: Envuelve cada elemento de la lista con un widget Dismissible.

3.Configuración de Dismissible:
    1.Key: Asigna una clave única a cada Dismissible para identificar el elemento en la lista.
    2.Background: Define un widget que se muestre cuando el elemento se deslice. Por lo general, un contenedor de color con     un icono o texto que indica la acción.
    3.OnDismissed: Implementa la lógica que se ejecutará cuando el elemento se deslice completamente.
    
4.Confirmación de Acciones: Opcionalmente, utiliza la propiedad confirmDismiss para mostrar un diálogo de confirmación antes de ejecutar la acción de deslizamiento.
5.Actualización de la Lista: Una vez que un elemento se ha deslizado y confirmado, actualiza el estado de tu lista para reflejar el cambio.
