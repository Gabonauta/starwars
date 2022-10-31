<h1>StarWars Aplication</h1>

<p>Esta app permite visualizar de manera interactiva los personajes de la Saga StarWars.</br>
<p> Los personajes son representados por los siguientes datos: nombre, películas en las cuales ha salido y género.</p>




https://user-images.githubusercontent.com/30781044/199112618-9f830b10-0974-4acb-b77d-52feaac87b23.mp4




<h2>Filtros</h2>

<p>El usuario puede filtrarlos por género: masculino, femenino y sin datos.</br>
<p>El filtro se mantiene durante el scroll, al menos que el usuario desea quitarlo.</br>
<p>El filtro puede limpiarse y retornar todos los personajes a la pantalla</br>
<p>La aplicación del filtro no afecta la posición de scroll en pantalla</p>



https://user-images.githubusercontent.com/30781044/199112619-e2cf2db5-c5f5-47f2-82bf-7a20929c366d.mp4



<h2>Scroll</h2>
<p>Los usuarios pueden seguir viendo la mayor cantidad de personajes mientras realizan un gesto swipe-up sobre la pantalla.</p>



https://user-images.githubusercontent.com/30781044/199112636-f11990d6-1fff-4895-bb26-f81601a6e9f2.mp4

<h2>Animaciones</h2>
<p>En la parte superior de la pantalla se muestra el logo del aplicativo, un cubo</p>
<p>Se desea que el logo gire reactivamente a movimientos giratorios del dispositivo.</p> 
<p>Considerar que este proceso no debe bloquear la presentación de los personajes. En consecuencia, mientras el usuario hace scroll y ve más personajes el logo puede estar girando si el teléfono detecta el movimiento.</p> 

https://user-images.githubusercontent.com/30781044/199123928-0324803a-7a38-42de-8fa6-2116835f3bd1.mp4

<h2>Paquetes</h2>
1. Provider.-  https://pub.dev/packages/provider 
<p>Necesario para manejar estado de widgets sin usar setState, Utilización de ChangeNotifier para observar cambios</p>
2. Dio.-  https://pub.dev/packages/dio 
<p>Necesario para realizar peticiones https hacia la API https://swapi.dev/documentation</p>
3. flutter_cube.-  https://pub.dev/packages/flutter_cube 
<p>Util para invocar objetos en 3d (.obj)</p>
4. sensors_plus.- https://pub.dev/packages/sensors_plus
<p>Facilita el consumo de sensores de dispositivos</p>

<h2>Probarlo</h2>
<p>Para probar la aplicación es necesario contar con flutter y un dispositivo Android o IOS.</br>
<p>La versión utilizada para compilar este proyecto es: flutter 2.10.2 y dart_sdk: ">=2.16.1 <3.0.0".</br>


![image](https://user-images.githubusercontent.com/30781044/199125468-1cc0fe93-7ab5-4d8c-845f-774788959e19.png)

