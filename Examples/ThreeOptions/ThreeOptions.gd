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
