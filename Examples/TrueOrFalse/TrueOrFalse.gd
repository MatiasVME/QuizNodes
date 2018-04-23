extends Node

func _ready():
	# Por defecto el custom type QuizMultipleChoice esta configurado a
	# TRUE_OR_FALSE
	$TrueOrFalse.set_question("La esquina de la tierra es la Isla de pascua, ubicada en chile.")
	$TrueOrFalse.add_alternative("Verdadero", false) # Alternativa 0
	$TrueOrFalse.add_alternative("Falso", true) # Alternativa 1
	
	$Question.text = $TrueOrFalse.get_question()
	$True.text = $TrueOrFalse.get_alternative(0)
	$False.text = $TrueOrFalse.get_alternative(1)

func _on_True_pressed():
	$TrueOrFalse.select_answer(0)
	$Result.text = str("¿Respuesta correta?: ", $TrueOrFalse.get_result())
	
func _on_False_pressed():
	$TrueOrFalse.select_answer(1)
	$Result.text = str("¿Respuesta correta?: ", $TrueOrFalse.get_result())
	