## [Spanish]

# QuizNodes

![Godot Quiz Plugin](https://github.com/MatiasVME/QuizNodes/blob/master/Images/OriginalImages/QuizTitle.png)

Plugin de Godot Engine para la creación de Quiz Personalizados. Añade nuevos nodos para la creación de diferentes tipos de Quiz.

## ¿Qué nodos o custom-type añade?

![MultipleChoice](https://github.com/MatiasVME/QuizNodes/blob/master/Images/OriginalImages/QuizMultipleChoice.png)

* QuizMultipleChoice

## Instalación

1. Descargar el plugin
2. Descomprimir (Si es que lo descargaste como ZIP)
3. Crear una carpeta addons en la raíz de tu proyecto (si es que esta no existe)
4. Copiar la carpeta "QuizNodes" (que esta en la carpeta descargada) a dentro de la carpeta addons creada del paso 3.
5. Activar el plugin en: Proyecto>Ajustes del proyecto>Plugins

## Ejemplos de como se usa (Vease también la carpeta Examples)

### Ejemplo: Pregunta verdadero o falso con el nodo QuizMultipleChoice

```gdscript
extends Node

func _ready():
	# Por defecto el custom type QuizMultipleChoice esta configurado a
	# TRUE_OR_FALSE
	$TrueOrFalse.set_question("La esquina de la tierra es la Isla de pascua, ubicada en chile.")
	$TrueOrFalse.add_alternative("Verdadero", false) # Alternativa 0
	$TrueOrFalse.add_alternative("Falso", true) # Alternativa 1 (es la correcta)
	
	$Question.text = $TrueOrFalse.get_question()
	$True.text = $TrueOrFalse.get_alternative(0)
	$False.text = $TrueOrFalse.get_alternative(1)

func _on_True_pressed():
	$TrueOrFalse.select_answer(0)
	$Result.text = str("¿Respuesta correta?: ", $TrueOrFalse.get_result())
	
func _on_False_pressed():
	$TrueOrFalse.select_answer(1)
	$Result.text = str("¿Respuesta correta?: ", $TrueOrFalse.get_result())
```

### Ejemplo: Pregunta con tres alternativas con el nodo QuizMultipleChoice

```gdscript
extends Node

func _ready():
	# Si se le agregan 3 opciones al QuizMultipleChoice entonces se transfomar
	# en una pregunta con tres alternativas THREE_OPTIONS
	$ThreeOptions.set_question("El operador = es:")
	$ThreeOptions.add_alternative("Operador relacional de igualdad", false) # Alternativa 0
	$ThreeOptions.add_alternative("Operador de asignación", true) # Alternativa 1
	$ThreeOptions.add_alternative("Operador de unario", false) # Alternativa 2
	
	$Question.text = $ThreeOptions.get_question()
	$Option1.text = $ThreeOptions.get_alternative(0)
	$Option2.text = $ThreeOptions.get_alternative(1)
	$Option3.text = $ThreeOptions.get_alternative(2)

func _on_Option1_pressed():
	$ThreeOptions.select_answer(0)
	$Answer.text = str("¿Respuesta correta?: ", $ThreeOptions.get_result())

func _on_Option2_pressed():
	$ThreeOptions.select_answer(1)
	$Answer.text = str("¿Respuesta correta?: ", $ThreeOptions.get_result())

func _on_Option3_pressed():
	$ThreeOptions.select_answer(2)
	$Answer.text = str("¿Respuesta correta?: ", $ThreeOptions.get_result())
```

### Ejemplo: Pregunta con cuatro alternativas y orden aleatorio con el nodo QuizMultipleChoice

```gdscript
extends Node

func _ready():
	# Si se le agregan 4 opciones al QuizMultipleChoice entonces se transfoma en
	# un FOUR_OPTIONS
	$FourOptions.set_question("¿Qué es un Objeto en programación?")
	$FourOptions.add_alternative("Una palabra reservada", false) # Alternativa 0
	$FourOptions.add_alternative("Una clase", false) # Alternativa 1
	$FourOptions.add_alternative("La instancia de una clase", true) # Alternativa 2
	$FourOptions.add_alternative("Un evento", false) # Alternativa 3
	
	# Desordena las alternativas
	$FourOptions.disarray_alternatves()
	
	$Question.text = $FourOptions.get_question()
	$Option1.text = $FourOptions.get_alternative(0)
	$Option2.text = $FourOptions.get_alternative(1)
	$Option3.text = $FourOptions.get_alternative(2)
	$Option4.text = $FourOptions.get_alternative(3)

func _on_Option1_pressed():
	$FourOptions.select_answer(0)
	$Answer.text = str("¿Respuesta correta?: ", $FourOptions.get_result())

func _on_Option2_pressed():
	$FourOptions.select_answer(1)
	$Answer.text = str("¿Respuesta correta?: ", $FourOptions.get_result())

func _on_Option3_pressed():
	$FourOptions.select_answer(2)
	$Answer.text = str("¿Respuesta correta?: ", $FourOptions.get_result())

func _on_Option4_pressed():
	$FourOptions.select_answer(3)
	$Answer.text = str("¿Respuesta correta?: ", $FourOptions.get_result())
```
