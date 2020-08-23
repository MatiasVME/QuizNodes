## [Spanish]

# QuizNodes

![Godot Quiz Plugin](https://github.com/MatiasVME/QuizNodes/blob/master/Images/OriginalImages/QuizTitle.png)

Plugin de Godot Engine para la creación de Quiz Personalizados. Añade nuevos nodos para la creación de diferentes tipos de Quiz.

# Preview (QuizDynamic)
[Preview](https://youtu.be/Vbr4BTaD6qU)

## ¿Qué nodos o custom-type añade?

* ![QuizMultipleChoice](https://raw.githubusercontent.com/MatiasVME/QuizNodes/master/Images/Icons/QuizMultipleChoise.png) QuizMultipleChoice : Quiz de selección multiple o simple
* ![QuizDynamic](https://raw.githubusercontent.com/MatiasVME/QuizNodes/master/Images/Icons/QuizDynamic.png) QuizDynamic : Quiz de selección multiple o simple cargado desde un json (Requiere PersistenceNode)

## Instalación

1. Descargar el plugin
2. Descomprimir (Si es que lo descargaste como ZIP)
3. Crear una carpeta addons en la raíz de tu proyecto (si es que esta no existe)
4. Copiar la carpeta "QuizNodes" (que esta en la carpeta descargada) a dentro de la carpeta addons creada del paso 3.
5. Si es que va a utilizar QuizDynamic, añadir también a la carpeta addons el PersistenceNode y json_beautifier.
6. Activar los plugin necesarios en: Proyecto > Ajustes del proyecto > Plugins

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

### Ejemplo: QuizDynamic (Extraer preguntas de un json creado)

```gdscript
extends Control

func _ready():
	$QuizDynamic.create_test()

	$QuizDynamic.read_from($QuizDynamic.QUESTION_TEST, "Category1", "SubCategory1")
	
	$QuizDynamic.connect("get_question", self, "_on_get_question")
	$QuizDynamic.connect("correct_answer", self, "_on_correct_answer")
	$QuizDynamic.connect("incorrect_answer", self, "_on_incorrect_answer")
	
	new_question()


func new_question():
	$VBox/Question.text = $QuizDynamic.get_question()


func disable_all(disabled := true):
	for button in $VBox/Grid.get_children():
		button.disabled = disabled
		

func wait_for_next_question():
	yield(get_tree().create_timer(3.0), "timeout")
		
	$QuizDynamic.next_question()
	new_question()
	disable_all(false)


func _on_get_question(num):
	$VBox/Grid/Opt1.text = $QuizDynamic.get_answer(1)
	$VBox/Grid/Opt2.text = $QuizDynamic.get_answer(2)
	$VBox/Grid/Opt3.text = $QuizDynamic.get_answer(3)
	$VBox/Grid/Opt4.text = $QuizDynamic.get_answer(4)


func _on_correct_answer():
	$VBox/Question.text = "Is Correct!"
	disable_all()
	
	if not $QuizDynamic.is_last_question():
		wait_for_next_question()
	else:
		$VBox/Question.text = "Bye!!"


func _on_incorrect_answer():
	$VBox/Question.text = "Is Incorrect!" 
	disable_all()
	
	if not $QuizDynamic.is_last_question():
		wait_for_next_question()
	else:
		$VBox/Question.text = "Bye!!"
		yield(get_tree().create_timer(3.0), "timeout")

func _on_Opt1_pressed():
	$QuizDynamic.is_correct(1)


func _on_Opt2_pressed():
	$QuizDynamic.is_correct(2)


func _on_Opt3_pressed():
	$QuizDynamic.is_correct(3)


func _on_Opt4_pressed():
	$QuizDynamic.is_correct(4)
```

A futuro se añadirán mas características.
