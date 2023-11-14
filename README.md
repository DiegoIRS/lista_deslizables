# lista_deslizables
Opciones deslizables en una lista

Pasos de Implementación

Estructura de la Lista: Crea un ListView.builder que generará nuestra lista de elementos.

Integración de Dismissible: Envuelve cada elemento de la lista con un widget Dismissible.

Configuración de Dismissible:

Key: Asigna una clave única a cada Dismissible para identificar el elemento en la lista.
Background: Define un widget que se muestre cuando el elemento se deslice. Por lo general, un contenedor de color con un icono o texto que indica la acción.
OnDismissed: Implementa la lógica que se ejecutará cuando el elemento se deslice completamente.
Confirmación de Acciones: Opcionalmente, utiliza la propiedad confirmDismiss para mostrar un diálogo de confirmación antes de ejecutar la acción de deslizamiento.

Actualización de la Lista: Una vez que un elemento se ha deslizado y confirmado, actualiza el estado de tu lista para reflejar el cambio.