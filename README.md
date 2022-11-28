# Algoritmo-de-Booth

El algoritmo de Booth es un método de cálculo iterativo de la operación aritmética de multiplicación. A diferencia de la implementación directa combinacional, este método requiere menos componentes combinacional (un solo sumador en comparación de N sumadores). Pero por ser un método iterativo su rendimiento es menor (llega a la respuesta después de varios ciclos de reloj). El algoritmo lo puede leer explicado de este http://vlabs.iitkgp.ernet.in/coa/exp7/index.html.
Se provee un diagrama de bloques del circuito a elaborar en Fig. 1. En la figura se destacan dos secciones relevantes del diseño: el control y el flujo de datos. En el apéndice 8 se provee un código en HDL como ejemplo para describir la sección de flujo de datos. El control quién controla la ejecución del algoritmo debe ser implementado en una máquina de estados cuyo diseño debe resolver la implementación del algoritmo descrito en el url anterior.

## Integrantes
Desarrollado por los estudiantes:
- Sebastián Moya Monge 2019077209
- Ignacio Grané Rojas  2019380056
- Joseph Jiménez Zúñiga 2016133677

## Tareas

## Subsistema de lectura - Joseph Jimenez

- Adquirir operandos "A" y "B" de 8 bits
- Interpretar operandos "A" y "B" complemento a 2
    - Desplegar en un LED próximo al switch para indicar como fue leído
- Captura y sincroniza con el sistema (4 FF cascada/switch)
- Boton de espera "push button"
    - Mantiene pulsado 500ms e inicia multiplicacion
    - No inicia otra operacion hasta volver al estado inicial 

## Subsistema de cálculo de multiplicación- Todos

- Recibe operandos "A" y "B" de subsistema de Lectura
- Habilidad bandera "Valid" como indicador del subsistema de Lectura para iniciar la operacion multiplicacion
- Aplicar algoritmo de Boot Iterativo:
    - Carga estado de la suma parcial Inicial y acarreo = 0
    - Obtiene Primer Dato de los Operandos A y B
    - Iterativamente compara los operandos A y B
      - Si es 0 no pasa nada
      - Si es 1 se suma el numero a la suma Parcial
    - Desplazada al segundo Dato de los Operandos A y B
    - Recorre todos los los bits de cada operando
    - La suma Parcial obtiene la suma total

## Subsistema conversión de binario a representación BCD - Ignacio Grane

- Registra, recibe resultado de subsistema de cálculo de multiplicación (16 bits con signo)
- Conversion BCD(5 dígitos en BCD + 1 de signo para el siguiente bloque):
  - Conversión de manera combinacional
  - Conversión de manera secuencial
- Habilitar bandera "Done" indica cuando está lista la conversión para registrar

## Subsistema de despliegue en display de 7 segmentos - Sebastian Moya

- Recibe resultado de subsistema conversión de binario a representación BCD
- Desplegar en dispositivos 7 Segmentos:
    - Despliega en los dispositivos 7 segmentos disponibles en la placa
    - Forma decimal, incluyendo el signo
    - Utilizar al menos 6 dígitos disponibles del 7 segmentos
    - Tasa de refresco adecuada para una visualización cómoda
    
## Subsistema Unidad de Control- Todos

- Determinar variables de Control
- Determinar Memoria para guardar y determinar siguiente Direccion
    
# Cronograma Establecido para completar las Tareas

- 20 de Octubre - Inicio de programacion submodulos individuales
- 23 de Octubre - Inicio de submodulo de control y de multiplicacion
- 24 de Octubre - Union de unidad de Control y subsistema de multiplicacion
- 27 de Octubre - Actualizacion de estado de submodulos
- 29 de Octubre - Finalizar Submodulos
- 1 de Noviembre - Listas las simulaciones
- 3 de Noviembre - ENTREGA Avance
- 7 de Noviembre - Terminar Detalles
- 10 de Noviembre -  Defensa del proyecto 

## Reglas
- La comunicación será por la plataforma WhatsApp, mediante el grupo creado para este fin.
- Las reuniones serán por la plataforma Zoom, cuando se considere pertinente. De preferencia serán en modalidad presencial.
- Se deberá de cumplir con los plazos de entrega establecidos por el profesor.
- Se deberá de cumplir con los plazos de entrega establecidos por los integrantes.
- Se deberá de completar las tareas correspondientes a cada miembro.
- Se utilizarán SystemVerilog y el suite de herramientas de Vivado para desarrollar el sistema completo.
- Al generar un diagrama de bloques para cada subsistema, debe ser con su funcionalidad descrita y su esquema de interconexión, con una descripción comportamental de cada sub-bloque dentro de los subsistemas.
- Para cada subsistema, será obligatorio presentar simulaciones tanto a nivel de RTL (pre-síntesis) como con información de temporizado (post-síntesis y post-colocación-y-ruteo), deberá estar adecuadamente registrado a la entrada, salida y ruta de datos


## Una descripción general del funcionamiento del circuito completo


## Subsistema de lectura


### Funcionamiento Fundamental

En este subsistema se adquiere los operando de 8 bits A y B, estos se proceden a hacer un complemento a 2 con signo, el cual se ve reflejado en los LEDS,
Estos operando son enviados al circuito antirebote que corresponde a 4 Flip Flops D en cascada, en donde se sincroniza con el sistema esperando la señal de pulsacion de 500ms para pasar iniciar la operacion aritmetica.

### Diagrama de Bloques Subsistema de lectura

![Image text](https://github.com/Heineken97/Algoritmo-de-Booth/blob/main/imagenes/Subsistema1_Completo.png)

### Diagrama de Bloques deñ circuito antirebote en subsistema 1

![Image text](https://github.com/Heineken97/Algoritmo-de-Booth/blob/main/imagenes/Subsistema1_CircuitoAntiRebote.png)

## Subsistema de cálculo de multiplicación


### Funcionamiento Fundamental Subsistema de cálculo de multiplicación

![Image text](https://github.com/Heineken97/Algoritmo-de-Booth/blob/main/imagenes/Calculo_Multiplicador.PNG)


### Diagrama de Bloques Subsistema de cálculo de multiplicación

![Image text](https://github.com/Heineken97/Algoritmo-de-Booth/blob/main/imagenes/Diagrama_Bloques_Multiplicador.png)

## Subsistema conversión de binario a representación BCD

### Diagrama de Bloques Subsistema conversión de binario a representación BCD
![Image text](https://github.com/Heineken97/Algoritmo-de-Booth/blob/main/imagenes/Conventional-BCD-Adder.png)


## Subsistema de despliegue en display de 7 segmentos

### Diagrama de Bloques Subsistema de despliegue en display de 7 segmentos
![Image text](https://github.com/Heineken97/Algoritmo-de-Booth/blob/main/imagenes/Display.png)


## Diagramas de estado de todas las FSM diseñadas
### Diagramas de Estado de la maquina de Moore 
![Image text](https://github.com/Heineken97/Algoritmo-de-Booth/blob/main/imagenes/MaquinaDeEstadosMoore.PNG)

## Ejemplo y análisis de una simulación funcional del sistema completo
![Image text](https://github.com/Heineken97/Algoritmo-de-Booth/blob/main/imagenes/Capture.PNG)

Se puede observar el comportamiento que tienen los módulos, así como las diferentes variables.

## Análisis de consumo de recursos en la FPGA y del consumo de potencia
![Image text](https://github.com/Heineken97/Algoritmo-de-Booth/blob/main/imagenes/potencia.PNG)

Se detalla el total de potencia consumida en Watts [W] por la FPGA.

## Reporte de velocidades máximas de reloj posibles en el diseño
[!Image text](https://github.com/Heineken97/Algoritmo-de-Booth/blob/main/imagenes/timming.PNG)

Detalle de las velocidades máximas de reloj.

## Problemas encontrados y soluciones aplicadas
Se encontraron los siguientes problemas:
- Falta de secuencialidad en la máquina de estados finitos desarrollada.
- Falta de funcionalidad por parte del programa Vivado.
- Mala administración del tiempo para desarrollar adecuadamente el proyecto.
- Se realiza un shift de más, por lo que se agregan 0's innecesarios al resultado final de cada multiplicación.
- La señal de carga (debida a la salida del sumador) no se regula correctamente, por lo que al momento de cargar la suma se suman 2 bits en 0.

Para los cuales se ejecutaron las siguientes soluciones:
- Se estudió más la teoría y se logró implementar una máquina de estados que permitiese una buena secuencialidad de instrucciones y estados.
- Se logró implementar el software de Icarus Verilog para la simulación de algunos testbench cuando Vivado no funcionase.
- Se intentó implementar un plan de trabajo para así regir y desarrollar para un horario fijo.
- Se intenta cambiar la lógica de la máquina de estados y corregir los chifts, sin embargo no hubo éxito.
- Se realiza un cambio en la lógica de la salida acarreada por el sumador, no obstante no se consiguió implementar una solución exacta.
