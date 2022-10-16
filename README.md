# Algoritmo-de-Booth

El algoritmo de Booth es un método de cálculo iterativo de la operación aritmética de multiplicación. A diferencia de la implementación directa combinacional, este método requiere menos componentes combinacional (un solo sumador en comparación de N sumadores). Pero por ser un método iterativo su rendimiento es menor (llega a la respuesta después de varios ciclos de reloj). El algoritmo lo puede leer explicado de este http://vlabs.iitkgp.ernet.in/coa/exp7/index.html.
Se provee un diagrama de bloques del circuito a elaborar en Fig. 1. En la figura se destacan dos secciones relevantes del diseño: el control y el flujo de datos. En el apéndice 8 se provee un código en HDL como ejemplo para describir la sección de flujo de datos. El control quién controla la ejecución del algoritmo debe ser implementado en una máquina de estados cuyo diseño debe resolver la implementación del algoritmo descrito en el url anterior.

## Integrantes
Desarrollado por los estudiantes:
- Sebastián Moya Monge 2019077209
- Ignacio Grané Rojas  2019380056
- Joseph Jiménez Zúñiga 2016133677

## Tareas

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


### Diagrama de Bloques Subsistema de lectura




## Subsistema de cálculo de multiplicación


### Funcionamiento Fundamental Subsistema de cálculo de multiplicación


### Diagrama de Bloques Subsistema de cálculo de multiplicación



## Subsistema conversión de binario a representación BCD


### Funcionamiento Fundamental Subsistema conversión de binario a representación BCD


### Diagrama de Bloques Subsistema conversión de binario a representación BCD



## Subsistema de despliegue en display de 7 segmentos

### Funcionamiento Fundamental Subsistema de despliegue en display de 7 segmentos

### Diagrama de Bloques Subsistema de despliegue en display de 7 segmentos


## Diagramas de estado de todas las FSM diseñadas


## Ejemplo y análisis de una simulación funcional del sistema completo


## Análisis de consumo de recursos en la FPGA y del consumo de potencia


## Reporte de velocidades máximas de reloj posibles en el diseño


## Problemas encontrados y soluciones aplicadas






